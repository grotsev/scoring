create table app_pledge (
	app uuid references app,
	pledge uuid default uuid_generate_v4(),
	primary key (app, pledge),

	pledge_kind code references pledge_kind,

	-- FLAT, HOUSE, LAND, COMMERCIAL, AUTO, MACHINE
	production_year int4,
	pledgor textfield,
	condition textfield,
	note textarea,
	-- FLAT, HOUSE, LAND, COMMERCIAL
	address uuid, foreign key (app, address) references app_address,
	cadastral_number textfield,
	purpose textfield,
	lease_term int4,
	-- FLAT, HOUSE, COMMERCIAL
	meterage_total int4,
	meterage_living int4,
	build_storey int4,
	room int4,
	-- FLAT, HOUSE
	wall_material code references wall_material,
	-- HOUSE, LAND
	meterage_land int4,
	-- COMMERCIAL
	specification textfield,
	-- AUTO, MACHINE
	auto_brand code references auto_brand,
	auto_model code, foreign key (auto_brand, auto_model) references auto_model,
	registration_number textfield,
	colour textfield,
	auto_volume numeric
);

comment on column app_pledge.lease_term is 'In month';
comment on column app_pledge.meterage_total is 'In square meter';
comment on column app_pledge.meterage_living is 'In square meter';
comment on column app_pledge.meterage_land is 'In square meter';

