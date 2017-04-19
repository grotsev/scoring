create table app_term (
	app uuid primary key references app,
	credit_purpose code references credit_purpose,
	client_category code references client_category,
	init_payment numeric,
	init_payment_percent numeric,
	pay_date int4 check (pay_date between 1 and 31)
);

