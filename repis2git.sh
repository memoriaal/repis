#!/bin/bash

root_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${root_dir}"

git pull

. "${root_dir}/scripts/establish_tunnel.sh"

. "${root_dir}/scripts/dump_schemas.sh"
. "${root_dir}/scripts/dump_routines.sh"

. "${root_dir}/scripts/close_tunnel.sh"

# commit changes
git add .
git commit -m "Update schemas, functions and procedures"
git push