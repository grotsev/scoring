set client_min_messages to warning;

drop schema if exists scoring_test cascade;
drop schema if exists scoring cascade;

drop role if exists authenticator;
drop role if exists anonymous;

drop owned by scoring cascade;
drop role if exists scoring;

drop role if exists scoring_user;

drop role if exists scoring_admin;
drop role if exists scoring_attract;
drop role if exists scoring_declare;
drop role if exists scoring_verify;
drop role if exists scoring_pledgerate;
drop role if exists scoring_lawyer;
drop role if exists scoring_security;
drop role if exists scoring_risk;
drop role if exists scoring_retailcom;
drop role if exists scoring_creditcom;
drop role if exists scoring_middle;
drop role if exists scoring_signing;
drop role if exists scoring_pledgereg;
drop role if exists scoring_creditadmin;
drop role if exists scoring_blacklist;
drop role if exists scoring_terrolist;
drop role if exists scoring_pkb;

