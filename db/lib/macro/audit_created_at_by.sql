--import db/lib/function/created_at_by.sql

create function audit_created_at_by(
  the_table name
) returns text
  language plpgsql
  stable
as $function$
declare
begin

  return format(
$macro$

alter table %1$s
  add column created_at timestamptz not null
, add column created_by        uuid not null
, add foreign key (created_by) references %2$s;

create trigger "1_created_at_by"
  before insert on %1$s
  for each row execute procedure created_at_by();

$macro$
  , the_table
  , current_setting('lib.actor_table')
  );

end;
$function$;

comment on function audit_created_at_by(name) is
  'Macro audit created_at and created_by. Requires lib.actor_table GUC';

