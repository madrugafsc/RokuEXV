#!/bin/bash

# validating ip
validating() {
    if [[ ! "$Ip" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
     echo -e "${VERMELHO}Error: Invalid IP address!${RESET}"
        exit 1
    else
        IFS='.' read -ra octets <<< "$Ip"
     for o in "${octets[@]}"; do
            if (( o > 255 )); then
                echo -e "${VERMELHO}Error: Invalid IP address!${RESET}"
                exit 1
            fi
    done
    fi
}

# menu 
option1() {
    while true; do 
    sleep 0.3 
    clear
    sleep 0.5
    echo -e "${AMARELO}«========================»${RESET}"
    sleep 0.2
    echo -e "${AMARELO}  1) Power ON             ${RESET}"
    sleep 0.2
    echo -e "${AMARELO}  2) Power OFF            ${RESET}"
    sleep 0.2
    echo -e "${AMARELO}  3) Sound UP             ${RESET}"
    sleep 0.2
    echo -e "${AMARELO}  4) Sound DOWN           ${RESET}"
    sleep 0.2
    echo -e "${AMARELO}  5) Sound MUTE           ${RESET}"
    sleep 0.2
    echo -e "${AMARELO}  6) Back to menu         ${RESET}"
    sleep 0.2
    echo -e "${AMARELO}«========================»${RESET}"
    sleep 0.1
    echo "                          "
    sleep 0.7
    read -rp "$(echo -e "${AMARELO}Select one option: ${VERDE}")" system_choice
    
      case $system_choice in
        1) ligartv_func;;
        2) desligartv_func;;
        3) volumeup ;;
        4) volumedown ;;
        5) mutartv_func;;
        6) sleep 0.5
        clear
        sleep 1
        break ;;  
        *) echo -e "${VERMELHO}Error: Option invalid! ${RESET}" ;;
      esac
    done
}

#Menu de opções
main_menu() {
    PS3=$(echo -e "${AMARELO}Choose an option: ${VERDE}")
    echo -e "${RESET}"
while true; do
sleep 1
select option in "${options[@]}"; do
    case $option in
        "Functions of system")
        sleep 0.5
           option1
           echo -e "${RESET}"
           REPLY="" ;;
        "Apps")
        sleep 0.3
            menu_apps
            echo -e "${RESET}"
            REPLY=""
            ;;
        "Free navigation")
        sleep 0.3
            echo "You choose the option 3! "
            REPLY=""
            ;;
        "Exit")
        sleep 0.7
        echo -e "${VERMELHO}Exiting...${RESET}"
        sleep 2
            exit 0
            ;;
        *)
            sleep 0.3
            echo -e "%{VERMELHO}Invalid option!${RESET}"
            sleep 1
            clear
            continue
            REPLY=""
            ;;
    esac
done
done
}

menu_salvador() {
    sleep 0.5
        clear
        sleep 1
        echo -e "${AMARELO}1) Functions of system${RESET}"
        sleep 0.25
        echo -e "${AMARELO}2) Apps${RESET}"
        sleep 0.25
        echo -e "${AMARELO}3) Free keyboard${RESET}"
        sleep 0.25
        echo -e "${AMARELO}4) Exit${RESET}"
        sleep 0.5
}

menu_apps() {
    local PS3=$(echo -e "${AMARELO}Choose an option: ${VERDE}")
    sleep 0.5
    clear
    sleep 1
    echo -e "${RESET}"
    select option in "${app_options[@]}"; do
        case $option in
            "Netflix")
            netflix_func
            REPLY="" ;;
            "Spotify") 
            spotify_func
            REPLY="" ;;
            "Youtube")
            youtube_func
            REPLY="" ;;
            "Prime Video") 
            primevideo_func
            REPLY="" ;;
            "Disney+")
            disney_func
            REPLY="" ;;
            "Pluto TV")
            pluto_func
            REPLY="" ;;
            "Close Apps")
            exitapps_func
            REPLY="" ;;
            "Return to menu")
            menu_salvador
            break ;;
            *) 
            continue ;;
        esac
    done
}