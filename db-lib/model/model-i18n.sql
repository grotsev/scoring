create table lang
( lang code not null check (lang ~ '^[A-Z]{3}$')

, primary key (lang)
);

comment on table lang is 'ISO 639-2 upper case';


create table i18n_code
( lang     code not null
, code     code not null

, i18n    text not null

, primary key (lang, code)
, foreign key (lang) references lang
);

comment on table i18n_code is 'Table independent translation of code';


create table i18n_relation
( lang     code not null
, rel  regclass not null

, i18n    text not null

, primary key (lang, rel)
, foreign key (lang) references lang
);

comment on table i18n_relation is 'Translation of relation';


create table i18n_attribute
( lang     code not null
, rel  regclass not null
, attr regclass not null

, i18n    text not null

, primary key (lang, rel, attr)
, foreign key (lang) references lang
);

comment on table i18n_attribute is 'Translation of attribute';

