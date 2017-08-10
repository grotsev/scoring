create table i18n_relation
( lang     code not null
, rel  regclass not null

, i18n    text not null

, primary key (lang, rel)
, foreign key (lang) references lang
);

comment on table i18n_relation is 'Translation of relation';
