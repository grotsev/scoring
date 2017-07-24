\setrandom term 1 1000
begin;
select become(auth('attraction', 'scoring_attraction'));
update contract_actual set term = :term where application = '11120000-0000-0000-0000-000011110001';
commit;
