create table address (
  application uuid references application
, address uuid_pk
, primary key (application, address)

, country code not null
, province code not null
, district code not null
, location code not null
, foreign key (country, province, district, location) references location

, street textfield
, building textfield
, room textfield
, postcode textfield
);

comment on column address.street is 'Street or city district';

