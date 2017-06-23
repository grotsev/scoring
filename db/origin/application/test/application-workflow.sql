create or replace function test_application() returns setof text as $$
declare
  a uuid;
begin
  set local jwt.claims.staff = '11110000-0000-0000-0000-000011110000';
  
  select application_create() into a;
  return next isnt(a , null, '');

  --select application_stage
end;
$$ language plpgsql
  set role = scoring_attraction
;

