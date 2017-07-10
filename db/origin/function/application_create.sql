create function application_create(
) returns uuid
  language plpgsql
as $function$
declare
  the_application uuid;
begin

  insert into application (branch, outlet)
    select branch, outlet
    from staff_outlet
    where staff = current_staff()
  returning application into the_application;

  insert into contract(application) values (the_application);

  perform application_take(the_application, 'ATTRACTION');

  return the_application;
  
end;
$function$;

comment on function application_create() is
  'Create new application with default dependent objects and current_staff automatically takes it';

