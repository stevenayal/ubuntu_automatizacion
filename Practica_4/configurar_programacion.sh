#!/bin/bash

# =============================================================================
# SCRIPT DE CONFIGURACIÓN DE PROGRAMACIÓN - PRÁCTICA 4
# =============================================================================
# Descripción: Configura automáticamente crontab, at y anacron para ambos usuarios
# Autor: Sistema de Automatización
# Fecha: $(date)
# =============================================================================

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

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

# Función para configurar crontab para un usuario
configurar_crontab() {
    local usuario="$1"
    local script_path="/home/$usuario/practica4/respaldo_avanzado.sh"
    
    show_message "$BLUE" "Configurando crontab para usuario $usuario..."
    
    # Verificar si el script existe
    if [ ! -f "$script_path" ]; then
        show_message "$RED" "✗ Error: Script no encontrado en $script_path"
        return 1
    fi
    
    # Verificar permisos de ejecución
    if [ ! -x "$script_path" ]; then
        show_message "$YELLOW" "Asignando permisos de ejecución al script..."
        chmod +x "$script_path"
    fi
    
    # Crear entrada de crontab temporal
    local temp_cron=$(mktemp)
    echo "# Respaldos diarios a la 1:00 AM para $usuario" > "$temp_cron"
    echo "0 1 * * * $script_path" >> "$temp_cron"
    
    # Instalar crontab
    if crontab -u "$usuario" "$temp_cron" 2>/dev/null; then
        show_message "$GREEN" "✓ Crontab configurado exitosamente para $usuario"
        rm "$temp_cron"
        return 0
    else
        show_message "$RED" "✗ Error al configurar crontab para $usuario"
        rm "$temp_cron"
        return 1
    fi
}

# Función para configurar anacron para steven
configurar_anacron_steven() {
    show_message "$BLUE" "Configurando anacron para steven..."
    
    local script_path="/home/steven/practica4/respaldo_avanzado.sh"
    local anacrontab_file="/etc/anacrontab"
    
    # Verificar si el script existe
    if [ ! -f "$script_path" ]; then
        show_message "$RED" "✗ Error: Script no encontrado en $script_path"
        return 1
    fi
    
    # Verificar si anacron está instalado
    if ! command_exists anacron; then
        show_message "$YELLOW" "Instalando anacron..."
        sudo apt update && sudo apt install -y anacron
    fi
    
    # Verificar si la entrada ya existe
    if grep -q "respaldo_semanal_steven" "$anacrontab_file" 2>/dev/null; then
        show_message "$YELLOW" "La entrada de anacron para steven ya existe"
        return 0
    fi
    
    # Agregar entrada al anacrontab
    if echo "7 5 respaldo_semanal_steven $script_path" | sudo tee -a "$anacrontab_file" >/dev/null; then
        show_message "$GREEN" "✓ Anacron configurado exitosamente para steven"
        return 0
    else
        show_message "$RED" "✗ Error al configurar anacron para steven"
        return 1
    fi
}

# Función para configurar anacron para ana
configurar_anacron_ana() {
    show_message "$BLUE" "Configurando anacron para ana..."
    
    local script_path="/home/ana/practica4/respaldo_avanzado.sh"
    local anacrontab_file="/etc/anacrontab"
    
    # Verificar si el script existe
    if [ ! -f "$script_path" ]; then
        show_message "$RED" "✗ Error: Script no encontrado en $script_path"
        return 1
    fi
    
    # Verificar si anacron está instalado
    if ! command_exists anacron; then
        show_message "$YELLOW" "Instalando anacron..."
        sudo apt update && sudo apt install -y anacron
    fi
    
    # Verificar si la entrada ya existe
    if grep -q "respaldo_semanal_ana" "$anacrontab_file" 2>/dev/null; then
        show_message "$YELLOW" "La entrada de anacron para ana ya existe"
        return 0
    fi
    
    # Agregar entrada al anacrontab
    if echo "7 5 respaldo_semanal_ana $script_path" | sudo tee -a "$anacrontab_file" >/dev/null; then
        show_message "$GREEN" "✓ Anacron configurado exitosamente para ana"
        return 0
    else
        show_message "$RED" "✗ Error al configurar anacron para ana"
        return 1
    fi
}

# Función para verificar servicios
verificar_servicios() {
    show_message "$BLUE" "Verificando servicios necesarios..."
    
    # Verificar cron
    if systemctl is-active --quiet cron; then
        show_message "$GREEN" "✓ Servicio cron está activo"
    else
        show_message "$YELLOW" "Iniciando servicio cron..."
        sudo systemctl enable cron && sudo systemctl start cron
    fi
    
    # Verificar atd
    if systemctl is-active --quiet atd; then
        show_message "$GREEN" "✓ Servicio atd está activo"
    else
        show_message "$YELLOW" "Iniciando servicio atd..."
        sudo systemctl enable atd && sudo systemctl start atd
    fi
    
    # Verificar anacron
    if systemctl is-active --quiet anacron; then
        show_message "$GREEN" "✓ Servicio anacron está activo"
    else
        show_message "$YELLOW" "Iniciando servicio anacron..."
        sudo systemctl enable anacron && sudo systemctl start anacron
    fi
}

# Función para crear directorios necesarios
crear_directorios() {
    show_message "$BLUE" "Creando directorios necesarios..."
    
    # Crear directorio de backup
    if [ ! -d "/backup" ]; then
        sudo mkdir -p /backup
        sudo chmod 755 /backup
        show_message "$GREEN" "✓ Directorio /backup creado"
    else
        show_message "$GREEN" "✓ Directorio /backup ya existe"
    fi
    
    # Crear directorios de usuarios
    for usuario in steven ana; do
        if [ ! -d "/home/$usuario/documentos" ]; then
            mkdir -p "/home/$usuario/documentos"
            show_message "$GREEN" "✓ Directorio /home/$usuario/documentos creado"
        fi
        
        if [ ! -d "/home/$usuario/fotos" ]; then
            mkdir -p "/home/$usuario/fotos"
            show_message "$GREEN" "✓ Directorio /home/$usuario/fotos creado"
        fi
    done
    
    # Crear archivo de log
    if [ ! -f "/var/log/respaldo.log" ]; then
        sudo touch /var/log/respaldo.log
        sudo chmod 666 /var/log/respaldo.log
        show_message "$GREEN" "✓ Archivo de log /var/log/respaldo.log creado"
    fi
}

# Función para mostrar resumen
mostrar_resumen() {
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "RESUMEN DE CONFIGURACIÓN"
    show_message "$BLUE" "=========================================="
    
    echo "USUARIO STEVEN:"
    echo "- Respaldos diarios: 1:00 AM (crontab)"
    echo "- Respaldos semanales: Cada 7 días (anacron)"
    echo "- Script: /home/steven/practica4/respaldo_avanzado.sh"
    echo ""
    
    echo "USUARIO ANA:"
    echo "- Respaldos diarios: 1:00 AM (crontab)"
    echo "- Respaldos semanales: Cada 7 días (anacron)"
    echo "- Script: /home/ana/practica4/respaldo_avanzado.sh"
    echo ""
    
    echo "SERVICIOS:"
    echo "- cron: Respaldos diarios"
    echo "- anacron: Respaldos semanales"
    echo ""
    
    echo "DIRECTORIOS:"
    echo "- Destino: /backup"
    echo "- Log: /var/log/respaldo.log"
    echo ""
    
    show_message "$GREEN" "Configuración completada exitosamente!"
}

# Función principal
main() {
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "CONFIGURADOR DE PROGRAMACIÓN - PRÁCTICA 4"
    show_message "$BLUE" "=========================================="
    
    # Verificar si se ejecuta como root para algunas operaciones
    if [ "$EUID" -ne 0 ]; then
        show_message "$YELLOW" "Algunas operaciones requieren permisos de root"
    fi
    
    # Crear directorios necesarios
    crear_directorios
    
    # Verificar servicios
    verificar_servicios
    
    # Configurar crontab para ambos usuarios
    configurar_crontab "steven"
    configurar_crontab "ana"
    
    # Configurar anacron para steven
    configurar_anacron_steven
    
    # Configurar anacron para ana
    configurar_anacron_ana
    
    # Mostrar resumen
    mostrar_resumen
}

# Ejecutar función principal
main "$@" 