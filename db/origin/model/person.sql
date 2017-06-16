create table cashflow_kind (
  cashflow_kind code primary key
, period numeric not null
);

comment on column cashflow_kind.period is 'In monthes, positive income, negative expences';

create table education (
  education code primary key
);

create table gender (
  gender code primary key
);

create table idcard_authority (
  idcard_authority code primary key
);

create table idcard_kind (
  idcard_kind code primary key
);

create table kinship (
  kinship code primary key
);

comment on table kinship is 'Relationship to individual';

create table marital_status (
  marital_status code primary key
);

create table phone_kind (
  phone_kind code primary key
);

create table position_category (
  position_category code primary key
);

create table residency (
  residency code primary key
);

create table responsibility (
  responsibility code primary key
);

comment on table responsibility is 'Responsibility according to contract';

create table speciality (
  speciality code primary key
);

create table tenure (
  tenure code primary key
);



create table individual (
  application uuid references application
, individual uuid_pk
, primary key (application, individual)

, iin iin
, surname textfield
, name textfield
, patronymic textfield
, dob date
, gender code references gender

, nationality code references country
, residency code references residency
, education code references education
, speciality code references speciality
, birthplace textarea

, marital_status code references marital_status
, children_lt_15 int4
, children_15_21 int4
, children_total int4
, dependant_ge_21 int4

, address_reg uuid, foreign key (application, address_reg) references address on delete set null
, address_fact uuid, foreign key (application, address_fact) references address on delete set null
, address_work uuid, foreign key (application, address_work) references address on delete set null
, tenure code references tenure
, tenancy_room int4

, email email

, photo uuid

, idcard_kind code references idcard_kind
, idcard_no textfield 
, idcard_series textfield
, idcard_term daterange
, idcard_authority code references idcard_authority

, employment_self boolean
, employment_title textfield
, employment_position_category code references position_category
, employment_position textfield
, employment_last_service int4
, employment_total_service int4
, employment_field textfield

, employment2_title textfield
, employment2_position textfield
, employment2_field textfield
);

comment on table individual is 'Individual';
comment on column individual.idcard_no is 'Number';
comment on column individual.employment_self is 'Is businessman';
comment on column individual.employment_last_service is 'In month';
comment on column individual.employment_total_service is 'In month';
comment on column individual.employment_field is 'Company service domain';
comment on column individual.employment2_field is 'Company service domain';
comment on column individual.photo is 'Reference to external system';

create table individual_cashflow (
  application uuid
, individual uuid, foreign key (application, individual) references individual
, cashflow_kind code references cashflow_kind
, primary key (application, individual, cashflow_kind)

, amount numeric not null
);

create table individual_kin (
  application uuid
, individual uuid, foreign key (application, individual) references individual
, kin uuid, foreign key (application, kin) references individual
, primary key (application, individual, kin)

, kinship code not null references kinship
);

create table individual_phone (
  application uuid
, individual uuid, foreign key (application, individual) references individual
, phone phone
, primary key (application, individual, phone)

, phone_kind code not null references phone_kind
);

create table individual_responsibility (
  application uuid references contract
, individual uuid, foreign key (application, individual) references individual
, primary key (application, individual)

, responsibility code not null references responsibility
);

create table legal_entity (
  application uuid references application
, entity uuid_pk
, primary key (application, entity)

, title textfield
);

comment on table legal_entity is 'Legal entity';

create table legal_entity_responsibility (
  application uuid references contract
, legal_entity uuid, foreign key (application, legal_entity) references legal_entity
, primary key (application, legal_entity)

, responsibility code not null references responsibility
);

