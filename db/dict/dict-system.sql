create table lang
( lang code not null check (lang ~ '^[A-Z]{3}$')

, primary key (lang)
);

comment on table lang is 'ISO 639-2 upper case';

create table title
( lang     code not null
, dict regclass not null
, code     code not null

, primary key (lang, dict, code)
, foreign key (lang) references lang
);

