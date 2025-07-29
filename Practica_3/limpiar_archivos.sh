#!/bin/bash

# Script para limpiar archivos generados durante las pruebas
# Uso: ./limpiar_archivos.sh

echo "Limpiando archivos generados..."
echo "==============================="

# Lista de archivos a eliminar
archivos_a_eliminar=(
    "passwd.txt"
    "hashcat.potfile"
    "*.tmp"
    "*.temp"
)

# Eliminar archivos
for archivo in "${archivos_a_eliminar[@]}"; do
    if ls $archivo 2>/dev/null; then
        rm -f $archivo
        echo "✓ Eliminado: $archivo"
    else
        echo "- No encontrado: $archivo"
    fi
done

# Limpiar archivos temporales de hashcat
if [ -d "$HOME/.hashcat" ]; then
    rm -rf "$HOME/.hashcat"/*.potfile 2>/dev/null
    echo "✓ Limpiados archivos temporales de hashcat"
fi

echo ""
echo "Limpieza completada!" 