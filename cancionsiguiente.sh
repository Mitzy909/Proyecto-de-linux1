#!/bin/bash

# Ruta del archivo de índice
archivo_indice="indicecancion.txt"

# Ruta del archivo con la lista de canciones
archivo_lista="listacan.txt"

# Verifica si el archivo de índice existe
if [ ! -f "$archivo_indice" ]; then
    echo "El archivo de índice '$archivo_indice' no existe."
    exit 1
fi

# Lee el valor numérico del archivo de índice y suma 1
valor_indice=$(cat "$archivo_indice")
nuevo_valor=$((valor_indice + 1))

# Usa sed para extraer la línea correspondiente del archivo de lista
linea=$(sed -n "${nuevo_valor}p" "$archivo_lista")

ruta_anterior=$(dirname "$PWD")


# Imprime la línea
echo "$ruta_anterior/musica/$linea" > "$PWD/cancionsiguiente.txt"