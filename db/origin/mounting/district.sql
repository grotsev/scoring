create table district (
  country code
, province code
, foreign key (country, province) references province
, district code
, primary key (country, province, district)
);

insert into district values
  ('KAZ', 'ALMATY', 'ALMATY')
, ('KAZ', 'ALMATY_REGION', 'KAPCHAGAY')
, ('KAZ', 'ALMATY_REGION', 'TALDYKORGAN')
, ('KAZ', 'ALMATY_REGION', 'TEKELI')
, ('KAZ', 'ALMATY_REGION', 'AKSU_DISTRICT')
, ('KAZ', 'ALMATY_REGION', 'ALAKOL_DISTRICT')
, ('KAZ', 'ALMATY_REGION', 'BALKHASH_DISTRICT')
, ('KAZ', 'ALMATY_REGION', 'ENBEKSHIKAZAKH_DISTRICT')
, ('KAZ', 'ALMATY_REGION', 'ESKELDI_DISTRICT')
, ('KAZ', 'ALMATY_REGION', 'ILE_DISTRICT')
, ('KAZ', 'ALMATY_REGION', 'KARASAY_DISTRICT')
, ('KAZ', 'ALMATY_REGION', 'KARATAL_DISTRICT')
, ('KAZ', 'ALMATY_REGION', 'KERBULAK_DISTRICT')
, ('KAZ', 'ALMATY_REGION', 'KOKSU_DISTRICT')
, ('KAZ', 'ALMATY_REGION', 'PANFILOV_DISTRICT')
, ('KAZ', 'ALMATY_REGION', 'RAIYMBEK_DISTRICT')
, ('KAZ', 'ALMATY_REGION', 'SARKAND_DISTRICT')
, ('KAZ', 'ALMATY_REGION', 'TALGAR_DISTRICT')
, ('KAZ', 'ALMATY_REGION', 'UYGUR_DISTRICT')
, ('KAZ', 'ALMATY_REGION', 'ZHAMBYL_DISTRICT')
;
