#!/bin/bash
# Description: Runs static analysis tools (PHPStan, Psalm) inside the container.

echo "Running PHPStan..."
docker exec alixar_php ./vendor/bin/phpstan analyse Modules --memory-limit=1G
docker exec alixar_php ./vendor/bin/phpstan analyse Tests --memory-limit=1G

echo "Running Psalm..."
docker exec alixar_php ./vendor/bin/psalm Modules --output-format=console
docker exec alixar_php ./vendor/bin/psalm Tests --output-format=console
