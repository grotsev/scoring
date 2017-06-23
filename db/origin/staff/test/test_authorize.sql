create function test_authorize() returns setof text as $function$
begin

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
  , 'user [all] should able to authorize as [scoring_attraction]'
  );

  set local jwt.claims.login = 'attraction';
  set local jwt.claims.staff = '11110000-0000-0000-0000-000011110002';
  return next is
  ( authorize('scoring_attraction')::jwt_token
  , row
    ( 'attraction'
    , '11110000-0000-0000-0000-000011110002'::uuid
    , 'scoring_attraction'::name
    , extract(epoch from (now() + interval '1 week'))
    )::jwt_token
  , 'user [attraction] should able to authorize as [scoring_attraction]'
  );

  set local jwt.claims.login = 'attraction';
  set local jwt.claims.staff = '11110000-0000-0000-0000-000011110002';
  return next is
  ( authorize('scoring_administrator')::jwt_token
  , row
    ( 'attraction'
    , '11110000-0000-0000-0000-000011110002'::uuid
    , 'anonymous'::name
    , extract(epoch from (now() + interval '1 week'))
    )::jwt_token
  , 'user [attraction] should not able to authorize as [scoring_administrator]'
  );

end;
$function$ language plpgsql
  set role to anonymous
;

