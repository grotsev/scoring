create table legal_entity (
  application uuid references application
, entity uuid_pk
, primary key (application, entity)

, liability code not null references liability

, title textfield
);

comment on table legal_entity is 'Legal entity';

