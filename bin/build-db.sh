#!/bin/bash

mkdir -p build/

OUT=build/db.sql

rm -f $OUT

for f in code uuid_pk textfield textarea iin phone email
do
	cat db/origin/define/$f.sql >> $OUT
done

for f in lang currency branch outlet income_evidence repayment_kind client_category product \
  cashflow_kind fee_kind fee pledge_kind credit_kind marital_status gender tenure stage \
  country province district location idcard_kind idcard_authority residency education speciality \
  credit_purpose phone_kind position_category kinship liability \
  wall_material auto_brand auto_model product_scheme product_fee
do
	cat db/origin/route/$f.sql >> $OUT
done

for f in app app_address app_entity app_person app_cashflow app_phone app_kin app_pledge
do
	cat db/origin/routine/$f.sql >> $OUT
done

for f in grant
do
	cat db/origin/security/$f.sql >> $OUT
done
