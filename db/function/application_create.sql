create function application_create(
) returns uuid
  language plpgsql
as $function$
declare
  the_application uuid;
  the_borrower uuid;
begin

  insert into application (branch, outlet)
    select branch, outlet
    from staff_outlet
    where staff = current_staff()
  returning application into the_application;

  if not found then
    raise 'staff % (%) not found', current_login(), current_staff();
  end if;

  insert into application_stage(application, stage, blocked)
    values (the_application, 'ATTRACT', false);

  insert into contract_actual (application) values (the_application);

  insert into individual (application) values (the_application)
  returning individual into the_borrower;

  insert into individual_responsibility (application, individual, responsibility)
    values (the_application, the_borrower, 'BORROWER');

  return the_application;

end;
$function$;

comment on function application_create() is
  'Create new application';

