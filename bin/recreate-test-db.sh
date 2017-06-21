#!/bin/bash
psql postgres://postgres:111@172.17.0.2:5432/postgres -bq --file db/init/clean.sql && \
psql postgres://postgres:111@172.17.0.2:5432/postgres -bq --file db/init/init.sql && \
psql postgres://postgres:111@172.17.0.2:5432/postgres -bq --file db/init/test.sql && \
bin/build-db.sh && \
psql postgres://scoring:changeme@172.17.0.2:5432/postgres -bq --file build/db.sql && \
psql postgres://scoring:changeme@172.17.0.2:5432/postgres -bq --file build/db-test.sql && \
psql postgres://authenticator:changeme@172.17.0.2:5432/postgres -c 'select * from runtests()'
