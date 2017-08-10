create type jwt_token as (
  login login
, actor  uuid
, role   name
, exp    int4
);
