#!/bin/bash

# Load environment variables
source ../.env || source .env

# Check if SSH tunnel is established
if nc -z localhost $SSH_LOCAL_PORT; then
    # Terminate SSH tunnel to mysql proxy
    echo "Closing SSH tunnel..."
    ssh -O exit -T -M -L $SSH_LOCAL_PORT:
    echo "SSH tunnel closed."
else
    echo "No tunnel to close."
fi