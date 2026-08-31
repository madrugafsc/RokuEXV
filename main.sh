#!/usr/bin/env bash
# ==============================================================================
# Nome do Script: RokuEXV.sh
# Descrição:      An Roku TV Exploit
# Autor:          MadrugaYH
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. SEGURANÇA E AMBIENTE
# ------------------------------------------------------------------------------

set -euo pipefail

# 1. Define a raiz do projeto
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE}")" &> /dev/null && pwd)"

# 2. Carrega as Variáveis Sensíveis (se o arquivo .env existir)
if [ -f "$ROOT_DIR/.env" ]; then
    source "$ROOT_DIR/.env"
else
    echo "Erro: Arquivo .env não encontrado. Crie um com base no .env.example" >&2
    exit 1
fi

# 3. Carrega as Configurações Globais e Mensagens
source "$ROOT_DIR/config/variaveis.conf"
source "$ROOT_DIR/config/cores.conf"


# 4. Carrega as Funções da pasta lib/
for arquivo_lib in "$ROOT_DIR"/lib/*.sh; do
    [ -f "$arquivo_lib" ] && source "$arquivo_lib"
done

# --- Início do Fluxo do Script ---
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
