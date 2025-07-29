#!/bin/bash

# =============================================================================
# SCRIPT DE VERIFICACIÓN DE CONFIGURACIÓN - PRÁCTICA 4
# =============================================================================
# Descripción: Verifica que toda la configuración de programación esté correcta
# Autor: Sistema de Automatización
# Fecha: $(date)
# =============================================================================

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Contador de verificaciones
TOTAL_VERIFICACIONES=0
VERIFICACIONES_EXITOSAS=0

# Función para mostrar mensajes con colores
show_message() {
    local color="$1"
    local mensaje="$2"
    echo -e "${color}$mensaje${NC}"
}

# Función para verificar y contar
verificar() {
    local descripcion="$1"
    local comando="$2"
    local esperado="$3"
    
    TOTAL_VERIFICACIONES=$((TOTAL_VERIFICACIONES + 1))
    
    if eval "$comando" 2>/dev/null | grep -q "$esperado"; then
        show_message "$GREEN" "✓ $descripcion"
        VERIFICACIONES_EXITOSAS=$((VERIFICACIONES_EXITOSAS + 1))
        return 0
    else
        show_message "$RED" "✗ $descripcion"
        return 1
    fi
}

# Función para verificar archivos
verificar_archivo() {
    local descripcion="$1"
    local archivo="$2"
    
    TOTAL_VERIFICACIONES=$((TOTAL_VERIFICACIONES + 1))
    
    if [ -f "$archivo" ]; then
        show_message "$GREEN" "✓ $descripcion"
        VERIFICACIONES_EXITOSAS=$((VERIFICACIONES_EXITOSAS + 1))
        return 0
    else
        show_message "$RED" "✗ $descripcion"
        return 1
    fi
}

# Función para verificar directorios
verificar_directorio() {
    local descripcion="$1"
    local directorio="$2"
    
    TOTAL_VERIFICACIONES=$((TOTAL_VERIFICACIONES + 1))
    
    if [ -d "$directorio" ]; then
        show_message "$GREEN" "✓ $descripcion"
        VERIFICACIONES_EXITOSAS=$((VERIFICACIONES_EXITOSAS + 1))
        return 0
    else
        show_message "$RED" "✗ $descripcion"
        return 1
    fi
}

# Función para verificar permisos de ejecución
verificar_permisos_ejecucion() {
    local descripcion="$1"
    local archivo="$2"
    
    TOTAL_VERIFICACIONES=$((TOTAL_VERIFICACIONES + 1))
    
    if [ -x "$archivo" ]; then
        show_message "$GREEN" "✓ $descripcion"
        VERIFICACIONES_EXITOSAS=$((VERIFICACIONES_EXITOSAS + 1))
        return 0
    else
        show_message "$RED" "✗ $descripcion"
        return 1
    fi
}

# Función para verificar servicios
verificar_servicio() {
    local descripcion="$1"
    local servicio="$2"
    
    TOTAL_VERIFICACIONES=$((TOTAL_VERIFICACIONES + 1))
    
    if systemctl is-active --quiet "$servicio"; then
        show_message "$GREEN" "✓ $descripcion"
        VERIFICACIONES_EXITOSAS=$((VERIFICACIONES_EXITOSAS + 1))
        return 0
    else
        show_message "$RED" "✗ $descripcion"
        return 1
    fi
}

# Función principal de verificación
main() {
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "VERIFICACIÓN DE CONFIGURACIÓN - PRÁCTICA 4"
    show_message "$BLUE" "=========================================="
    
    echo ""
    show_message "$BLUE" "1. VERIFICACIÓN DE ARCHIVOS Y DIRECTORIOS"
    show_message "$BLUE" "=========================================="
    
    # Verificar scripts de respaldo
    verificar_archivo "Script de respaldo de steven" "/home/steven/practica4/respaldo_avanzado.sh"
    verificar_archivo "Script de respaldo de ana" "/home/ana/practica4/respaldo_avanzado.sh"
    
    # Verificar permisos de ejecución
    verificar_permisos_ejecucion "Permisos de ejecución - steven" "/home/steven/practica4/respaldo_avanzado.sh"
    verificar_permisos_ejecucion "Permisos de ejecución - ana" "/home/ana/practica4/respaldo_avanzado.sh"
    
    # Verificar archivos de tarea
    verificar_archivo "Archivo tarea.txt de steven" "/home/steven/practica4/tarea.txt"
    verificar_archivo "Archivo tarea.txt de ana" "/home/ana/practica4/tarea.txt"
    
    # Verificar archivos de programación
    verificar_archivo "Archivo programacion.txt de steven" "/home/steven/practica4/programacion.txt"
    verificar_archivo "Archivo programacion.txt de ana" "/home/ana/practica4/programacion.txt"
    
    # Verificar directorios de respaldo
    verificar_directorio "Directorio de respaldo" "/backup"
    verificar_directorio "Directorio documentos de steven" "/home/steven/documentos"
    verificar_directorio "Directorio fotos de steven" "/home/steven/fotos"
    verificar_directorio "Directorio documentos de ana" "/home/ana/documentos"
    verificar_directorio "Directorio fotos de ana" "/home/ana/fotos"
    
    # Verificar archivo de log
    verificar_archivo "Archivo de log de respaldos" "/var/log/respaldo.log"
    
    echo ""
    show_message "$BLUE" "2. VERIFICACIÓN DE SERVICIOS"
    show_message "$BLUE" "============================"
    
    # Verificar servicios
    verificar_servicio "Servicio cron" "cron"
    verificar_servicio "Servicio atd" "atd"
    verificar_servicio "Servicio anacron" "anacron"
    
    echo ""
    show_message "$BLUE" "3. VERIFICACIÓN DE CONFIGURACIÓN CRONTAB"
    show_message "$BLUE" "======================================="
    
    # Verificar crontab de steven
    if crontab -u steven -l 2>/dev/null | grep -q "respaldo_avanzado.sh"; then
        show_message "$GREEN" "✓ Crontab configurado para steven"
        VERIFICACIONES_EXITOSAS=$((VERIFICACIONES_EXITOSAS + 1))
    else
        show_message "$RED" "✗ Crontab no configurado para steven"
    fi
    TOTAL_VERIFICACIONES=$((TOTAL_VERIFICACIONES + 1))
    
    # Verificar crontab de ana
    if crontab -u ana -l 2>/dev/null | grep -q "respaldo_avanzado.sh"; then
        show_message "$GREEN" "✓ Crontab configurado para ana"
        VERIFICACIONES_EXITOSAS=$((VERIFICACIONES_EXITOSAS + 1))
    else
        show_message "$RED" "✗ Crontab no configurado para ana"
    fi
    TOTAL_VERIFICACIONES=$((TOTAL_VERIFICACIONES + 1))
    
    echo ""
    show_message "$BLUE" "4. VERIFICACIÓN DE ANACRON"
    show_message "$BLUE" "=========================="
    
    # Verificar configuración de anacron para steven
    if grep -q "respaldo_semanal_steven" /etc/anacrontab 2>/dev/null; then
        show_message "$GREEN" "✓ Anacron configurado para steven"
        VERIFICACIONES_EXITOSAS=$((VERIFICACIONES_EXITOSAS + 1))
    else
        show_message "$RED" "✗ Anacron no configurado para steven"
    fi
    TOTAL_VERIFICACIONES=$((TOTAL_VERIFICACIONES + 1))
    
    # Verificar configuración de anacron para ana
    if grep -q "respaldo_semanal_ana" /etc/anacrontab 2>/dev/null; then
        show_message "$GREEN" "✓ Anacron configurado para ana"
        VERIFICACIONES_EXITOSAS=$((VERIFICACIONES_EXITOSAS + 1))
    else
        show_message "$RED" "✗ Anacron no configurado para ana"
    fi
    TOTAL_VERIFICACIONES=$((TOTAL_VERIFICACIONES + 1))
    
    echo ""
    show_message "$BLUE" "6. VERIFICACIÓN DE PERMISOS"
    show_message "$BLUE" "=========================="
    
    # Verificar permisos de escritura en /backup
    if [ -w "/backup" ]; then
        show_message "$GREEN" "✓ Permisos de escritura en /backup"
        VERIFICACIONES_EXITOSAS=$((VERIFICACIONES_EXITOSAS + 1))
    else
        show_message "$RED" "✗ Sin permisos de escritura en /backup"
    fi
    TOTAL_VERIFICACIONES=$((TOTAL_VERIFICACIONES + 1))
    
    # Verificar permisos de escritura en /var/log
    if [ -w "/var/log" ]; then
        show_message "$GREEN" "✓ Permisos de escritura en /var/log"
        VERIFICACIONES_EXITOSAS=$((VERIFICACIONES_EXITOSAS + 1))
    else
        show_message "$RED" "✗ Sin permisos de escritura en /var/log"
    fi
    TOTAL_VERIFICACIONES=$((TOTAL_VERIFICACIONES + 1))
    
    echo ""
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "RESUMEN DE VERIFICACIÓN"
    show_message "$BLUE" "=========================================="
    
    echo "Verificaciones totales: $TOTAL_VERIFICACIONES"
    echo "Verificaciones exitosas: $VERIFICACIONES_EXITOSAS"
    echo "Verificaciones fallidas: $((TOTAL_VERIFICACIONES - VERIFICACIONES_EXITOSAS))"
    
    local porcentaje=$((VERIFICACIONES_EXITOSAS * 100 / TOTAL_VERIFICACIONES))
    echo "Porcentaje de éxito: $porcentaje%"
    
    if [ $porcentaje -eq 100 ]; then
        show_message "$GREEN" "¡TODAS LAS VERIFICACIONES EXITOSAS!"
        show_message "$GREEN" "La configuración está completa y correcta."
    elif [ $porcentaje -ge 80 ]; then
        show_message "$YELLOW" "La mayoría de verificaciones son exitosas."
        show_message "$YELLOW" "Revisar las verificaciones fallidas."
    else
        show_message "$RED" "Hay varios problemas en la configuración."
        show_message "$RED" "Revisar y corregir las verificaciones fallidas."
    fi
    
    echo ""
    show_message "$BLUE" "COMANDOS ÚTILES PARA VERIFICACIÓN MANUAL:"
    echo "crontab -u steven -l"
    echo "crontab -u ana -l"
    echo "cat /etc/anacrontab"
    echo "systemctl status cron"
    echo "systemctl status anacron"
    echo "ls -la /backup"
    echo "tail -f /var/log/respaldo.log"
}

# Ejecutar función principal
main "$@" 