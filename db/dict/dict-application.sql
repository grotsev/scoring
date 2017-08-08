create table stage
( stage code not null

, primary key (stage)
);

comment on table stage is
  'Stage is tightly related to agent which pin application to process';

