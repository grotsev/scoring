create function current_authority() returns name as $function$
declare
  result name;
begin
  select current_setting('jwt.claims.role') into result;
  return result;
exception
  when undefined_object then
    return null;
end;
$function$ language plpgsql stable;

comment on function current_authority() is 'Get current role by JWT';

