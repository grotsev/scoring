create table attr
( rel  name not null
, attr name not null

, primary key (rel, attr)
, foreign key (rel) references rel
);

comment on table attr is
  'Attribute of relation';
