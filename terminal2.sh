#!/bin/bash

trap "" SIGINT SIGTSTP

current_directory=$(pwd)
minibin_directory="${current_directory}/minibin"
export PATH=$PATH:$minibin_directory

usuario=$USER

while true; do
    directorio_actual=${PWD##*/}  # Actualiza el directorio actual en cada iteración
    read -p "$usuario@$directorio_actual@MiTerminal:~$ " comando

    # Verificar si se ingresó "salir" para salir del script
    if [[ $comando == "salir" ]]; then
        echo "Saliendo de la Terminal."
        exit 0
    fi

    # Ejecutar el comando ingresado
    eval "$comando"
done
