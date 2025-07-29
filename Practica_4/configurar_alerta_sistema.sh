#!/bin/bash

# =============================================================================
# SCRIPT DE CONFIGURACIÓN DE ALERTA DEL SISTEMA - PRÁCTICA 4
# =============================================================================
# Descripción: Configura automáticamente cronjobs de alerta del sistema
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

# Función para configurar cronjob de alerta para un usuario
configurar_cronjob_alerta() {
    local usuario="$1"
    local script_path="/home/$usuario/practica4/alerta_sistema.sh"
    
    show_message "$BLUE" "Configurando cronjob de alerta para usuario $usuario..."
    
    # Verificar si el script existe
    if [ ! -f "$script_path" ]; then
        show_message "$RED" "✗ Error: Script de alerta no encontrado en $script_path"
        return 1
    fi
    
    # Verificar permisos de ejecución
    if [ ! -x "$script_path" ]; then
        show_message "$YELLOW" "Asignando permisos de ejecución al script de alerta..."
        chmod +x "$script_path"
    fi
    
    # Crear entrada de crontab temporal
    local temp_cron=$(mktemp)
    
    # Obtener crontab actual del usuario
    crontab -u "$usuario" -l 2>/dev/null > "$temp_cron" || echo "" > "$temp_cron"
    
    # Verificar si ya existe la entrada de alerta
    if grep -q "alerta_sistema.sh" "$temp_cron"; then
        show_message "$YELLOW" "Cronjob de alerta ya existe para $usuario, actualizando..."
        # Remover línea existente
        sed -i '/alerta_sistema.sh/d' "$temp_cron"
    fi
    
    # Agregar comentario y nueva entrada
    echo "# Alerta del sistema cada hora" >> "$temp_cron"
    echo "0 * * * * $script_path" >> "$temp_cron"
    
    # Instalar crontab
    if crontab -u "$usuario" "$temp_cron" 2>/dev/null; then
        show_message "$GREEN" "✓ Cronjob de alerta configurado exitosamente para $usuario"
        rm "$temp_cron"
        return 0
    else
        show_message "$RED" "✗ Error al configurar cronjob de alerta para $usuario"
        rm "$temp_cron"
        return 1
    fi
}

# Función para crear archivo de log de alertas
crear_archivo_log_alertas() {
    local archivo_log="/var/log/alerta_sistema.log"
    
    show_message "$BLUE" "Creando archivo de log de alertas..."
    
    if [ ! -f "$archivo_log" ]; then
        sudo touch "$archivo_log"
        sudo chmod 666 "$archivo_log"
        show_message "$GREEN" "✓ Archivo de log de alertas creado: $archivo_log"
    else
        show_message "$GREEN" "✓ Archivo de log de alertas ya existe: $archivo_log"
    fi
}

# Función para verificar servicios necesarios
verificar_servicios() {
    show_message "$BLUE" "Verificando servicios necesarios..."
    
    # Verificar cron
    if systemctl is-active --quiet cron; then
        show_message "$GREEN" "✓ Servicio cron está activo"
    else
        show_message "$YELLOW" "Iniciando servicio cron..."
        sudo systemctl enable cron && sudo systemctl start cron
    fi
}

# Función para mostrar resumen de configuración
mostrar_resumen() {
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "RESUMEN DE CONFIGURACIÓN DE ALERTAS"
    show_message "$BLUE" "=========================================="
    
    echo "USUARIO STEVEN:"
    echo "- Script: /home/steven/practica4/alerta_sistema.sh"
    echo "- Cronjob: 0 * * * * (cada hora en punto)"
    echo "- Umbrales: CPU 80%, Memoria 80%, Disco 75%"
    echo ""
    
    echo "USUARIO ANA:"
    echo "- Script: /home/ana/practica4/alerta_sistema.sh"
    echo "- Cronjob: 0 * * * * (cada hora en punto)"
    echo "- Umbrales: CPU 80%, Memoria 80%, Disco 75%"
    echo ""
    
    echo "ARCHIVO DE LOG:"
    echo "- Ubicación: /var/log/alerta_sistema.log"
    echo "- Formato: [YYYY-MM-DD HH:MM:SS] Mensaje"
    echo ""
    
    echo "COMANDOS DE VERIFICACIÓN:"
    echo "- Ver crontab de steven: crontab -u steven -l"
    echo "- Ver crontab de ana: crontab -u ana -l"
    echo "- Ver logs en tiempo real: tail -f /var/log/alerta_sistema.log"
    echo "- Ver alertas: grep 'ALERTA' /var/log/alerta_sistema.log"
    echo ""
    
    show_message "$GREEN" "Configuración de alertas completada exitosamente!"
}

# Función para probar los scripts de alerta
probar_scripts() {
    show_message "$BLUE" "Probando scripts de alerta..."
    
    for usuario in steven ana; do
        local script_path="/home/$usuario/practica4/alerta_sistema.sh"
        
        if [ -f "$script_path" ] && [ -x "$script_path" ]; then
            show_message "$YELLOW" "Probando script de alerta para $usuario..."
            if timeout 30s "$script_path" >/dev/null 2>&1; then
                show_message "$GREEN" "✓ Script de alerta para $usuario funciona correctamente"
            else
                show_message "$RED" "✗ Error al probar script de alerta para $usuario"
            fi
        else
            show_message "$RED" "✗ Script de alerta no encontrado o no ejecutable para $usuario"
        fi
    done
}

# Función principal
main() {
    show_message "$BLUE" "=========================================="
    show_message "$BLUE" "CONFIGURADOR DE ALERTA DEL SISTEMA"
    show_message "$BLUE" "=========================================="
    
    # Verificar servicios
    verificar_servicios
    
    # Crear archivo de log
    crear_archivo_log_alertas
    
    # Configurar cronjobs para ambos usuarios
    configurar_cronjob_alerta "steven"
    configurar_cronjob_alerta "ana"
    
    # Probar scripts
    probar_scripts
    
    # Mostrar resumen
    mostrar_resumen
}

# Ejecutar función principal
main "$@" 