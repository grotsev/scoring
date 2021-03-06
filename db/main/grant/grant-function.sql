grant execute on function
  authenticate(login, text)
, authorize(name)
, current_actor()
, current_login()
, current_rol()
, available_role()
to authenticator, anonymous, scoring_user, scoring_admin;

grant execute on function
  -- system
  -- actor
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
, effective_term(code,int4,numeric)
to scoring_user;

grant execute on function
  application_create()
to scoring_attract;
