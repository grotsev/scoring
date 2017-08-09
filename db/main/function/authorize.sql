create function authorize(
  the_role name
) returns jwt_token
  language plpgsql
  stable
  strict
  security definer
as $function$
begin
  select a.role
  from actor_role a
  where a.actor = current_actor()
    and a.role = the_role
  into the_role;

  return (
      current_login()
    , current_actor()
    , coalesce(the_role, 'anonymous')
    , extract(epoch from (now() + interval '1 week'))
  )::jwt_token;
end;
$function$;

comment on function authorize(name) is
  'Creates a JWT token that will securely authorize actor';

