#!/bin/bash
bin/db-recreate.sh \
echo "TAP version 13" && \
if [[ $# -eq 0 ]]; then
  psql postgres://authenticator:changeme@172.17.0.2:5432/postgres --tuples-only -c "select runtests()"
else
  for test in $*; do
    psql postgres://authenticator:changeme@172.17.0.2:5432/postgres --tuples-only -c "select runtests('^$test$')"
  done
fi
