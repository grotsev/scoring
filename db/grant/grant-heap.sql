grant execute on function
  score(pkb)
, route(uuid, code)
, route_default(uuid, code)
to scoring_user;

grant select, insert, update, delete on table
  application_stage
to scoring_user;

