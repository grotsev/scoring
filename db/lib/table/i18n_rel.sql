create table i18n_rel
( i18n code not null
, rel  name not null

, title    text not null

, primary key (i18n, rel)
, foreign key (i18n) references i18n
, foreign key (rel)  references rel
);

comment on table i18n_rel is
  'Translation of relation';
