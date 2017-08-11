insert into attr (rel, attr)
  select table_name, column_name
  from information_schema.columns
  where table_catalog = 'postgres'
    and table_schema = 'scoring'
on conflict do nothing
;
