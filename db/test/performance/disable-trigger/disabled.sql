\setrandom term 1 1000
begin;
set local role scoring;
alter table contract disable trigger "020_contract";
select become(auth('attract', 'scoring_attract'));
update contract set term = :term where application = '11120000-0000-0000-0000-000011110000';
set local role scoring;
alter table contract enable trigger "020_contract";
commit;
