#!/bin/bash

# =============================================================================
# EJECUTAR TAREA COMPLETA - PRÁCTICA 4 - TODOS LOS USUARIOS
# =============================================================================
# Descripción: Script maestro para configurar y verificar toda la tarea para ambos usuarios
# Autor: Sistema de Automatización
# Fecha: $(date)
# Usuarios: steven y ana
# =============================================================================

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Función para mostrar mensajes con colores
show_message() {
    local color="$1"
    local mensaje="$2"
    echo -e "${color}$mensaje${NC}"
}

# Función para mostrar banner
mostrar_banner() {
    clear
    show_message "$CYAN" "=========================================="
    show_message "$CYAN" "  SISTEMA DE AUTOMATIZACIÓN Y MONITOREO"
    show_message "$CYAN" "           PRÁCTICA 4 - COMPLETA"
    show_message "$CYAN" "=========================================="
    echo ""
    show_message "$YELLOW" "Este script configurará y verificará toda la tarea"
    show_message "$YELLOW" "para los usuarios steven y ana automáticamente."
    echo ""
}

# Función para mostrar menú
mostrar_menu() {
    show_message "$BLUE" "OPCIONES DISPONIBLES:"
    echo ""
    show_message "$GREEN" "1) Ejecutar para STEVEN"
    show_message "$GREEN" "2) Ejecutar para ANA"
    show_message "$GREEN" "3) Ejecutar para AMBOS usuarios"
    show_message "$GREEN" "4) Verificar estado actual"
    show_message "$RED" "5) Salir"
    echo ""
}

# Función para ejecutar script de usuario
ejecutar_para_usuario() {
    local usuario="$1"
    local script_path="/home/$usuario/practica4/ejecutar_tarea_completa_$usuario.sh"
    
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "EJECUTANDO PARA USUARIO: $usuario"
    show_message "$BLUE" "=========================================="
    
    if [ -f "$script_path" ]; then
        show_message "$YELLOW" "Ejecutando script para $usuario..."
        chmod +x "$script_path"
        "$script_path"
        
        if [ $? -eq 0 ]; then
            show_message "$GREEN" "✓ Script completado exitosamente para $usuario"
        else
            show_message "$RED" "✗ Error al ejecutar script para $usuario"
        fi
    else
        show_message "$RED" "✗ Script no encontrado: $script_path"
        show_message "$YELLOW" "Asegúrate de que el archivo existe en la ubicación correcta"
    fi
    
    echo ""
    show_message "$CYAN" "Presiona ENTER para continuar..."
    read -r
}

# Función para verificar estado actual
verificar_estado() {
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "VERIFICANDO ESTADO ACTUAL DEL SISTEMA"
    show_message "$BLUE" "=========================================="
    
    echo ""
    
    # Verificar servicios
    show_message "$YELLOW" "SERVICIOS DEL SISTEMA:"
    if sudo systemctl is-active cron >/dev/null 2>&1; then
        show_message "$GREEN" "✓ Servicio cron: ACTIVO"
    else
        show_message "$RED" "✗ Servicio cron: INACTIVO"
    fi
    
    if sudo systemctl is-active anacron >/dev/null 2>&1; then
        show_message "$GREEN" "✓ Servicio anacron: ACTIVO"
    else
        show_message "$RED" "✗ Servicio anacron: INACTIVO"
    fi
    
    echo ""
    
    # Verificar directorios
    show_message "$YELLOW" "DIRECTORIOS DEL SISTEMA:"
    if [ -d "/backup" ]; then
        show_message "$GREEN" "✓ Directorio /backup: EXISTE"
        echo "   Contenido: $(ls -1 /backup | wc -l) archivos"
    else
        show_message "$RED" "✗ Directorio /backup: NO EXISTE"
    fi
    
    if [ -f "/var/log/respaldo.log" ]; then
        show_message "$GREEN" "✓ Log de respaldo: EXISTE"
    else
        show_message "$RED" "✗ Log de respaldo: NO EXISTE"
    fi
    
    if [ -f "/var/log/alerta_sistema.log" ]; then
        show_message "$GREEN" "✓ Log de alerta: EXISTE"
    else
        show_message "$RED" "✗ Log de alerta: NO EXISTE"
    fi
    
    echo ""
    
    # Verificar usuarios
    for usuario in "steven" "ana"; do
        show_message "$YELLOW" "USUARIO: $usuario"
        
        # Verificar directorios del usuario
        if [ -d "/home/$usuario/documentos" ]; then
            show_message "$GREEN" "  ✓ Directorio documentos: EXISTE"
        else
            show_message "$RED" "  ✗ Directorio documentos: NO EXISTE"
        fi
        
        if [ -d "/home/$usuario/fotos" ]; then
            show_message "$GREEN" "  ✓ Directorio fotos: EXISTE"
        else
            show_message "$RED" "  ✗ Directorio fotos: NO EXISTE"
        fi
        
        # Verificar scripts del usuario
        if [ -f "/home/$usuario/practica4/respaldo_avanzado.sh" ]; then
            show_message "$GREEN" "  ✓ Script de respaldo: EXISTE"
            if [ -x "/home/$usuario/practica4/respaldo_avanzado.sh" ]; then
                show_message "$GREEN" "  ✓ Script de respaldo: EJECUTABLE"
            else
                show_message "$RED" "  ✗ Script de respaldo: NO EJECUTABLE"
            fi
        else
            show_message "$RED" "  ✗ Script de respaldo: NO EXISTE"
        fi
        
        if [ -f "/home/$usuario/practica4/alerta_sistema.sh" ]; then
            show_message "$GREEN" "  ✓ Script de alerta: EXISTE"
            if [ -x "/home/$usuario/practica4/alerta_sistema.sh" ]; then
                show_message "$GREEN" "  ✓ Script de alerta: EJECUTABLE"
            else
                show_message "$RED" "  ✗ Script de alerta: NO EJECUTABLE"
            fi
        else
            show_message "$RED" "  ✗ Script de alerta: NO EXISTE"
        fi
        
        # Verificar crontab del usuario
        if crontab -u "$usuario" -l 2>/dev/null | grep -q "respaldo_avanzado"; then
            show_message "$GREEN" "  ✓ Crontab respaldo: CONFIGURADO"
        else
            show_message "$RED" "  ✗ Crontab respaldo: NO CONFIGURADO"
        fi
        
        if crontab -u "$usuario" -l 2>/dev/null | grep -q "alerta_sistema"; then
            show_message "$GREEN" "  ✓ Crontab alerta: CONFIGURADO"
        else
            show_message "$RED" "  ✗ Crontab alerta: NO CONFIGURADO"
        fi
        
        echo ""
    done
    
    # Verificar anacron
    show_message "$YELLOW" "CONFIGURACIÓN ANACRON:"
    if grep -q "respaldo_semanal_steven" /etc/anacrontab 2>/dev/null; then
        show_message "$GREEN" "✓ Anacron steven: CONFIGURADO"
    else
        show_message "$RED" "✗ Anacron steven: NO CONFIGURADO"
    fi
    
    if grep -q "respaldo_semanal_ana" /etc/anacrontab 2>/dev/null; then
        show_message "$GREEN" "✓ Anacron ana: CONFIGURADO"
    else
        show_message "$RED" "✗ Anacron ana: NO CONFIGURADO"
    fi
    
    echo ""
    show_message "$CYAN" "Presiona ENTER para continuar..."
    read -r
}

# Función para ejecutar para ambos usuarios
ejecutar_para_ambos() {
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "EJECUTANDO PARA AMBOS USUARIOS"
    show_message "$BLUE" "=========================================="
    
    # Ejecutar para steven
    ejecutar_para_usuario "steven"
    
    # Ejecutar para ana
    ejecutar_para_usuario "ana"
    
    show_message "$GREEN" "=========================================="
    show_message "$GREEN" "PROCESO COMPLETADO PARA AMBOS USUARIOS"
    show_message "$GREEN" "=========================================="
}

# Función para mostrar información del sistema
mostrar_info_sistema() {
    show_message "$CYAN" "=========================================="
    show_message "$CYAN" "INFORMACIÓN DEL SISTEMA"
    show_message "$CYAN" "=========================================="
    
    echo "Sistema Operativo: $(uname -s)"
    echo "Versión: $(uname -r)"
    echo "Arquitectura: $(uname -m)"
    echo "Usuario actual: $(whoami)"
    echo "Fecha y hora: $(date)"
    echo "Directorio actual: $(pwd)"
    
    echo ""
    show_message "$YELLOW" "CARACTERÍSTICAS DE LA TAREA:"
    echo "• Respaldos diarios automáticos (1:00 AM)"
    echo "• Respaldos semanales automáticos (anacron)"
    echo "• Alertas del sistema cada hora"
    echo "• Monitoreo de CPU, memoria y disco"
    echo "• Logs detallados de todas las operaciones"
    echo "• Limpieza automática de respaldos antiguos"
    
    echo ""
    show_message "$YELLOW" "ARCHIVOS PRINCIPALES:"
    echo "• respaldo_avanzado.sh - Script de respaldo"
    echo "• alerta_sistema.sh - Script de monitoreo"
    echo "• ejecutar_tarea_completa_[usuario].sh - Scripts de configuración"
    echo "• /var/log/respaldo.log - Logs de respaldo"
    echo "• /var/log/alerta_sistema.log - Logs de alerta"
    echo "• /backup/ - Directorio de respaldos"
    
    echo ""
    show_message "$CYAN" "Presiona ENTER para continuar..."
    read -r
}

# Función principal del menú
menu_principal() {
    while true; do
        mostrar_banner
        mostrar_menu
        
        read -p "Selecciona una opción (1-5): " opcion
        
        case $opcion in
            1)
                ejecutar_para_usuario "steven"
                ;;
            2)
                ejecutar_para_usuario "ana"
                ;;
            3)
                ejecutar_para_ambos
                ;;
            4)
                verificar_estado
                ;;
            5)
                show_message "$GREEN" "¡Gracias por usar el sistema de automatización!"
                exit 0
                ;;
            *)
                show_message "$RED" "Opción inválida. Presiona ENTER para continuar..."
                read -r
                ;;
        esac
    done
}

# Función para mostrar ayuda
mostrar_ayuda() {
    show_message "$CYAN" "=========================================="
    show_message "$CYAN" "AYUDA - SISTEMA DE AUTOMATIZACIÓN"
    show_message "$CYAN" "=========================================="
    
    echo ""
    show_message "$YELLOW" "DESCRIPCIÓN:"
    echo "Este script permite configurar y verificar automáticamente"
    echo "todo el sistema de automatización y monitoreo de la Práctica 4"
    echo "para los usuarios steven y ana."
    
    echo ""
    show_message "$YELLOW" "OPCIONES:"
    echo "1) Ejecutar para STEVEN - Configura solo el usuario steven"
    echo "2) Ejecutar para ANA - Configura solo el usuario ana"
    echo "3) Ejecutar para AMBOS - Configura ambos usuarios"
    echo "4) Verificar estado - Muestra el estado actual del sistema"
    echo "5) Salir - Termina el programa"
    
    echo ""
    show_message "$YELLOW" "REQUISITOS:"
    echo "• Sistema WSL Ubuntu"
    echo "• Permisos de sudo"
    echo "• Scripts de respaldo y alerta en las ubicaciones correctas"
    echo "• Conexión a internet (para instalar anacron si es necesario)"
    
    echo ""
    show_message "$YELLOW" "NOTAS:"
    echo "• Los scripts se ejecutarán automáticamente según la programación"
    echo "• Los logs se guardan en /var/log/"
    echo "• Los respaldos se guardan en /backup/"
    echo "• Se mantienen los últimos 7 respaldos por usuario"
    
    echo ""
    show_message "$CYAN" "Presiona ENTER para continuar..."
    read -r
}

# Verificar argumentos de línea de comandos
case "${1:-}" in
    --help|-h|help)
        mostrar_ayuda
        exit 0
        ;;
    --info|-i|info)
        mostrar_info_sistema
        exit 0
        ;;
    --steven|-s)
        ejecutar_para_usuario "steven"
        exit 0
        ;;
    --ana|-a)
        ejecutar_para_usuario "ana"
        exit 0
        ;;
    --ambos|-b)
        ejecutar_para_ambos
        exit 0
        ;;
    --verificar|-v)
        verificar_estado
        exit 0
        ;;
    "")
        # Sin argumentos, mostrar menú interactivo
        menu_principal
        ;;
    *)
        show_message "$RED" "Uso: $0 [OPCIÓN]"
        echo ""
        echo "Opciones:"
        echo "  --steven, -s     Ejecutar para usuario steven"
        echo "  --ana, -a        Ejecutar para usuario ana"
        echo "  --ambos, -b      Ejecutar para ambos usuarios"
        echo "  --verificar, -v  Verificar estado actual"
        echo "  --info, -i       Mostrar información del sistema"
        echo "  --help, -h       Mostrar esta ayuda"
        echo ""
        echo "Sin argumentos: Menú interactivo"
        exit 1
        ;;
esac 