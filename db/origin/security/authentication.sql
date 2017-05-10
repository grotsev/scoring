create function authentication(
  login login,
  password text
) returns staff_session as $$
declare
  staff staff;
begin
  select a.* into staff
  from staff a
  where a.login = $1;

  if staff.password_hash = crypt(password, staff.password_hash) then
    return (
      ( staff.staff, 'anonymous')::jwt_token
      , staff.login
      , 'anonymous'
    )::staff_session;
  else
    return null;
  end if;
end;
$$ language plpgsql volatile strict security definer;

comment on function authentication(login, text) is 'Creates a JWT token that will securely identify a staff and give them ability to select role.';

