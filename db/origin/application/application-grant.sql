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
to scoring_attraction;

