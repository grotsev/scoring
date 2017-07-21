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
  cat db/model/model-$f.sql    >> $OUT
  cat db/data/data-$f.sql      >> $OUT      2> /dev/null
  cat db-test/mock/mock-$f.sql >> $OUT_TEST 2> /dev/null
done

# unordered
cat db/function/*.sql \
    db/formula/*.sql \
    db/grant/*.sql \
      >> $OUT
cat db-test/function/*.sql \
    db-test/input/*.sql \
    db-test/check/*.sql \
    db-test/test/*.sql \
      >> $OUT_TEST
