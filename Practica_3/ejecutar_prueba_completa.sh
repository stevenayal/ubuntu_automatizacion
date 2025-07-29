#!/bin/bash

# Script de prueba completa para los scripts de BASH
# Uso: ./ejecutar_prueba_completa.sh

echo "PRUEBA COMPLETA - Scripts de BASH"
echo "================================="
echo ""

# Hacer ejecutables los scripts
chmod +x generararchivo.sh
chmod +x verificarpasswd.sh

echo "1. Generando archivo de contraseñas..."
echo "Ejecutando: ./generararchivo.sh 5 3"
echo "-----------------------------------"
./generararchivo.sh 5 3

echo ""
echo "2. Verificando contraseñas débiles..."
echo "Ejecutando: ./verificarpasswd.sh passwd.txt"
echo "-------------------------------------------"
./verificarpasswd.sh passwd.txt

echo ""
echo "3. Mostrando contenido final del archivo..."
echo "------------------------------------------"
if [ -f "passwd.txt" ]; then
    cat passwd.txt
else
    echo "Error: No se encontró el archivo passwd.txt"
fi

echo ""
echo "PRUEBA COMPLETADA"
echo "=================" 