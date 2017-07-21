create function authorize(
  role name
) returns jwt_token
  language plpgsql
  stable
  strict
  security definer
as $function$
declare
  the_role name;
begin
  select a.role
  from staff_role a
  where a.staff = current_staff()
    and a.role = $1
  into the_role;

  return (
      current_login()
    , current_staff()
    , coalesce(the_role, 'anonymous')
    , extract(epoch from (now() + interval '1 week'))
  )::jwt_token;
end;
$function$;

comment on function authorize(name) is
  'Creates a JWT token that will securely authorize staff';

