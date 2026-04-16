#!/bin/bash
# Description: Runs database migrations and seeders for the Alixar project.

echo "Running migrations inside alixar_php container..."
docker exec -it alixar_php php run_migrations.php

echo "Running seeders inside alixar_php container..."
docker exec -it alixar_php php run_seeders.php

echo "Process finished."
