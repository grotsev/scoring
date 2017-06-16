#!/bin/bash

psql postgres://postgres:111@172.17.0.2:5432/postgres -bq --file db/origin/security/admin_clean.sql
psql postgres://postgres:111@172.17.0.2:5432/postgres -bq --file db/origin/security/admin_init.sql

bin/build-db.sh
psql postgres://scoring:changeme@172.17.0.2:5432/postgres -bq --file build/db.sql
psql postgres://scoring:changeme@172.17.0.2:5432/postgres -bq --file build/db-test.sql

#bin/postgraphql-scoring.sh
