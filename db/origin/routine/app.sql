create table app (
	app uuid default uuid_generate_v4() primary key,

	created_at timestamp with time zone not null default now(),
	created_by name not null default current_user, -- TODO current_setting('request.jwt.claim.login'), check does not work, trigger
	
	branch code not null,
	outlet code not null,
	foreign key (branch, outlet) references outlet,
	-- TODO trigger fill from session_user current outlet

	stage code not null default 'ATTRACTION' references stage,

	product code not null references product,
	currency code not null references currency,
	client_category code not null references currency,
	term_range int4range not null,
	amount_range int4range not null,
	foreign key (product, currency, client_category, term_range, amount_range) references product_scheme,
	term int4 not null check (term between 0 and 1200),
	amount numeric not null,

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
	monthly_payment numeric,
	offer_accepted boolean,

	credit_kind code references credit_kind,
	credit_purpose code references credit_purpose
);

comment on table app is 'Client application to get product';
comment on column app.term is 'In month';

