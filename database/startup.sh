#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER hoyt;
    CREATE DATABASE hoyt;
    CREATE DATABASE test_hoyt;
    GRANT ALL PRIVILEGES ON DATABASE hoyt TO hoyt;
    GRANT ALL PRIVILEGES ON DATABASE test_hoyt TO hoyt;
EOSQL
