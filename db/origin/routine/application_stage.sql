create table application_stage (
  application uuid references application
, stage code not null references stage
, primary key (application, stage)
);

comment on table application_handler is 'Possible next application stages';

