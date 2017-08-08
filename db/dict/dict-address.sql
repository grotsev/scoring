create table country
( country code not null

, primary key (country)
);

comment on table country is 'ISO 3166-1';

create table province
( country  code not null
, province code not null

, primary key (country, province)
, foreign key (country) references country
);

create table district
( country  code not null
, province code not null
, district code not null

, primary key (country, province, district)
, foreign key (country, province) references province
);

create table location
( country  code not null
, province code not null
, district code not null
, location code not null

, primary key (country, province, district, location)
, foreign key (country, province, district) references district
);

