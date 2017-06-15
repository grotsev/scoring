create table location (
  country code
, province code
, district code
, foreign key (country, province, district) references district
, location code
, primary key (country, province, district, location)
);

insert into location values
  ('KAZ', 'ALMATY', 'ALMATY', 'ALMATY')
, ('KAZ', 'ALMATY_REGION', 'KAPCHAGAY', 'KAPCHAGAY')
, ('KAZ', 'ALMATY_REGION', 'AKSU_DISTRICT', 'ZHANSUGIROV')
;

