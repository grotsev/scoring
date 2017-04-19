create table app_phone (
	app uuid references app,
	phone phone,
	primary key (app, phone),
	phone_kind code references phone_kind
);

