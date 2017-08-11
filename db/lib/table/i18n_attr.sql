create table i18n_attr
( i18n code not null
, rel  name not null
, attr name not null

, title    text not null

, primary key (i18n, rel, attr)
, foreign key (i18n)      references i18n
, foreign key (rel, attr) references attr
);

comment on table i18n_attr is
  'Translation of attribute';
