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

  return next throws_ok(
    $$select application_take('$$||the_application||$$', 'ATTRACTION')$$,
    'duplicate key value violates unique constraint "staging_pkey"',
    'Application is taken just once'
  );
  
  open cursor for
    select stage
    from staging
    where application = the_application
      and staff = the_staff
  ;
  return next results_eq(
    cursor,
    $$values ('ATTRACTION'::code)$$,
    'New application is in [ATTRACTION] stage'
  );
  close cursor;
  
  return next isnt_empty(
    'select * from contract_draft w',
    'create_application()/contract_take() creates contract_draft'
  );

end;
$function$;

