#!/bin/bash

# Script para ejecutar desafíos específicos de línea de comandos
# Autor: Steven

# Configurar variables
LOG_FILE="steven_desafios_$(date +%Y%m%d_%H%M%S).log"
CHALLENGES_DIR="/home/steven/command-line-challenges/challenges"

# Función para logging
log_command() {
    echo "=== $(date '+%Y-%m-%d %H:%M:%S') ===" >> "$LOG_FILE"
    echo "DESAFÍO: $1" >> "$LOG_FILE"
    echo "Comando: $2" >> "$LOG_FILE"
    echo "Directorio: $(pwd)" >> "$LOG_FILE"
    echo "Salida:" >> "$LOG_FILE"
    echo "----------------------------------------" >> "$LOG_FILE"
}

# Función para ejecutar desafío y loggear
run_challenge() {
    local challenge_name="$1"
    local cmd="$2"
    echo "=== DESAFÍO: $challenge_name ===" | tee -a "$LOG_FILE"
    echo "Ejecutando: $cmd"
    log_command "$challenge_name" "$cmd"
    eval "$cmd" >> "$LOG_FILE" 2>&1
    echo "----------------------------------------" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
    echo "Presiona Enter para continuar al siguiente desafío..."
    read
}

# Iniciar el script
echo "=== INICIANDO DESAFÍOS DE COMANDOS ===" | tee -a "$LOG_FILE"
echo "Fecha: $(date)" | tee -a "$LOG_FILE"
echo "Log guardado en: $LOG_FILE" | tee -a "$LOG_FILE"
echo "=====================================" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

# Navegar al directorio de desafíos
cd "$CHALLENGES_DIR" || exit 1

# DESAFÍO 1: Comparar archivos de texto
run_challenge "Comparar greeting1.txt y greeting2.txt" "diff greeting1.txt greeting2.txt"

# DESAFÍO 2: Ver permisos de archivos
run_challenge "Ver permisos de archivos" "ls -la *.txt"

# DESAFÍO 3: Contar líneas en archivos
run_challenge "Contar líneas en greeting1.txt" "wc -l greeting1.txt"

# DESAFÍO 4: Buscar archivos específicos
run_challenge "Buscar archivos .empty" "find bunch_of_files/ -name '*.empty' | head -10"

# DESAFÍO 5: Contar archivos por tipo
run_challenge "Contar archivos .rand" "find bunch_of_files/ -name '*.rand' | wc -l"

# DESAFÍO 6: Ver tamaño de archivos
run_challenge "Ver tamaño de archivos .txt" "ls -lh *.txt"

# DESAFÍO 7: Buscar archivos con contenido específico
run_challenge "Buscar archivos que contengan 'Hello'" "grep -l 'Hello' *.txt"

# DESAFÍO 8: Listar archivos ordenados por fecha
run_challenge "Listar archivos por fecha" "ls -lt *.txt"

# DESAFÍO 9: Ver información del sistema de archivos
run_challenge "Ver espacio usado" "du -sh ."

# DESAFÍO 10: Crear un archivo de resumen
run_challenge "Crear resumen de archivos" "echo 'Resumen de archivos:' > resumen.txt && ls -la >> resumen.txt && echo 'Archivos .rand:' >> resumen.txt && find bunch_of_files/ -name '*.rand' | wc -l >> resumen.txt"

echo "=== DESAFÍOS COMPLETADOS ===" | tee -a "$LOG_FILE"
echo "Revisa el archivo $LOG_FILE para ver todos los resultados." | tee -a "$LOG_FILE"
echo "Archivo de resumen creado: resumen.txt" | tee -a "$LOG_FILE" 