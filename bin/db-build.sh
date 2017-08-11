#!/bin/bash

mkdir -p build/

source ./bin/module.sh

for mt in main test
do
  for md in model data
  do
    out=build/db-${mt}-${md}.sql
    rm -f $out
    for m in $module
    do
      ref=${mt}_${md}_${m}
      for f in ${!ref}
      do
        cat db/$f.sql >> $out
        echo $'\n' >> $out
      done
    done
  done
done

out=build/db-main-model.sql
for f in \
    db/main/view.sql \
    db/main/trigger.sql \
    db/main/function/*.sql \
    db/main/formula/*.sql \
    db/main/grant/*.sql
do
  cat $f >> $out
  echo $'\n' >> $out
done

out=build/db-test-model.sql
for f in \
    db/test/function/*.sql \
    db/test/check/*.sql \
    db/test/check_pin/*.sql \
    db/test/check_unpin/*.sql \
    db/test/test/*.sql
do
  cat $f >> $out
  echo $'\n' >> $out
done

