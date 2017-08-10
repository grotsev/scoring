create table currency
( currency code not null check (currency ~ '^[A-Z]{3}$')

, primary key (currency)
);

comment on table currency is 'ISO 4217';
