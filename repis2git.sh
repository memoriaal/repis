#!/bin/bash

. scripts/establish_tunnel.sh

. scripts/dump_schemas.sh
. scripts/dump_routines.sh

. scripts/close_tunnel.sh

# commit changes
git add .
git commit -m "Update schemas, functions and procedures"
git push