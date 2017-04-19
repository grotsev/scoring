create table app_profile (
	app uuid primary key references app,
	
	nationality code references country,
	resident_status code references resident_status,
	education code references education,
	speciality code references speciality,
	birthplace textarea,

	marital_status code references marital_status,
	children_lt_15 int4,
	children_15_21 int4,
	children_total int4,
	dependant_ge_21 int4,

	address_reg uuid,
	address_fact uuid,
	address_work uuid,
	residence_kind code references residence_kind,
	tenancy_room int4,

	email email,

	photo uuid
);

comment on column app_profile.photo is 'Reference to external system';

