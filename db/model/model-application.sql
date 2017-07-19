create table stage
( stage code not null

, primary key (stage)
);

comment on table stage is
  'Stage is tightly related to agent which take application to process';



create table application
( application uuid_pk not null

, created_at timestamptz not null default now() -- TODO move to trigger for security
, created_by        uuid not null default current_staff() -- TODO move to trigger for security

, branch code not null
, outlet code not null
-- TODO trigger fill from session_user current outlet

, primary key (application)
, foreign key (created_by)     references staff
, foreign key (branch, outlet) references outlet
);

comment on table application is
  'Client application to get a product';

create table application_stage
( application uuid not null
, stage       code not null
, blocked  boolean not null

, primary key (application, stage)
, foreign key (application) references application
, foreign key (stage)       references stage
);

comment on table application_stage is
  'Next possible application stages blocked or available to staffs';


create table take_history
( application     uuid not null
, sys_period tstzrange not null
, staff           uuid not null
, stage           code not null
);

create table take
( primary key (application)
, unique      (staff)
, foreign key (application) references application
, foreign key (staff)       references staff
, foreign key (stage)       references stage
) inherits (take_history);

comment on table take is 'Staff which has taken application for processing';

create trigger take_versioning
  before insert or update or delete on take
  for each row execute procedure versioning('sys_period', 'take_history', true)
;

