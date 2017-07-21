create type jwt_token as (
  login login
, staff  uuid
, role   name
, exp integer
);



-- WARN current_role is reserved word
create function current_rol(
) returns name
  language plpgsql
  stable
as $function$
declare
  result name;
begin
  select current_setting('jwt.claims.role') into result;
  return result;
exception
  when undefined_object then
    return null;
end;
$function$;

comment on function current_rol() is 'Get current role by JWT';



create function current_login(
) returns text
  language plpgsql
  stable
as $function$
declare
  result text;
begin
  select current_setting('jwt.claims.login') into result;
  return result;
exception
  when undefined_object then
    return null;
end;
$function$;

comment on function current_login() is 'Get current login by JWT';



create function current_staff(
) returns uuid
  language plpgsql
  stable
as $function$
declare
  result uuid;
begin
  select current_setting('jwt.claims.staff') into result;
  return result;
exception
  when undefined_object then
    return null;
end;
$function$;

comment on function current_staff() is 'Get current staff by JWT';



create table branch
( branch code not null

, primary key (branch)
);

comment on table branch is 'Regional division';

create table outlet
( branch code not null
, outlet code not null

, primary key (branch, outlet)
, foreign key (branch) references branch
);

comment on table outlet is 'Retail trade point division';



create table staff
( staff uuid_pk not null

, login        login not null
, password_hash text not null

, primary key (staff)
, unique (login)
);

create table staff_outlet
( staff uuid not null
, branch code
, outlet code

, primary key (staff)
, foreign key (staff)          references staff
, foreign key (branch, outlet) references outlet
);

create table staff_role
( staff uuid not null
, role  name not null

, primary key (staff, role)
, foreign key (staff) references staff
);

