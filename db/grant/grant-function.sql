grant execute on function
  authenticate(login, text)
, authorize(name)
, current_staff()
, current_login()
, current_authority()
to authenticator, anonymous, scoring_user, scoring_administrator;

grant execute on function
  -- system
  -- staff
  -- product
  -- application
  application_take(uuid, code)
, application_release(uuid)
, route(uuid, code)
, route_default(uuid, code)
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
to scoring_attraction;