create function application_take(
  application uuid,
  stage code
) returns void
  language sql
as $function$
  
  -- TODO check available_stage
    
  insert into take (application, staff, stage, sys_period)
    values ($1, current_staff(), $2, tstzrange(now(), null) );

  insert into contract_draft (
    select * from contract
    where application = $1
  );

  -- new empty contract
  insert into contract_draft (application, sys_period)
    values ($1, tstzrange(now(), null))
    on conflict do nothing;

$function$;

comment on function application_take(uuid, code) is
  'Pin application to current_staff and create or copy draft from last state';

