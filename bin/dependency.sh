#!/bin/bash

mkdir -p build/

DEPENDENCY=build/dependency.sql
OUT=build/db.sql

rm -f $DEPENDENCY
rm -f $OUT

cat >> $DEPENDENCY << EOF
with recursive target(file) as (values
EOF

echo "  ('$1')" >> $DEPENDENCY

cat >> $DEPENDENCY << EOF
), dependency(file, need) as (values
EOF

grep -RoPH -e "--import \K.*" db/ | \
  sed "2,1000000s/^/, ('/; 1s/^/  ('/; s/$/')/; s/:/', '/" \
  >> $DEPENDENCY

cat >> $DEPENDENCY << EOF
), back(file, depth) as (
    select file, 0
    from target
  union all
    select d.need, b.depth+1
    from back b
      inner join dependency d on b.file = d.file
)
select file
from back
group by file
order by max(depth) desc;
EOF

for f in `psql postgres://postgres:111@172.17.0.2:5432/postgres -q1t --file $DEPENDENCY`
do
  echo $'\n--file' $f $'\n' >> $OUT
  cat $f >> $OUT
done
