#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER "$REMINDER_USER" WITH LOGIN PASSWORD '$REMINDER_PASSWORD';
    CREATE DATABASE "$REMINDER_DB" OWNER "$REMINDER_USER";
EOSQL