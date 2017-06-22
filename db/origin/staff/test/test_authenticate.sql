create function test_authenticate() returns setof text as $$
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

end;
$$ language plpgsql
  set role to anonymous
;

