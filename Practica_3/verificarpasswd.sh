#!/bin/bash

# Script para verificar contraseñas débiles en archivo passwd
# Uso: ./verificarpasswd.sh <archivo_passwd>

# Validación de parámetros
if [ $# -eq 0 ]; then
    echo "Error: Debe especificar un nombre de archivo"
    echo "Uso: $0 <archivo_passwd>"
    exit 1
fi

archivo=$1

# Verificar si el archivo existe
if [ ! -f "$archivo" ]; then
    echo "Error: Archivo '$archivo' no se encuentra"
    exit 1
fi

# Verificar si hashcat está instalado
if [ ! -f "/usr/bin/hashcat" ]; then
    echo "Error: Hashcat debe estar instalado"
    echo "Instale hashcat: sudo apt-get install hashcat"
    exit 1
fi

echo "Verificando contraseñas débiles en $archivo..."
echo "=============================================="

# Procesar cada línea del archivo
while IFS=: read -r usuario hash; do
    if [ -n "$usuario" ] && [ -n "$hash" ]; then
        echo "Verificando usuario: $usuario"
        
        # Crear archivo temporal con el hash
        temp_hash_file=$(mktemp)
        echo "$usuario:$hash" > "$temp_hash_file"
        
        # Intentar crackear con hashcat (solo hasta 4 caracteres para contraseñas débiles)
        # Modo 1600 = Apache MD5, modo 3 = ataque de fuerza bruta
        # ?d = solo dígitos, ?l = solo minúsculas, ?u = solo mayúsculas
        # -m 1600: formato Apache MD5
        # -a 3: ataque de fuerza bruta
        # --increment: probar longitudes incrementales
        # --increment-min=1: longitud mínima
        # --increment-max=4: longitud máxima (para contraseñas débiles)
        
        result=$(hashcat -m 1600 -a 3 "$temp_hash_file" "?d?d?d" --increment --increment-min=1 --increment-max=4 -o /dev/null 2>/dev/null)
        
        # Verificar si hashcat encontró la contraseña
        if [ $? -eq 0 ]; then
            echo "✓ $usuario - CONTRASEÑA DÉBIL DETECTADA"
        else
            echo "✗ $usuario - Contraseña segura"
        fi
        
        # Limpiar archivo temporal
        rm -f "$temp_hash_file"
    fi
done < "$archivo"

echo ""
echo "Verificación completada." 