#!/bin/bash

# Load environment variables
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$script_dir/../.env"

signature="ssh -f -N -T -M -L ${SSH_LOCAL_PORT}"
# collect processes matching the signature
processes=`ps aux | grep "${signature}" | grep -v grep | awk '{print $2}' | grep -v "PID"`

# Kill all processes matching the signature
for process in $processes; do
    # echo "Killing process ${process}..."
    kill $process
done
