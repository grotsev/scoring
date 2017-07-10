create domain code as text
  check (value ~ '^[_A-Z][_A-Z0-9]{0,31}$')
;

create domain uuid_pk as uuid
  default uuid_generate_v1mc()
;

comment on domain uuid_pk is 'Primary key aware mostly sequential time based uuid';

create domain login as text
  check (value ~ '^[A-Za-z][A-Za-z_0-9]{0,31}$')
;

create domain textfield as text
  check (char_length(value) <= 100)
;

comment on domain textfield is 'Reasonably large user input but securely bounded';

create domain textarea as text
  check (char_length(value) <= 2000)
;

comment on domain textarea is 'Reasonably large user input but securely bounded';



create table lang
( lang code primary key check (lang ~ '^[A-Z]{3}$')
);

comment on table lang is 'ISO 639-2 upper case';

create table title
( lang code references lang
, dict regclass
, code code
, primary key (lang, dict, code)
);

