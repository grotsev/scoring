create function check_application_release(
  the_application uuid
) returns setof text
  language plpgsql
  set role scoring
as $function$
declare
  cursor refcursor;
begin

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
$function$;

