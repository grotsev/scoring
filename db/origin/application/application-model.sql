create table stage
( stage code primary key
);



create table application
( application uuid_pk primary key

, created_at timestamp with time zone not null default now()
, created_by uuid not null references staff default jwt_staff()

, branch code not null
, outlet code not null
, foreign key (branch, outlet) references outlet
-- TODO trigger fill from session_user current outlet
);

comment on table application is 'Client application to get product';

create table application_stage
( application uuid references application
, stage code not null references stage
, primary key (application, stage)
);

comment on table application_stage is 'Possible next application stages';

create table staging_history
( application uuid      not null
, staff       uuid      not null
, stage       code      not null
, sys_period  tstzrange not null
);

create table staging
( primary key (application)
, unique      (staff)
, foreign key (application) references application
, foreign key (staff) references staff
, foreign key (stage) references stage
) inherits (staging_history);

comment on table staging is 'Staff which has taken application for processing';

create trigger staging_versioning
  before insert or update or delete on staging
  for each row execute procedure versioning('sys_period', 'staging_history', true)
;