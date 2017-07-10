create function current_login() returns text as $function$
declare
  result text;
begin
  select current_setting('jwt.claims.login') into result;
  return result;
exception
  when undefined_object then
    return null;
end;
$function$ language plpgsql stable;

comment on function current_login() is 'Get current login by JWT';

