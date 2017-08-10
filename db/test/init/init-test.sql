set client_min_messages to warning;
set plpgsql.extra_warnings to 'all';

create schema scoring_test authorization scoring;

create extension if not exists "pgtap" schema scoring_test;

alter database postgres set search_path to scoring_test, scoring;
