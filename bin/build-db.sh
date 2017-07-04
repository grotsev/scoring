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
      db/origin/$f/$f-data.sql >> $OUT 2> /dev/null
  cat db/origin/$f/$f-test-data.sql db/origin/$f/test/*.sql >> $OUT_TEST 2> /dev/null
done

for f in $MODULES
do
  cat db/origin/$f/procedure/*.sql \
      db/origin/$f/$f-grant.sql >> $OUT 2> /dev/null
done

