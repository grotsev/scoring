grant usage on schema scoring to scoring_audit;
grant select on all tables in schema scoring to scoring_audit;
grant select on all sequences in schema scoring to scoring_audit;

-- TODO grant execute on function login to scoring_auth, scoring_anon;

grant select
on lang
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
 , liability
 , wall_material
 , auto_brand
 , auto_model
 , product_scheme
 , product_fee
to scoring_user
;

grant select, insert, update
on app
 , app_address
 , app_entity
 , app_person
 , app_cashflow
 , app_phone
 , app_kin
 , app_pledge
to scoring_attraction
 , scoring_application
 , scoring_verification
 , scoring_pledge_estimation
 , scoring_legal_review
 , scoring_security
 , scoring_risk_management
 , scoring_retail_committee
 , scoring_credit_committee
 , scoring_legal_review_additional
 , scoring_middle_administrator
 , scoring_contract_signing
 , scoring_pledge_registration
 , scoring_credit_administrator
;

