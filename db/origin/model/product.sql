create table currency (
  currency code primary key check (currency ~ '^[A-Z]{3}$')
);

comment on table currency is 'ISO 4217';

create table client_category (
  client_category code primary key
);

create table product (
  product code primary key
);

create table product_scheme (
  product code references product
, currency code references currency
, client_category code references client_category
, term_range int4range
, amount_range int4range
, primary key (product, currency, client_category, term_range, amount_range)
, interest numeric not null
, k1 numeric not null
, k2 numeric not null
, ltv numeric not null
, pledge boolean not null
, active boolean not null default true
);

comment on column product_scheme.term_range is 'In month';

create table fee_kind (
  fee_kind code primary key
);

create table fee (
  fee code primary key
, fee_kind code not null references fee_kind
, amount numeric not null
);

comment on column fee.amount is 'In percent';

create table product_fee (
  product code
, currency code
, client_category code
, term_range int4range
, amount_range int4range
, foreign key (product, currency, client_category, term_range, amount_range) references product_scheme
, fee code references fee
, primary key (product, currency, client_category, term_range, amount_range, fee)
);

