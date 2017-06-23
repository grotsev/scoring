create function jwt_staff() returns uuid as $function$
declare
  result uuid;
begin
  select current_setting('jwt.claims.staff') into result;
  return result;
exception
  when undefined_object then
    return null;
end;
$function$ language plpgsql stable;

comment on function jwt_login() is 'Get current staff by JWT';

