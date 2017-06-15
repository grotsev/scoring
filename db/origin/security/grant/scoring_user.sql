grant select on table
  lang
, currency
, branch
, outlet
, income_evidence
, repayment_kind
, client_category
, product
, cashflow_kind
, fee_kind
, fee
, pledge_kind
, credit_kind
, marital_status
, gender
, tenure
, stage
, country
, province
, district
, location
, idcard_kind
, idcard_authority
, residency
, education
, speciality
, credit_purpose
, phone_kind
, position_category
, kinship
, responsibility
, wall_material
, auto_brand
, auto_model
, product_scheme
, product_fee
to scoring_user
;

grant select, insert, update on table
  application
, offer
, address
, legal_entity
, individual
, individual_cashflow
, individual_phone
, individual_kin
, pledge
to scoring_user
;

