create function application_create() returns void as $$
  insert into application (branch, outlet)
    select branch, outlet
    from staff_outlet
    where staff = jwt_staff()
$$ language sql;

create function application_take(application uuid, stage code) returns void as $$
  insert into staging (application, staff, stage, sys_period)
    values ($1, jwt_staff(), $2, tstzrange(now(), null) )
$$ language sql;

