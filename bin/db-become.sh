#!/bin/bash
psql postgres://authenticator:changeme@172.17.0.2:5432/postgres --tuples-only -c "select become(auth('all', '$1'), false);"
