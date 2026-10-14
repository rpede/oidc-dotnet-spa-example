#! /usr/bin/env bash

# Fail script on error
# -e exit on error, -u error on unset var, -o pipefail error on pipe fail
set -euo pipefail
# Set envvvars
source ../.env

TOKEN=$(curl -s -X POST \
  "http://localhost:8080/realms/master/protocol/openid-connect/token" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "grant_type=password" \
  -d "client_id=admin-cli" \
  -d "username=$KEYCLOAK_ADMIN" \
  -d "password=$KEYCLOAK_ADMIN_PASSWORD" |
  jq -r '.access_token')

curl -s "http://localhost:8080/admin/realms/vulntrack/clients" \
  -H "Authorization: Bearer $TOKEN" |
  jq '.'
