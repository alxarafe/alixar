#!/bin/bash
# Description: Starts the Alixar project containers.

clear

echo "Starting Alixar containers with docker compose..."
docker compose up -d

echo "List of containers"
docker ps
