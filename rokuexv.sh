#!/usr/bin/env bash
# ==============================================================================
# Name of Script: RokuEXV
# Description:  An Roku TV Remote Controller
# Author: Madruga
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. SECURITY AND SOURCES
# ------------------------------------------------------------------------------

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE}")" &> /dev/null && pwd)"

source "$ROOT_DIR/config/variables.conf"
source "$ROOT_DIR/config/colors.conf"

for arquivo_lib in "$ROOT_DIR"/lib/*.sh; do
    [ -f "$arquivo_lib" ] && source "$arquivo_lib"
done

validar_arg

main() {
    main_menu                        
}

main
