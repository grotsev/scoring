create function authentication(
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
    return (login, null, 'anonymous')::jwt_token;
  else
    return null;
  end if;
end;
$$ language plpgsql volatile strict security definer;

comment on function authentication(login, text) is
  'Creates a JWT token that will securely identify a staff and give them ability to select role.';

