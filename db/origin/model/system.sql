create table lang (
  lang code primary key check (lang ~ '^[A-Z]{3}$')
);

comment on table lang is 'ISO 639-2 upper case';

create table title (
  lang code references lang
, dict regclass
, code code
, primary key (lang, dict, code)
);

