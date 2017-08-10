create table i18n_attr
( i18n     code not null
, rel  regclass not null
, attr regclass not null

, title    text not null

, primary key (i18n, rel, attr)
, foreign key (i18n) references i18n
);

comment on table i18n_attr is 'Translation of attribute';
