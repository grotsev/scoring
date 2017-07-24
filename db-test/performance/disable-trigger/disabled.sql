\setrandom term 1 1000
begin;
set local role scoring;
alter table contract_actual disable trigger "020_contract";
select become(auth('attraction', 'scoring_attraction'));
update contract_actual set term = :term where application = '11120000-0000-0000-0000-000011110000';
set local role scoring;
alter table contract_actual enable trigger "020_contract";
commit;
