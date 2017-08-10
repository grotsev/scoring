-- Database Administator have to create roles and schema before application startup

create role anonymous;
create role authenticator with login password 'changeme' in role anonymous noinherit;
create role scoring       with login password 'changeme' noinherit;

comment on role anonymous     is 'No authentication is provided';
comment on role authenticator is 'Initial connection to become anonymous or an user';
comment on role scoring       is 'Owner create and upgrage schema';

create role scoring_user;

comment on role scoring_user   is 'Routine business user';

create role scoring_admin         with role authenticator;

create role scoring_attract     with role authenticator in role scoring_user;
create role scoring_declare     with role authenticator in role scoring_user;
create role scoring_verify      with role authenticator in role scoring_user;
create role scoring_pledgerate  with role authenticator in role scoring_user;
create role scoring_lawyer      with role authenticator in role scoring_user;
create role scoring_security    with role authenticator in role scoring_user;
create role scoring_risk        with role authenticator in role scoring_user;
create role scoring_retailcom   with role authenticator in role scoring_user;
create role scoring_creditcom   with role authenticator in role scoring_user;
create role scoring_middle      with role authenticator in role scoring_user;
create role scoring_signing     with role authenticator in role scoring_user;
create role scoring_pledgereg   with role authenticator in role scoring_user;
create role scoring_creditadmin with role authenticator in role scoring_user;
create role scoring_blacklist   with role authenticator in role scoring_user;
create role scoring_terrolist   with role authenticator in role scoring_user;
create role scoring_pkb         with role authenticator in role scoring_user;

create schema authorization scoring;

-- temporary superuser scoring to create extensions owned by scoring
alter role scoring with superuser;
set local role scoring;

create extension if not exists "uuid-ossp";
create extension if not exists "pgcrypto";
create extension if not exists "temporal_tables";

reset role;
alter role scoring with nosuperuser;

alter default privileges for role scoring revoke execute on functions from public;

grant usage on schema scoring to public;
