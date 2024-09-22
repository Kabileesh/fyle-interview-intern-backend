#!/bin/bash

# to stop on first error
set -e

# Delete older .pyc files
# find . -type d \( -name env -o -name venv  \) -prune -false -o -name "*.pyc" -exec rm -rf {} \;

# Run required migrations
export FLASK_APP=core/server.py

# Reset the db file to the given state
rm instance/store.sqlite3

echo "db reset done"

# Update the db data from the migration data given
flask db upgrade -d core/migrations/

echo "db migration done"

# Run server
gunicorn -c gunicorn_config.py core.server:app
