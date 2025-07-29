#!/bin/bash

# =============================================================================
# SCRIPT DE RESPALDO AVANZADO - USUARIO STEVEN
# =============================================================================
# Descripción: Sistema de respaldo automatizado para directorios críticos
# Autor: Sistema de Automatización
# Fecha: $(date)
# Usuario: steven
# =============================================================================

# Configuración específica para el usuario steven
USUARIO="steven"
DIRECTORIOS_ORIGEN=(
    "/home/steven/documentos"
    "/home/steven/fotos"
)
DIRECTORIO_DESTINO="/backup"
ARCHIVO_LOG="/var/log/respaldo.log"
FECHA_ACTUAL=$(date +"%Y%m%d_%H%M%S")
NOMBRE_RESPALDO="respaldo_steven_${FECHA_ACTUAL}.tar.gz"

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Función para logging
log_message() {
    local mensaje="$1"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] $mensaje" | tee -a "$ARCHIVO_LOG"
}

# Función para mostrar mensajes con colores
show_message() {
    local color="$1"
    local mensaje="$2"
    echo -e "${color}$mensaje${NC}"
}

# Función para verificar si un directorio existe
verificar_directorio() {
    local directorio="$1"
    if [ ! -d "$directorio" ]; then
        show_message "$YELLOW" "ADVERTENCIA: El directorio $directorio no existe. Creándolo..."
        mkdir -p "$directorio"
        if [ $? -eq 0 ]; then
            log_message "Directorio $directorio creado exitosamente"
            show_message "$GREEN" "✓ Directorio $directorio creado"
        else
            show_message "$RED" "✗ Error al crear el directorio $directorio"
            log_message "ERROR: No se pudo crear el directorio $directorio"
            return 1
        fi
    fi
    return 0
}

# Función para verificar permisos
verificar_permisos() {
    if [ ! -w "$DIRECTORIO_DESTINO" ]; then
        show_message "$RED" "✗ Error: No hay permisos de escritura en $DIRECTORIO_DESTINO"
        log_message "ERROR: Permisos insuficientes en $DIRECTORIO_DESTINO"
        return 1
    fi
    
    if [ ! -w "$(dirname "$ARCHIVO_LOG")" ]; then
        show_message "$RED" "✗ Error: No hay permisos de escritura para el archivo de log"
        log_message "ERROR: Permisos insuficientes para escribir en $ARCHIVO_LOG"
        return 1
    fi
    return 0
}

# Función para crear respaldo
crear_respaldo() {
    local archivos_a_respaldar=()
    
    # Verificar qué directorios existen y agregarlos al respaldo
    for directorio in "${DIRECTORIOS_ORIGEN[@]}"; do
        if [ -d "$directorio" ]; then
            archivos_a_respaldar+=("$directorio")
            show_message "$BLUE" "✓ Directorio $directorio encontrado"
        else
            show_message "$YELLOW" "⚠ Directorio $directorio no encontrado, será omitido"
            log_message "ADVERTENCIA: Directorio $directorio no encontrado"
        fi
    done
    
    # Verificar si hay archivos para respaldar
    if [ ${#archivos_a_respaldar[@]} -eq 0 ]; then
        show_message "$RED" "✗ No hay directorios válidos para respaldar"
        log_message "ERROR: No hay directorios válidos para respaldar"
        return 1
    fi
    
    # Crear el respaldo
    show_message "$BLUE" "Iniciando respaldo de directorios..."
    log_message "Iniciando respaldo para usuario $USUARIO"
    
    tar -czf "$DIRECTORIO_DESTINO/$NOMBRE_RESPALDO" "${archivos_a_respaldar[@]}" 2>/dev/null
    
    if [ $? -eq 0 ]; then
        local tamanio=$(du -h "$DIRECTORIO_DESTINO/$NOMBRE_RESPALDO" | cut -f1)
        show_message "$GREEN" "✓ Respaldo creado exitosamente: $NOMBRE_RESPALDO ($tamanio)"
        log_message "RESPALDO EXITOSO: $NOMBRE_RESPALDO creado ($tamanio)"
        
        # Mostrar información del respaldo
        echo "----------------------------------------"
        echo "INFORMACIÓN DEL RESPALDO:"
        echo "Archivo: $NOMBRE_RESPALDO"
        echo "Tamaño: $tamanio"
        echo "Ubicación: $DIRECTORIO_DESTINO"
        echo "Fecha: $(date)"
        echo "Usuario: $USUARIO"
        echo "----------------------------------------"
        
        return 0
    else
        show_message "$RED" "✗ Error al crear el respaldo"
        log_message "ERROR: Fallo al crear el respaldo $NOMBRE_RESPALDO"
        return 1
    fi
}

# Función para limpiar respaldos antiguos (mantener solo los últimos 7 para steven)
limpiar_respaldos_antiguos() {
    local max_respaldos=7
    local respaldos_actuales=$(ls -t "$DIRECTORIO_DESTINO"/respaldo_steven_*.tar.gz 2>/dev/null | wc -l)
    
    if [ "$respaldos_actuales" -gt "$max_respaldos" ]; then
        show_message "$YELLOW" "Limpiando respaldos antiguos..."
        ls -t "$DIRECTORIO_DESTINO"/respaldo_steven_*.tar.gz 2>/dev/null | tail -n +$((max_respaldos + 1)) | xargs rm -f
        log_message "Respaldos antiguos eliminados (mantenidos $max_respaldos más recientes)"
        show_message "$GREEN" "✓ Limpieza completada"
    fi
}

# Función para mostrar estadísticas del respaldo
mostrar_estadisticas() {
    local total_respaldos=$(ls "$DIRECTORIO_DESTINO"/respaldo_steven_*.tar.gz 2>/dev/null | wc -l)
    local espacio_total=$(du -sh "$DIRECTORIO_DESTINO" 2>/dev/null | cut -f1)
    
    show_message "$PURPLE" "----------------------------------------"
    show_message "$PURPLE" "ESTADÍSTICAS DE RESPALDOS:"
    show_message "$PURPLE" "Total de respaldos: $total_respaldos"
    show_message "$PURPLE" "Espacio utilizado: $espacio_total"
    show_message "$PURPLE" "----------------------------------------"
}

# Función principal
main() {
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "SISTEMA DE RESPALDO AVANZADO - STEVEN"
    show_message "$BLUE" "=========================================="
    
    # Verificar permisos
    if ! verificar_permisos; then
        exit 1
    fi
    
    # Verificar y crear directorios si es necesario
    for directorio in "${DIRECTORIOS_ORIGEN[@]}"; do
        verificar_directorio "$directorio"
    done
    
    # Crear respaldo
    if crear_respaldo; then
        # Limpiar respaldos antiguos
        limpiar_respaldos_antiguos
        
        # Mostrar estadísticas
        mostrar_estadisticas
        
        show_message "$GREEN" "=========================================="
        show_message "$GREEN" "RESPALDO COMPLETADO EXITOSAMENTE"
        show_message "$GREEN" "=========================================="
        log_message "Proceso de respaldo completado exitosamente"
    else
        show_message "$RED" "=========================================="
        show_message "$RED" "ERROR EN EL PROCESO DE RESPALDO"
        show_message "$RED" "=========================================="
        log_message "Proceso de respaldo falló"
        exit 1
    fi
}

# Ejecutar función principal
main "$@" 