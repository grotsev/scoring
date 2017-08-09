insert into actor values
  ('11110000-0000-0000-0000-000011110000'::uuid, 'all'        , crypt('all'        , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110001'::uuid, 'admin'      , crypt('admin'      , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110002'::uuid, 'attract'    , crypt('attract'    , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110003'::uuid, 'declare'    , crypt('declare'    , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110004'::uuid, 'verify'     , crypt('verify'     , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110005'::uuid, 'pledgerate' , crypt('pledgerate' , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110006'::uuid, 'lawyer'     , crypt('lawyer'     , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110007'::uuid, 'security'   , crypt('security'   , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110008'::uuid, 'risk'       , crypt('risk'       , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110009'::uuid, 'retailcom'  , crypt('retailcom'  , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110010'::uuid, 'creditcom'  , crypt('creditcom'  , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110011'::uuid, 'middle'     , crypt('middle'     , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110012'::uuid, 'signing'    , crypt('signing'    , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110013'::uuid, 'pledgereg'  , crypt('pledgereg'  , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110014'::uuid, 'creditadmin', crypt('creditadmin', gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110015'::uuid, 'blacklist'  , crypt('blacklist'  , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110016'::uuid, 'terrolist'  , crypt('terrolist'  , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110017'::uuid, 'pkb'        , crypt('pkb'        , gen_salt('bf')))
;

insert into actor_outlet values
  ('11110000-0000-0000-0000-000011110000', 'ALMATY', 'CITY_CENTER')
, ('11110000-0000-0000-0000-000011110001', 'ALMATY', 'CITY_CENTER')
, ('11110000-0000-0000-0000-000011110002', 'ALMATY', 'CITY_CENTER')
, ('11110000-0000-0000-0000-000011110003', 'ALMATY', 'CITY_CENTER')
, ('11110000-0000-0000-0000-000011110004', 'ALMATY', 'CITY_CENTER')
, ('11110000-0000-0000-0000-000011110005', 'ALMATY', 'CITY_CENTER')
, ('11110000-0000-0000-0000-000011110006', 'ALMATY', 'CITY_CENTER')
, ('11110000-0000-0000-0000-000011110007', 'ALMATY', 'CITY_CENTER')
, ('11110000-0000-0000-0000-000011110008', 'ALMATY', 'CITY_CENTER')
, ('11110000-0000-0000-0000-000011110009', 'ALMATY', 'CITY_CENTER')
, ('11110000-0000-0000-0000-000011110010', 'ALMATY', 'CITY_CENTER')
, ('11110000-0000-0000-0000-000011110011', 'ALMATY', 'CITY_CENTER')
, ('11110000-0000-0000-0000-000011110012', 'ALMATY', 'CITY_CENTER')
, ('11110000-0000-0000-0000-000011110013', 'ALMATY', 'CITY_CENTER')
, ('11110000-0000-0000-0000-000011110014', 'ALMATY', 'CITY_CENTER')
, ('11110000-0000-0000-0000-000011110015', 'ALMATY', 'CITY_CENTER')
;

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

