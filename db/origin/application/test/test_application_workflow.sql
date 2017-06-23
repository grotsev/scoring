create or replace function test_application_workflow() returns setof text as $function$
declare
  the_application uuid;
  the_stage code;
  cursor refcursor;
begin
  set local jwt.claims.staff = '11110000-0000-0000-0000-000011110000';
  
  set local role = scoring_attraction;
  select application_create() into the_application;
  return next isnt(the_application , null, 'application_create should create new application');

  reset role;
  open cursor for
    select stage
    from application_stage
    where application = the_application
  ;
  return next results_eq
    ( cursor
    , $$values ('ATTRACTION'::code)$$
    , 'New application should be in [ATTRACTION] stage'
    );
  close cursor;

end;
$function$ language plpgsql
  set role from current
;

