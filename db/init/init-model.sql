-- Database Administator have to create roles and schema before application startup

create role anonymous;
create role authenticator with login password 'changeme' in role anonymous noinherit;
create role scoring       with login password 'changeme';

comment on role anonymous     is 'No authentication is provided';
comment on role authenticator is 'Initial connection to become anonymous or an user';
comment on role scoring       is 'Owner create and upgrage schema';

create role scoring_user;
create role scoring_public with role anonymous, scoring_user;

comment on role scoring_user   is 'Routine business user';
comment on role scoring_public is 'Anybody concern scoring system';

create role scoring_administrator           with role authenticator in role scoring_user;
create role scoring_attraction              with role authenticator in role scoring_user;
create role scoring_application             with role authenticator in role scoring_user;
create role scoring_verification            with role authenticator in role scoring_user;
create role scoring_pledge_estimation       with role authenticator in role scoring_user;
create role scoring_legal_review            with role authenticator in role scoring_user;
create role scoring_security                with role authenticator in role scoring_user;
create role scoring_risk_management         with role authenticator in role scoring_user;
create role scoring_retail_committee        with role authenticator in role scoring_user;
create role scoring_credit_committee        with role authenticator in role scoring_user;
create role scoring_legal_review_additional with role authenticator in role scoring_user;
create role scoring_middle_administrator    with role authenticator in role scoring_user;
create role scoring_contract_signing        with role authenticator in role scoring_user;
create role scoring_pledge_registration     with role authenticator in role scoring_user;
create role scoring_credit_administrator    with role authenticator in role scoring_user;

create schema authorization scoring;

-- temporary superuser scoring to create extensions owned by scoring
alter role scoring with superuser;
set local role scoring;

create extension if not exists "uuid-ossp";
create extension if not exists "pgcrypto";
create extension if not exists "temporal_tables";

reset role;
alter role scoring with nosuperuser;

