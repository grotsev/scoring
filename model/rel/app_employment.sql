create table app_employment (
	app uuid primary key references app,
	businessman boolean,
	employer_title textfield,
	position_category code references position_category,
	position textfield,
	last_service int4,
	total_service int4,
	field textfield,

	extra_employer_title textfield,
	extra_position textfield,
	extra_field textfield
);

comment on column app_employment.last_service is 'In month';
comment on column app_employment.total_service is 'In month';
comment on column app_employment.field is 'Company service domain';

