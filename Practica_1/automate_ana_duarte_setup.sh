#!/bin/bash

# Script de automatización completa para Ubuntu + Usuario ana_duarte
# Autor: Asistente IA
# Fecha: $(date)

set -e  # Salir en caso de error

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para logging
log_message() {
    echo -e "${GREEN}[$(date '+%Y-%m-%d %H:%M:%S')]${NC} $1" | tee -a ana_duarte.log
}

log_error() {
    echo -e "${RED}[$(date '+%Y-%m-%d %H:%M:%S')] ERROR:${NC} $1" | tee -a ana_duarte.log
}

log_warning() {
    echo -e "${YELLOW}[$(date '+%Y-%m-%d %H:%M:%S')] WARNING:${NC} $1" | tee -a ana_duarte.log
}

log_info() {
    echo -e "${BLUE}[$(date '+%Y-%m-%d %H:%M:%S')] INFO:${NC} $1" | tee -a ana_duarte.log
}

# Función para verificar si estamos en WSL
check_wsl() {
    if grep -qi microsoft /proc/version; then
        log_info "Detectado WSL (Windows Subsystem for Linux)"
        return 0
    else
        log_warning "No se detectó WSL. Este script está optimizado para WSL."
        return 1
    fi
}

# Función para actualizar el sistema
update_system() {
    log_message "Iniciando actualización del sistema Ubuntu..."
    
    # Actualizar lista de paquetes
    log_info "Actualizando lista de paquetes..."
    sudo apt update -y
    
    # Actualizar paquetes instalados
    log_info "Actualizando paquetes instalados..."
    sudo apt upgrade -y
    
    # Instalar paquetes esenciales
    log_info "Instalando paquetes esenciales..."
    sudo apt install -y curl wget git vim nano htop tree unzip zip
    
    log_message "Sistema actualizado correctamente"
}

# Función para crear usuario ana_duarte
create_user_ana_duarte() {
    log_message "Creando usuario ana_duarte..."
    
    # Verificar si el usuario ya existe
    if id "ana_duarte" &>/dev/null; then
        log_warning "El usuario ana_duarte ya existe"
        return 0
    fi
    
    # Crear usuario con directorio home
    log_info "Creando usuario ana_duarte con directorio home..."
    sudo useradd -m -s /bin/bash ana_duarte
    
    # Establecer contraseña (puedes cambiarla después)
    log_info "Estableciendo contraseña para ana_duarte..."
    echo "ana_duarte:AnaDuarte2024!" | sudo chpasswd
    
    # Agregar usuario a grupos importantes
    log_info "Agregando ana_duarte a grupos del sistema..."
    sudo usermod -aG sudo ana_duarte
    sudo usermod -aG users ana_duarte
    
    # Crear directorio de logs personalizado
    log_info "Creando directorio de logs personalizado..."
    sudo mkdir -p /home/ana_duarte/logs
    sudo chown ana_duarte:ana_duarte /home/ana_duarte/logs
    
    log_message "Usuario ana_duarte creado exitosamente"
}

# Función para configurar el entorno de ana_duarte
setup_user_environment() {
    log_message "Configurando entorno para ana_duarte..."
    
    # Crear archivos de configuración básicos
    log_info "Creando archivos de configuración..."
    
    # .bashrc personalizado
    cat > /tmp/ana_duarte_bashrc << 'EOF'
# Configuración personalizada para ana_duarte
export PS1='\[\033[01;32m\]ana_duarte\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth

# Aliases útiles
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Función para logging automático
log_session() {
    script -q -c "$SHELL" /home/ana_duarte/logs/session_$(date +%Y%m%d_%H%M%S).log
}

# Función para limpiar logs antiguos
cleanup_logs() {
    find /home/ana_duarte/logs -name "*.log" -mtime +7 -delete
    echo "Logs antiguos limpiados"
}

# Mensaje de bienvenida
echo "¡Bienvenida ana_duarte!"
echo "Comandos útiles:"
echo "  log_session    - Iniciar sesión con logging automático"
echo "  cleanup_logs   - Limpiar logs antiguos"
echo "  ll            - Listar archivos con detalles"
EOF

    # Copiar configuración al usuario
    sudo cp /tmp/ana_duarte_bashrc /home/ana_duarte/.bashrc
    sudo chown ana_duarte:ana_duarte /home/ana_duarte/.bashrc
    
    # Crear archivo .profile
    cat > /tmp/ana_duarte_profile << 'EOF'
# Configuración de perfil para ana_duarte
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Variables de entorno personalizadas
export EDITOR=nano
export VISUAL=nano
export PAGER=less

# Directorio de trabajo por defecto
cd /home/ana_duarte
EOF

    sudo cp /tmp/ana_duarte_profile /home/ana_duarte/.profile
    sudo chown ana_duarte:ana_duarte /home/ana_duarte/.profile
    
    # Limpiar archivos temporales
    rm -f /tmp/ana_duarte_bashrc /tmp/ana_duarte_profile
    
    log_message "Entorno de ana_duarte configurado correctamente"
}

# Función para instalar herramientas adicionales
install_additional_tools() {
    log_message "Instalando herramientas adicionales..."
    
    # Herramientas de desarrollo
    log_info "Instalando herramientas de desarrollo..."
    sudo apt install -y build-essential python3 python3-pip nodejs npm
    
    # Herramientas de red
    log_info "Instalando herramientas de red..."
    sudo apt install -y net-tools iputils-ping traceroute nmap
    
    # Herramientas de monitoreo
    log_info "Instalando herramientas de monitoreo..."
    sudo apt install -y iotop iostat sysstat
    
    # Herramientas de compresión y archivos
    log_info "Instalando herramientas de archivos..."
    sudo apt install -y p7zip-full rar unrar
    
    log_message "Herramientas adicionales instaladas"
}

# Función para configurar logging automático
setup_automatic_logging() {
    log_message "Configurando sistema de logging automático..."
    
    # Crear script de logging automático
    cat > /tmp/auto_logger.sh << 'EOF'
#!/bin/bash

# Script de logging automático para ana_duarte
LOG_DIR="/home/ana_duarte/logs"
LOG_FILE="$LOG_DIR/ana_duarte_$(date +%Y%m%d_%H%M%S).log"

# Crear directorio si no existe
mkdir -p "$LOG_DIR"

# Iniciar logging con script
script -q -c "$SHELL" "$LOG_FILE"

# Al finalizar, copiar log al directorio actual
cp "$LOG_FILE" "./ana_duarte.log"
echo "Log guardado en: ana_duarte.log"
EOF

    sudo cp /tmp/auto_logger.sh /usr/local/bin/auto_logger
    sudo chmod +x /usr/local/bin/auto_logger
    sudo chown ana_duarte:ana_duarte /usr/local/bin/auto_logger
    
    # Crear alias para ana_duarte
    echo 'alias start_logging="auto_logger"' | sudo tee -a /home/ana_duarte/.bashrc
    
    rm -f /tmp/auto_logger.sh
    
    log_message "Sistema de logging automático configurado"
}

# Función para crear directorio de trabajo
create_workspace() {
    log_message "Creando directorio de trabajo..."
    
    sudo mkdir -p /home/ana_duarte/workspace
    sudo mkdir -p /home/ana_duarte/projects
    sudo mkdir -p /home/ana_duarte/documents
    
    sudo chown -R ana_duarte:ana_duarte /home/ana_duarte/workspace
    sudo chown -R ana_duarte:ana_duarte /home/ana_duarte/projects
    sudo chown -R ana_duarte:ana_duarte /home/ana_duarte/documents
    
    log_message "Directorios de trabajo creados"
}

# Función para mostrar información final
show_final_info() {
    log_message "=== INSTALACIÓN COMPLETADA ==="
    echo ""
    echo -e "${GREEN}✅ Ubuntu configurado correctamente${NC}"
    echo -e "${GREEN}✅ Usuario ana_duarte creado${NC}"
    echo -e "${GREEN}✅ Sistema de logging configurado${NC}"
    echo ""
    echo -e "${BLUE}📋 INFORMACIÓN IMPORTANTE:${NC}"
    echo "Usuario: ana_duarte"
    echo "Contraseña: AnaDuarte2024!"
    echo "Directorio home: /home/ana_duarte"
    echo "Logs: /home/ana_duarte/logs/"
    echo ""
    echo -e "${YELLOW}🚀 COMANDOS ÚTILES:${NC}"
    echo "Para cambiar al usuario ana_duarte:"
    echo "  su - ana_duarte"
    echo ""
    echo "Para iniciar sesión con logging automático:"
    echo "  auto_logger"
    echo ""
    echo "Para ver logs en tiempo real:"
    echo "  tail -f ana_duarte.log"
    echo ""
    echo -e "${BLUE}📝 NOTA:${NC} Todos los logs se guardan automáticamente en ana_duarte.log"
}

# Función principal
main() {
    echo "=== AUTOMATIZACIÓN UBUNTU + ANA_DUARTE ==="
    echo "Iniciando proceso de instalación y configuración..."
    echo ""
    
    # Crear archivo de log inicial
    echo "=== LOG DE AUTOMATIZACIÓN ANA_DUARTE ===" > ana_duarte.log
    echo "Fecha de inicio: $(date)" >> ana_duarte.log
    echo "========================================" >> ana_duarte.log
    echo "" >> ana_duarte.log
    
    # Verificar WSL
    check_wsl
    
    # Ejecutar pasos de configuración
    update_system
    create_user_ana_duarte
    setup_user_environment
    install_additional_tools
    setup_automatic_logging
    create_workspace
    
    # Mostrar información final
    show_final_info
    
    # Guardar información final en el log
    echo "" >> ana_duarte.log
    echo "=== INSTALACIÓN COMPLETADA ===" >> ana_duarte.log
    echo "Usuario: ana_duarte" >> ana_duarte.log
    echo "Contraseña: AnaDuarte2024!" >> ana_duarte.log
    echo "Fecha de finalización: $(date)" >> ana_duarte.log
    
    log_message "Proceso de automatización completado exitosamente"
    echo ""
    echo -e "${GREEN}🎉 ¡Todo listo! El archivo ana_duarte.log contiene todos los detalles.${NC}"
}

# Ejecutar función principal
main "$@" 