#!/bin/bash

mkdir -p build/

OUT=build/test-db.sql

rm -f $OUT

echo -e 'begin;\n' >> $OUT

for f in staff staff_role
do
  cat db/test/security/$f.sql >> $OUT
done

echo -e 'commit;\n' >> $OUT

