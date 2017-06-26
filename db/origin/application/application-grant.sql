grant select on table
  stage
, application
, application_stage
to scoring_user;

grant insert on table
  application
, application_stage
to scoring_attraction;

grant execute on function
  application_create()
to scoring_attraction;

