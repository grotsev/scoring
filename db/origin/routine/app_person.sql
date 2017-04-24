create table app_person (
  app uuid references app
, person uuid default uuid_generate_v4()
, primary key (app, person)
-- TODO individ uuid default uuid_generate_v4 to the best of our knowledge

, liability code not null references liability

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

, address_reg uuid, foreign key (app, address_reg) references app_address on delete set null
, address_fact uuid, foreign key (app, address_fact) references app_address on delete set null
, address_work uuid, foreign key (app, address_work) references app_address on delete set null
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

comment on table app_person is 'Individual';
comment on column app_person.idcard_no is 'Number';
comment on column app_person.employment_self is 'Is businessman';
comment on column app_person.employment_last_service is 'In month';
comment on column app_person.employment_total_service is 'In month';
comment on column app_person.employment_field is 'Company service domain';
comment on column app_person.employment2_field is 'Company service domain';
comment on column app_person.photo is 'Reference to external system';

