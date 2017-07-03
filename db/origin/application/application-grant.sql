grant select on table
  stage
, application
, staging
to scoring_user;

grant insert on table
  application
, staging
to scoring_attraction;

grant execute on function
  application_create()
, application_take(uuid, code)
, application_release(uuid)
to scoring_attraction;

