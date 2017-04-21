create table app_address (
	app uuid,
	address uuid default uuid_generate_v4(),
	primary key (app, address),

	country code not null,
	province code not null,
	district code not null,
	location code not null,
	foreign key (country, province, district, location) references location,

	street textfield,
	building textfield,
	room textfield,
	postcode textfield
);

comment on column app_address.street is 'Street or city district';

