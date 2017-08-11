-- add manually because macro_i18n can not be recursive
alter table i18n
  add column i18n_rus text not null
;

insert into i18n
  (i18n , i18n_rus )
values
  ('RUS', 'русский')
;
