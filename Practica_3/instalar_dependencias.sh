#!/bin/bash

# Script para instalar dependencias necesarias para los scripts de BASH
# Uso: ./instalar_dependencias.sh

echo "Instalando dependencias para los scripts de BASH..."
echo "=================================================="

# Actualizar repositorios
echo "1. Actualizando repositorios..."
sudo apt-get update

# Instalar apache2-utils (contiene htpasswd)
echo "2. Instalando apache2-utils (htpasswd)..."
sudo apt-get install -y apache2-utils

# Instalar hashcat
echo "3. Instalando hashcat..."
sudo apt-get install -y hashcat

# Verificar instalaciones
echo ""
echo "Verificando instalaciones..."
echo "============================"

if [ -f "/usr/bin/htpasswd" ]; then
    echo "✓ htpasswd instalado correctamente"
    htpasswd -v
else
    echo "✗ Error: htpasswd no se instaló correctamente"
fi

if [ -f "/usr/bin/hashcat" ]; then
    echo "✓ hashcat instalado correctamente"
    hashcat --version | head -1
else
    echo "✗ Error: hashcat no se instaló correctamente"
fi

echo ""
echo "Instalación completada!"
echo "Ahora puedes ejecutar los scripts:"
echo "- ./generararchivo.sh <total> <debiles>"
echo "- ./verificarpasswd.sh <archivo>" 