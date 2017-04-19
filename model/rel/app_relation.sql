create table app_relation (
	app uuid references app,
	relation uuid default uuid_generate_v4(),
	primary key (app, relation),
	surname textfield not null,
	name textfield not null,
	patronymic textfield,
	relation_kind code references relation_kind
);

