#!/bin/bash

# Load environment variables
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$script_dir/../.env"

# Check if the dumps/routines directory exists, if not, create it
if [ ! -d "$script_dir/../dumps/routines" ]; then
  mkdir -p $script_dir/../dumps/routines
fi
if [ ! -d "$script_dir/../dumps/schemas" ]; then
  mkdir -p $script_dir/../dumps/schemas
fi
if [ ! -d "$script_dir/../dumps/events" ]; then
  mkdir -p $script_dir/../dumps/events
fi


if nc -z localhost $SSH_LOCAL_PORT; then
    now=`mysql --host=127.0.0.1 --port=3306 -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" pub<<EOFMYSQL
select now();
EOFMYSQL
`
    echo "Current time at server: ${now}"
else
    echo "No tunnel. Or is it?"
    ps aux | grep "ssh -f -N -T -M -L 3306" | grep -v grep
fi
