create table country (
	country code primary key
);

comment on table country is 'ISO 3166-1';

insert into country values
	('KAZ'),
	('CHN'),
	('RUS'),
	('USA')
;

