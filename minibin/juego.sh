#!/bin/bash

tablero=(" " " " " " " " " " " " " " " " " ")


mostrar_tablero() {
  
  echo "  ₍⸍⸌̣ʷ̣̫⸍̣⸌₎   ₍⸍⸌̣ʷ̣̫⸍̣⸌₎    ₍⸍⸌̣ʷ̣̫⸍̣⸌₎    ₍⸍⸌̣ʷ̣̫⸍̣⸌₎    ₍⸍⸌̣ʷ̣̫⸍̣⸌₎    ₍⸍⸌̣ʷ̣̫⸍̣⸌₎"
  echo "---------------------------------------------------------------"
  echo "-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-"
  echo ""
  echo "Ingresa tu posición de acuerdo a los números del ejemplo"
  echo ""
  echo "                                  Ejemplo:"
  echo "            ${tablero[0]} | ${tablero[1]} | ${tablero[2]}            1 | 2 | 3 "
  echo "           ---+---+---          ---+---+--- "
  echo "            ${tablero[3]} | ${tablero[4]} | ${tablero[5]}            4 | 5 | 6 "
  echo "           ---+---+---          ---+---+--- "
  echo "            ${tablero[6]} | ${tablero[7]} | ${tablero[8]}            7 | 8 | 9 "
  echo ""
  echo "-|-|-|-|-|--|-|-|-|-|--|-|--|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-"
  echo "--------------------------------------------------------------"
}


verificar_ganador() {
  local ganador=""

 
  for i in 0 3 6; do
    if [[ "${tablero[$i]}" == "${tablero[$((i+1))]}" && "${tablero[$i]}" == "${tablero[$((i+2))]}" && "${tablero[$i]}" != " " ]]; then
      ganador="${tablero[$i]}"
    fi
  done

  for i in 0 1 2; do
    if [[ "${tablero[$i]}" == "${tablero[$((i+3))]}" && "${tablero[$i]}" == "${tablero[$((i+6))]}" && "${tablero[$i]}" != " " ]]; then
      ganador="${tablero[$i]}"
    fi
  done

  if [[ "${tablero[0]}" == "${tablero[4]}" && "${tablero[0]}" == "${tablero[8]}" && "${tablero[0]}" != " " ]]; then
    ganador="${tablero[0]}"
  fi

  if [[ "${tablero[2]}" == "${tablero[4]}" && "${tablero[2]}" == "${tablero[6]}" && "${tablero[2]}" != " " ]]; then
    ganador="${tablero[2]}"
  fi

  echo "$ganador"
}

jugar_gato() {
  local jugador="X"
  local empate=false
  local flag=1
  while [ $flag == 1 ]; do
    mostrar_tablero
    flag=0
    echo "Es el turno del jugador $jugador. Ingresa la posición (1-9):"
    read posicion

    if [[ ! "$posicion" =~ ^[1-9]$ ]]; then
      echo "Por favor ingresa un número aceptable del 1 al 9"
      continue
    fi

    local indice=$((posicion - 1))

    if [[ "${tablero[$indice]}" == " " ]]; then
      tablero[$indice]=$jugador
    else
      echo "Posición ya utilizada, por favor ingresa otra :3"
      flag=1
      continue
    fi

    ganador=$(verificar_ganador)

    for i in $(seq 0 8); do
      if [[ "${tablero[$i]}" == " " ]]; then
        flag=1
      fi
    done

    if [[ "$ganador" == "X" || "$ganador" == "O" ]]; then
      mostrar_tablero

	echo "    _____                       _         _   _   _ "
	echo "   / ____|                     | |       | | | | | |"
	echo "  | |  __  __ _ _ __   __ _ ___| |_ ___  | | | | | |"
	echo "  | | |_ |/ _  |  _ \ / _  / __| __/ _ \ | | | | | |"
	echo "  | |__| | (_| | | | | (_| \__ \ ||  __/ |_| |_| |_|"
	echo "   \_____|\__,_|_| |_|\__,_|___/\__\___| (_) (_) (_)"
      break
    elif [[ $flag == 0 ]]; then
      mostrar_tablero
      echo ""
	echo "                              _         _   _   _ "
	echo "                             | |       | | | | | |"
	echo "    ___ _ __ ___  _ __   __ _| |_ ___  | | | | | |"
	echo "   / _ \  _   _ \|  _ \ / _  | __/ _ \ | | | | | |"
	echo "  |  __/ | | | | | |_) | (_| | ||  __/ |_| |_| |_|"
	echo "   \___|_| |_| |_| .__/ \__,_|\__\___| (_) (_) (_)"
	echo "                 | |                              "
	echo "                 |_|                              "
      break
    fi

 
    if [[ "$jugador" == "X" ]]; then
      jugador="O"
    else
      jugador="X"
    fi
  done
}


menu_principal(){
opcion=0
echo "░░░▄▀▌░▄▀▌░░░░░░░░░░░░░░░░░░░░░░░░"
echo "░▄██▀▀▀█▀▀▀▄     ╔╦╗╔╗╔╗╗╗╗       "
echo "▐███░▐░█░▐░█     ║║║╠╝║║║║║       "
echo "███████╥████     ╝╝╝╚╝╚╝╩╩╩       "
echo "█████╚═╩═╝██░░░░░░░░░░░░░░░░░░░░░░"
echo "----------------------------------"
echo "       B I E N V E N I D O        "
echo "----------------------------------"
echo "¿Qué quieres hacer? "
echo "  Selecciona una opción "
echo "  Escribe el número correspondiente  por favor"
echo ""
echo "   1.- ¡Vamos a jugar gato!"
echo "   2.- no quiero jugar, vamonos de aqui"
read opcion
case $opcion in
1)
	clear
	jugar_gato
	;;
2)
	echo "----------------------------------"
	echo "Que amargado, Yoshi dice  adioooos"
	echo "----------------------------------"
echo  "─────────────────────────────"
echo "───────────────████─███──────"
echo "──────────────██▒▒▒█▒▒▒█─────"
echo "─────────────██▒────────█────"
echo "─────────██████──██─██──█────"
echo "────────██████───██─██──█────"
echo "────────██▒▒▒█──────────███──"
echo "────────██▒▒▒▒▒▒───▒──██████─"
echo "───────██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█─"
echo "──────██▒▒▒▒─────▒▒▒▒▒▒▒▒▒▒█─"
echo "──────██▒▒▒───────▒▒▒▒▒█▒█▒██"
echo "───────██▒▒───────▒▒▒▒▒▒▒▒▒▒█"
echo "────────██▒▒─────█▒▒▒▒▒▒▒▒▒▒█"
echo "────────███▒▒───██▒▒▒▒▒▒▒▒▒▒█"
echo "─────────███▒▒───█▒▒▒▒▒▒▒▒▒█─"
echo "────────██▀█▒▒────█▒▒▒▒▒▒██──"
echo "──────██▀██▒▒▒────███████────"
echo "────██▀███▒▒▒▒────█▒▒██──────"
echo "█████████▒▒▒▒▒█───██──█──────"
echo "█▒▒▒▒▒▒█▒▒▒▒▒█────████▒──────"
echo "█▒▒▒▒▒▒█▒▒▒▒▒▒█───███▒▒──────"
echo "█▒▒▒▒▒▒█▒▒▒▒▒█────█▒▒▒▒──────"
echo "██▒▒▒▒▒█▒▒▒▒▒▒█───█▒▒▒█──────"
echo "─██▒▒▒▒███████───██████──────"
echo "──██▒▒▒▒▒██─────██───────────"
echo "───██▒▒▒██─────██────────────"
echo "────█████─────███────────────"
echo "────█████▄───█████▄──────────"
echo "──▄█▓▓▓▓▓█▄─█▓▓▓▓▓█▄─────────"
echo "──█▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓█────────"
echo "──█▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓█────────"
echo "──▀████████▀▀███████▀────────"

	exit
	;;
*)
	echo "esa no es una opción valida"
	;;
esac

}

menu_principal
