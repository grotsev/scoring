#!/bin/bash

mkdir -p build/

OUT=build/grant.sql

source ./bin/modules.sh

rm -f $OUT

for f in $MODULES
do
  cat db/origin/$f/$f-grant.sql >> $OUT
done

