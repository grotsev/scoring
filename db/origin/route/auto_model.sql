create table auto_model (
  auto_brand code references auto_brand
, auto_model code
, primary key (auto_brand, auto_model)
);

insert into auto_model values
  ('BMW', 'M3')
, ('BMW', 'X5')
, ('TOYOTA', 'LAND_CRUISER')
, ('SUZUKI', 'GRAND_VITARA')
;

