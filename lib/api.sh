#!/bin/bash

#Function Sound Up
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

#Function Sound Down
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


