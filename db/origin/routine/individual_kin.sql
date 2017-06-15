create table individual_kin (
  application uuid
, individual uuid, foreign key (application, individual) references individual
, kin uuid, foreign key (application, kin) references individual
, primary key (application, individual, kin)

, kinship code not null references kinship
);

