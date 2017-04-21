create table product_scheme (
	product code references product,
	currency code references currency,
	client_category code references client_category,
	term_range int4range,
	amount_range int4range,
	primary key (product, currency, client_category, term_range, amount_range),
	interest numeric not null,
	k1 numeric not null,
	k2 numeric not null,
	ltv numeric not null,
	pledge boolean not null,
	active boolean not null default true
);

comment on column product_scheme.term_range is 'In month';

insert into product_scheme values
	('NEEDFUL_CREDIT_MORTGAGE', 'KZT', 'A1', '[12, 120]', '[10000, 100000)',
		13.8, 1, 1, 0, false),
	('NEEDFUL_CREDIT_MORTGAGE', 'KZT', 'B1', '[12, 120]', '[10000, 100000)',
		15, 1, 1, 0, false),
	('NEEDFUL_CREDIT_MORTGAGE', 'KZT', 'A2', '[12, 120]', '[10000, 100000)',
		15, 1, 1, 0, false),
	('NEEDFUL_CREDIT_MORTGAGE', 'KZT', 'B2', '[12, 120]', '[10000, 100000)',
		15, 1, 1, 0, false),
	('NEEDFUL_CREDIT_MORTGAGE', 'USD', 'A1', '[12, 120]', '[1000, 100000)',
		13, 1, 1, 0, false)
;

