grant select on table
  country
, province
, district
, location
to scoring_user;

grant select, insert, update on table
  address
to scoring_user;

grant select, insert, update on table
  country
, province
, district
, location
to scoring_administrator;

