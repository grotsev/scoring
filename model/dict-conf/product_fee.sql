create table product_fee (
	product code, -- references product
	currency code, -- references currency
	client_category code, -- references client_category
	term_range int4range,
	amount_range int4range,
	foreign key (product, currency, client_category, term_range, amount_range) references product_scheme,
	fee code references fee,
	primary key (product, currency, client_category, term_range, amount_range, fee)
);

insert into product_fee
	select p.product, p.currency, p.client_category, p.term_range, p.amount_range, f.fee
	from product_scheme p
		cross join fee f
;

