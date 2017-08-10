create table district
( country  code not null
, province code not null
, district code not null

, primary key (country, province, district)
, foreign key (country, province) references province
);
