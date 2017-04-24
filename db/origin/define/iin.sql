create domain iin as varchar(32)
    check (value ~ '^\d{12}$')
;

