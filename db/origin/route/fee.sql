create table fee (
  fee code primary key
, fee_kind code not null references fee_kind
, amount numeric not null
);

comment on column fee.amount is 'In percent';

insert into fee values
  ('REVIEW', 'COMMISSION', 1)
, ('OVERDUE', 'FINE', 5)
, ('MANDATORY_INSURANCE', 'INSURANCE', 3)
;

