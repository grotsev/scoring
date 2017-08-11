insert into rel (rel)
  select table_name
  from information_schema.tables
  where table_catalog = 'postgres'
    and table_schema = 'scoring'
on conflict do nothing
;
