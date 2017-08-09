--import db/lib/domain/code.sql
--import db/lib/table/lang.sql

create table i18n_attribute
( lang     code not null
, rel  regclass not null
, attr regclass not null

, i18n    text not null

, primary key (lang, rel, attr)
, foreign key (lang) references lang
);

comment on table i18n_attribute is 'Translation of attribute';

