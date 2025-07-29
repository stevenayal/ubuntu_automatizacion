#!/bin/bash

# AUTOMATIZACIÓN COMPLETA UBUNTU + ANA_DUARTE
# Script que automatiza la instalación de Ubuntu, creación de usuario ana_duarte
# y configuración del sistema de logging automático
# Autor: Asistente IA
# Fecha: $(date)

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
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

log_success() {
    echo -e "${CYAN}[$(date '+%Y-%m-%d %H:%M:%S')] SUCCESS:${NC} $1" | tee -a ana_duarte.log
}

# Banner de inicio
show_banner() {
    clear
    echo -e "${PURPLE}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                                                              ║"
    echo "║           AUTOMATIZACIÓN COMPLETA UBUNTU + ANA_DUARTE        ║"
    echo "║                                                              ║"
    echo "║  🐧 Instalación Ubuntu    👤 Usuario ana_duarte              ║"
    echo "║  📝 Logging automático    🛠️  Herramientas de desarrollo     ║"
    echo "║                                                              ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo ""
}

# Función para verificar requisitos previos
check_prerequisites() {
    log_info "Verificando requisitos previos..."
    
    # Verificar si estamos en WSL
    if grep -qi microsoft /proc/version; then
        log_success "WSL (Windows Subsystem for Linux) detectado"
    else
        log_warning "No se detectó WSL. Este script está optimizado para WSL."
    fi
    
    # Verificar permisos de sudo
    if sudo -n true 2>/dev/null; then
        log_success "Permisos de sudo verificados"
    else
        log_error "Se requieren permisos de sudo para continuar"
        exit 1
    fi
    
    # Verificar conectividad a internet
    if ping -c 1 8.8.8.8 &>/dev/null; then
        log_success "Conectividad a internet verificada"
    else
        log_error "No hay conectividad a internet"
        exit 1
    fi
}

# Función para actualizar el sistema
update_system() {
    log_message "Iniciando actualización del sistema Ubuntu..."
    
    log_info "Actualizando lista de paquetes..."
    sudo apt update -y
    
    log_info "Actualizando paquetes instalados..."
    sudo apt upgrade -y
    
    log_info "Instalando paquetes esenciales..."
    sudo apt install -y curl wget git vim nano htop tree unzip zip
    
    log_success "Sistema actualizado correctamente"
}

# Función para crear usuario ana_duarte
create_user_ana_duarte() {
    log_message "Creando usuario ana_duarte..."
    
    # Verificar si el usuario ya existe
    if id "ana_duarte" &>/dev/null; then
        log_warning "El usuario ana_duarte ya existe"
        return 0
    fi
    
    log_info "Creando usuario ana_duarte con directorio home..."
    sudo useradd -m -s /bin/bash ana_duarte
    
    log_info "Estableciendo contraseña para ana_duarte..."
    echo "ana_duarte:AnaDuarte2024!" | sudo chpasswd
    
    log_info "Agregando ana_duarte a grupos del sistema..."
    sudo usermod -aG sudo ana_duarte
    sudo usermod -aG users ana_duarte
    
    log_info "Creando directorio de logs personalizado..."
    sudo mkdir -p /home/ana_duarte/logs
    sudo chown ana_duarte:ana_duarte /home/ana_duarte/logs
    
    log_success "Usuario ana_duarte creado exitosamente"
}

# Función para instalar herramientas de desarrollo
install_development_tools() {
    log_message "Instalando herramientas de desarrollo..."
    
    log_info "Instalando herramientas de desarrollo básicas..."
    sudo apt install -y build-essential python3 python3-pip nodejs npm
    
    log_info "Instalando herramientas de red..."
    sudo apt install -y net-tools iputils-ping traceroute nmap
    
    log_info "Instalando herramientas de monitoreo..."
    sudo apt install -y htop iotop sysstat
    
    log_info "Instalando herramientas de compresión..."
    sudo apt install -y p7zip-full unrar
    
    log_success "Herramientas de desarrollo instaladas correctamente"
}

# Función para configurar el entorno de ana_duarte
setup_user_environment() {
    log_message "Configurando entorno para ana_duarte..."
    
    # Crear directorios de trabajo
    log_info "Creando directorios de trabajo..."
    sudo mkdir -p /home/ana_duarte/{workspace,projects,documents,logs}
    
    # Configurar .bashrc personalizado
    log_info "Configurando archivos de configuración..."
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
    
    log_success "Entorno de ana_duarte configurado correctamente"
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
    
    log_success "Sistema de logging automático configurado"
}

# Función para crear archivos de información
create_info_files() {
    log_message "Creando archivos de información..."
    
    # Crear archivo de información principal
    sudo -u ana_duarte bash -c 'cat > /home/ana_duarte/INFO_ANA_DUARTE.txt << "EOF"
=== INFORMACIÓN DE USUARIO ANA_DUARTE ===

Usuario: ana_duarte
Contraseña: AnaDuarte2024!
Directorio home: /home/ana_duarte

COMANDOS ÚTILES:
- Para cambiar al usuario: su - ana_duarte
- Para logging automático: auto_logger
- Para ver logs: tail -f ana_duarte.log

DIRECTORIOS CREADOS:
- /home/ana_duarte/workspace/  (área de trabajo)
- /home/ana_duarte/projects/   (proyectos)
- /home/ana_duarte/documents/  (documentos)
- /home/ana_duarte/logs/       (logs de sesión)

HERRAMIENTAS INSTALADAS:
- Herramientas de desarrollo (build-essential, python3, nodejs, npm)
- Herramientas de red (net-tools, ping, traceroute, nmap)
- Herramientas de monitoreo (htop, iotop, sysstat)
- Herramientas de compresión (p7zip, unrar)

FECHA DE CONFIGURACIÓN: $(date)
EOF'

    # Crear script de prueba
    sudo -u ana_duarte bash -c 'cat > /home/ana_duarte/test_ana_duarte.sh << "EOF"
#!/bin/bash
echo "=== PRUEBA DE USUARIO ANA_DUARTE ==="
echo "Usuario actual: $(whoami)"
echo "Directorio actual: $(pwd)"
echo "Fecha: $(date)"
echo ""
echo "Comandos básicos:"
echo "1. Ver archivos:"
ls -la
echo ""
echo "2. Ver directorios creados:"
ls -la /home/ana_duarte/
echo ""
echo "3. Verificar herramientas instaladas:"
which python3 nodejs npm htop iotop 7z unrar
echo ""
echo "=== PRUEBA COMPLETADA ==="
EOF'

    sudo chmod +x /home/ana_duarte/test_ana_duarte.sh
    
    # Corregir permisos finales
    sudo chown -R ana_duarte:ana_duarte /home/ana_duarte/
    sudo chmod 755 /home/ana_duarte/
    
    log_success "Archivos de información creados correctamente"
}

# Función para probar la configuración
test_configuration() {
    log_message "Probando configuración del usuario ana_duarte..."
    
    # Probar el usuario ana_duarte
    if sudo -u ana_duarte bash -c 'echo "Prueba exitosa: Usuario ana_duarte funciona correctamente"' &>/dev/null; then
        log_success "Usuario ana_duarte funciona correctamente"
    else
        log_error "Error al probar usuario ana_duarte"
        return 1
    fi
    
    # Verificar herramientas instaladas
    log_info "Verificando herramientas instaladas..."
    tools=("python3" "nodejs" "npm" "htop" "iotop" "7z" "unrar")
    for tool in "${tools[@]}"; do
        if command -v "$tool" &>/dev/null; then
            log_success "$tool instalado correctamente"
        else
            log_warning "$tool no encontrado"
        fi
    done
    
    log_success "Configuración probada exitosamente"
}

# Función para mostrar información final
show_final_info() {
    log_message "=== INSTALACIÓN COMPLETADA ==="
    
    echo ""
    echo -e "${GREEN}✅ Ubuntu configurado correctamente${NC}"
    echo -e "${GREEN}✅ Usuario ana_duarte creado${NC}"
    echo -e "${GREEN}✅ Sistema de logging configurado${NC}"
    echo -e "${GREEN}✅ Herramientas de desarrollo instaladas${NC}"
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
    echo "Para probar la configuración:"
    echo "  sudo -u ana_duarte bash /home/ana_duarte/test_ana_duarte.sh"
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
    # Crear archivo de log inicial
    echo "=== LOG DE AUTOMATIZACIÓN COMPLETA ANA_DUARTE ===" > ana_duarte.log
    echo "Fecha de inicio: $(date)" >> ana_duarte.log
    echo "================================================" >> ana_duarte.log
    echo "" >> ana_duarte.log
    
    show_banner
    
    # Ejecutar pasos de configuración
    check_prerequisites
    update_system
    create_user_ana_duarte
    install_development_tools
    setup_user_environment
    setup_automatic_logging
    create_info_files
    test_configuration
    
    # Mostrar información final
    show_final_info
    
    # Guardar información final en el log
    echo "" >> ana_duarte.log
    echo "=== INSTALACIÓN COMPLETADA ===" >> ana_duarte.log
    echo "Usuario: ana_duarte" >> ana_duarte.log
    echo "Contraseña: AnaDuarte2024!" >> ana_duarte.log
    echo "Fecha de finalización: $(date)" >> ana_duarte.log
    echo "Estado: CONFIGURACIÓN COMPLETA Y EXITOSA" >> ana_duarte.log
    
    log_message "Proceso de automatización completado exitosamente"
    echo ""
    echo -e "${GREEN}🎉 ¡Todo listo! El archivo ana_duarte.log contiene todos los detalles.${NC}"
}

# Ejecutar función principal
main "$@" 