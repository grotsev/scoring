create view attr_absent as
  select table_name  as rel
       , column_name as attr
  from information_schema.columns
  where table_catalog = 'postgres'
    and table_schema = 'scoring'
except
  select rel, attr
  from attr
order by attr, rel;


comment on view attr_absent is
  'Not described attribute';
