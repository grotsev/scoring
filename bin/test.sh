#!/bin/bash
bin/recreate-db.sh \
echo "TAP version 13" && \
psql postgres://authenticator:changeme@172.17.0.2:5432/postgres --tuples-only -c "select runtests()"
