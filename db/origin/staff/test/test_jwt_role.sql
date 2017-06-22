create or replace function test_jwt_role() returns setof text as $$
begin

  set local jwt.claims.role = 'scoring_attraction';
  return next is
  ( jwt_role()
  , 'scoring_attraction'::name
  , 'jwt_role() should be jwt.claims.role'
  );

end;
$$ language plpgsql
  set role = anonymous
;

