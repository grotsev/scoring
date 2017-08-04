create table credit_kind
( credit_kind code not null

, primary key (credit_kind)
);

create table credit_purpose
( credit_purpose code not null

, primary key (credit_purpose)
);

create table income_evidence
( income_evidence code not null

, primary key (income_evidence)
);

create table repayment_kind
( repayment_kind code not null

, primary key (repayment_kind)
);



create table contract_template
( application     uuid not null
, sys_period tstzrange not null default tstzrange(now(), null)

, product           code
, currency          code
, client_category   code
, term_range   int4range
, amount_range int4range
, term              int4 check (term between 0 and 1200 and term <@ term_range)
, amount        monetary

, repayment_kind           code
, income_evidence          code
, deposit_value        monetary
, property_value       monetary
, pledge_value         monetary
, pledge_currency          code
, init_payment         monetary
, init_payment_percent numeric
, pay_date                 int4 check (pay_date between 1 and 31)
, monthly_payment      monetary

, credit_kind    code
, credit_purpose code
);

comment on table contract_template is 'Application contract terms and conditions';
comment on column contract_template.term is 'In month';

create table contract_attract
( primary key (application)
) inherits (contract_template);

create table contract_history
(
) inherits (contract_template);

create table contract
( primary key (application)
, foreign key (application)                                                  references application
, foreign key (product)                                                      references product
, foreign key (currency)                                                     references currency
, foreign key (client_category)                                              references client_category
, foreign key (product, currency, client_category, term_range, amount_range) references product_scheme
, foreign key (repayment_kind)                                               references repayment_kind
, foreign key (income_evidence)                                              references income_evidence
, foreign key (pledge_currency)                                              references currency
, foreign key (credit_kind)                                                  references credit_kind
, foreign key (credit_purpose)                                               references credit_purpose
) inherits (contract_history);


create trigger "010_contract"
  before update on contract
  for each row execute procedure modified()
;

create trigger "020_contract"
  before insert or update or delete on contract
  for each row execute procedure versioning('sys_period', 'contract_history', true)
;

