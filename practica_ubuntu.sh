#!/bin/bash

# Script para práctica de comandos en Ubuntu
# Autor: Steven

# Crear archivo de log con timestamp
LOG_FILE="practica_$(date +%Y%m%d_%H%M%S).log"

echo "=== INICIANDO PRÁCTICA DE COMANDOS ===" | tee "$LOG_FILE"
echo "Fecha: $(date)" | tee -a "$LOG_FILE"
echo "Usuario: $(whoami)" | tee -a "$LOG_FILE"
echo "Sistema: $(uname -a)" | tee -a "$LOG_FILE"
echo "=====================================" | tee -a "$LOG_FILE"

# Navegar al directorio de desafíos
cd /home/steven/command-line-challenges/challenges

echo "=== EXPLORANDO ARCHIVOS ===" | tee -a "$LOG_FILE"
ls -la | tee -a "$LOG_FILE"

echo "=== CONTENIDO DE ARCHIVOS TXT ===" | tee -a "$LOG_FILE"
for file in *.txt; do
    if [ -f "$file" ]; then
        echo "Archivo: $file" | tee -a "$LOG_FILE"
        echo "Permisos: $(ls -la "$file")" | tee -a "$LOG_FILE"
        echo "Contenido:" | tee -a "$LOG_FILE"
        cat "$file" | tee -a "$LOG_FILE"
        echo "---" | tee -a "$LOG_FILE"
    fi
done

echo "=== ESTADÍSTICAS DE ARCHIVOS ===" | tee -a "$LOG_FILE"
echo "Total archivos: $(find . -type f | wc -l)" | tee -a "$LOG_FILE"
echo "Archivos .rand: $(find bunch_of_files/ -name '*.rand' | wc -l)" | tee -a "$LOG_FILE"
echo "Archivos .empty: $(find bunch_of_files/ -name '*.empty' | wc -l)" | tee -a "$LOG_FILE"

echo "=== PRIMEROS 10 ARCHIVOS .rand ===" | tee -a "$LOG_FILE"
find bunch_of_files/ -name '*.rand' | head -10 | tee -a "$LOG_FILE"

echo "=== PRIMEROS 5 ARCHIVOS .empty ===" | tee -a "$LOG_FILE"
find bunch_of_files/ -name '*.empty' | head -5 | tee -a "$LOG_FILE"

echo "=== PRÁCTICA CONFIGURADA EXITOSAMENTE ===" | tee -a "$LOG_FILE"
echo "Log guardado en: $LOG_FILE" | tee -a "$LOG_FILE"
echo "Directorio de trabajo: $(pwd)" | tee -a "$LOG_FILE"
echo "=========================================" | tee -a "$LOG_FILE"

echo "Script completado. Revisa el archivo $LOG_FILE para ver todos los resultados." 