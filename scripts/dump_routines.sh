#!/bin/bash

# Load environment variables
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$script_dir/../.env"

# Use mysqldump of remote server to dump the functions
# --routines includes stored procedures and functions
# --no-create-info and --no-data ensure only the functions are dumped
# --skip-triggers ensures triggers are not included
# Iterate over all $MYSQL_DATABASES

for db in ${MYSQL_DATABASES[@]}; do
  # echo "Dumping routines for database ${db}..."
  . "${script_dir}/establish_tunnel.sh"
  mysqldump -h 127.0.0.1 --port=$SSH_LOCAL_PORT -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" --databases ${db} --routines --no-create-info --no-data --skip-triggers | grep -v "/*!" | head -n -2 > dumps/routines/${db}.sql
  . "${script_dir}/close_tunnel.sh"
  # echo "Dumped routines for database ${db}."
done
