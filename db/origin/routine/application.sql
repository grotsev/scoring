create table application (
  application uuid_pk primary key

, created_at timestamp with time zone not null default now()
, created_by name not null default current_user -- TODO current_setting('request.jwt.claim.login'); check does not work; trigger

, branch code not null
, outlet code not null
, foreign key (branch, outlet) references outlet
-- TODO trigger fill from session_user current outlet

, stage code not null default 'ATTRACTION' references stage
);

comment on table application is 'Client application to get product';

