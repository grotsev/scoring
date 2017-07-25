create function check_application_create(
  the_application uuid,
  the_staff uuid
) returns setof text
  language plpgsql
  set role scoring
as $function$
declare
  cursor refcursor;
begin
  
  return next isnt(
    the_application,
    null,
    'application_create() create new application'
  );

  /* TODO move to check stage
  open cursor for
    select stage
    from pin
    where application = the_application
      and staff = the_staff
  ;

  return next results_eq(
    cursor,
    $$values ('ATTRACTION'::code)$$,
    'New application is in [ATTRACTION] stage'
  );
  close cursor;
  */
  
  return next isnt_empty(
    $$select * from contract_draft where application='$$||the_application||$$'$$,
    'pin() in create_application() creates contract_draft' -- TODO move
  );

end;
$function$;

