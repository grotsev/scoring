create domain login as text
  check (value ~ '^[A-Za-z][A-Za-z_0-9]{0,31}$')
;


create type jwt_token as (
  login login
, actor  uuid
, role   name
, exp    int4
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



create function current_actor(
) returns uuid
  language plpgsql
  stable
as $function$
declare
  result uuid;
begin
  select current_setting('jwt.claims.actor') into result;
  return result;
exception
  when undefined_object then
    return null;
end;
$function$;

comment on function current_actor() is 'Get current actor by JWT';



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



create table actor
( actor uuid_pk not null

, login        login not null
, password_hash text not null

, primary key (actor)
, unique (login)
);

create table actor_outlet
( actor uuid not null
, branch code
, outlet code

, primary key (actor)
, foreign key (actor)          references actor
, foreign key (branch, outlet) references outlet
);

create table actor_role
( actor uuid not null
, role  name not null

, primary key (actor, role)
, foreign key (actor) references actor
);

set lib.actor_table = 'actor';
