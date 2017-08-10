insert into actor_role
  select a.actor
       , 'scoring_' || o.login as role
  from actor a
    cross join actor o
  where a.login = 'all'
    and o.login != 'all'
;

insert into actor_role
  select actor
       , 'scoring_' || login as role
  from actor
  where login != 'all'
;
