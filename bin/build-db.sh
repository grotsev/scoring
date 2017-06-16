#!/bin/bash

mkdir -p build/

OUT=build/db.sql
OUT_TEST=build/db-test.sql

rm -f $OUT
rm -f $OUT_TEST

echo -e 'begin;\n' >> $OUT

for f in \
  system \
  staff \
  product application \
  address \
  pledge contract person \

do
  cat db/origin/$f/model.sql >> $OUT
  cat db/origin/$f/function.sql >> $OUT
  cat db/origin/$f/grant.sql >> $OUT
  cat db/origin/$f/data.sql >> $OUT
  cat db/origin/$f/test.sql >> $OUT_TEST
done

echo -e 'commit;\n' >> $OUT

