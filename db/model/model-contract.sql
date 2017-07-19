create table credit_kind
( credit_kind code primary key
);

create table credit_purpose
( credit_purpose code primary key
);

create table income_evidence
( income_evidence code primary key
);

create table repayment_kind
( repayment_kind code primary key
);



create table contract_template
( application uuid
, sys_period  tstzrange not null

, product code
, currency code
, client_category code
, term_range int4range
, amount_range int4range
, term int4 check (term between 0 and 1200)
, amount numeric

, repayment_kind code
, income_evidence code
, deposit_value numeric
, property_value numeric
, pledge_value numeric
, pledge_currency code
, init_payment numeric
, init_payment_percent numeric
, pay_date int4 check (pay_date between 1 and 31)
, monthly_payment numeric

, credit_kind code
, credit_purpose code
);

create table contract_draft
(
) inherits (contract_template);

create table contract_history
(
) inherits (contract_template);

create table contract
( primary key (application)
, foreign key (application) references application
, foreign key (product) references product
, foreign key (currency) references currency
, foreign key (client_category) references client_category
, foreign key (product, currency, client_category, term_range, amount_range) references product_scheme
, foreign key (repayment_kind) references repayment_kind
, foreign key (income_evidence) references income_evidence
, foreign key (pledge_currency) references currency
, foreign key (credit_kind) references credit_kind
, foreign key (credit_purpose) references credit_purpose
) inherits (contract_history);

comment on table contract is 'Application contract terms and conditions';
comment on column contract.term is 'In month';

create trigger "contract_010"
  before update on contract
  for each row execute procedure modified()
;

create trigger "contract_020"
  before insert or update or delete on contract
  for each row execute procedure versioning('sys_period', 'contract_history', true)
;

