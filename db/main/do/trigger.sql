create trigger pin_versioning
  before insert or update or delete on pin
  for each row execute procedure versioning('sys_period', 'pin_history', true)
;

create trigger "5_assign_outlet"
  before insert or update on application
  for each row execute procedure assign_outlet()
;

do $block$
begin
  execute (select macro_created('application'));
  execute (select macro_history('contract', 'contract_history'));
  execute (select macro_history('pkb', 'pkb_history'));
end;
$block$;
