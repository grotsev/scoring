create function application_take(application uuid, stage code) returns void as $function$
  insert into staging (application, staff, stage, sys_period)
    values ($1, jwt_staff(), $2, tstzrange(now(), null) )
$function$ language sql;

