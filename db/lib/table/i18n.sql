create table i18n
( i18n code not null check (i18n ~ '^[A-Z]{3}$')

, primary key (i18n)
);

comment on table i18n is
  'ISO 639-2 lower case';
