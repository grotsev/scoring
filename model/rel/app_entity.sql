create table app_entity (
	app uuid references app,
	entity uuid default uuid_generate_v4(),
	primary key (app, entity),

	liability code not null references liability,

	title textfield
);

comment on table app is 'Legal entity';

