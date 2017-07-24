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
  
  -- ATTRACTION
  
  select become(auth('attraction', 'scoring_attraction')) into the_staff;

  the_application := application_create();
  return query select check_application_create(the_application, the_staff);
  
  return query select input_contract_draft(the_application);
  return query select input_individual_draft_borrower(the_application);
  perform application_release(the_application);
  return query select check_application_release_attraction(the_application);

  -- BLACK_LIST

  select become(auth('black_list', 'scoring_black_list')) into the_staff;

  -- TERRORIST_LIST

  select become(auth('terrorist_list', 'scoring_terrorist_list')) into the_staff;

  -- APPLICATION

  select become(auth('application', 'scoring_application')) into the_staff;
  -- TODO check history

  -- VERIFICATION

  select become(auth('verification', 'scoring_verification')) into the_staff;

  -- APPLICATION 2 round

  select become(auth('application', 'scoring_application')) into the_staff;

  -- VERIFICATION 2 round

  select become(auth('verification', 'scoring_verification')) into the_staff;

  -- PKB

  select become(auth('pkb', 'scoring_pkb')) into the_staff;
  -- TODO check_score

  -- PLEDGE_ESTIMATION

  select become(auth('pledge_estimation', 'scoring_pledge_estimation')) into the_staff;

  -- LEGAL_REVIEW

  select become(auth('legal_review', 'scoring_legal_review')) into the_staff;

  -- APPLICATION 3 round

  select become(auth('application', 'scoring_application')) into the_staff;

  -- SECURITY

  select become(auth('security', 'scoring_security')) into the_staff;

  -- RISK_MANAGEMENT

  select become(auth('risk_management', 'scoring_risk_management')) into the_staff;

  -- RETAIL_COMMITTEE

  select become(auth('retail_committee', 'scoring_retail_committee')) into the_staff;

  -- CREDIT_COMMITTEE

  select become(auth('credit_committee', 'scoring_credit_committee')) into the_staff;

  -- LEGAL_REVIEW_ADDITIONAL

  select become(auth('legal_review_additional', 'scoring_legal_review_additional')) into the_staff;

  -- MIDDLE_ADMINISTRATOR

  select become(auth('middle_administrator', 'scoring_middle_administrator')) into the_staff;

  -- CONTRACT_SIGNING

  select become(auth('contract_signing', 'scoring_contract_signing')) into the_staff;

  -- PLEDGE_REGISTRATION

  select become(auth('pledge_registration', 'scoring_pledge_registration')) into the_staff;

  -- CREDIT_ADMINISTRATOR

  select become(auth('credit_administrator', 'scoring_credit_administrator')) into the_staff;

end;
$function$;

