#!/bin/bash

# Load environment variables
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$script_dir/../.env"

# Check if SSH tunnel is not established
if ! nc -z localhost $SSH_LOCAL_PORT; then
    # Establish SSH tunnel to mysql proxy
    # (control file and SSH_HOST in ~/.ssh/config)
    ssh -f -N -T -M -L $SSH_LOCAL_PORT:127.0.0.1:$SSH_REMOTE_PORT $SSH_HOST

    # Check if SSH tunnel was successfully established
    if ! nc -z localhost $SSH_LOCAL_PORT; then
        echo "Failed to establish SSH tunnel."
        exit 1
    fi
fi