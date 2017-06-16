#!/bin/bash

mkdir -p build/

OUT=build/db.sql

rm -f $OUT

echo -e 'begin;\n' >> $OUT

for f in \
  system \
  staff \
  product application \
  address \
  pledge contract person \

do
  cat db/origin/model/$f.sql >> $OUT
  cat db/origin/function/$f.sql >> $OUT
  cat db/origin/data/$f.sql >> $OUT
done

cat `find ./db/origin/security/grant/ -maxdepth 1 -type f` >> $OUT

echo -e 'commit;\n' >> $OUT

