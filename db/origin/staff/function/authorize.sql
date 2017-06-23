create function authorize(
  role name
) returns jwt_token as $function$
declare
  role name;
begin
  select a.role into role
  from staff_role a
  where a.staff = jwt_staff() and a.role = $1;

  return (
      jwt_login()
    , jwt_staff()
    , coalesce(role, 'anonymous')
    , extract(epoch from (now() + interval '1 week'))
  )::jwt_token;
end;
$function$ language plpgsql stable strict security definer;

comment on function authorize(name) is
  'Creates a JWT token that will securely authorize role.';

