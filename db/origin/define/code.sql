create domain code as varchar(32)
	check (value ~ '^[_A-Z][_A-Z0-9]{0,31}$')
;

