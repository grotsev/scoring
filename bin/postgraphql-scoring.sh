#!/bin/bash

postgraphql --connection postgres://authenticator:changeme@172.17.0.2:5432/postgres --schema scoring --default-role anonymous --secret 'scoring' --token scoring.jwt_token
