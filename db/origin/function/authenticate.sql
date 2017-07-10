create function authenticate(
  login login,
  password text
) returns jwt_token as $function$
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
$function$ language plpgsql stable strict security definer;

comment on function authenticate(login, text) is
  'Creates a JWT token that will securely identify a staff and give them ability to select role.';


