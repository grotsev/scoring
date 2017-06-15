create table contract (
  application uuid primary key references application

, product code not null references product
, currency code not null references currency
, client_category code not null references currency
, term_range int4range not null
, amount_range int4range not null
, foreign key (product, currency, client_category, term_range, amount_range) references product_scheme
, term int4 not null check (term between 0 and 1200)
, amount numeric not null

, repayment_kind code references repayment_kind
, income_evidence code references income_evidence
, pledge_kind code references pledge_kind
, deposit_value numeric
, property_value numeric
, pledge_value numeric
, pledge_currency code references currency
, init_payment numeric
, init_payment_percent numeric
, pay_date int4 check (pay_date between 1 and 31)
, monthly_payment numeric

, credit_kind code references credit_kind
, credit_purpose code references credit_purpose
);

comment on table contract is 'Application contract terms and conditions';
comment on column contract.term is 'In month';

