#!/bin/bash

netflix_func() {
  if curl --connect-timeout 3 --max-time 4 '' -d "http://${Ip}:8060/launch/12" > /dev/null 2>&1; then
   echo -e "${VERDE}Successful Netflix is open!${RESET}"
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

spotify_func() {
  if curl --connect-timeout 3 --max-time 4 '' -d "http://${Ip}:8060/launch/19977" > /dev/null 2>&1; then
   echo -e "${VERDE}Successful Spotify is open!${RESET}"
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

youtube_func() {
  if curl --connect-timeout 3 --max-time 4 '' -d "http://${Ip}:8060/launch/837" > /dev/null 2>&1; then
   echo -e "${VERDE}Successful Youtube is open!${RESET}"
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

primevideo_func() {
  if curl --connect-timeout 3 --max-time 4 '' -d "http://${Ip}:8060/launch/13" > /dev/null 2>&1; then
   echo -e "${VERDE}Successful Prime Video is open!${RESET}"
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

disney_func() {
  if curl --connect-timeout 3 --max-time 4 '' -d "http://${Ip}:8060/launch/291097" > /dev/null 2>&1; then
   echo -e "${VERDE}Successful Disney+ is open!${RESET}"
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

exitapps_func() {
  if curl --connect-timeout 3 --max-time 4 '' -d "http://${Ip}:8060/keypress/Home" > /dev/null 2>&1; then
   echo -e "${VERDE}Successful return to home!${RESET}"
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

pluto_func() {
  if curl --connect-timeout 3 --max-time 4 '' -d "http://${Ip}:8060/launch/74519" > /dev/null 2>&1; then
   echo -e "${VERDE}Successful Pluto TV is open!${RESET}"
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
