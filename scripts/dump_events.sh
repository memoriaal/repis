#!/bin/bash

# Load environment variables
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$script_dir/../.env"

# sample
# mysqldump -u your_username -p your_password --events --no-create-info --no-data your_database > your_events_dump.sql

# Loop through all the databases
for db in ${MYSQL_DATABASES[@]}; do
  echo "Dumping events for ${db}..."
  . "${script_dir}/establish_tunnel.sh"
  mysqldump -h 127.0.0.1 --port=$SSH_LOCAL_PORT -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" --events --no-data --no-create-info ${db} | head -n -2 > dumps/events/${db}.sql
  . "${script_dir}/close_tunnel.sh"
  echo "Events for ${db} dumped."
done