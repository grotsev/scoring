create function test_current(
) returns setof text
  language plpgsql
  set role from current
as $function$
begin

  set local role anonymous;
  set local jwt.claims.staff = '11110000-0000-0000-0000-000011110000';
  set local jwt.claims.login = 'all';
  set local jwt.claims.role = 'scoring_attraction';

  return next is
  ( current_staff()
  , '11110000-0000-0000-0000-000011110000'::uuid
  , 'current_staff() = jwt.claims.staff'
  );
  
  return next is
  ( current_login()
  , 'all'
  , 'current_login() = jwt.claims.login'
  );

  return next is
  ( current_rol()
  , 'scoring_attraction'::name
  , 'current_rol() = jwt.claims.role'
  );

end;
$function$;

