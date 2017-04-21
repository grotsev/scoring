#!/bin/bash

mkdir -p build/

OUT=build/test-db.sql

rm -f $OUT

echo -e 'reset role;\n' >> $OUT

for f in clean init
do
	cat db/origin/security/$f.sql >> $OUT
done

echo -e 'set role to scoring;\n' >> $OUT

bin/build-db.sh
cat build/db.sql >> $OUT
