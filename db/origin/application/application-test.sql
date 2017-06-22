create or replace function test_application_create() returns setof text as $$
declare
  a uuid;
begin
  set local jwt.claims.staff = '11110000-0000-0000-0000-000011110000';
  
  select application_create() into a;
  return next isnt(a , null, '' );
end;
$$ language plpgsql
  set role = scoring_attraction
;

