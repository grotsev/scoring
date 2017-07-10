create function application_take(application uuid, stage code) returns void as $function$
  
  insert into staging (application, staff, stage, sys_period)
    values ($1, current_staff(), $2, tstzrange(now(), null) );

  insert into contract_draft (
    select * from contract
    where application = $1
  );

$function$ language sql;

comment on function application_take(uuid, code) is '';

