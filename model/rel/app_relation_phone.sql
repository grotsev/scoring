create table app_relation_phone (
	app uuid,
	relation uuid,
	foreign key (app, relation) references app_relation,
	phone phone,
	primary key (app, relation, phone),
	phone_kind code references phone_kind
);

