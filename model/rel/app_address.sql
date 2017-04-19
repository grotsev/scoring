create table app_address (
	app uuid,
	person uuid, foreign key (app, person) references app_person,
	address uuid default uuid_generate_v4(),
	primary key (app, person, address),

	country code not null references country,
	province code not null,
	foreign key (country, province) references province,
	district code not null,
	foreign key (country, province, district) references district,
	location code not null,
	foreign key (country, province, district, location) references location,

	street textfield,
	building textfield,
	room textfield,
	postcode textfield
);

comment on column app_address.street is 'Street or city district';

alter table app_person
	add foreign key (app, person, address_reg) references app_address on delete set null,
	add foreign key (app, person, address_fact) references app_address on delete set null,
	add foreign key (app, person, address_work) references app_address on delete set null
;

