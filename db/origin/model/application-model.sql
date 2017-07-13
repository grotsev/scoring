create table stage
( stage code primary key
);

comment on table stage is
  'Stage is tightly related to agent which take application to process';

create table stage_blocker
( blocker code references stage
, blocked code references stage
, primary key (blocker, blocked)
);

comment on table stage_blocker is
  'Dependency to forbid to take a stage when there is another';



create table application
( application uuid_pk primary key

, created_at timestamp with time zone not null default now()
, created_by uuid not null references staff default current_staff()

, branch code not null
, outlet code not null
, foreign key (branch, outlet) references outlet
-- TODO trigger fill from session_user current outlet
);

comment on table application is
  'Client application to get product';

create table possible_stage
( application uuid references application
, stage code not null references stage
, primary key (application, stage)
);

comment on table possible_stage is
  'Possible next application stages';

create table available_stage
( application uuid references application
, stage code not null references stage
, primary key (application, stage)
);

comment on table available_stage is
  'Available next application stages is possible stages except blocked';

create table take_history
( application uuid      not null
, sys_period  tstzrange not null
, staff       uuid      not null
, stage       code      not null
);

create table take
( primary key (application)
, unique      (staff)
, foreign key (application) references application
, foreign key (staff) references staff
, foreign key (stage) references stage
) inherits (take_history);

comment on table take is 'Staff which has taken application for processing';

create trigger take_versioning
  before insert or update or delete on take
  for each row execute procedure versioning('sys_period', 'take_history', true)
;

