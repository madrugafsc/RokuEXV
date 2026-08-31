#!/usr/bin/env bash
# ==============================================================================
# Name of Script: RokuEXV
# Description:  An Roku TV Exploit
# Author: MadrugaYH
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
    sleep 0.5
    clear
    sleep 0.5
    echo -e "${VERMELHO} (                             )          ${RESET}"
    sleep 0.2
    echo -e "${VERMELHO} )\\ )         )             ( /(          ${RESET}"
    sleep 0.2
    echo -e "${VERMELHO}((()/(      ( /(    (   (    )\\()) (   (   ${RESET}"
    sleep 0.2
    echo -e "${VERMELHO} /(_)) (   )\\())  ))\\  )\\  ((_)\\  )\\  )\\  ${RESET}"
    sleep 0.2
    echo -e "${VERMELHO}(_))   )\\ ((_)\\  /((_)((_) __((_)((_)((_) ${RESET}"
    sleep 0.2
    echo -e "${VERMELHO}| _ \\ ((_)| |(_)(_))(| __|\\ \\/ /\\ \\ / /  ${RESET}"
    sleep 0.2
    echo -e "${VERMELHO}|   //_ \\| / / | ||| | _|  >  <  \\ V /   ${RESET}"
    sleep 0.2
    echo -e "${VERMELHO}|_|_\\\\___/|_\\_\\ \\_,_| |___|/_/\\_\\  \\_/    ${RESET}"
    sleep 0.2
    echo -e "${VERMELHO}========================================${RESET}"    
    sleep 0.2
    echo "                                                              "                                                      
    main_menu                        
}

main
