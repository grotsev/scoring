#!/bin/bash

mkdir -p build/

OUT=build/db.sql

rm -f $OUT

echo -e 'begin;\n' >> $OUT

for f in code uuid_pk login jwt_token textfield textarea iin phone email
do
	cat db/origin/define/$f.sql >> $OUT
done

for f in staff staff_role \
  authenticate authorize \
  jwt_login jwt_staff jwt_role
do
  cat db/origin/security/$f.sql >> $OUT
done

for f in lang currency branch outlet income_evidence repayment_kind client_category product \
  cashflow_kind fee_kind fee pledge_kind credit_kind marital_status gender tenure stage \
  country province district location idcard_kind idcard_authority residency education speciality \
  credit_purpose phone_kind position_category kinship responsibility \
  wall_material auto_brand auto_model product_scheme product_fee
do
	cat db/origin/mounting/$f.sql >> $OUT
done

for f in application contract address pledge \
  legal_entity legal_entity_responsibility \
  individual individual_cashflow individual_phone individual_kin individual_responsibility \
  application_handler
do
	cat db/origin/routine/$f.sql >> $OUT
done

cat `find ./db/origin/security/grant/ -maxdepth 1 -type f` >> $OUT

echo -e 'commit;\n' >> $OUT

