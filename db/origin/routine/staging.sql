create table staging_history (
  application uuid      not null
, staff       uuid      not null
, stage       code      not null
, sys_period  tstzrange not null
);

create table staging (
  primary key (application)
, unique      (staff)
, foreign key (application) references application
, foreign key (staff) references staff
, foreign key (stage) references stage
) inherits (staging_history);

comment on table staging is 'Staff which has taken application for processing';

