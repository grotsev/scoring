create table stage
( stage code not null

, primary key (stage)
);

comment on table stage is
  'Stage is tightly related to agent which pin application to process';



create table application
( application uuid_pk not null

, created_at timestamptz not null default now() -- TODO move to trigger for security
, created_by        uuid not null default current_staff() -- TODO move to trigger for security

, branch code not null
, outlet code not null

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


create table pin_history
( application     uuid not null
, sys_period tstzrange not null
, staff           uuid not null
, stage           code not null
);

create table pin
( primary key (application)
, unique      (staff)
, foreign key (application) references application
, foreign key (staff)       references staff
, foreign key (stage)       references stage
) inherits (pin_history);

comment on table pin is 'Staff which has pinned application for processing';

create trigger pin_versioning
  before insert or update or delete on pin
  for each row execute procedure versioning('sys_period', 'pin_history', true)
;

create table rework
( application uuid not null
, back        code not null
, forth       code not null

, primary key (application)
, foreign key (back)  references stage
, foreign key (forth) references stage
);

comment on table rework is
  'Fix mistakes in back stage and return forth. Other stages are untouched';


create function assign_outlet(
) returns trigger
  language plpgsql
as $function$
begin
  select branch, outlet
  from staff_outlet
  where staff = current_staff()
  into new.branch, new.outlet;
  return new;
end;
$function$;

create trigger "010_application"
  before insert or update on application
  for each row execute procedure assign_outlet()
;

