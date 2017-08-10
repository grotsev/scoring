create table actor
( actor uuid_pk not null

, login        login not null
, password_hash text not null

, primary key (actor)
, unique (login)
);
