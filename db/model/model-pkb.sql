-- TODO Add sys_period and history
create table pkb
( application uuid not null

, current_credit_count      int4
, surname              textfield
, name                 textfield
, patronymic           textfield
, current_overdue       monetary
, balance_write_off      boolean
, right_reassign         boolean
, blank_loan_amount     monetary
, multiple_person_found  boolean
, unsecured_credit       boolean
, request_count_90          int4
, current_credit_amount monetary

, primary key (application)
, foreign key (application) references application
);

comment on table pkb is
  'PKB service response';

