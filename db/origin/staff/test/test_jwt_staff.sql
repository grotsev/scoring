create function test_jwt_staff() returns setof text as $function$
begin

  set local role to anonymous;
  set local jwt.claims.staff = '11110000-0000-0000-0000-000011110000';
  return next is
  ( jwt_staff()
  , '11110000-0000-0000-0000-000011110000'::uuid
  , 'jwt_staff() should be jwt.claims.staff'
  );

end;
$function$ language plpgsql
  set role from current
;

