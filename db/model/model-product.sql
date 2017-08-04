create table currency
( currency code not null check (currency ~ '^[A-Z]{3}$')

, primary key (currency)
);

comment on table currency is 'ISO 4217';

create table client_category
( client_category code not null

, primary key (client_category)
);

create table product
( product code not null

, primary key (product)
);

create table product_scheme
( product           code not null
, currency          code not null
, client_category   code not null
, term_range   int4range not null
, amount_range int4range not null

, interest  numeric not null
, k1        numeric not null
, k2        numeric not null
, ltv       numeric not null
, pledge   boolean not null
, active   boolean not null default true

, primary key (product, currency, client_category, term_range, amount_range)
, foreign key (product)         references product
, foreign key (currency)        references currency
, foreign key (client_category) references client_category
);

comment on column product_scheme.interest is 'Percent per month';
comment on column product_scheme.term_range is 'In month';

create table fee_kind
( fee_kind code not null

, primary key (fee_kind)
);

create table fee
( fee code not null

, fee_kind  code not null
, amount monetary not null

, primary key (fee)
, foreign key (fee_kind) references fee_kind
);

comment on column fee.amount is 'In percent';

create table product_fee
( product           code not null
, currency          code not null
, client_category   code not null
, term_range   int4range not null
, amount_range int4range not null
, fee               code not null

, primary key (product, currency, client_category, term_range, amount_range, fee)
, foreign key (product, currency, client_category, term_range, amount_range) references product_scheme
, foreign key (fee)                                                          references fee
);

