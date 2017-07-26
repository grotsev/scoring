create table perf_table_template
( id uuid_pk
, sys_period tstzrange not null
, data text
);

create table perf_table_history
(
) inherits (perf_table_template);

create table perf_table_actual
(
) inherits (perf_table_template);

create table perf_table_migration
(
) inherits (perf_table_template);

insert into perf_table_migration
  select md5(random()::text)::uuid
       , tstzrange(now(), null)
       , md5(random()::text)
  from generate_series(1, 1000000)
;

