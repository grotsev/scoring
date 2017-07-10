create type jwt_token as (
  login login
, staff uuid
, role name
, exp integer
);


create function current_authority() returns name as $function$
declare
  result name;
begin
  select current_setting('jwt.claims.role') into result;
  return result;
exception
  when undefined_object then
    return null;
end;
$function$ language plpgsql stable;

comment on function current_authority() is 'Get current role by JWT';


create function current_login() returns text as $function$
declare
  result text;
begin
  select current_setting('jwt.claims.login') into result;
  return result;
exception
  when undefined_object then
    return null;
end;
$function$ language plpgsql stable;

comment on function current_login() is 'Get current login by JWT';


create function current_staff() returns uuid as $function$
declare
  result uuid;
begin
  select current_setting('jwt.claims.staff') into result;
  return result;
exception
  when undefined_object then
    return null;
end;
$function$ language plpgsql stable;

comment on function current_staff() is 'Get current staff by JWT';


create table branch
( branch code primary key
);

comment on table branch is 'Regional division';

create table outlet
( branch code references branch
, outlet code
, primary key (branch, outlet)
);

comment on table outlet is 'Retail trade point division';



create table staff
( staff uuid_pk primary key
, login login not null unique
, password_hash varchar(100) not null
);

create table staff_outlet
( staff uuid primary key references staff
, branch code
, outlet code, foreign key (branch, outlet) references outlet
);

create table staff_role
( staff uuid references staff
, role name
, primary key (staff, role)
);

