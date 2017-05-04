create table staff (
  staff uuid_pk primary key
, login login not null unique
, password_hash varchar(100) not null
);

