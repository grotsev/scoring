#!/bin/bash

mkdir -p build/

OUT=build/db.sql
OUT_TEST=build/db-test.sql

source ./bin/modules.sh

rm -f $OUT
rm -f $OUT_TEST

# modules are ordered by dependency
for f in $MODULES
do
  cat db/origin/model/$f-model.sql \
      db/origin/data/$f-data.sql \
        >> $OUT 2> /dev/null
  cat db/origin/test-data/$f-test-data.sql \
        >> $OUT_TEST 2> /dev/null
done

# unordered
cat db/origin/function/*.sql \
    db/origin/grant/*.sql \
      >> $OUT 2> /dev/null
cat db/origin/test-input/*.sql \
    db/origin/test-check/*.sql \
    db/origin/test/*.sql \
      >> $OUT_TEST 2> /dev/null
