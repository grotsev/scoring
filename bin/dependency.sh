#!/bin/bash

mkdir -p build/

DEPENDENCY=build/dependency.sql

rm -f $DEPENDENCY

cat >> $DEPENDENCY << EOF
with recursive target(file) as (values
EOF

cat | \
  sed "2,1000000s/^/, ('/; 1s/^/  ('/; s/$/')/" \
  >> $DEPENDENCY

cat >> $DEPENDENCY << EOF
), dependency(file, need) as (values
EOF

grep -RoPH -e "--import \K.*" db-lib/ | \
  sed "2,1000000s/^/, ('/; 1s/^/  ('/; s/$/')/; s/:/', '/" \
  >> $DEPENDENCY

cat >> $DEPENDENCY << EOF
), back(file) as (
    select file
    from target
  union
    select d.need
    from back b
      inner join dependency d on b.file = d.file
), restricted_dependency as (
  select file, need
  from dependency
    inner join (
      select file from target
      union
      select file from back
    ) x using (file)
), forth(file) as (
    select distinct need
    from restricted_dependency child
    where not exists (
      select
      from restricted_dependency parent
      where child.need = parent.file
    )
  union
    select d.file
    from forth f
      inner join restricted_dependency d on f.file = d.need
)
select file
from forth;

EOF

