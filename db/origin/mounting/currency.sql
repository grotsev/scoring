create table currency (
  currency code primary key check (currency ~ '^[A-Z]{3}$')
);

comment on table currency is 'ISO 4217';

insert into currency values
  ('RUB')
, ('KZT')
, ('USD')
, ('CNY')
;

