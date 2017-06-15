create table legal_entity_responsibility (
  application uuid references contract
, legal_entity uuid, foreign key (application, legal_entity) references legal_entity
, primary key (application, legal_entity)

, responsibility code not null references responsibility
);

