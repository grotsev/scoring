create table auto_model
( auto_brand code not null
, auto_model code not null

, primary key (auto_brand, auto_model)
, foreign key (auto_brand) references auto_brand
);
