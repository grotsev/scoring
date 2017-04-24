create domain phone as varchar(32)
    check (value ~ '^+7\d{10}$')
;

