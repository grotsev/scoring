#!/bin/bash

#postgraphql --connection postgres://scoring_authenticator:changeme@172.17.0.2:5432/postgres --schema scoring --default-role scoring_superuser
postgraphql --connection postgres://scoring:changeme@172.17.0.2:5432/postgres --schema scoring --default-role scoring
