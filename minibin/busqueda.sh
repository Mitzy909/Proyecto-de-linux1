#!/bin/bash

# Un comando que pueda buscar por un archivo en un directorio específico recibe
#dos  parámetros: La carpeta a buscar y el archivo que va a buscar.
#Ej: Linux GEN 44

echo "     -------------------------"
echo "    |   ENCONTRAR ARCHIVO     | "
echo "     -------------------------"
echo ""
echo "vamo a buscar tu archivo"
echo ""
echo "por favor, ingresa la ruta absoluta del directorio en donde se encuentra tu carpeta"
read  rutaCarpeta
echo ""
echo "por favor, ingresa el nombre del archivo que quieres encontrar, recuerda especificar el tipo de archivo"
read nombreArchivo

#rutaCarpeta="$(realpath "$rutaCarpeta")"
rutaCarpeta_y_nombreArchivo="$rutaCarpeta/$nombreArchivo"

if [ -e "$rutaCarpeta_y_nombreArchivo" ]; then
	echo "ufaaaas su archivo $nombreArchivo si se encuentra en $rutaCarpeta"
else
	echo "nooo puede ser su archivo $nombreArchivo no se ha encontrado en $rutaCarpeta, que triste tu caso"

fi
