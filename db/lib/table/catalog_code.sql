--import db/lib/domain/code.sql

create table catalog_code
( code code not null

, primary key (code)
);

comment on table catalog_code is 'Catalog all table independent code';


