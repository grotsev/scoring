grant execute on function
  score(pkb)
, route(uuid)
, route_default(uuid, code)
to scoring_user;

grant select, insert, update, delete on table
  possible_stage
, available_stage
, stage_blocker
to scoring_user;

