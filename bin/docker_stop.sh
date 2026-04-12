#!/bin/bash
# Description: Stops the Alixar project containers.

CYAN='\033[0;36m'
NC='\033[0m'

clear
echo -e "${CYAN}Alixar — Deteniendo contenedores${NC}"
echo "─────────────────────────────────────────"

# Intentar usar docker compose down para una limpieza completa
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

if [ -f "$PROJECT_DIR/docker-compose.yml" ]; then
    docker compose -f "$PROJECT_DIR/docker-compose.yml" down
else
    echo "No se encontró docker-compose.yml en $PROJECT_DIR"
fi

echo ""
echo "Estado de los contenedores:"
docker ps -a
