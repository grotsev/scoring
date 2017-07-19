-- TODO Add sys_period and history
create table pkb
( application uuid not null

, current_credit_count  integer
, surname             textfield
, name                textfield
, patronymic          textfield
, current_overdue       numeric
, balance_write_off     boolean
, right_reassign        boolean
, blank_loan_amount     numeric
, multiple_person_found boolean
, unsecured_credit      boolean
, request_count_90      integer
, current_credit_amount numeric

, primary key (application)
, foreign key (application) references application
);

comment on table pkb is
  'PKB service response';

