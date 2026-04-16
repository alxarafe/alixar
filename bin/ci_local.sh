#!/bin/bash
# Description: Orchestrates the execution of all quality assurance scripts in Alixar.

set -e

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "=== 1. Checking Standards (PHPCS) ==="
bash "$SCRIPT_DIR/check_standards.sh"

echo "=== 2. Static Analysis (PHPStan) ==="
bash "$SCRIPT_DIR/static_analysis.sh"


echo ""
echo "✅ All local CI checks passed successfully for Alixar!"
