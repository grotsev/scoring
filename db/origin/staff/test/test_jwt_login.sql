create or replace function test_jwt_login() returns setof text as $$
begin
  
  set local jwt.claims.login = 'all';
  return next is
  ( jwt_login()
  , 'all'
  , 'jwt_login() should be jwt.claims.login'
  );

end;
$$ language plpgsql
  set role = anonymous
;

