-- Database Administator have to create roles and schema before application startup

begin;

create role authenticator  with noinherit login password 'changeme';
create role anonymous      with noinherit role authenticator;

comment on role authenticator is 'Initial connection to become anonymous or an user';
comment on role anonymous     is 'No authentication is provided';

create role scoring           with noinherit login password 'changeme';
create role scoring_audit     with noinherit login password 'changeme' bypassrls;
create role scoring_user      with noinherit role authenticator;
create role scoring_superuser with noinherit role authenticator bypassrls;

comment on role scoring           is 'Owner create and upgrage schema';
comment on role scoring_audit     is 'Read only but total access';
comment on role scoring_user      is 'Group of all routine users';
comment on role scoring_superuser is 'Can do any other routine user can';

create role scoring_attraction              with role scoring_user in role scoring_superuser;
create role scoring_application             with role scoring_user in role scoring_superuser;
create role scoring_verification            with role scoring_user in role scoring_superuser;
create role scoring_pledge_estimation       with role scoring_user in role scoring_superuser;
create role scoring_legal_review            with role scoring_user in role scoring_superuser;
create role scoring_security                with role scoring_user in role scoring_superuser;
create role scoring_risk_management         with role scoring_user in role scoring_superuser;
create role scoring_retail_committee        with role scoring_user in role scoring_superuser;
create role scoring_credit_committee        with role scoring_user in role scoring_superuser;
create role scoring_legal_review_additional with role scoring_user in role scoring_superuser;
create role scoring_middle_administrator    with role scoring_user in role scoring_superuser;
create role scoring_contract_signing        with role scoring_user in role scoring_superuser;
create role scoring_pledge_registration     with role scoring_user in role scoring_superuser;
create role scoring_credit_administrator    with role scoring_user in role scoring_superuser;

create schema authorization scoring;

create extension if not exists "uuid-ossp" schema scoring;
create extension if not exists "pgcrypto"  schema scoring;

commit;

