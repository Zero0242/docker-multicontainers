#!/bin/bash

read -p "¿Desea continuar con la ejecución del script? (s/n): " confirmacion
if [[ "$confirmacion" != "s" && "$confirmacion" != "S" ]]; then
    echo "Ejecución cancelada por el usuario."
    exit 1
fi

# * Preparacion del server
echo "Verificando programas del servidor..."
apt update && apt upgrade -y

# * Programas utiles para el servidor
# Lista de programas a verificar
# Verificar si los programas existen

programas=(git curl gpg)

for prog in "${programas[@]}"; do
    if ! command -v "$prog" &> /dev/null; then
        echo "El programa '$prog' no está instalado. Instalando..."
        apt install "$prog" -y
    else
        echo "El programa '$prog' está instalado."
    fi
done

# * Docker
if ! command -v docker &> /dev/null; then
    echo "Docker no está instalado. Descargando e instalando Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    rm -f get-docker.sh
else
    echo "Docker ya está instalado."
fi

