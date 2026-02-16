#!/bin/bash
# Description: Runs the PHPUnit test suite inside the container.

echo "Running PHPUnit Tests..."
docker exec alixar_php ./vendor/bin/phpunit
