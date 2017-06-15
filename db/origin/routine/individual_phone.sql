create table individual_phone (
  application uuid
, individual uuid, foreign key (application, individual) references individual
, phone phone
, primary key (application, individual, phone)

, phone_kind code not null references phone_kind
);

