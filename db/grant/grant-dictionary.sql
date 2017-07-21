grant select on table
  -- system
  lang
  -- staff
, staff
, branch
, outlet
, staff_outlet
, staff_role
  -- product
, currency
, client_category
, product
, product_scheme
, fee_kind
, fee
, product_fee
, product
  -- application
, stage
  -- address
, country
, province
, district
, location
  -- pledge
, auto_brand
, auto_model
, pledge_kind
, wall_material
  -- contract
, credit_kind
, credit_purpose
, income_evidence
, repayment_kind
  -- person
, cashflow_kind
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
  -- pkb
to scoring_user;

-- copy from scoring_user
grant select, insert, update, delete on table
  -- system
  lang
  -- staff
, staff
, branch
, outlet
, staff_outlet
, staff_role
  -- product
, currency
, client_category
, product
, product_scheme
, fee_kind
, fee
, product_fee
, product
  -- application
, stage
  -- address
, country
, province
, district
, location
  -- pledge
, auto_brand
, auto_model
, pledge_kind
, wall_material
  -- contract
, credit_kind
, credit_purpose
, income_evidence
, repayment_kind
  -- person
, cashflow_kind
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
  -- pkb
to scoring_administrator;

alter table staff_role enable row level security;
create policy select_staff_role
  on staff_role
  for select
  using (staff = current_staff());

