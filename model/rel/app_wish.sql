create table app_wish (
	app uuid primary key references app,

	product code, -- references product
	currency code, -- references currency
	client_category code, -- references client_category
	term_range int4range,
	amount_range int4range,
	foreign key (product, currency, client_category, term_range, amount_range) references product_scheme,
	term int4 check (term between 0 and 1200),
	amount numeric,

	repayment_kind code references repayment_kind,
	income_evidence code references income_evidence,
	pledge_kind code references pledge_kind,
	deposit_value numeric,
	property_value numeric,
	pledge_value numeric,
	pledge_currency code references currency,
	init_payment numeric,
	init_payment_percent numeric,
	pay_date int4 check (pay_date between 1 and 31),

	credit_kind code references credit_kind,
	credit_purpose code references credit_purpose
);

comment on column app_wish.term is 'In month';

