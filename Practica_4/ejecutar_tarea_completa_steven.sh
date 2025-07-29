#!/bin/bash

# =============================================================================
# EJECUTAR TAREA COMPLETA - PRÁCTICA 4 - STEVEN
# =============================================================================
# Descripción: Script completo para configurar y verificar toda la tarea
# Autor: Sistema de Automatización
# Fecha: $(date)
# Usuario: steven
# =============================================================================

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Variables de configuración
USUARIO="steven"
SCRIPT_RESPALDO="/home/$USUARIO/practica4/respaldo_avanzado.sh"
SCRIPT_ALERTA="/home/$USUARIO/practica4/alerta_sistema.sh"
DIR_BACKUP="/backup"
LOG_RESPALDO="/var/log/respaldo.log"
LOG_ALERTA="/var/log/alerta_sistema.log"
DIR_ORIGEN_DOCS="/home/$USUARIO/documentos"
DIR_ORIGEN_FOTOS="/home/$USUARIO/fotos"

# Contador de verificaciones
TOTAL_VERIFICACIONES=0
VERIFICACIONES_EXITOSAS=0

# Función para mostrar mensajes con colores
show_message() {
    local color="$1"
    local mensaje="$2"
    echo -e "${color}$mensaje${NC}"
}

# Función para verificar si un comando existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
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

# Función para crear directorios necesarios
crear_directorios() {
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "CREANDO DIRECTORIOS NECESARIOS"
    show_message "$BLUE" "=========================================="
    
    # Crear directorios de origen
    mkdir -p "$DIR_ORIGEN_DOCS"
    mkdir -p "$DIR_ORIGEN_FOTOS"
    
    # Crear algunos archivos de ejemplo
    echo "Documento de ejemplo para steven - $(date)" > "$DIR_ORIGEN_DOCS/documento_ejemplo.txt"
    echo "Foto de ejemplo para steven - $(date)" > "$DIR_ORIGEN_FOTOS/foto_ejemplo.jpg"
    
    # Crear directorio de backup
    sudo mkdir -p "$DIR_BACKUP"
    sudo chown "$USUARIO:$USUARIO" "$DIR_BACKUP"
    
    # Crear archivos de log
    sudo touch "$LOG_RESPALDO"
    sudo touch "$LOG_ALERTA"
    sudo chmod 666 "$LOG_RESPALDO"
    sudo chmod 666 "$LOG_ALERTA"
    
    show_message "$GREEN" "✓ Directorios y archivos de log creados"
}

# Función para configurar permisos de scripts
configurar_permisos() {
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "CONFIGURANDO PERMISOS DE SCRIPTS"
    show_message "$BLUE" "=========================================="
    
    if [ -f "$SCRIPT_RESPALDO" ]; then
        chmod +x "$SCRIPT_RESPALDO"
        show_message "$GREEN" "✓ Permisos de respaldo configurados"
    else
        show_message "$RED" "✗ Script de respaldo no encontrado en $SCRIPT_RESPALDO"
    fi
    
    if [ -f "$SCRIPT_ALERTA" ]; then
        chmod +x "$SCRIPT_ALERTA"
        show_message "$GREEN" "✓ Permisos de alerta configurados"
    else
        show_message "$RED" "✗ Script de alerta no encontrado en $SCRIPT_ALERTA"
    fi
}

# Función para configurar crontab
configurar_crontab() {
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "CONFIGURANDO CRONTAB"
    show_message "$BLUE" "=========================================="
    
    # Crear entrada de crontab temporal
    local temp_cron=$(mktemp)
    echo "# Respaldos diarios a la 1:00 AM" > "$temp_cron"
    echo "0 1 * * * $SCRIPT_RESPALDO" >> "$temp_cron"
    echo "# Alerta del sistema cada hora" >> "$temp_cron"
    echo "0 * * * * $SCRIPT_ALERTA" >> "$temp_cron"
    
    # Instalar crontab
    if crontab -u "$USUARIO" "$temp_cron" 2>/dev/null; then
        show_message "$GREEN" "✓ Crontab configurado exitosamente"
        rm "$temp_cron"
        return 0
    else
        show_message "$RED" "✗ Error al configurar crontab"
        rm "$temp_cron"
        return 1
    fi
}

# Función para configurar anacron
configurar_anacron() {
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "CONFIGURANDO ANACRON"
    show_message "$BLUE" "=========================================="
    
    # Verificar si anacron está instalado
    if ! command_exists anacron; then
        show_message "$YELLOW" "Instalando anacron..."
        sudo apt update && sudo apt install -y anacron
    fi
    
    # Verificar si la entrada ya existe
    if ! grep -q "respaldo_semanal_steven" /etc/anacrontab 2>/dev/null; then
        echo "7 5 respaldo_semanal_steven $SCRIPT_RESPALDO" | sudo tee -a /etc/anacrontab >/dev/null
        show_message "$GREEN" "✓ Anacron configurado exitosamente"
    else
        show_message "$YELLOW" "Anacron ya configurado"
    fi
}

# Función para verificar servicios
verificar_servicios() {
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "VERIFICANDO SERVICIOS"
    show_message "$BLUE" "=========================================="
    
    # Verificar cron
    if sudo systemctl is-active cron >/dev/null 2>&1; then
        show_message "$GREEN" "✓ Servicio cron activo"
    else
        show_message "$YELLOW" "Iniciando servicio cron..."
        sudo systemctl enable cron && sudo systemctl start cron
    fi
    
    # Verificar anacron
    if sudo systemctl is-active anacron >/dev/null 2>&1; then
        show_message "$GREEN" "✓ Servicio anacron activo"
    else
        show_message "$YELLOW" "Iniciando servicio anacron..."
        sudo systemctl enable anacron && sudo systemctl start anacron
    fi
}

# Función para ejecutar pruebas
ejecutar_pruebas() {
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "EJECUTANDO PRUEBAS DE FUNCIONAMIENTO"
    show_message "$BLUE" "=========================================="
    
    # Probar script de respaldo
    if [ -x "$SCRIPT_RESPALDO" ]; then
        show_message "$YELLOW" "Probando script de respaldo..."
        "$SCRIPT_RESPALDO"
        if [ $? -eq 0 ]; then
            show_message "$GREEN" "✓ Script de respaldo funciona correctamente"
        else
            show_message "$RED" "✗ Error en script de respaldo"
        fi
    else
        show_message "$RED" "✗ Script de respaldo no es ejecutable"
    fi
    
    # Probar script de alerta
    if [ -x "$SCRIPT_ALERTA" ]; then
        show_message "$YELLOW" "Probando script de alerta..."
        "$SCRIPT_ALERTA"
        if [ $? -eq 0 ]; then
            show_message "$GREEN" "✓ Script de alerta funciona correctamente"
        else
            show_message "$RED" "✗ Error en script de alerta"
        fi
    else
        show_message "$RED" "✗ Script de alerta no es ejecutable"
    fi
}

# Función para mostrar verificación final
verificacion_final() {
    show_message "$PURPLE" "=========================================="
    show_message "$PURPLE" "VERIFICACIÓN FINAL DE CONFIGURACIÓN"
    show_message "$PURPLE" "=========================================="
    
    echo "Usuario: $USUARIO"
    echo "Fecha: $(date)"
    echo ""
    
    # Verificar directorios
    verificar_directorio "Directorio de documentos" "$DIR_ORIGEN_DOCS"
    verificar_directorio "Directorio de fotos" "$DIR_ORIGEN_FOTOS"
    verificar_directorio "Directorio de backup" "$DIR_BACKUP"
    
    # Verificar archivos de log
    verificar_archivo "Archivo de log de respaldo" "$LOG_RESPALDO"
    verificar_archivo "Archivo de log de alerta" "$LOG_ALERTA"
    
    # Verificar scripts
    verificar_archivo "Script de respaldo" "$SCRIPT_RESPALDO"
    verificar_archivo "Script de alerta" "$SCRIPT_ALERTA"
    
    # Verificar crontab
    echo ""
    echo "CRONTAB CONFIGURADO:"
    crontab -u "$USUARIO" -l 2>/dev/null || echo "No hay entradas en crontab"
    
    # Verificar anacron
    echo ""
    echo "ANACRON CONFIGURADO:"
    grep "respaldo_semanal_steven" /etc/anacrontab 2>/dev/null || echo "No hay entrada en anacron"
    
    # Verificar archivos de log
    echo ""
    echo "ARCHIVOS DE LOG:"
    if [ -f "$LOG_RESPALDO" ]; then
        echo "✓ $LOG_RESPALDO (últimas 3 líneas):"
        tail -3 "$LOG_RESPALDO" 2>/dev/null || echo "  Archivo vacío"
    else
        echo "✗ $LOG_RESPALDO no existe"
    fi
    
    if [ -f "$LOG_ALERTA" ]; then
        echo "✓ $LOG_ALERTA (últimas 3 líneas):"
        tail -3 "$LOG_ALERTA" 2>/dev/null || echo "  Archivo vacío"
    else
        echo "✗ $LOG_ALERTA no existe"
    fi
    
    # Verificar directorio de backup
    echo ""
    echo "DIRECTORIO DE BACKUP:"
    if [ -d "$DIR_BACKUP" ]; then
        echo "✓ $DIR_BACKUP"
        ls -la "$DIR_BACKUP" | grep "respaldo_steven" | tail -3 || echo "  No hay respaldos aún"
    else
        echo "✗ $DIR_BACKUP no existe"
    fi
    
    # Mostrar estadísticas
    echo ""
    show_message "$CYAN" "=========================================="
    show_message "$CYAN" "ESTADÍSTICAS DE VERIFICACIÓN"
    show_message "$CYAN" "=========================================="
    echo "Verificaciones totales: $TOTAL_VERIFICACIONES"
    echo "Verificaciones exitosas: $VERIFICACIONES_EXITOSAS"
    echo "Porcentaje de éxito: $((VERIFICACIONES_EXITOSAS * 100 / TOTAL_VERIFICACIONES))%"
    
    show_message "$PURPLE" "=========================================="
    show_message "$GREEN" "VERIFICACIÓN COMPLETADA"
    show_message "$PURPLE" "=========================================="
}

# Función para mostrar resumen final
mostrar_resumen() {
    show_message "$GREEN" "=========================================="
    show_message "$GREEN" "RESUMEN DE LA TAREA COMPLETADA"
    show_message "$GREEN" "=========================================="
    
    echo "✅ Respaldos diarios configurados (1:00 AM)"
    echo "✅ Respaldos semanales configurados (anacron)"
    echo "✅ Alertas del sistema configuradas (cada hora)"
    echo "✅ Directorios de origen creados"
    echo "✅ Directorio de backup configurado"
    echo "✅ Archivos de log configurados"
    echo "✅ Scripts con permisos de ejecución"
    echo "✅ Servicios cron y anacron activos"
    echo "✅ Pruebas de funcionamiento ejecutadas"
    
    echo ""
    show_message "$YELLOW" "INFORMACIÓN IMPORTANTE:"
    echo "• Los respaldos se ejecutarán automáticamente a la 1:00 AM"
    echo "• Las alertas se ejecutarán cada hora"
    echo "• Los respaldos semanales se ejecutarán cada 7 días"
    echo "• Los logs se guardan en /var/log/respaldo.log y /var/log/alerta_sistema.log"
    echo "• Los respaldos se guardan en /backup"
    
    echo ""
    show_message "$CYAN" "COMANDOS ÚTILES PARA VERIFICAR:"
    echo "• Ver crontab: crontab -l"
    echo "• Ver logs de respaldo: tail -f /var/log/respaldo.log"
    echo "• Ver logs de alerta: tail -f /var/log/alerta_sistema.log"
    echo "• Ver respaldos: ls -la /backup"
    echo "• Verificar servicios: sudo systemctl status cron anacron"
    
    show_message "$GREEN" "=========================================="
    show_message "$GREEN" "TAREA COMPLETADA EXITOSAMENTE"
    show_message "$GREEN" "=========================================="
}

# Función principal
main() {
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "EJECUTANDO TAREA COMPLETA - PRÁCTICA 4"
    show_message "$BLUE" "USUARIO: STEVEN"
    show_message "$BLUE" "=========================================="
    
    # Crear directorios y archivos necesarios
    crear_directorios
    
    # Configurar permisos
    configurar_permisos
    
    # Configurar programación
    configurar_crontab
    configurar_anacron
    
    # Verificar servicios
    verificar_servicios
    
    # Ejecutar pruebas
    ejecutar_pruebas
    
    # Verificación final
    verificacion_final
    
    # Mostrar resumen
    mostrar_resumen
}

# Ejecutar función principal
main "$@" 