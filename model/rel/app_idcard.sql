create table app_idcard (
	app uuid references app_person primary key,
	idcard_kind code not null references idcard_kind,
	no textfield not null,
	series textfield,
	term daterange not null,
	authority code not null references idcard_authority
);

comment on column app_idcard.no is 'Number';

