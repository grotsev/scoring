create table lang (
  lang code primary key check (lang ~ '^[A-Z]{3}$')
);

comment on table lang is 'ISO 639-2 upper case';

insert into lang values
  ('RUZ')
, ('KAZ')
, ('ENG')
, ('CHI')
;

