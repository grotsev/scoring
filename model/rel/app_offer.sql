create table app_offer (
	app uuid primary key references app,
	amount numeric not null,
	interest numeric not null,
	term int4 not null check (term between 0 and 1200),
	currency code not null references currency,
	repayment_kind code not null references repayment_kind,
	monthly_payment numeric not null,
	accepted boolean not null
);



