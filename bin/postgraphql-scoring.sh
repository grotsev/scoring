#!/bin/bash

kill -9 $(ps ax | grep postgraph | grep node | cut -d' ' -f1)
postgraphql --connection postgres://scoring_authenticator:changeme@172.17.0.2:5432/postgres --schema scoring --default-role scoring_superuser
