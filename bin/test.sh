#!/bin/bash
# Ejecutar tests de PHPUnit dentro del contenedor Docker

set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

if docker compose ps --services --filter "status=running" | grep -q "alixar_php"; then
    echo "✔ Contenedor alixar_php en ejecución. Lanzando tests..."
    docker compose exec alixar_php vendor/bin/phpunit "$@"
else
    echo "⚠ El contenedor alixar_php no está en ejecución. Lanzando efímeramente..."
    docker compose run --rm alixar_php vendor/bin/phpunit "$@"
fi
