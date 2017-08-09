#!/bin/bash

OUT=build/db.sql

rm -f $OUT

for f in `psql postgres://postgres:111@172.17.0.2:5432/postgres -q1t --file build/dependency.sql`
do
  cat $f >> $OUT
done
