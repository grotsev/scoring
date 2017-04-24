create table kinship (
  kinship code primary key
);

comment on table kinship is 'Relationship to person';

insert into kinship values
  ('PARENT')
, ('CHILD')
, ('SIBLING')
, ('UNCLE_AUNT')
, ('KINSMAN')
, ('FRIEND')
, ('COLLEAGUE')
;

