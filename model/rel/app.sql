create table app (
	app uuid default uuid_generate_v4() primary key,

	created_at timestamp with time zone not null default now(),
	created_by regrole not null default session_user::regrole,
	
	branch code not null,
	outlet code not null,
	foreign key (branch, outlet) references outlet,
	-- TODO trigger fill from session_user current outlet

	stage code not null default 'ATTRACTION' references stage
);

comment on table app is 'Client application to get product';

