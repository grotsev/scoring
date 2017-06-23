create function application_create() returns uuid as $function$
declare
  the_application uuid;
begin

  insert into application (branch, outlet)
    select branch, outlet
    from staff_outlet
    where staff = jwt_staff()
  returning application into the_application;

  insert into application_stage (application, stage)
  values (the_application, 'ATTRACTION');

  return the_application;
  
end;
$function$
language plpgsql
security definer
;

