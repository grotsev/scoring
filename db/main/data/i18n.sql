-- add manually because i18n table still empty in macro_i18n
alter table i18n
  add column i18n_rus text not null
;

insert into i18n
  (i18n , i18n_rus )
values
  ('RUS', 'русский')
;
