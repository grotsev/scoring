grant execute on function
  authenticate(login, text)
, authorize(name)
, current_staff()
, current_login()
, current_rol()
to authenticator, anonymous, scoring_user, scoring_admin;

grant execute on function
  -- system
  -- staff
  -- product
  -- application
  pin(uuid,code)
, unpin(uuid,code,boolean)
, route(uuid,code)
, route_default(uuid,code)
  -- address
  -- pledge
  -- contract
  -- person
  -- pkb
  -- formula
, score(pkb)
to scoring_user;

grant execute on function
  application_create()
to scoring_attract;
