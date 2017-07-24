set client_min_messages to warning;

drop schema if exists scoring_test cascade;
drop schema if exists scoring cascade;

drop role if exists authenticator;
drop role if exists anonymous;

drop owned by scoring cascade;
drop role if exists scoring;

drop role if exists scoring_user;

drop role if exists scoring_administrator;
drop role if exists scoring_attraction;
drop role if exists scoring_application;
drop role if exists scoring_verification;
drop role if exists scoring_pledge_estimation;
drop role if exists scoring_legal_review;
drop role if exists scoring_security;
drop role if exists scoring_risk_management;
drop role if exists scoring_retail_committee;
drop role if exists scoring_credit_committee;
drop role if exists scoring_legal_review_additional;
drop role if exists scoring_middle_administrator;
drop role if exists scoring_contract_signing;
drop role if exists scoring_pledge_registration;
drop role if exists scoring_credit_administrator;
drop role if exists scoring_black_list;
drop role if exists scoring_terrorist_list;
drop role if exists scoring_pkb;

