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
, period     int4 not null

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



create table individual
( application   uuid not null
, individual uuid_pk not null

, iin              iin
, surname    textfield
, name       textfield
, patronymic textfield
, dob             date
, gender          code

, nationality    code
, residency      code
, education      code
, speciality     code
, birthplace textarea

, marital_status  code
, children_lt_15  int4
, children_15_21  int4
, children_total  int4
, dependant_ge_21 int4

, address_reg  uuid
, address_fact uuid
, address_work uuid
, tenure       code
, tenancy_room int4

, email email

, photo uuid

, idcard_kind        code
, idcard_no     textfield
, idcard_series textfield
, idcard_term   daterange
, idcard_authority   code

, employment_self           boolean
, employment_title        textfield
, employment_position_category code
, employment_position     textfield
, employment_last_service      int4
, employment_total_service     int4
, employment_field        textfield

, employment2_title    textfield
, employment2_position textfield
, employment2_field    textfield

, primary key (application, individual)
, foreign key (application)                  references application
, foreign key (gender)                       references gender
, foreign key (nationality)                  references country
, foreign key (residency)                    references residency
, foreign key (education)                    references education
, foreign key (speciality)                   references speciality
, foreign key (marital_status)               references marital_status
, foreign key (application, address_reg)     references address on delete set null
, foreign key (application, address_fact)    references address on delete set null
, foreign key (application, address_work)    references address on delete set null
, foreign key (tenure)                       references tenure
, foreign key (idcard_kind)                  references idcard_kind
, foreign key (idcard_authority)             references idcard_authority
, foreign key (employment_position_category) references position_category
);

comment on table individual is 'Individual';
comment on column individual.idcard_no is 'Number';
comment on column individual.employment_self is 'Is businessman';
comment on column individual.employment_last_service is 'In month';
comment on column individual.employment_total_service is 'In month';
comment on column individual.employment_field is 'Company service domain';
comment on column individual.employment2_field is 'Company service domain';
comment on column individual.photo is 'Reference to external system';

create table individual_cashflow
( application   uuid not null
, individual    uuid not null
, cashflow_kind code not null

, amount monetary not null

, primary key (application, individual, cashflow_kind)
, foreign key (application, individual) references individual
, foreign key (cashflow_kind)           references cashflow_kind
);

create table individual_kin
( application uuid not null
, individual  uuid not null
, kin         uuid not null

, kinship code not null

, primary key (application, individual, kin)
, foreign key (application, individual) references individual
, foreign key (application, kin)        references individual
, foreign key (kinship)                 references kinship
);

create table individual_phone
( application uuid not null
, individual  uuid not null
, phone      phone not null

, phone_kind code not null

, primary key (application, individual, phone)
, foreign key (application, individual) references individual
, foreign key (phone_kind)              references phone_kind
);

create table individual_responsibility
( application uuid not null
, individual  uuid not null

, responsibility code not null

, primary key (application, individual)
, foreign key (application)             references application
, foreign key (application, individual) references individual
, foreign key (responsibility)          references responsibility
);

create table legal_entity
( application uuid not null
, entity   uuid_pk not null

, title textfield

, primary key (application, entity)
, foreign key (application) references application
);

comment on table legal_entity is 'Legal entity';

create table legal_entity_responsibility
( application  uuid not null
, legal_entity uuid not null

, responsibility code not null

, primary key (application, legal_entity)
, foreign key (application)               references application
, foreign key (application, legal_entity) references legal_entity
, foreign key (responsibility)            references responsibility
);

