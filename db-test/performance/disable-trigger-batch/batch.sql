begin;
set local role scoring;
insert into perf_table_actual select * from perf_table_migration;
commit;
