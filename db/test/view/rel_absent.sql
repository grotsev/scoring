create view rel_absent as
  select table_name as rel
  from information_schema.tables
  where table_catalog = 'postgres'
    and table_schema = 'scoring'
except
  select rel
  from rel;

comment on view rel_absent is
  'Not described relation';
