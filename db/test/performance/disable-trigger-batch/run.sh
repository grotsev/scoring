#!/bin/bash

cd db-test/performance/disable-trigger-batch/

psql --file prepare.sql -q1 postgres://scoring:changeme@172.17.0.2:5432/postgres

if [[ $# -gt 0 ]]; then
psql --file trigger.sql -q1 postgres://scoring:changeme@172.17.0.2:5432/postgres
fi

pgbench -f batch.sql -c 1 -j 1 -n -t 1 -h 172.17.0.2 -p 5432 -U authenticator postgres

psql --file clean.sql -q1 postgres://scoring:changeme@172.17.0.2:5432/postgres
