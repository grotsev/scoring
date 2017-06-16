#!/bin/bash

mkdir -p build/

OUT=build/db.sql

rm -f $OUT

echo -e 'begin;\n' >> $OUT

for f in code uuid_pk login jwt_token textfield textarea iin phone email
do
	cat db/origin/define/$f.sql >> $OUT
done

cat db/origin/model/staff.sql >> $OUT

for f in authenticate authorize \
  jwt_login jwt_staff jwt_role
do
  cat db/origin/security/$f.sql >> $OUT
done

for f in \
  system \
  product application \
  address \
  pledge contract person \

do
  cat db/origin/model/$f.sql >> $OUT
done

for f in \
  system \
  product application \
  address \
  pledge contract person \

do
  cat db/origin/data/$f.sql >> $OUT
done

cat `find ./db/origin/security/grant/ -maxdepth 1 -type f` >> $OUT

echo -e 'commit;\n' >> $OUT

