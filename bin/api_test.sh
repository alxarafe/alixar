#!/bin/bash
# ─────────────────────────────────────────────────────────────
# Ejecuta los tests de compatibilidad Bruno contra un entorno.
#
# Uso:
#   ./bin/api_test.sh              → Ejecuta contra Alixar local
#   ./bin/api_test.sh dolibarr     → Ejecuta contra Dolibarr
#   ./bin/api_test.sh local        → Ejecuta contra Alixar local
#
# Requisitos:
#   npx @usebruno/cli (se instala automáticamente)
#
# Los tests son IDÉNTICOS para Dolibarr y Alixar. Solo cambia
# el environment (baseUrl + apiBase). Si ambos pasan, la API
# de Alixar es compatible con Dolibarr.
# ─────────────────────────────────────────────────────────────

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
COLLECTION_DIR="$PROJECT_DIR/api"

ENV="${1:-local}"

echo "╔═══════════════════════════════════════════════════════╗"
echo "║  Alixar API — Tests de Compatibilidad               ║"
echo "║  Entorno: $ENV"
echo "╚═══════════════════════════════════════════════════════╝"
echo ""

if ! command -v npx &>/dev/null; then
    echo "❌ npx no encontrado. Instala Node.js primero."
    exit 1
fi

echo "▶ Ejecutando colección Bruno contra entorno '$ENV'..."
echo ""

npx --yes @usebruno/cli run "$COLLECTION_DIR" \
    --env "$ENV" \
    --format junit \
    --output "$PROJECT_DIR/var/api-test-results-${ENV}.xml" \
    2>&1

RESULT=$?

echo ""
if [ $RESULT -eq 0 ]; then
    echo "✅ Todos los tests pasaron contra '$ENV'"
else
    echo "❌ Algunos tests fallaron contra '$ENV'"
fi

echo ""
echo "📄 Resultados JUnit: var/api-test-results-${ENV}.xml"

exit $RESULT
