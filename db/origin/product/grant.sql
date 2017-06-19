grant select on table
  currency
, client_category
, product
, product_scheme
, fee_kind
, fee
, product_fee
to scoring_user;

grant select, insert, update, delete on table
  product
to scoring_user;

grant select, insert, update, delete on table
  currency
, client_category
, product
, product_scheme
, fee_kind
, fee
, product_fee
to scoring_administrator;

