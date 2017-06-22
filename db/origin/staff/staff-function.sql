create function authenticate(
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
    return (
        login
      , staff.staff
      , 'anonymous'
      , extract(epoch from (now() + interval '1 week'))
    )::jwt_token;
  else
    return null;
  end if;
end;
$$ language plpgsql stable strict security definer;

comment on function authenticate(login, text) is
  'Creates a JWT token that will securely identify a staff and give them ability to select role.';



create function authorize(
  role name
) returns jwt_token as $$
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
$$ language plpgsql stable strict security definer;

comment on function authorize(name) is
  'Creates a JWT token that will securely authorize role.';



create function jwt_login() returns text as $$
declare
  result text;
begin
  select current_setting('jwt.claims.login') into result;
  return result;
exception
  when undefined_object then
    return null;
end;
$$ language plpgsql stable;

comment on function jwt_login() is 'Get current login by JWT';



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



create function jwt_staff() returns uuid as $$
declare
  result uuid;
begin
  select current_setting('jwt.claims.staff') into result;
  return result;
exception
  when undefined_object then
    return null;
end;
$$ language plpgsql stable;

comment on function jwt_login() is 'Get current staff by JWT';

