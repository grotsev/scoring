create table app_person (
	app uuid references app primary key,
	iin iin not null,
	surname textfield not null,
	name textfield not null,
	patronymic textfield,
	dob date not null,
	gender code not null references gender
);

