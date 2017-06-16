create table staff_outlet (
  staff uuid primary key references staff
, branch code
, outlet code, foreign key (branch, outlet) references outlet
);

