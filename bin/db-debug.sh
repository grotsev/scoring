#!/bin/bash
bin/db-recreate.sh && \
psql postgres://authenticator:changeme@172.17.0.2:5432/postgres --tuples-only -c "set client_min_messages to info; select runtests('^$1$')"
