create function auth(
  the_login text,
  the_role name
) returns jwt_token
  language plpgsql
  security definer
as $function$
declare
  the_actor uuid;
begin
  select s.actor
  from actor s
    inner join actor_role r on s.actor = r.actor
  where s.login = the_login
    and r.role = the_role
  into the_actor;

  if not found then
    raise 'actor with login % and role % is not found', the_login, the_role;
  end if;

  return (
      the_login
    , the_actor
    , the_role
    , extract(epoch from (now() + interval '1 week'))
  )::jwt_token;
end;
$function$;

comment on function auth(text, name) is
  'Authenticate and authorize without password but check actor_role';
