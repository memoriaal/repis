#!/bin/bash

root_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${root_dir}"

git pull

. "${root_dir}/scripts/establish_tunnel.sh"

. "${root_dir}/scripts/dump_schemas.sh"
. "${root_dir}/scripts/dump_routines.sh"
. "${root_dir}/scripts/dump_events.sh"

. "${root_dir}/scripts/close_tunnel.sh"

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