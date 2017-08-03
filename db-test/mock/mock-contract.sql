set local jwt.claims.staff = '11110000-0000-0000-0000-000011110000'; -- all

insert into contract (application)
  select application from application -- FOR performance disable_trigger
;

