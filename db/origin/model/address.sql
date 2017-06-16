create table country (
  country code primary key
);

comment on table country is 'ISO 3166-1';

create table province (
  country code references country
, province code
, primary key (country, province)
);

create table district (
  country code
, province code
, foreign key (country, province) references province
, district code
, primary key (country, province, district)
);

create table location (
  country code
, province code
, district code
, foreign key (country, province, district) references district
, location code
, primary key (country, province, district, location)
);



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

