#!/bin/bash
# ─────────────────────────────────────────────────────────────
# Tests de Compatibilidad API: Dolibarr vs Alixar
#
# Usa el fork alxarafe/dolibarr ya clonado en ../dolibarr/
# y ejecuta los mismos tests Bruno contra ambas APIs.
#
# Uso:
#   ./bin/api_compare.sh up        → Levantar contenedores
#   ./bin/api_compare.sh test      → Ejecutar tests
#   ./bin/api_compare.sh reset     → BD aséptica (borra y recrea)
#   ./bin/api_compare.sh update    → git pull del fork Dolibarr
#   ./bin/api_compare.sh down      → Apagar contenedores
#   ./bin/api_compare.sh all       → reset + up + espera config + test
# ─────────────────────────────────────────────────────────────

set -e
set -o pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
COMPOSE_FILE="$PROJECT_DIR/docker-compose.api-test.yml"
COLLECTION_DIR="$PROJECT_DIR/api"
RESULTS_DIR="$PROJECT_DIR/var"
# Cargar variables de entorno desde .env si existe
if [ -f "$PROJECT_DIR/.env" ]; then
    export $(grep -v '^#' "$PROJECT_DIR/.env" | xargs)
fi

DOLIBARR_DIR="${DOLIBARR_PATH:-$PROJECT_DIR/../dolibarr}"

DOLIBARR_URL="http://localhost:${APITEST_DOLIBARR_PORT:-8090}"
ALIXAR_URL="http://localhost:${APITEST_ALIXAR_PORT:-8091}"

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

mkdir -p "$RESULTS_DIR"

# ── Funciones ─────────────────────────────────────────────

check_dolibarr() {
    local fatal=${1:-true}
    if [ -z "$DOLIBARR_PATH" ]; then
        echo -e "${YELLOW}Advertencia: La variable DOLIBARR_PATH no está definida en .env${NC}"
        echo "  Se usará el valor por defecto: $PROJECT_DIR/../dolibarr"
        echo ""
    fi

    if [ ! -d "$DOLIBARR_DIR/htdocs" ]; then
        echo -e "${RED}Error: No se encuentra el código de Dolibarr en: ${CYAN}$DOLIBARR_DIR/htdocs${NC}"
        echo ""
        if [ "$fatal" = "true" ]; then
            echo "Para ejecutar esta comparación, necesitas clonar el repositorio de Dolibarr."
            echo "Define su ruta en el archivo .env (ej: DOLIBARR_PATH=/ruta/a/dolibarr)."
            echo ""
            exit 1
        else
            echo -e "${YELLOW}Continuando solo con el entorno de Alixar (modo test)...${NC}"
            echo ""
            return 1
        fi
    fi
    return 0
}

dolibarr_version() {
    if [ -d "$DOLIBARR_DIR/.git" ]; then
        git -C "$DOLIBARR_DIR" log --oneline -1 2>/dev/null
    else
        echo "sin git"
    fi
}

wait_for_url() {
    local url=$1
    local name=$2
    local max_wait=${3:-120}
    local elapsed=0

    printf "  Esperando a ${BLUE}%s${NC} (%s)..." "$name" "$url"
    while [ $elapsed -lt $max_wait ]; do
        if curl -s -o /dev/null -w "%{http_code}" "$url" 2>/dev/null | grep -q "^[23]"; then
            printf " ${GREEN}OK${NC} (%ds)\n" "$elapsed"
            return 0
        fi
        sleep 2
        elapsed=$((elapsed + 2))
        printf "."
    done
    printf " ${RED}TIMEOUT${NC} (%ds)\n" "$max_wait"
    return 1
}

do_update() {
    check_dolibarr true
    echo ""
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║  Actualizar fork alxarafe/dolibarr                   ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo ""

    local before
    before=$(dolibarr_version)
    echo -e "  Antes: ${YELLOW}${before}${NC}"

    git -C "$DOLIBARR_DIR" pull --ff-only 2>&1

    local after
    after=$(dolibarr_version)
    echo -e "  Ahora: ${GREEN}${after}${NC}"

    if [ "$before" = "$after" ]; then
        echo -e "  ${CYAN}Ya estaba actualizado.${NC}"
    else
        echo -e "  ${GREEN}✅ Actualizado. Reinicia contenedores: ./bin/api_compare.sh down && ./bin/api_compare.sh up${NC}"
    fi
    echo ""
}

do_up() {
    local has_dolibarr=true
    check_dolibarr false || has_dolibarr=false

    echo ""
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║  Levantando entorno de tests API                      ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo ""
    if [ "$has_dolibarr" = "true" ]; then
        echo -e "  Dolibarr: ${CYAN}$(dolibarr_version)${NC} (../dolibarr/)"
    else
        echo -e "  Dolibarr: ${RED}No detectado (solo Alixar)${NC}"
    fi
    echo -e "  Alixar:   ${CYAN}$(git -C "$PROJECT_DIR" log --oneline -1 2>/dev/null || echo 'dev')${NC}"
    echo ""

    # Si no hay Dolibarr, podemos arrancar solo lo de Alixar para ahorrar recursos
    if [ "$has_dolibarr" = "true" ]; then
        docker compose -f "$COMPOSE_FILE" up -d --build 2>&1
        docker compose -f "$COMPOSE_FILE" restart apitest_alixar_nginx apitest_dolibarr_nginx 2>&1
    else
        echo "  Arrancando infraestructura Alixar para pruebas manuales..."
        docker compose -f "$COMPOSE_FILE" up -d --build apitest_alixar_nginx apitest_db apitest_phpmyadmin 2>&1
        docker compose -f "$COMPOSE_FILE" restart apitest_alixar_nginx 2>&1
    fi

    echo ""
    echo "Ejecutando migraciones Core y Plugins para Alixar V2..."
    sleep 5 # dar tiempo a que mariadb acepte conexiones
    docker exec -i apitest_alixar_php php run_plugin_migration.php || true

    echo ""
    echo "Esperando a que los servicios estén listos..."
    echo ""

    if [ "$has_dolibarr" = "true" ]; then
        wait_for_url "$DOLIBARR_URL" "Dolibarr" 120
    fi
    wait_for_url "${ALIXAR_URL}/api/status" "Alixar API" 60

    echo ""
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║  ⚠ PRIMERA VEZ: Configurar Dolibarr                   ║"
    echo "╠═══════════════════════════════════════════════════════╣"
    echo "║                                                       ║"
    echo "║  1. Abrir http://localhost:${APITEST_DOLIBARR_PORT:-8090}/install/              ║"
    echo "║  2. Instalar Dolibarr:                                ║"
    echo "║     - DB host: apitest_db                             ║"
    echo "║     - DB name: apitest_db / user: root / pass: root   ║"
    echo "║  3. Login: admin / (contraseña que elijas)            ║"
    echo "║  4. Setup > Modules > Activar 'API/Web services'      ║"
    echo "║  5. Users > admin > Tab API > Generate Key            ║"
    echo "║  6. Copiar DOLAPIKEY a:                               ║"
    echo "║     api/environments/dolibarr.bru                     ║"
    echo "║                                                       ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo ""
}

do_test() {
    check_dolibarr
    echo ""
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║  Tests de Compatibilidad API                          ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo -e "  Dolibarr: ${CYAN}$(dolibarr_version)${NC}"
    echo ""

    local doli_result=0
    local alixar_result=0

    # Suites de test a ejecutar
    local SUITES=("Status" "ThirdParties" "Contacts" "Events" "BankAccounts" "Invoices" "Proposals" "Orders" "SupplierInvoices" "SupplierOrders" "Products" "Projects")

    # ── Dolibarr ──────────────────────────────────────────
    echo "━━━ Dolibarr (referencia) ━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    for suite in "${SUITES[@]}"; do
        echo -e "  ── ${BLUE}${suite}${NC} ──"
        if docker run --rm --network apitest_network \
            -v "$PROJECT_DIR:/work" -w /work/api \
            -e DOLAPIKEY="$DOLAPIKEY" \
            node:20-alpine \
            npx --yes @usebruno/cli run "$suite" \
            --env dolibarr \
            --env-var apiKey="$DOLAPIKEY" \
            --env-var baseUrl=http://apitest_dolibarr_nginx 2>&1 | tee "$RESULTS_DIR/api-test-dolibarr-${suite,,}.log"; then
            echo -e "  ${suite}: ${GREEN}✅ PASS${NC}"
        else
            doli_result=1
            echo -e "  ${suite}: ${RED}❌ FAIL${NC}"
        fi
        echo ""
    done

    if [ $doli_result -eq 0 ]; then
        echo -e "  Dolibarr: ${GREEN}✅ PASS${NC}"
    else
        echo -e "  Dolibarr: ${RED}❌ FAIL${NC}"
    fi

    echo ""

    # ── Alixar ────────────────────────────────────────────
    echo "━━━ Alixar Hexagonal (implementación) ━━━━━━━━━━━━━"
    echo ""
    for suite in "${SUITES[@]}"; do
        echo -e "  ── ${BLUE}${suite}${NC} ──"
        if docker run --rm --network apitest_network \
            -v "$PROJECT_DIR:/work" -w /work/api \
            node:20-alpine \
            npx --yes @usebruno/cli run "$suite" \
            --env apitest \
            --env-var apiKey="$DOLAPIKEY" \
            --env-var baseUrl=http://apitest_alixar_nginx 2>&1 | tee "$RESULTS_DIR/api-test-alixar-${suite,,}.log"; then
            echo -e "  ${suite}: ${GREEN}✅ PASS${NC}"
        else
            alixar_result=1
            echo -e "  ${suite}: ${RED}❌ FAIL${NC}"
        fi
        echo ""
    done

    if [ $alixar_result -eq 0 ]; then
        echo -e "  Alixar:   ${GREEN}✅ PASS${NC}"
    else
        echo -e "  Alixar:   ${RED}❌ FAIL${NC}"
    fi

    # ── Resumen ───────────────────────────────────────────
    echo ""
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║  RESULTADO                                            ║"
    echo "╠═══════════════════════════════════════════════════════╣"
    [ $doli_result -eq 0 ] \
        && echo -e "║  Dolibarr:  ${GREEN}✅ PASS${NC}                                    ║" \
        || echo -e "║  Dolibarr:  ${RED}❌ FAIL${NC}                                    ║"
    [ $alixar_result -eq 0 ] \
        && echo -e "║  Alixar:    ${GREEN}✅ PASS${NC}                                    ║" \
        || echo -e "║  Alixar:    ${RED}❌ FAIL${NC}                                    ║"

    if [ $doli_result -eq 0 ] && [ $alixar_result -eq 0 ]; then
        echo -e "║  ${GREEN}★ APIs CERTIFICADAS COMO COMPATIBLES ★${NC}               ║"
    fi
    echo "╚═══════════════════════════════════════════════════════╝"
    echo ""

    return $((doli_result + alixar_result))
}

do_reset() {
    echo ""
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║  Reset: BD aséptica (DESTRUCTIVO)                     ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo ""
    echo "  Destruyendo volúmenes de datos..."

    docker compose -f "$COMPOSE_FILE" down -v 2>&1

    echo ""
    echo -e "  ${GREEN}✅ BD eliminada. El próximo 'up' arranca con BD limpia.${NC}"
    echo -e "  ${YELLOW}⚠  Dolibarr necesitará reinstalarse (wizard) y regenerar DOLAPIKEY.${NC}"
    echo -e "  ${CYAN}Si solo quieres borrar datos de prueba, usa: ${YELLOW}./bin/api_compare.sh clean${NC}"
    echo ""
}

do_clean() {
    echo ""
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║  Clean: Limpieza de datos transaccionales             ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo ""
    echo "  Purgando tablas de test (Dolibarr & Alixar share DB)..."

    if docker exec -i apitest_db mariadb -u root -proot apitest_db < "$SCRIPT_DIR/clean_apitest.sql" 2>/dev/null; then
        echo -e "  ${GREEN}✅ Tablas purgadas.${NC}"
        echo -e "  ${GREEN}✅ Configuración y DOLAPIKEY preservados.${NC}"
    else
        echo -e "  ${RED}❌ Error al limpiar la base de datos.${NC}"
        echo "  Asegúrate de que los contenedores están arrancados: ./bin/api_compare.sh up"
    fi
    echo ""
}

do_down() {
    echo "Apagando entorno de tests (datos preservados)..."
    docker compose -f "$COMPOSE_FILE" down
    echo -e "${CYAN}Datos preservados. Usa 'clean' para purgar o 'reset' para BD aséptica.${NC}"
}

# ── Main ──────────────────────────────────────────────────

case "${1:-help}" in
    update)  do_update ;;
    up)      do_up ;;
    test)    do_test ;;
    clean)   do_clean ;;
    reset)   do_reset ;;
    down)    do_down ;;
    all)
        do_clean 2>/dev/null || do_reset
        do_up
        do_test
        ;;
    *)
        echo ""
        echo "Alixar API — Tests de Compatibilidad"
        echo ""
        echo "Uso: $0 {up|test|clean|reset|update|down|all}"
        echo ""
        echo "  up      Levantar Dolibarr + Alixar dockerizados"
        echo "  test    Ejecutar tests Bruno contra ambas APIs"
        echo "  clean   Borra datos (proposals, etc) pero mantiene API KEY"
        echo "  reset   Destruir BD y empezar limpio (aséptico, borra todo)"
        echo "  update  git pull del fork alxarafe/dolibarr"
        echo "  down    Apagar contenedores (datos preservados)"
        echo "  all     clean + up + test"
        echo ""
        echo "Estructura requerida:"
        echo "  Alxarafe/"
        echo "  ├── alixar/     ← (este repo)"
        echo "  └── dolibarr/   ← fork alxarafe/dolibarr"
        echo ""
        ;;
esac
