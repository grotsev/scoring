insert into staff values
  ('11110000-0000-0000-0000-000011110000'::uuid, 'all'                     , crypt('all'                     , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110001'::uuid, 'administrator'           , crypt('administrator'           , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110002'::uuid, 'attraction'              , crypt('attraction'              , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110003'::uuid, 'application'             , crypt('application'             , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110004'::uuid, 'verification'            , crypt('verification'            , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110005'::uuid, 'pledge_estimation'       , crypt('pledge_estimation'       , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110006'::uuid, 'legal_review'            , crypt('legal_review'            , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110007'::uuid, 'security'                , crypt('security'                , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110008'::uuid, 'risk_management'         , crypt('risk_management'         , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110009'::uuid, 'retail_committee'        , crypt('retail_committee'        , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110010'::uuid, 'credit_committee'        , crypt('credit_committee'        , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110011'::uuid, 'legal_review_additional' , crypt('legal_review_additional' , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110012'::uuid, 'middle_administrator'    , crypt('middle_administrator'    , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110013'::uuid, 'contract_signing'        , crypt('contract_signing'        , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110014'::uuid, 'pledge_registration'     , crypt('pledge_registration'     , gen_salt('bf')))
, ('11110000-0000-0000-0000-000011110015'::uuid, 'credit_administrator'    , crypt('credit_administrator'    , gen_salt('bf')))
;

insert into staff_outlet values
  ('11110000-0000-0000-0000-000011110000', 'ALMATY', 'CITY_CENTER')
, ('11110000-0000-0000-0000-000011110001', 'ALMATY', 'CITY_CENTER')
;

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

create function test_staff() returns setof text as $$
declare
begin
  return next is
  ( authenticate('all', 'all')::jwt_token
  , row
    ( 'all'
    , '11110000-0000-0000-0000-000011110000'::uuid
    , 'anonymous'
    , extract(epoch from (now() + interval '1 week'))
    )::jwt_token
  , 'Anonimous should able to authenticate'
  );

  set local jwt.claims.login = 'all';
  set local jwt.claims.staff = '11110000-0000-0000-0000-000011110000';
  return next is
  ( authorize('scoring_attraction')::jwt_token
  , row
    ( 'all'
    , '11110000-0000-0000-0000-000011110000'::uuid
    , 'scoring_attraction'::name
    , extract(epoch from (now() + interval '1 week'))
    )::jwt_token
  , 'user [all] should able to authorize as scoring_attraction'
  );
end;
$$ language plpgsql
  set role to anonymous
;

