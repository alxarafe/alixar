#!/bin/bash
# Description: Stops the Alixar project containers.

clear

echo "Stopping Alixar containers..."
docker stop alixar_nginx alixar_php alixar_db alixar_phpmyadmin

echo "List of containers"
docker ps -a
