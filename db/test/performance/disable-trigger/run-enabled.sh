#!/bin/bash

cd db-test/performance/disable-trigger/
pgbench -c 16 -f enabled.sql -j 2 -n -T 5 -h 172.17.0.2 -p 5432 -U authenticator postgres
