#!/bin/bash

# Script para práctica de comandos de línea
# Autor: Steven
# Fecha: $(date)

# Configurar variables
LOG_FILE="steven_practica_$(date +%Y%m%d_%H%M%S).log"
CHALLENGES_DIR="/home/steven/command-line-challenges"
WORK_DIR="/home/steven/practica_comandos"

# Función para logging
log_command() {
    echo "=== $(date '+%Y-%m-%d %H:%M:%S') ===" >> "$LOG_FILE"
    echo "Comando: $1" >> "$LOG_FILE"
    echo "Directorio: $(pwd)" >> "$LOG_FILE"
    echo "Salida:" >> "$LOG_FILE"
    echo "----------------------------------------" >> "$LOG_FILE"
}

# Función para ejecutar comando y loggear
run_and_log() {
    local cmd="$1"
    echo "Ejecutando: $cmd"
    log_command "$cmd"
    eval "$cmd" >> "$LOG_FILE" 2>&1
    echo "----------------------------------------" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
}

# Iniciar el script
echo "=== INICIANDO PRÁCTICA DE COMANDOS ===" | tee -a "$LOG_FILE"
echo "Fecha: $(date)" | tee -a "$LOG_FILE"
echo "Usuario: $(whoami)" | tee -a "$LOG_FILE"
echo "Sistema: $(uname -a)" | tee -a "$LOG_FILE"
echo "=====================================" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

# Verificar que estamos en el directorio home
run_and_log "cd /home/steven"
run_and_log "pwd"

# Verificar si ya existe el repositorio
if [ ! -d "$CHALLENGES_DIR" ]; then
    echo "Descargando repositorio de desafíos..." | tee -a "$LOG_FILE"
    run_and_log "git clone https://github.com/mssalvatore/command-line-challenges.git"
else
    echo "Repositorio ya existe, actualizando..." | tee -a "$LOG_FILE"
    run_and_log "cd $CHALLENGES_DIR && git pull"
fi

# Navegar al directorio de desafíos
run_and_log "cd $CHALLENGES_DIR"

# Verificar estructura de archivos
run_and_log "ls -la"

# Extraer desafíos si no están extraídos
if [ ! -d "$CHALLENGES_DIR/challenges" ]; then
    echo "Extrayendo archivos de desafíos..." | tee -a "$LOG_FILE"
    run_and_log "tar -xzf challenges.tar.gz"
fi

# Navegar al directorio de desafíos
run_and_log "cd challenges"
run_and_log "ls -la"

# Mostrar archivos de texto disponibles
run_and_log "find . -name '*.txt' -type f"

# Mostrar contenido de archivos de texto
echo "=== CONTENIDO DE ARCHIVOS DE TEXTO ===" | tee -a "$LOG_FILE"
for file in *.txt; do
    if [ -f "$file" ]; then
        echo "Archivo: $file" | tee -a "$LOG_FILE"
        echo "Permisos: $(ls -la "$file")" | tee -a "$LOG_FILE"
        echo "Contenido:" | tee -a "$LOG_FILE"
        cat "$file" | tee -a "$LOG_FILE"
        echo "----------------------------------------" | tee -a "$LOG_FILE"
    fi
done

# Mostrar estructura del directorio bunch_of_files
run_and_log "ls -la bunch_of_files/ | head -20"

# Contar archivos
run_and_log "find bunch_of_files/ -type f | wc -l"

# Mostrar tipos de archivos
run_and_log "find bunch_of_files/ -type f -name '*.empty' | wc -l"
run_and_log "find bunch_of_files/ -type f -name '*.rand' | wc -l"

echo "=== PRÁCTICA CONFIGURADA EXITOSAMENTE ===" | tee -a "$LOG_FILE"
echo "Log guardado en: $LOG_FILE" | tee -a "$LOG_FILE"
echo "Directorio de trabajo: $(pwd)" | tee -a "$LOG_FILE"
echo "=========================================" | tee -a "$LOG_FILE"

# Mostrar estadísticas finales
echo "" | tee -a "$LOG_FILE"
echo "=== ESTADÍSTICAS FINALES ===" | tee -a "$LOG_FILE"
run_and_log "du -sh ."
run_and_log "find . -type f | wc -l"
run_and_log "find . -type d | wc -l"

echo "Script completado. Revisa el archivo $LOG_FILE para ver todos los comandos ejecutados." 