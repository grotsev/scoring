create table liability (
  liability code primary key
);

comment on table liability is 'Relationship to application';

insert into liability values
  ('BORROWER')
, ('COBORROWER')
, ('PLEDGER')
, ('GUARANTOR')
, ('INSURER')
;

