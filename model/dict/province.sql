create table province (
	country code references country,
	province code,
	primary key (country, province)
);

insert into province values
	('KAZ', 'AKMOLA_REGION'),
	('KAZ', 'AKTOBE_REGION'),
	('KAZ', 'ALMATY'),
	('KAZ', 'ALMATY_REGION'),
	('KAZ', 'ASTANA'),
	('KAZ', 'ATYRAY_REGION'),
	('KAZ', 'BAIKONUR'),
	('KAZ', 'EAST_KAZAKHSTAN_REGION'),
	('KAZ', 'JAMBYL_REGION'),
	('KAZ', 'KARAGANDA_REGION'),
	('KAZ', 'KOSTANAY_REGION'),
	('KAZ', 'KYZYLORDA_REGION'),
	('KAZ', 'MANGYSTAU_REGION'),
	('KAZ', 'NORTH_KAZAKHSTAN_REGION'),
	('KAZ', 'PAVLODAR_REGION'),
	('KAZ', 'SOUTH_KAZAKHSTAN_REGION'),
	('KAZ', 'WEST_KAZAKHSTAN_REGION')
;

