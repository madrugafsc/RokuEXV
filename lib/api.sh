#!/bin/bash

volumeup() {
  sleep 0.2
  clear 
  sleep 0.2
  echo -e "${AMARELO}How much u need to up? Enter a number between 1-100${RESET}"
  read -rp "$(echo -e "${AMARELO}>  ${VERDE}")" Loop
    if (( $Loop > 100 )); then
       sleep 0.5
       echo -e "${VERMELHO} Error: Number so high! Pls enter a number between 1-100! ${RESET}"
       sleep 0.5
       echo -e "${VERMELHO}Exiting...${RESET}"
       sleep 3
       exit 0
    fi
    clear
local i=0
while [ $i -le $Loop ]; do
sleep 0.1
if curl --connect-timeout 3 --time-max 4 -d '' "http://${Ip}:8060/keypress/VolumeUp" > /dev/null 2>&1; then
  echo -e "${VERDE}Successful Volume is UP! $i${RESET}"
  else
  sleep 1
  echo -e "${VERMELHO}Error: comunication with target failed ${RESET}"
 sleep 0.2
 echo "                                    "
 sleep 0.5
 echo -e "${VERMELHO}exiting...${RESET}"
 sleep 3
 exit 1
  ((i++))
fi
done
}

volumedown() {
  sleep 0.2
  clear 
  sleep 0.2
  echo -e "${AMARELO}How much u need to down? Enter a number between 1-100${RESET}"
  read -rp "$(echo -e "${AMARELO}>  ${VERDE}")" Loop
    if (( $Loop > 100 )); then
       sleep 0.5
       echo -e "${VERMELHO} Error: Number so high! Pls enter a number between 1-100! ${RESET}"
       sleep 0.5
       echo -e "${VERMELHO}Exiting...${RESET}"
       sleep 3
       exit 0
    fi

    clear
    local i=0
  while [ $i -le $Loop ]; do
    sleep 0.1
    if curl --connect-timeout 3 --max-time 4 -d '' "http://${Ip}:8060/keypress/VolumeUp" > /dev/null 2>&1; then
      echo -e "${VERDE}Sucessful Volume is DOWN! $i${RESET}"
    else
    sleep 1
      echo -e "${VERMELHO}Error: comunication with target failed ${RESET}"
      sleep 0.2
      echo "                                    "
      sleep 0.5
      echo -e "${VERMELHO}exiting...${RESET}"
      sleep 3
      exit 1
      ((i++))
    fi
  done
}

desligartv_func() {
  if curl --connect-timeout 3 --max-time 4 '' -d "http://${Ip}:8060/keypress/PowerOFF" > /dev/null 2>&1; then
   echo -e "${VERDE}Successful Power OFF!${RESET}"
  else
   sleep 0.5
   clear
   sleep 1.2
   echo -e "${VERMELHO}Error: comunication with device failed ${RESET}"
   sleep 0.2
   echo "                                                            "
   sleep 0.5
   echo -e "${VERMELHO}Exiting... ${RESET}"
   sleep 3
   exit 1
  fi
}

ligartv_func() {
  if curl --connect-timeout 3 --max-time 4 '' -d "http://${Ip}:8060/keypress/PowerOn" > /dev/null 2>&1; then
   echo -e "${VERDE}Successful Power ON!${RESET}"
  else
   sleep 0.5
   clear
   sleep 1.2
   echo -e "${VERMELHO}Error: comunication with device failed ${RESET}"
   sleep 0.2
   echo "                                                            "
   sleep 0.5
   echo -e "${VERMELHO}Exiting... ${RESET}"
   sleep 3
   exit 1
  fi
}

mutartv_func() {
  if curl --connect-timeout 3 --max-time 4 '' -d "http://${Ip}:8060/keypress/VolumeMute" > /dev/null 2>&1; then
   echo -e "${VERDE}Successful Device MUTED!${RESET}"
  else
   sleep 0.5
   clear
   sleep 1.2
   echo -e "${VERMELHO}Error: comunication with device failed ${RESET}"
   sleep 0.2
   echo "                                                            "
   sleep 0.5
   echo -e "${VERMELHO}Exiting... ${RESET}"
   sleep 3
   exit 1
  fi
}

teclado_func() {
  while true; do
sleep 0.5
clear
sleep 0.5
echo -e "${AMARELO}Enter the text you want to search or Press 0 to back to menu ${RESET}"
sleep 0.5
echo "                                                               "
sleep 0.5
read -rp "$(echo -e "${AMARELO}>  ${VERDE}")" texto_user
sleep 0.5
echo "                                                               "
sleep 1
echo -e "${AMARELO}In which app do you want to search for this? ${RESET}"
sleep 0.3
echo -e "${AMARELO}1) Netflix ${RESET}"
sleep 0.3
echo -e "${AMARELO}2) Spotify ${RESET}"
sleep 0.3
echo -e "${AMARELO}3) Youtube ${RESET}"
sleep 0.3
echo -e "${AMARELO}4) Browse of system ${RESET}"
sleep 0.3
echo "                                                               "
sleep 0.3
read -rp "$(echo -e "${AMARELO}>  ${VERDE}")" app_choice  

if [[ "$texto_user" == "0" ]]; then
    sleep 0.3
    clear
    sleep 0.5
    main_menu
fi

if [[ "$app_choice" == "1" ]]; then
    curl -d '' "http://${Ip}:8060/launch/12?contentId=search" > /dev/null 2&1
    sleep 7
elif [[ "$app_choice" == "2" ]]; then
    curl -d '' "http://${Ip}:8060/launch/19977?contentId=search" > /dev/null 2&1
    sleep 7
elif [[ "$app_choice" == "3" ]]; then
    curl -d '' "http://${Ip}:8060/launch/837?contentId=search" > /dev/null 2&1
sleep 7
elif [[ "$app_choice" == "4" ]]; then
    curl -d '' "http://${Ip}:8060/search/browse?keyword=" > /dev/null 2&1
    sleep 5
else
    sleep 0.5
    echo "                                                        "
    echo -e "${VERMELHO}Error: Invalid option!${RESET}"
    sleep 0.5
    continue
fi

for (( i=0; i<${#texto_user}; i++ )); do
    CARACTERE="${texto_user:$i:1}"
    
    CHAR_CODIFICADO=$(echo -n "$CARACTERE" | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g')
    
    if curl --connect-timeout 3 --max-time 4 -d '' "http://${Ip}:8060/keypress/Lit_${CHAR_CODIFICADO}" > /dev/null 2>&1; then

    sleep 0.2
    if curl --connect-timeout 3 --max-time 4 -d '' "http://${Ip}:8060/keypress/Enter" > /dev/null 2>&1; then
    echo -e "${VERDE}Text sent successfully!${RESET}"
    else
        sleep 0.5
        clear
        sleep 1.2
        echo -e "${VERMELHO}Error: communication with device failed ${RESET}"
        sleep 0.2
        echo "                                                            "
        sleep 0.5
        echo -e "${VERMELHO}Exiting... ${RESET}"
        sleep 3
        exit 1
    fi
    fi
done
done
}

}


