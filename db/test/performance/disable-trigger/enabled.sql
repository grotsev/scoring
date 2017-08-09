\setrandom term 1 1000
begin;
select become(auth('attract', 'scoring_attract'));
update contract set term = :term where application = '11120000-0000-0000-0000-000011110001';
commit;
