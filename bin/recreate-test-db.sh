#!/bin/bash
bin/build-db.sh
psql postgres://postgres:111@172.17.0.2:5432/postgres -bq1 --file db/init/init-clean.sql && \
psql postgres://postgres:111@172.17.0.2:5432/postgres -bq1 --file db/init/init-model.sql && \
psql postgres://scoring:changeme@172.17.0.2:5432/postgres -bq1 --file build/db.sql && \
psql postgres://postgres:111@172.17.0.2:5432/postgres -bq1 --file db/init/init-test.sql && \
psql postgres://scoring:changeme@172.17.0.2:5432/postgres -bq1 --file build/db-test.sql && \
psql postgres://scoring:changeme@172.17.0.2:5432/postgres -c "select runtests()"
