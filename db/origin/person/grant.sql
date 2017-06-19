grant select on table
  cashflow_kind
, education
, gender
, idcard_authority
, idcard_kind
, kinship
, marital_status
, phone_kind
, position_category
, residency
, responsibility
, speciality
, tenure
to scoring_user;

grant select, insert, update on table
  legal_entity
, individual
, individual_cashflow
, individual_phone
, individual_kin
, pledge
to scoring_user
;

grant select, insert, update, delete on table
  cashflow_kind
, education
, gender
, idcard_authority
, idcard_kind
, kinship
, marital_status
, phone_kind
, position_category
, residency
, responsibility
, speciality
, tenure
to scoring_administrator;

