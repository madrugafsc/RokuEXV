#!/bin/bash

# ============================================================
# Function Sound Up
# ============================================================

volumeup() {
  sleep 0.2
  clear
  sleep 0.2

  echo -e "${AMARELO}How much u need to up? Enter a number between 1-100${RESET}"
  read -rp "$(echo -e "${AMARELO}>  ${VERDE}")" Loop

  # Validate input
  if ! [[ "$Loop" =~ ^[0-9]+$ ]] || (( Loop < 1 || Loop > 100 )); then
    sleep 0.5
    echo -e "${VERMELHO}Error: Please enter a number between 1-100!${RESET}"
    sleep 0.5
    echo -e "${VERMELHO}Exiting...${RESET}"
    sleep 3
    return 1
  fi

  clear

  local i=0

  while (( i < Loop )); do
    sleep 0.1

    if curl -d '' "http://${Ip}:8060/keypress/VolumeUp" > /dev/null 2>&1; then
      ((i++))
      echo -e "${VERDE}Successful Volume UP! $i/$Loop${RESET}"
    else
      sleep 1
      echo -e "${VERMELHO}Error: communication with target failed${RESET}"
      sleep 0.2
      echo "                                    "
      sleep 0.5
      echo -e "${VERMELHO}Exiting...${RESET}"
      sleep 3
      return 1
    fi
  done
}


# ============================================================
# Function Sound Down
# ============================================================

volumedown() {
  sleep 0.2
  clear
  sleep 0.2

  echo -e "${AMARELO}How much u need to down? Enter a number between 1-100${RESET}"
  read -rp "$(echo -e "${AMARELO}>  ${VERDE}")" Loop

  # Validate input
  if ! [[ "$Loop" =~ ^[0-9]+$ ]] || (( Loop < 1 || Loop > 100 )); then
    sleep 0.5
    echo -e "${VERMELHO}Error: Please enter a number between 1-100!${RESET}"
    sleep 0.5
    echo -e "${VERMELHO}Exiting...${RESET}"
    sleep 3
    return 1
  fi

  clear

  local i=0

  while (( i < Loop )); do
    sleep 0.1

    if curl -d '' "http://${Ip}:8060/keypress/VolumeDown" > /dev/null 2>&1; then
      ((i++))
      echo -e "${VERDE}Successful Volume DOWN! $i/$Loop${RESET}"
    else
      sleep 1
      echo -e "${VERMELHO}Error: communication with target failed${RESET}"
      sleep 0.2
      echo "                                    "
      sleep 0.5
      echo -e "${VERMELHO}Exiting...${RESET}"
      sleep 3
      return 1
    fi
  done
}


# ============================================================
# Function Power OFF
# ============================================================

desligartv_func() {

  if curl -d '' "http://${Ip}:8060/keypress/PowerOff" > /dev/null 2>&1; then
    echo -e "${VERDE}Successful Power OFF!${RESET}"
  else
    sleep 0.5
    clear
    sleep 1.2

    echo -e "${VERMELHO}Error: communication with device failed${RESET}"

    sleep 0.2
    echo "                                                            "
    sleep 0.5

    echo -e "${VERMELHO}Exiting...${RESET}"

    sleep 3
    return 1
  fi
}


# ============================================================
# Function Power ON
# ============================================================

ligartv_func() {

  if curl -d '' "http://${Ip}:8060/keypress/PowerOn" > /dev/null 2>&1; then
    echo -e "${VERDE}Successful Power ON!${RESET}"
  else
    sleep 0.5
    clear
    sleep 1.2

    echo -e "${VERMELHO}Error: communication with device failed${RESET}"

    sleep 0.2
    echo "                                                            "
    sleep 0.5

    echo -e "${VERMELHO}Exiting...${RESET}"

    sleep 3
    return 1
  fi
}


# ============================================================
# Function Mute
# ============================================================

mutartv_func() {

  if curl -d '' "http://${Ip}:8060/keypress/VolumeMute" > /dev/null 2>&1; then
    echo -e "${VERDE}Successful Device MUTED!${RESET}"
  else
    sleep 0.5
    clear
    sleep 1.2

    echo -e "${VERMELHO}Error: communication with device failed${RESET}"

    sleep 0.2
    echo "                                                            "
    sleep 0.5

    echo -e "${VERMELHO}Exiting...${RESET}"

    sleep 3
    return 1
  fi
}


# ============================================================
# Function Keyboard / Search
# ============================================================

teclado_func() {

  while true; do

    sleep 0.5
    clear
    sleep 0.5

    echo -e "${AMARELO}Enter the text you want to search or Press 0 to back to menu${RESET}"
    sleep 0.5
    echo "                                                               "

    read -rp "$(echo -e "${AMARELO}>  ${VERDE}")" texto_user


    # Return to main menu
    if [[ "$texto_user" == "0" ]]; then
      sleep 0.3
      clear
      sleep 0.3
      main_menu
    fi


    sleep 0.5
    echo "                                                               "
    sleep 1


    for (( i=0; i<${#texto_user}; i++ )); do

      CARACTERE="${texto_user:$i:1}"


      # Encode character for URL
      CHAR_CODIFICADO=$(
        echo -n "$CARACTERE" |
        xxd -plain |
        tr -d '\n' |
        sed 's/\(..\)/%\1/g'
      )


      # Send character to Roku
      if curl -d '' \
        "http://${Ip}:8060/keypress/Lit_${CHAR_CODIFICADO}" \
        > /dev/null 2>&1
      then
        echo -e "${AMARELO}Researching... ${RESET}"

        sleep 0.2

      else

        sleep 0.5
        clear
        sleep 1.2

        echo -e "${VERMELHO}Error: communication with device failed${RESET}"

        sleep 0.2
        echo "                                                            "
        sleep 0.5

        echo -e "${VERMELHO}Exiting...${RESET}"

        sleep 3
        return 1

      fi

    done


    # ========================================================
    # Press Enter AFTER all characters were sent
    # ========================================================

    sleep 0.2

    if curl -d '' \
      "http://${Ip}:8060/keypress/Enter" \
      > /dev/null 2>&1
    then

      echo -e "${VERDE}Text sent successfully!${RESET}"

    else

      sleep 0.5
      clear
      sleep 1.2

      echo -e "${VERMELHO}Error: communication with device failed${RESET}"

      sleep 0.2
      echo "                                                            "
      sleep 0.5

      echo -e "${VERMELHO}Exiting...${RESET}"

      sleep 3
      return 1

    fi

  done
}


# ============================================================
# Free Navigation
# ============================================================

free_navigation() {

  local direction=""

  while true; do

    sleep 0.5
    clear
    sleep 0.5

    echo -e "${AMARELO}For use this, just press A to go left, D to go right, W to go up, S to go down${RESET}"

    sleep 0.1

    echo -e "${AMARELO}Press 1 to select your action, 2 to go back or 0 to exit to main menu${RESET}"

    sleep 0.1

    echo -e "${VERDE}  W${RESET}"

    sleep 0.1

    echo -e "${VERDE}A S D${RESET}"

    sleep 0.1

    echo -e "${VERDE}1 = OK${RESET}"

    sleep 0.1

    echo -e "${VERDE}2 = Back${RESET}"

    sleep 0.1

    echo -e "${VERDE}0 = Exit to main menu${RESET}"

    sleep 0.2


    # Read one key
    read -r -n 1 -p "$(echo -e "${AMARELO}>  ${VERDE}")" direction

    echo


    case "$direction" in

      # ======================================================
      # UP
      # ======================================================

      [Ww])

        if curl -d '' \
          "http://${Ip}:8060/keypress/Up" \
          > /dev/null 2>&1
        then

          true

        else

          sleep 0.3
          echo "          "
          sleep 0.5

          echo -e "${VERMELHO}Error: communication with device failed${RESET}"

          sleep 0.2
          echo "          "
          sleep 0.5

          echo -e "${VERMELHO}Exiting...${RESET}"

          sleep 3
          return 1

        fi

        continue
        ;;


      # ======================================================
      # DOWN
      # ======================================================

      [Ss])

        if curl -d '' \
          "http://${Ip}:8060/keypress/Down" \
          > /dev/null 2>&1
        then

          true

        else

          sleep 0.3
          echo "          "
          sleep 0.5

          echo -e "${VERMELHO}Error: communication with device failed${RESET}"

          sleep 0.2
          echo "          "
          sleep 0.5

          echo -e "${VERMELHO}Exiting...${RESET}"

          sleep 3
          return 1

        fi

        continue
        ;;


      # ======================================================
      # LEFT
      # ======================================================

      [Aa])

        if curl -d '' \
          "http://${Ip}:8060/keypress/Left" \
          > /dev/null 2>&1
        then

          true

        else

          sleep 0.3
          echo "          "
          sleep 0.5

          echo -e "${VERMELHO}Error: communication with device failed${RESET}"

          sleep 0.2
          echo "          "
          sleep 0.5

          echo -e "${VERMELHO}Exiting...${RESET}"

          sleep 3
          return 1

        fi

        continue
        ;;


      # ======================================================
      # RIGHT
      # ======================================================

      [Dd])

        if curl -d '' \
          "http://${Ip}:8060/keypress/Right" \
          > /dev/null 2>&1
        then

          true

        else

          sleep 0.3
          echo "          "
          sleep 0.5

          echo -e "${VERMELHO}Error: communication with device failed${RESET}"

          sleep 0.2
          echo "          "
          sleep 0.5

          echo -e "${VERMELHO}Exiting...${RESET}"

          sleep 3
          return 1

        fi

        continue
        ;;


      # ======================================================
      # SELECT
      # ======================================================

      1)

        if curl -d '' \
          "http://${Ip}:8060/keypress/Select" \
          > /dev/null 2>&1
        then

          true

        else

          sleep 0.3
          echo "          "
          sleep 0.5

          echo -e "${VERMELHO}Error: communication with device failed${RESET}"

          sleep 0.2
          echo "          "
          sleep 0.5

          echo -e "${VERMELHO}Exiting...${RESET}"

          sleep 3
          return 1

        fi

        continue
        ;;


      # ======================================================
      # BACK
      # ======================================================

      2)

        if curl -d '' \
          "http://${Ip}:8060/keypress/Back" \
          > /dev/null 2>&1
        then

          true

        else

          sleep 0.3
          echo "          "
          sleep 0.5

          echo -e "${VERMELHO}Error: communication with device failed${RESET}"

          sleep 0.2
          echo "          "
          sleep 0.5

          echo -e "${VERMELHO}Exiting...${RESET}"

          sleep 3
          return 1

        fi

        continue
        ;;


      # ======================================================
      # MAIN MENU
      # ======================================================

      0)

        sleep 0.3
        clear
        sleep 0.3

        main_menu
        ;;


      # ======================================================
      # INVALID OPTION
      # ======================================================

      *)

        sleep 0.3
        echo "          "
        sleep 0.5

        echo -e "${VERMELHO}Error: Invalid option!${RESET}"

        sleep 0.5

        continue
        ;;

    esac

  done
}

