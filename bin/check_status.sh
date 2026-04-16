#!/bin/bash
# Description: Verifies the status of the repositories and Docker containers.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# Colores
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
NC='\033[0m'

# Cargar variables de entorno
if [ -f "$PROJECT_DIR/.env" ]; then
    export $(grep -v '^#' "$PROJECT_DIR/.env" | xargs)
fi

clear
echo -e "${CYAN}Alixar — Estado del Sistema${NC}"
echo "─────────────────────────────────────────"

# 1. Verificar Repositorio Alixar
echo -e "${BLUE}[Repositorios]${NC}"
if [ -d "$PROJECT_DIR/.git" ]; then
    BRANCH=$(git -C "$PROJECT_DIR" rev-parse --abbrev-ref HEAD)
    echo -e "  Alixar (Local): ${GREEN}OK${NC} (rama: $BRANCH)"
else
    echo -e "  Alixar (Local): ${RED}Error (No es un repo git)${NC}"
fi

# 2. Verificar Repositorio Dolibarr
DOLIBARR_DIR="${DOLIBARR_PATH:-$PROJECT_DIR/../dolibarr}"
if [ -d "$DOLIBARR_DIR/htdocs" ]; then
    if [ -d "$DOLIBARR_DIR/.git" ]; then
        D_BRANCH=$(git -C "$DOLIBARR_DIR" rev-parse --abbrev-ref HEAD)
        echo -e "  Dolibarr:       ${GREEN}OK${NC} (rama: $D_BRANCH)"
    else
        echo -e "  Dolibarr:       ${GREEN}OK${NC} (sin git)"
    fi
else
    echo -e "  Dolibarr:       ${YELLOW}No detectado${NC} (opcional para tests)"
    echo -e "                  Ruta buscada: $DOLIBARR_DIR"
fi

echo ""
echo -e "${BLUE}[Docker - Desarrollo (Estándar)]${NC}"
if docker compose -f "$PROJECT_DIR/docker-compose.yml" ps | grep -q "Up"; then
    echo -e "  Estado: ${GREEN}En ejecución${NC}"
    echo -e "  Web App: http://localhost:${HTTP_PORT:-8083}"
else
    echo -e "  Estado: ${RED}Parado${NC}"
    echo -e "  Para arrancar: ${YELLOW}./bin/docker_start.sh${NC}"
fi

echo ""
echo -e "${BLUE}[Docker - API Test (Comparación)]${NC}"
if docker compose -f "$PROJECT_DIR/docker-compose.api-test.yml" ps | grep -q "Up"; then
    echo -e "  Estado: ${GREEN}En ejecución${NC}"
    echo -e "  Dolibarr API: http://localhost:${APITEST_DOLIBARR_PORT:-8090}"
    echo -e "  Alixar API:   http://localhost:${APITEST_ALIXAR_PORT:-8091}"
else
    echo -e "  Estado: ${RED}Parado${NC}"
    if [ -d "$DOLIBARR_DIR/htdocs" ]; then
        echo -e "  Para arrancar: ${YELLOW}./bin/api_compare.sh up${NC}"
    else
        echo -e "  Nota: Se requiere clonar Dolibarr para este entorno."
    fi
fi

echo ""
echo "─────────────────────────────────────────"
echo -e "Usa ${CYAN}./bin/api_compare.sh help${NC} para ver opciones de test."
echo ""
