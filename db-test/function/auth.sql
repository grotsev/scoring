create function auth(
  the_login text,
  the_role name
) returns jwt_token
  language plpgsql
  security definer
as $function$
declare
  the_staff uuid;
begin
  select s.staff
  from staff s
    inner join staff_role r on s.staff = r.staff
  where s.login = the_login
    and r.role = the_role
  into the_staff;

  if not found then
    raise 'staff with login % and role % is not found', the_login, the_role;
  end if;

  return (
      the_login
    , the_staff
    , the_role
    , extract(epoch from (now() + interval '1 week'))
  )::jwt_token;
end;
$function$;

comment on function auth(text, name) is
  'Authenticate and authorize without password but check staff_role';

