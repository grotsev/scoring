create function test_application_workflow(
) returns setof text
  language plpgsql
  set role from current
as $function$
declare
  the_staff uuid;
  the_application uuid;
  the_borrower uuid;
  the_stage code;
begin

  set local jwt.claims.staff = '11110000-0000-0000-0000-000011110000';
  select current_staff() into the_staff;
  set local role = scoring_attraction;

  the_application := application_create();
  return query select check_application_create(the_application, the_staff);
  
  return query select input_contract_draft(the_application);
  return query select input_individual_draft_borrower(the_application);
  perform application_release(the_application);
  return query select check_application_release(the_application);
  
end;
$function$;

