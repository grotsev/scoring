grant select on table
  auto_brand
, auto_model
, pledge_kind
, wall_material
to scoring_user;

grant select, insert, update, delete on table
  pledge
to scoring_user;

grant select, insert, update, delete on table
  auto_brand
, auto_model
, pledge_kind
, wall_material
to scoring_administrator;

