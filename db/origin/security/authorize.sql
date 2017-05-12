create function authorize(
  role name
) returns jwt_token as $$
declare
  role name;
begin
  select a.role into role
  from staff_role a
  where a.staff = jwt_staff() and a.role = $1;

  return (jwt_login(), jwt_staff(), coalesce(role, 'anonymous'))::jwt_token;
end;
$$ language plpgsql stable strict security definer;

comment on function authorize(name) is
  'Creates a JWT token that will securely authorize role.';

