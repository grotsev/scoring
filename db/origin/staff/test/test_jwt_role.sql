create function test_jwt_role() returns setof text as $function$
begin

  set local role to anonymous;
  set local jwt.claims.role = 'scoring_attraction';
  return next is
  ( jwt_role()
  , 'scoring_attraction'::name
  , 'jwt_role() should be jwt.claims.role'
  );

end;
$function$ language plpgsql
  set role from current
;

