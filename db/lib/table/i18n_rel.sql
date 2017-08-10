create table i18n_rel
( i18n     code not null
, rel  regclass not null

, title    text not null

, primary key (i18n, rel)
, foreign key (i18n) references i18n
);

comment on table i18n_rel is 'Translation of relation';
