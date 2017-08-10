create table pin
( primary key (application)
, unique      (actor)
, foreign key (application) references application
, foreign key (actor)       references actor
, foreign key (stage)       references stage
) inherits (pin_history);

comment on table pin is 'actor which has pinned application for processing';
