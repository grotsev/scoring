grant usage on schema scoring to scoring_public;

grant select on table
  lang
to scoring_user, scoring_administrator;

grant select, insert, update on table
  lang
to scoring_administrator;

