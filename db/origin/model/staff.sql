create table branch (
  branch code primary key
);

comment on table branch is 'Regional division';

create table outlet (
  branch code references branch
, outlet code
, primary key (branch, outlet)
);

comment on table outlet is 'Retail trade point division';



create table staff (
  staff uuid_pk primary key
, login login not null unique
, password_hash varchar(100) not null
);

create table staff_outlet (
  staff uuid primary key references staff
, branch code
, outlet code, foreign key (branch, outlet) references outlet
);

create table staff_role (
  staff uuid references staff
, role name
, primary key (staff, role)
);

