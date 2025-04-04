#!/bin/bash

set -e

./wait_for_it.sh ${DB_HOST}:${DB_PORT} -t 0

export KC_DB_URL="jdbc:postgresql://${DB_HOST}:${DB_PORT}"

PGPASSWORD=${DB_PASSWORD_ROOT} psql -h ${DB_HOST} -p ${DB_PORT} -U ${DB_USERNAME_ROOT} << SQL
DO
$do$
BEGIN
   IF EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolename = '${KC_DB_USERNAME}') THEN

      RAISE NOTICE 'Role "${KC_DB_USERNAME}" already exists. Skipping.';
   ELSE
      CREATE ROLE ${KC_DB_USERNAME} LOGIN PASSWORD '${KC_DB_PASSWORD}';
   END IF;
   CREATE SCHEMA IF NOT EXISTS ${KC_DB_SCHEMA} AUTHORIZATION ${KC_DB_USERNAME};
END
$do$;
SQL
