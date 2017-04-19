create table app_cashflow (
	app uuid,
	person uuid, foreign key (app, person) references app_person,
	cashflow_kind code references cashflow_kind,
	primary key (app, person, cashflow_kind),

	amount numeric not null
);

