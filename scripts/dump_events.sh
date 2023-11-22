#!/bin/bash

# Load environment variables
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$script_dir/../.env"

# sample
# mysqldump -u your_username -p your_password --events --no-create-info --no-data your_database > your_events_dump.sql

# Loop through all the databases
if nc -z localhost $SSH_LOCAL_PORT; then
  echo "Dumping events"
  mysqldump -h 127.0.0.1 --port=$SSH_LOCAL_PORT -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" --events --no-data --no-create-info | grep -v "/*!" > dumps/events.sql
  echo "Events dumped"
else
  echo "No tunnel. Or is it?"
  ps aux | grep "ssh -f -N -T -M -L 3306" | grep -v grep
fi
