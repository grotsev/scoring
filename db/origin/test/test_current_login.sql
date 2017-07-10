create function test_current_login(
) returns setof text
  language plpgsql
  set role from current
as $function$
begin
  
  set local role to anonymous;
  set local jwt.claims.login = 'all';
  return next is
  ( current_login()
  , 'all'
  , 'current_login() should be jwt.claims.login'
  );

end;
$function$;

