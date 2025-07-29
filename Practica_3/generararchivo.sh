#!/bin/bash

# Script para generar archivo de contraseñas con usuarios débiles y normales
# Uso: ./generararchivo.sh <total_usuarios> <usuarios_debiles>

# Validación de parámetros
if [ $# -lt 2 ]; then
    echo "Error: Debe especificar 2 parámetros"
    echo "Uso: $0 <total_usuarios> <usuarios_debiles>"
    exit 1
fi

# Obtener parámetros
t=$1
d=$2

# Validar que t sea mayor que d
if [ $t -lt $d ]; then
    echo "Error: La cantidad total de usuarios ($t) debe ser mayor a la cantidad de contraseñas débiles ($d)"
    exit 1
fi

# Verificar si htpasswd está instalado
if [ ! -f "/usr/bin/htpasswd" ]; then
    echo "Error: htpasswd no está instalado"
    echo "Instale apache2-utils: sudo apt-get install apache2-utils"
    exit 1
fi

# Nombre del archivo
archivo="passwd.txt"

# Limpiar archivo si existe
if [ -f "$archivo" ]; then
    rm "$archivo"
fi

echo "Generando archivo $archivo con $t usuarios ($d con contraseñas débiles)..."

# Generar usuarios
for i in $(seq 1 $t); do
    if [ $i -le $d ]; then
        # Generar contraseña débil (3 caracteres, solo números)
        passwd=$(head -c 500 /dev/urandom | tr -dc '0-9' | cut -c -3)
        echo "Generando usuario$i con contraseña débil: $passwd"
    else
        # Generar contraseña normal (10 caracteres, alfanumérica)
        passwd=$(head -c 500 /dev/urandom | tr -dc 'a-zA-Z0-9' | cut -c -10)
        echo "Generando usuario$i con contraseña normal: $passwd"
    fi
    
    # Crear usuario con htpasswd
    if [ ! -f "$archivo" ]; then
        htpasswd -b -c "$archivo" "usuario$i" "$passwd" > /dev/null 2>&1
    else
        htpasswd -b "$archivo" "usuario$i" "$passwd" > /dev/null 2>&1
    fi
done

echo "Archivo $archivo generado exitosamente!"
echo "Contenido del archivo:"
echo "======================"
cat "$archivo" 