create function test_authenticate() returns setof text as $function$
begin

  return next is
  ( authenticate('all', 'all')::jwt_token
  , row
    ( 'all'
    , '11110000-0000-0000-0000-000011110000'::uuid
    , 'anonymous'
    , extract(epoch from (now() + interval '10 week'))
    )::jwt_token
  , 'Anonimous should able to authenticate'
  );

end;
$function$ language plpgsql
  set role to anonymous
;

