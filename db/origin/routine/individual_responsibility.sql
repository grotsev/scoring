create table individual_responsibility (
  application uuid references contract
, individual uuid, foreign key (application, individual) references individual
, primary key (application, individual)

, responsibility code not null references responsibility
);

