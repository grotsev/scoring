create table legal_entity
( application uuid not null
, entity   uuid_pk not null

, title textfield

, primary key (application, entity)
, foreign key (application) references application
);

comment on table legal_entity is 'Legal entity';
