create table app_entity (
  app uuid references app
, entity uuid_pk
, primary key (app, entity)

, liability code not null references liability

, title textfield
);

comment on table app is 'Legal entity';

