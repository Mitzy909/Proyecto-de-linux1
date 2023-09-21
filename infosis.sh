#!/bin/bash

# Información de Memoria RAM desde /proc/meminfo
memoria_ram=$(grep 'MemTotal' /proc/meminfo | awk '{print $2}')

# Arquitectura del Sistema desde /proc/version
arquitectura=$(grep 'model name' /proc/cpuinfo | head -n 1 | awk '{print $4}')
if [[ "$arquitectura" == "lm" ]]; then
  arquitectura="x86_64"
else
  arquitectura="x86"
fi
# Versión del SO desde /etc/os-release
version_so=$(grep 'PRETTY_NAME' /etc/os-release | awk -F '=' '{print $2}' | tr -d '"')

echo "Información del sistema:"
echo "Memoria RAM: $memoria_ram kB"
echo "Arquitectura del sistema: $arquitectura"
echo "Versión del SO: $version_so"

