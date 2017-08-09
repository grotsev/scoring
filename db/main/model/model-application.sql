create table application
( application uuid_pk not null

, branch code not null
, outlet code not null

, primary key (application)
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
  'Next possible application stages blocked or available to actors';


create table pin_history
( application     uuid not null
, sys_period tstzrange not null
, actor           uuid not null
, stage           code not null
);

create table pin
( primary key (application)
, unique      (actor)
, foreign key (application) references application
, foreign key (actor)       references actor
, foreign key (stage)       references stage
) inherits (pin_history);

comment on table pin is 'actor which has pinned application for processing';

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
  from actor_outlet
  where actor = current_actor()
  into new.branch, new.outlet;
  return new;
end;
$function$;

create trigger "5_assign_outlet"
  before insert or update on application
  for each row execute procedure assign_outlet()
;

do $block$
begin
  execute (select audit_created_at_by('application'));
end;
$block$;

