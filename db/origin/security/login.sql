create function login(
  login login,
  password text
) returns jwt_token as $$
declare
  staff staff;
begin
  select a.* into staff
  from staff a
  where a.login = $1;

  if staff.password_hash = crypt(password, staff.password_hash) then
    return (staff.staff, staff.login, 'scoring_authenticator')::jwt_token;
  else
    return null;
  end if;
end;
$$ language plpgsql stable strict security definer;

comment on function login(login, text) is 'Creates a JWT token that will securely identify a staff and give them ability to select role.';

