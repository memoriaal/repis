#!/bin/bash

root_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${root_dir}"

git pull

dateformat="%Y-%m-%dT%H:%M:%SZ"

echo "$(date +"${dateformat}"): Dumping events..."
. "${root_dir}/scripts/dump_events.sh"

echo "$(date +"${dateformat}"): Dumping schemas..."
. "${root_dir}/scripts/dump_schemas.sh"

echo "$(date +"${dateformat}"): Dumping routines..."
. "${root_dir}/scripts/dump_routines.sh"

echo "$(date +"${dateformat}"): commiting changes..."
# commit changes
git add .

# set commit message if provided as argument
if [ $# -eq 1 ]; then
    commit_message=$1
else
    commit_message="Update schemas, functions and procedures"
fi
git commit -m "$commit_message"

git push