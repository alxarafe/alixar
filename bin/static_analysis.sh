#!/bin/bash
# Description: Runs static analysis tools (PHPStan, Psalm) inside the container.

set -e

echo "Running PHPStan..."
docker exec alixar_php ./vendor/bin/phpstan analyse src plugins --memory-limit=1G

echo "Running Psalm..."
docker exec alixar_php ./vendor/bin/psalm src plugins --output-format=console
