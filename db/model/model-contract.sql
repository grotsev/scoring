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
, sys_period tstzrange not null

, product           code
, currency          code
, client_category   code
, term_range   int4range
, amount_range int4range
, term              int4 check (term between 0 and 1200)
, amount         numeric

, repayment_kind          code
, income_evidence         code
, deposit_value        numeric
, property_value       numeric
, pledge_value         numeric
, pledge_currency         code
, init_payment         numeric
, init_payment_percent numeric
, pay_date                int4 check (pay_date between 1 and 31)
, monthly_payment      numeric

, credit_kind    code
, credit_purpose code
);

create table contract_draft
(
) inherits (contract_template);

create table contract_history
(
) inherits (contract_template);

create table contract_actual
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

comment on table contract_actual is 'Application contract_actual terms and conditions';
comment on column contract_actual.term is 'In month';


create trigger "010_contract"
  before update on contract_actual
  for each row execute procedure modified()
;

create trigger "020_contract"
  before insert or update or delete on contract_actual
  for each row execute procedure versioning('sys_period', 'contract_history', true)
;

