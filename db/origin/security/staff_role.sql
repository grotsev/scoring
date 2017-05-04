create table staff_role (
  staff uuid references staff
, role name
, primary key (staff, role)
);

