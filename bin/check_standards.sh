#!/bin/bash
# Description: Checks coding standards using PHPCS inside the container.

set -e

echo "Running PHPCS..."
docker exec alixar_php ./vendor/bin/phpcs --tab-width=4 --encoding=utf-8 --standard=phpcs.xml Modules -s
docker exec alixar_php ./vendor/bin/phpcs --tab-width=4 --encoding=utf-8 --standard=phpcs.xml Tests -s
