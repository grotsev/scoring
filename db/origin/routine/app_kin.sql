create table app_kin (
	app uuid,
	person uuid, foreign key (app, person) references app_person,
	kin uuid, foreign key (app, kin) references app_person,
	primary key (app, person, kin),

	kinship code not null references kinship
);

