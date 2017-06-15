create table individual_cashflow (
  application uuid
, individual uuid, foreign key (application, individual) references individual
, cashflow_kind code references cashflow_kind
, primary key (application, individual, cashflow_kind)

, amount numeric not null
);

