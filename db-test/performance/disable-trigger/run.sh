#!/bin/bash

cd db-test/performance/disable-trigger/
pgbench -c 16 -f disabled.sql -f enabled.sql -j 2 -n -T 5 -h 172.17.0.2 -p 5432 -U authenticator postgres
echo "TAP version 13" && \
psql postgres://authenticator:changeme@172.17.0.2:5432/postgres --tuples-only -c "select runtests('^check_disable_trigger$')"
