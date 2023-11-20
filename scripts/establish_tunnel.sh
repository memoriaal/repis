#!/bin/bash

# Load environment variables
source ../.env

# Check if SSH tunnel is already established
if nc -z localhost $SSH_LOCAL_PORT; then
    echo "SSH tunnel is already established."
else
    # Establish SSH tunnel to mysql proxy
    # (control file and SSH_HOST in ~/.ssh/config)
    echo "Establishing SSH tunnel..."
    ssh -f -N -T -M -L $SSH_LOCAL_PORT:127.0.0.1:$SSH_REMOTE_PORT $SSH_HOST

    # Check if SSH tunnel was successfully established
    if nc -z localhost $SSH_LOCAL_PORT; then
        echo "SSH tunnel successfully established."
    else
        echo "Failed to establish SSH tunnel."
        exit 1
    fi
fi