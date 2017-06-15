create table responsibility (
  responsibility code primary key
);

comment on table responsibility is 'Responsibility according to contract';

insert into responsibility values
  ('BORROWER')
, ('COBORROWER')
, ('PLEDGER')
, ('GUARANTOR')
, ('INSURER')
;

