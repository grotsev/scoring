create trigger "010_perf_table"
  before insert or update or delete on perf_table_actual
  for each row execute procedure versioning('sys_period', 'parf_table_history', true)
;
