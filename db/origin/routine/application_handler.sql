create table application_handler (
  application uuid primary key references application
, staff uuid not null references staff unique
, stage code not null references stage
, taken_at timestamp with time zone not null default now()
);

comment on table application_handler is 'Staff which has taken application for processing';

