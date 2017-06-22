grant select on table
  stage
, application
to scoring_user;

grant insert on table
  application
to scoring_attraction;

grant execute on function
  application_create()
to scoring_attraction;

