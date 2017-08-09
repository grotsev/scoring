create table auto_brand
( auto_brand code not null

, primary key (auto_brand)
);

create table auto_model
( auto_brand code not null
, auto_model code not null

, primary key (auto_brand, auto_model)
, foreign key (auto_brand) references auto_brand
);

create table pledge_kind
( pledge_kind code not null

, primary key (pledge_kind)
);

create table wall_material
( wall_material code not null

, primary key (wall_material)
);

