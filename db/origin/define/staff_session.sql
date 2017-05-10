create type staff_session as (
  token jwt_token
, login login
, role name
);

