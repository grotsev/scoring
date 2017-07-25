create function check_pin(
  the_application uuid,
  the_staff uuid,
  the_stage code
) returns setof text
  language plpgsql
as $function$
begin

  return next ok(
    exists (
      select
      from application_stage
      where application = the_application
        and stage = the_stage
        and not blocked
    ),
    'Application is in stage ' || the_stage
  );

  return next ok(
    exists (
      select
      from pin
      where application = the_application
        and staff = the_staff
        and stage = the_stage
    ),
    'Application is pinned to stage ' || the_stage
  );

  return next throws_ok(
    $$select pin('$$||the_application||$$', 'ATTRACTION')$$,
    'duplicate key value violates unique constraint "pin_pkey"',
    'Application is pinned just once'
  );

  return next isnt_empty(
    $$select * from contract_draft where application='$$||the_application||$$'$$,
    'pin() in create_application() creates contract_draft'
  );

end;
$function$;

