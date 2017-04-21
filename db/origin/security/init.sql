-- Database Administator have to create roles and schema before application startup

create role scoring       with noinherit login password 'changeme';
create role scoring_audit with noinherit login bypassrls password 'changeme';
create role scoring_auth  with noinherit login password 'changeme';
create role scoring_anon  with noinherit role scoring_auth;
create role scoring_user  with noinherit role scoring_auth;

comment on role scoring       is 'Owner create and upgrage schema';
comment on role scoring_audit is 'Read only but total access';
comment on role scoring_auth  is 'PostgREST connects to become anonymous or one of the users';
comment on role scoring_anon  is 'PostgREST use when no client authentication is provided';
comment on role scoring_user  is 'Group of all routine users';

create role scoring_attraction              with role scoring_user;
create role scoring_application             with role scoring_user;
create role scoring_verification            with role scoring_user;
create role scoring_pledge_estimation       with role scoring_user;
create role scoring_legal_review            with role scoring_user;
create role scoring_security                with role scoring_user;
create role scoring_risk_management         with role scoring_user;
create role scoring_retail_committee        with role scoring_user;
create role scoring_credit_committee        with role scoring_user;
create role scoring_legal_review_additional with role scoring_user;
create role scoring_middle_administrator    with role scoring_user;
create role scoring_contract_signing        with role scoring_user;
create role scoring_pledge_registration     with role scoring_user;
create role scoring_credit_administrator    with role scoring_user;

create schema authorization scoring;

create extension "uuid-ossp";

