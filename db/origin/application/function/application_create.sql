create function application_create() returns uuid as $$
  insert into application (branch, outlet)
    select branch, outlet
    from staff_outlet
    where staff = jwt_staff()
  returning application
$$ language sql;

