#!/bin/bash

mkdir -p build/

OUT=build/db.sql
OUT_TEST=build/db-test.sql

source ./bin/modules.sh

rm -f $OUT
rm -f $OUT_TEST

for f in $MODULES
do
  cat db/origin/$f/$f-model.sql \
      db/origin/$f/function/*.sql \
      db/origin/$f/$f-grant.sql \
      db/origin/$f/$f-data.sql >> $OUT
  cat db/origin/$f/$f-test-data.sql db/origin/$f/test/*.sql >> $OUT_TEST
done

