#!/bin/bash

# Load environment variables
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$script_dir/../.env"

# Loop through all the databases
if nc -z localhost $SSH_LOCAL_PORT; then
  for db in ${MYSQL_DATABASES[@]}; do
    echo "Dumping schema for ${db}..."
    . "${script_dir}/establish_tunnel.sh"
    mysqldump -h 127.0.0.1 --port=$SSH_LOCAL_PORT -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" --databases ${db} --no-data --skip-add-drop-table | grep -v "/*!" | sed -E 's/AUTO_INCREMENT=[0-9]*/AUTO_INCREMENT=0/' | head -n -2 > dumps/schemas/${db}.sql
    . "${script_dir}/close_tunnel.sh"
    echo "Dumped schema for ${db}."
  done
else
  echo "No tunnel. Or is it?"
  ps aux | grep "ssh -f -N -T -M -L 3306" | grep -v grep
fi
