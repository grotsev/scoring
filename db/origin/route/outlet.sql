create table outlet (
	branch code references branch,
	outlet code,
	primary key (branch, outlet)
);

comment on table outlet is 'Retail trade point division';

insert into outlet values
	('ALMATY', 'CITY_CENTER'),
	('ALMATY', 'SOUTH'),
	('ALMATY', '_123'),
	('KARAGANDA', '_21')
;

