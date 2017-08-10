create table actor_role
( actor uuid not null
, role  name not null

, primary key (actor, role)
, foreign key (actor) references actor
);
