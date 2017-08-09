--import db/lib/domain/code.sql
--import db/lib/table/lang.sql

create table i18n_code
( lang     code not null
, code     code not null

, i18n    text not null

, primary key (lang, code)
, foreign key (lang) references lang
);

comment on table i18n_code is 'Table independent translation of code';


