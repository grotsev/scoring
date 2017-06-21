set client_min_messages to warning;

create schema scoring_test;

create extension if not exists "pgtap" schema scoring_test;

grant execute on all functions in schema scoring_test to authenticator;

grant usage on schema scoring_test to authenticator;

alter role authenticator set search_path to scoring_test, scoring;

