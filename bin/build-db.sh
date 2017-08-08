#!/bin/bash

mkdir -p build/

OUT_LIB=build/db-lib.sql
OUT=build/db.sql
OUT_TEST=build/db-test.sql

source ./bin/modules.sh

rm -f $OUT_LIB
rm -f $OUT
rm -f $OUT_TEST

cat db-lib/domain.sql \
    db-lib/function/*.sql \
    db-lib/macro/*.sql \
      >> $OUT_LIB

# modules are ordered by dependency
for f in $MODULES
do
  cat db/dict/dict-$f.sql \
      db/data/data-$f.sql \
      db/model/model-$f.sql    >> $OUT      2> /dev/null
  cat db-test/mock/mock-$f.sql >> $OUT_TEST 2> /dev/null
done

cat db/view.sql >> $OUT

# unordered
cat db/function/*.sql \
    db/formula/*.sql \
    db/grant/*.sql \
      >> $OUT
cat db-test/function/*.sql \
    db-test/check/*.sql \
    db-test/check_pin/*.sql \
    db-test/check_unpin/*.sql \
    db-test/test/*.sql \
      >> $OUT_TEST
