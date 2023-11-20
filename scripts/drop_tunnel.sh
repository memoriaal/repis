#!/bin/bash

# Load environment variables
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$script_dir/../.env"

# find processes with the same port number and kill them
echo "Killing processes with port $SSH_LOCAL_PORT..."
ps aux | grep "ssh -f -N -T -M -L ${SSH_LOCAL_PORT}" | grep -v grep | awk '{print $2}' | grep -v "PID" | xargs kill
echo "ssh processes killed."
