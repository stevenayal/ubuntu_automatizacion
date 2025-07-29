#!/bin/bash

# =============================================================================
# SCRIPT DE ALERTA DEL SISTEMA - USUARIO STEVEN
# =============================================================================
# Descripción: Monitoreo de CPU, memoria y disco con alertas automáticas
# Autor: Sistema de Automatización
# Fecha: $(date)
# Usuario: steven
# =============================================================================

# Configuración específica para el usuario steven
USUARIO="steven"
ARCHIVO_LOG="/var/log/alerta_sistema.log"

# Umbrales de alerta
UMBRAL_CPU=80
UMBRAL_MEMORIA=80
UMBRAL_DISCO=75

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Función para mostrar mensajes con colores
show_message() {
    local color="$1"
    local mensaje="$2"
    echo -e "${color}$mensaje${NC}"
}

# Función para logging
log_message() {
    local mensaje="$1"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] $mensaje" | sudo tee -a "$ARCHIVO_LOG" >/dev/null
}

# Función para obtener uso de CPU
obtener_uso_cpu() {
    # Obtener uso de CPU usando top (promedio de 1 segundo)
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
    echo "$cpu_usage"
}

# Función para obtener uso de memoria
obtener_uso_memoria() {
    # Obtener uso de memoria usando free
    local mem_total=$(free | grep Mem | awk '{print $2}')
    local mem_used=$(free | grep Mem | awk '{print $3}')
    local mem_usage=$((mem_used * 100 / mem_total))
    echo "$mem_usage"
}

# Función para obtener uso de disco
obtener_uso_disco() {
    # Obtener uso de disco del directorio raíz
    local disk_usage=$(df / | tail -1 | awk '{print $5}' | cut -d'%' -f1)
    echo "$disk_usage"
}

# Función para verificar y registrar alertas
verificar_recurso() {
    local recurso="$1"
    local valor_actual="$2"
    local umbral="$3"
    local unidad="$4"
    
    if [ "$valor_actual" -gt "$umbral" ]; then
        local mensaje="ALERTA: Uso de $recurso al ${valor_actual}${unidad} (umbral: ${umbral}${unidad}) - Usuario: $USUARIO"
        show_message "$RED" "⚠ $mensaje"
        log_message "$mensaje"
        return 1
    else
        local mensaje="OK: Uso de $recurso al ${valor_actual}${unidad} (umbral: ${umbral}${unidad}) - Usuario: $USUARIO"
        show_message "$GREEN" "✓ $mensaje"
        log_message "$mensaje"
        return 0
    fi
}

# Función para mostrar estadísticas del sistema
mostrar_estadisticas() {
    local cpu_usage=$(obtener_uso_cpu)
    local mem_usage=$(obtener_uso_memoria)
    local disk_usage=$(obtener_uso_disco)
    
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "ESTADÍSTICAS DEL SISTEMA - STEVEN"
    show_message "$BLUE" "=========================================="
    
    echo "CPU: ${cpu_usage}% (Umbral: ${UMBRAL_CPU}%)"
    echo "Memoria: ${mem_usage}% (Umbral: ${UMBRAL_MEMORIA}%)"
    echo "Disco: ${disk_usage}% (Umbral: ${UMBRAL_DISCO}%)"
    echo "Fecha: $(date)"
    echo "Usuario: $USUARIO"
    
    show_message "$BLUE" "=========================================="
}

# Función para verificar todos los recursos
verificar_recursos() {
    local alertas=0
    
    show_message "$BLUE" "Iniciando verificación de recursos del sistema..."
    log_message "Iniciando verificación de recursos para usuario $USUARIO"
    
    # Obtener valores actuales
    local cpu_usage=$(obtener_uso_cpu)
    local mem_usage=$(obtener_uso_memoria)
    local disk_usage=$(obtener_uso_disco)
    
    # Verificar CPU
    if ! verificar_recurso "CPU" "$cpu_usage" "$UMBRAL_CPU" "%"; then
        alertas=$((alertas + 1))
    fi
    
    # Verificar memoria
    if ! verificar_recurso "Memoria" "$mem_usage" "$UMBRAL_MEMORIA" "%"; then
        alertas=$((alertas + 1))
    fi
    
    # Verificar disco
    if ! verificar_recurso "Disco" "$disk_usage" "$UMBRAL_DISCO" "%"; then
        alertas=$((alertas + 1))
    fi
    
    # Mostrar resumen
    if [ $alertas -eq 0 ]; then
        show_message "$GREEN" "=========================================="
        show_message "$GREEN" "TODOS LOS RECURSOS DENTRO DE LOS LÍMITES"
        show_message "$GREEN" "=========================================="
        log_message "Verificación completada: Todos los recursos dentro de los límites"
    else
        show_message "$RED" "=========================================="
        show_message "$RED" "SE DETECTARON $alertas ALERTA(S)"
        show_message "$RED" "=========================================="
        log_message "Verificación completada: Se detectaron $alertas alerta(s)"
    fi
    
    return $alertas
}

# Función para crear archivo de log si no existe
crear_archivo_log() {
    if [ ! -f "$ARCHIVO_LOG" ]; then
        sudo touch "$ARCHIVO_LOG"
        sudo chmod 666 "$ARCHIVO_LOG"
        show_message "$YELLOW" "Archivo de log creado: $ARCHIVO_LOG"
    fi
}

# Función principal
main() {
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "SISTEMA DE ALERTA - STEVEN"
    show_message "$BLUE" "=========================================="
    
    # Crear archivo de log si no existe
    crear_archivo_log
    
    # Mostrar estadísticas
    mostrar_estadisticas
    
    # Verificar recursos
    verificar_recursos
    
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "VERIFICACIÓN COMPLETADA"
    show_message "$BLUE" "=========================================="
}

# Ejecutar función principal
main "$@" 