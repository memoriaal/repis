#!/bin/bash

# Load environment variables
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$script_dir/../.env"

# Use mysqldump of remote server to dump the functions
# --routines includes stored procedures and functions
# --no-create-info and --no-data ensure only the functions are dumped
# --skip-triggers ensures triggers are not included
# Iterate over all $MYSQL_DATABASES

for db in $MYSQL_DATABASES; do
  echo "Dumping routines for database ${db}..."
  if nc -z localhost $SSH_LOCAL_PORT; then
        mysqldump -h 127.0.0.1 --port=$SSH_LOCAL_PORT -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" --databases ${db} --routines --no-create-info --no-data --skip-triggers > dumps/routines/${db}.sql
  else
      echo "No tunnel. Or is it?"
      ps aux | grep "ssh -f -N -T -M -L 3306" | grep -v grep
      exit 1
  fi
done
