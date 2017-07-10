create function test_current_authority() returns setof text as $function$
begin

  set local role to anonymous;
  set local jwt.claims.role = 'scoring_attraction';
  return next is
  ( current_authority()
  , 'scoring_attraction'::name
  , 'current_authority() should be jwt.claims.role'
  );

end;
$function$ language plpgsql
  set role from current
;

