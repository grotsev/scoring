#!/bin/bash
bin/build-db.sh
psql postgres://postgres:111@172.17.0.2:5432/postgres -q1 --file db/test/init/init-clean.sql && \
psql postgres://postgres:111@172.17.0.2:5432/postgres -q1 --file db/test/init/init-model.sql && \
psql postgres://scoring:changeme@172.17.0.2:5432/postgres -q1 --file build/db-main-model.sql && \
psql postgres://scoring:changeme@172.17.0.2:5432/postgres -q1 --file build/db-main-data.sql && \

psql postgres://postgres:111@172.17.0.2:5432/postgres -q1 --file db/test/init/init-test.sql && \
psql postgres://scoring:changeme@172.17.0.2:5432/postgres -q1 --file build/db-test-model.sql && \
psql postgres://scoring:changeme@172.17.0.2:5432/postgres -q1 --file build/db-test-data.sql && \
psql postgres://postgres:111@172.17.0.2:5432/postgres -q1 --file db/test/init/init-test-grant.sql
