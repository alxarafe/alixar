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

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
COMPOSE_FILE="$PROJECT_DIR/docker-compose.api-test.yml"
COLLECTION_DIR="$PROJECT_DIR/api"
RESULTS_DIR="$PROJECT_DIR/var"
DOLIBARR_DIR="$PROJECT_DIR/../dolibarr"

DOLIBARR_URL="http://localhost:8090"
ALIXAR_URL="http://localhost:8091"

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
    if [ ! -d "$DOLIBARR_DIR/htdocs" ]; then
        echo -e "${RED}Error: No se encuentra ../dolibarr/htdocs${NC}"
        echo "  El fork alxarafe/dolibarr debe estar clonado como hermano de alixar/"
        echo "  Estructura esperada:"
        echo "    Alxarafe/"
        echo "    ├── alixar/     ← (estás aquí)"
        echo "    └── dolibarr/   ← git@github.com:alxarafe/dolibarr.git"
        exit 1
    fi
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
    check_dolibarr
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
    check_dolibarr
    echo ""
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║  Levantando entorno de tests API                     ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo ""
    echo -e "  Dolibarr: ${CYAN}$(dolibarr_version)${NC} (../dolibarr/)"
    echo -e "  Alixar:   ${CYAN}$(git -C "$PROJECT_DIR" log --oneline -1 2>/dev/null || echo 'dev')${NC}"
    echo ""

    docker compose -f "$COMPOSE_FILE" up -d --build 2>&1

    echo ""
    echo "Esperando a que los servicios estén listos..."
    echo ""

    wait_for_url "$DOLIBARR_URL" "Dolibarr" 120
    wait_for_url "${ALIXAR_URL}/api/status" "Alixar API" 60

    echo ""
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║  ⚠ PRIMERA VEZ: Configurar Dolibarr                 ║"
    echo "╠═══════════════════════════════════════════════════════╣"
    echo "║                                                       ║"
    echo "║  1. Abrir http://localhost:8090/install/              ║"
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
    echo ""
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║  Tests de Compatibilidad API                         ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo -e "  Dolibarr: ${CYAN}$(dolibarr_version)${NC}"
    echo ""

    local doli_result=0
    local alixar_result=0

    # ── Dolibarr ──────────────────────────────────────────
    echo "━━━ Dolibarr (referencia) ━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    if npx --yes @usebruno/cli run "$COLLECTION_DIR/ThirdParties" \
        --env dolibarr 2>&1 | tee "$RESULTS_DIR/api-test-dolibarr.log"; then
        echo -e "\n  Dolibarr: ${GREEN}✅ PASS${NC}"
    else
        doli_result=1
        echo -e "\n  Dolibarr: ${RED}❌ FAIL${NC}"
    fi

    echo ""

    # ── Alixar ────────────────────────────────────────────
    echo "━━━ Alixar Hexagonal (implementación) ━━━━━━━━━━━━━"
    echo ""
    if npx --yes @usebruno/cli run "$COLLECTION_DIR/ThirdParties" \
        --env apitest 2>&1 | tee "$RESULTS_DIR/api-test-alixar.log"; then
        echo -e "\n  Alixar:   ${GREEN}✅ PASS${NC}"
    else
        alixar_result=1
        echo -e "\n  Alixar:   ${RED}❌ FAIL${NC}"
    fi

    # ── Resumen ───────────────────────────────────────────
    echo ""
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║  RESULTADO                                           ║"
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
    echo "║  Reset: BD aséptica                                  ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo ""
    echo "  Destruyendo volúmenes de datos..."

    docker compose -f "$COMPOSE_FILE" down -v 2>&1

    echo ""
    echo -e "  ${GREEN}✅ BD eliminada. El próximo 'up' arranca con BD limpia.${NC}"
    echo -e "  ${YELLOW}⚠  Dolibarr necesitará reinstalarse (wizard) y regenerar DOLAPIKEY.${NC}"
    echo ""
}

do_down() {
    echo "Apagando entorno de tests (datos preservados)..."
    docker compose -f "$COMPOSE_FILE" down
    echo -e "${CYAN}Datos preservados. Usa 'reset' para BD aséptica.${NC}"
}

# ── Main ──────────────────────────────────────────────────

case "${1:-help}" in
    update)  do_update ;;
    up)      do_up ;;
    test)    do_test ;;
    reset)   do_reset ;;
    down)    do_down ;;
    all)
        do_reset
        do_up
        echo "Pulsa ENTER cuando hayas configurado la DOLAPIKEY de Dolibarr:"
        read -r
        do_test
        ;;
    *)
        echo ""
        echo "Alixar API — Tests de Compatibilidad"
        echo ""
        echo "Uso: $0 {up|test|reset|update|down|all}"
        echo ""
        echo "  up      Levantar Dolibarr + Alixar dockerizados"
        echo "  test    Ejecutar tests Bruno contra ambas APIs"
        echo "  reset   Destruir BD y empezar limpio (aséptico)"
        echo "  update  git pull del fork alxarafe/dolibarr"
        echo "  down    Apagar contenedores (datos preservados)"
        echo "  all     reset + up + espera config + test"
        echo ""
        echo "Estructura requerida:"
        echo "  Alxarafe/"
        echo "  ├── alixar/     ← (este repo)"
        echo "  └── dolibarr/   ← fork alxarafe/dolibarr"
        echo ""
        ;;
esac
