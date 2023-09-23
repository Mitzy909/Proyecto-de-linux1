#!/bin/bash

# Verifica que se haya proporcionado una palabra a buscar
if [ $# -ne 1 ]; then

    exit 1
fi

palabra_a_buscar="$1"

# Nombre del archivo de entrada y archivo de salida
archivo_de_entrada="listacan.txt"
archivo_de_salida="indicecancion.txt"

# Verifica si el archivo de entrada existe
if [ ! -f "$archivo_de_entrada" ]; then
    
    exit 1
fi

# Utiliza grep para buscar la palabra en el archivo de entrada y guardar las líneas coincidentes en el archivo de salida

grep -n "$palabra_a_buscar" "$archivo_de_entrada" | awk -F: '{print $1}' > "$archivo_de_salida"

./cancionsiguiente.sh
