create table app_phone (
	app uuid,
	person uuid, foreign key (app, person) references app_person,
	phone phone,
	primary key (app, person, phone),

	phone_kind code not null references phone_kind
);

