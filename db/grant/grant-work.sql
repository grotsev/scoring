grant select on table
  application
to scoring_user;

grant insert on table
  application
to scoring_attraction;

grant select, insert, update on table
  -- system
  -- staff
  -- product
  -- application
  individual_responsibility
, take -- TODO rls
, application_stage
  -- address
, address
  -- pledge
, pledge
  -- contract
, contract_actual
, contract_draft
, contract_history
  -- person
, legal_entity
, individual
, individual_cashflow
, individual_phone
, individual_kin
, pledge
  -- pkb
to scoring_user;

grant delete on table
  individual_responsibility
, take
, application_stage
, contract_draft
to scoring_user;

