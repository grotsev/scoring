#!/bin/bash

postgraphql --connection postgres://scoring_authenticator:changeme@172.17.0.2:5432/postgres --schema scoring --default-role scoring_anonymous --secret 'scoring' --token scoring.jwt_token
