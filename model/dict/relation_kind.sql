create table relation_kind (
	relation_kind code primary key
);

insert into relation_kind values
	('PARENT'),
	('CHILD'),
	('SIBLING'),
	('UNCLE_AUNT'),
	('KINSMAN'),
	('FRIEND'),
	('COLLEAGUE')
;

