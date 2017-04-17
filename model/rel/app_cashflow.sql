create table app_cashflow (
	app uuid references app,
	cashflow_kind code references cashflow_kind,
	primary key (app, cashflow_kind)
);

