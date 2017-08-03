create function authenticate(
  the_login login,
  the_password text
) returns jwt_token
  language plpgsql
  stable
  strict
  security definer
as $function$
declare
  staff staff;
begin

  select a.* into staff
  from staff a
  where a.login = the_login;

  if staff.password_hash = crypt(the_password, staff.password_hash) then
    return (
        the_login
      , staff.staff
      , 'anonymous'
      , extract(epoch from (now() + interval '1 week'))
    )::jwt_token;
  else
    return null;
  end if;

end;
$function$;

comment on function authenticate(login, text) is
  'Creates a JWT token that will securely identify a staff and give them ability to select authority';

