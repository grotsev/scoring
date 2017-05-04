insert into staff_role
  select a.staff
       , 'scoring_' || o.login as role
  from staff a
    cross join staff o
  where a.login = 'all'
    and o.login != 'all'
;

insert into staff_role
  select staff
       , 'scoring_' || login as role
  from staff
  where login != 'all'
;

