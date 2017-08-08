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
  actor actor;
begin

  select a.* into actor
  from actor a
  where a.login = the_login;

  if actor.password_hash = crypt(the_password, actor.password_hash) then
    return (
        the_login
      , actor.actor
      , 'anonymous'
      , extract(epoch from (now() + interval '1 week'))
    )::jwt_token;
  else
    return null;
  end if;

end;
$function$;

comment on function authenticate(login, text) is
  'Creates a JWT token that will securely identify a actor and give them ability to select authority';

