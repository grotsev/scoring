create function jwt_role() returns name as $$
declare
  result name;
begin
  select current_setting('jwt.claims.role') into result;
  return result;
exception
  when undefined_object then
    return null;
end;
$$ language plpgsql stable;

comment on function jwt_role() is 'Get current role by JWT';

