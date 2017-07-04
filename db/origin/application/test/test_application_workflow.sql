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
  
  return next isnt
    ( the_application
    , null
    , 'application_create should create new application'
    );

  return next throws_ok
    ( $$select application_take('$$||the_application||$$', 'ATTRACTION')$$
    , 'duplicate key value violates unique constraint "staging_pkey"'
    , 'Application should not be taken twice'
    );

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

  return next isnt_empty
    ( 'select * from contract_draft w'
    , 'contract_draft should be created by contract_take'
    );

  update contract_draft set
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

  open cursor for
    select product
         , currency
         , client_category
         , amount
    from contract
    where application = the_application
  ;
  return next results_eq
    ( cursor
    , $$values
      ( 'NEEDFUL_CREDIT_MORTGAGE'::code
      , 'KZT'
      , 'A1'
      , 500000
      )$$
    , 'contract should be filled from contract_draft'
    );
  close cursor;

  open cursor for
    select *
    from contract_draft
    where application = the_application
  ;
  return next results_eq
    ( cursor
    , '{}'::text[]
    , 'contract_draft should be cleared by application_release'
    );

  return next diag(array(select row(c.*) from contract_draft c));

end;
$function$ language plpgsql
  set role from current
;

