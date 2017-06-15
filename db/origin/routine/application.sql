create table application (
  application uuid_pk primary key

, created_at timestamp with time zone not null default now()
, created_by uuid not null references staff default jwt_staff()

, branch code not null
, outlet code not null
, foreign key (branch, outlet) references outlet
-- TODO trigger fill from session_user current outlet
);

comment on table application is 'Client application to get product';

