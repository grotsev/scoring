create table app_relation_phone (
	app uuid references app,
	relation uuid,
	phone phone,
	primary key (app, relation, phone),
	phone_kind code references phone_kind
);

