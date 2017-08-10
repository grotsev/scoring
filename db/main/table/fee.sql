create table fee
( fee code not null

, fee_kind  code not null
, amount monetary not null

, primary key (fee)
, foreign key (fee_kind) references fee_kind
);

comment on column fee.amount is 'In percent';
