#!/bin/bash

# Script de ejecución rápida para la Práctica 2
# Este script ejecuta la práctica completa de forma optimizada

echo "=== EJECUTANDO PRÁCTICA 2 - VERSIÓN RÁPIDA ==="
echo "Fecha y hora de inicio: $(date)"
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -f "practica_2_automatizada_rapida.sh" ]; then
    echo "ERROR: No se encontró el script principal"
    echo "Asegúrate de estar en el directorio Practica_2/"
    exit 1
fi

# Dar permisos de ejecución
echo "Configurando permisos de ejecución..."
chmod +x *.sh
echo "✓ Permisos configurados"
echo ""

# Instalar dependencias
echo "Instalando dependencias..."
./instalar_dependencias_practica2.sh
echo ""

# Ejecutar práctica automatizada
echo "Ejecutando práctica automatizada..."
./practica_2_automatizada_rapida.sh
echo ""

# Generar reporte
echo "Generando reporte completo..."
./generar_reporte_practica2.sh
echo ""

echo "=== PRÁCTICA 2 COMPLETADA ==="
echo "Archivos generados:"
echo "- ejercicio1/ (encriptación AES)"
echo "- ejercicio2/ (comparación de algoritmos)"
echo "- ejercicio3/ (hashes y verificación)"
echo "- Practica_2_Reporte_Completo.txt (reporte final)"
echo ""
echo "Fecha y hora de finalización: $(date)" 