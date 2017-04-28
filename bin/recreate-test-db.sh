#!/bin/bash

psql postgres://postgres:111@172.17.0.2:5432/postgres -bq --file db/origin/security/clean.sql
psql postgres://postgres:111@172.17.0.2:5432/postgres -bq --file db/origin/security/init.sql

bin/build-db.sh
psql postgres://scoring:changeme@172.17.0.2:5432/postgres -bq --file build/db.sql

bin/postgraphql-scoring.sh
