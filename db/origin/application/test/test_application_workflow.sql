create function test_application_workflow() returns setof text as $function$
declare
  the_staff uuid;
  the_application uuid;
  the_borrower uuid;
  the_stage code;
  cursor refcursor;
begin
  set local jwt.claims.staff = '11110000-0000-0000-0000-000011110000';
  select jwt_staff() into the_staff;
  
  set local role = scoring_attraction;

  select application_create() into the_application;
  return next isnt(the_application , null, 'application_create should create new application');

  open cursor for
    select stage
    from staging
    where application = the_application
      and staff = the_staff
  ;
  return next results_eq
    ( cursor
    , $$values ('ATTRACTION'::code)$$
    , 'New application should be in [ATTRACTION] stage'
    );
  close cursor;

  set local role = scoring_attraction;

  update contract set
    product = 'NEEDFUL_CREDIT_MORTGAGE'
  , currency = 'KZT'
  , client_category ='A1'
  , amount = 500000
  where application = the_application
  ;

  insert into individual (application) values (the_application)
  returning individual into the_borrower
  ;

  update individual set
    iin = '800102012345'
  , surname = 'Ivanov'
  , name = 'Ivan'
  , patronymic = 'Ivanovich'
  ;

  perform application_release(the_application);

end;
$function$ language plpgsql
  set role from current
;

