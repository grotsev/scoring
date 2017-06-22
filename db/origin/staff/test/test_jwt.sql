create or replace function test_jwt() returns setof text as $$
declare
  a uuid;
begin
  set local jwt.claims.login = 'all';
  set local jwt.claims.staff = '11110000-0000-0000-0000-000011110000';
  set local jwt.claims.role = 'scoring_attraction';
  
  return next is(jwt_login() , 'all', 'jwt_login() should be jwt.claims.login');
  return next is(jwt_staff() , '11110000-0000-0000-0000-000011110000'::uuid, 'jwt_staff() should be jwt.claims.staff');
  return next is(jwt_role() , 'scoring_attraction'::name, 'jwt_role() should be jwt.claims.role');
end;
$$ language plpgsql
  set role = anonymous
;

