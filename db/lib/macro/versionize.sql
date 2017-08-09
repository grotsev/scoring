--import db/lib/function/modified_by.sql
--import db/lib/function/deleted_by.sql

create function versionize(
  actual      name,
  history     name
) returns text
  language plpgsql
  stable
as $function$
begin

  return format(
$macro$

alter table %1$s
  add column sys_period  tstzrange not null
, add column modified_by      uuid not null
, add column deleted_by       uuid
, add foreign key (modified_by) references %3$s
, add foreign key (deleted_by)  references %3$s;

create trigger "1_modified_by"
  before insert or update on %1$s
  for each row execute procedure modified_by();

create trigger "1_deleted_by"
  before delete on %1$s
  for each row execute procedure deleted_by();

create trigger "8_distinct_data"
  before update on contract
  for each row
  execute procedure distinct_data();

create trigger "8_versioning"
  before insert or update or delete on contract
  for each row
  execute procedure versioning('sys_period', '%2$s', true);

$macro$
  , actual
  , history
  , current_setting('lib.actor_table')
  );

end;
$function$;

comment on function versionize(name,name) is
  'Macro copy on write actual table to history table. Requires lib.actor_table GUC';

