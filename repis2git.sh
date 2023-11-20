#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

. "$script_dir/scripts/establish_tunnel.sh"

. "$script_dir/scripts/dump_schemas.sh"
. "$script_dir/scripts/dump_routines.sh"

. "$script_dir/scripts/close_tunnel.sh"

# commit changes
git add .
git commit -m "Update schemas, functions and procedures"
git push