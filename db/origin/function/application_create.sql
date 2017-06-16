create function application_create() returns void as $$
  insert into application (branch, outlet)
    select branch, outlet
    from staff_outlet
    where staff = jwt_staff()
$$ language sql;

