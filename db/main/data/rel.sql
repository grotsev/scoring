insert into rel
  select table_name
  from information_schema.tables
  where table_catalog = 'postgres'
    and table_schema = 'scoring'
    and table_type = 'BASE TABLE'
on conflict do nothing
;
