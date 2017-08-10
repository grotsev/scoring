create table province
( country  code not null
, province code not null

, primary key (country, province)
, foreign key (country) references country
);
