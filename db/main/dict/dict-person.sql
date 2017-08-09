create domain email as text
  check (char_length(value) <= 100)
  check (value ~ '^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9.-]+$')
;

create domain iin as text
  check (value ~ '^\d{12}$')
;

create domain phone as text
  check (value ~ '^+7\d{10}$')
;



create table cashflow_kind
( cashflow_kind code not null
, period        int4 not null
, k1         boolean not null

, primary key (cashflow_kind)
);

comment on column cashflow_kind.period is 'In monthes, positive income, negative expences';

create table education
( education code not null

, primary key (education)
);

create table gender
( gender code not null

, primary key (gender)
);

create table idcard_authority
( idcard_authority code not null

, primary key (idcard_authority)
);

create table idcard_kind
( idcard_kind code not null

, primary key (idcard_kind)
);

create table kinship
( kinship code not null

, primary key (kinship)
);

comment on table kinship is 'Relationship to individual';

create table marital_status
( marital_status code not null

, primary key (marital_status)
);

create table phone_kind
( phone_kind code not null

, primary key (phone_kind)
);

create table position_category
( position_category code not null

, primary key (position_category)
);

create table residency
( residency code not null

, primary key (residency)
);

create table responsibility
( responsibility code not null

, primary key (responsibility)
);

comment on table responsibility is 'Responsibility according to contract';

create table speciality
( speciality code not null

, primary key (speciality)
);

create table tenure
( tenure code not null

, primary key (tenure)
);

