#!/bin/bash

# Load environment variables
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$script_dir/../.env"

# Loop through all the databases
if nc -z localhost $SSH_LOCAL_PORT; then
  for db in ${MYSQL_DATABASES[@]}; do
    echo "Dumping schema for ${db}..."
    mysqldump -h 127.0.0.1 --port=$SSH_LOCAL_PORT -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" --databases ${db} --no-data --no-create-info | grep -v "/*!" | head -n -2 > dumps/routines/${db}.sql
    echo "Dumped schema for ${db}."
  done
else
  echo "No tunnel. Or is it?"
  ps aux | grep "ssh -f -N -T -M -L 3306" | grep -v grep
fi
