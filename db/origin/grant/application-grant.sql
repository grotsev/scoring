grant select on table
  stage
, application
, individual_responsibility
to scoring_user;

grant insert on table
  application
to scoring_attraction;

grant select, insert, update, delete on table
  take
, possible_stage
to scoring_attraction;

grant execute on function
  application_create()
, application_take(uuid, code)
, application_release(uuid)
to scoring_attraction;

