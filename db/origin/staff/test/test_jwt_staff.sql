create or replace function test_jwt() returns setof text as $function$
begin

  set local jwt.claims.staff = '11110000-0000-0000-0000-000011110000';
  return next is
  ( jwt_staff()
  , '11110000-0000-0000-0000-000011110000'::uuid
  , 'jwt_staff() should be jwt.claims.staff'
  );

end;
$function$ language plpgsql
  set role = anonymous
;

