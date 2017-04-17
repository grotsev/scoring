create table app_address (
	app uuid references app,
	address uuid,
	primary key (app, address),

	country code not null references country,
	province code not null,
	foreign key (country, province) references province,
	district code not null,
	foreign key (country, province, district) references district,
	location code not null,
	foreign key (country, province, district, location) references location,

	street_district textfield,
	building textfield,
	room textfield,
	postcode textfield
);

alter table app_profile
	add foreign key (app, address_reg) references app_address on delete set null,
	add foreign key (app, address_fact) references app_address on delete set null,
	add foreign key (app, address_work) references app_address on delete set null
;

