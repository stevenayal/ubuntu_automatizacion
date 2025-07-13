#!/bin/bash

# Script para completar la configuración de ana_duarte
# Continuación del script anterior

set -e

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== COMPLETANDO CONFIGURACIÓN ANA_DUARTE ===${NC}"

# Verificar si ana_duarte existe
if id "ana_duarte" &>/dev/null; then
    echo -e "${GREEN}✅ Usuario ana_duarte ya existe${NC}"
else
    echo -e "${YELLOW}⚠️  Usuario ana_duarte no existe, creándolo...${NC}"
    sudo useradd -m -s /bin/bash ana_duarte
    echo "ana_duarte:AnaDuarte2024!" | sudo chpasswd
    sudo usermod -aG sudo ana_duarte
    sudo usermod -aG users ana_duarte
fi

# Instalar herramientas faltantes
echo -e "${BLUE}Instalando herramientas de monitoreo...${NC}"
sudo apt install -y sysstat htop iotop -y

# Instalar herramientas de compresión
echo -e "${BLUE}Instalando herramientas de compresión...${NC}"
sudo apt install -y p7zip-full unrar -y

# Crear directorios de trabajo
echo -e "${BLUE}Creando directorios de trabajo...${NC}"
sudo mkdir -p /home/ana_duarte/{workspace,projects,documents,logs}
sudo chown -R ana_duarte:ana_duarte /home/ana_duarte/

# Configurar .bashrc personalizado
echo -e "${BLUE}Configurando entorno personalizado...${NC}"
cat > /tmp/ana_bashrc << 'EOF'
# Configuración personalizada para ana_duarte
export PS1='\[\033[01;32m\]ana_duarte\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export HISTSIZE=10000
export HISTFILESIZE=20000

# Aliases útiles
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'

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

sudo cp /tmp/ana_bashrc /home/ana_duarte/.bashrc
sudo chown ana_duarte:ana_duarte /home/ana_duarte/.bashrc

# Crear script de logging automático
echo -e "${BLUE}Creando sistema de logging automático...${NC}"
cat > /tmp/auto_logger.sh << 'EOF'
#!/bin/bash
# Script de logging automático para ana_duarte
LOG_DIR="/home/ana_duarte/logs"
LOG_FILE="$LOG_DIR/ana_duarte_$(date +%Y%m%d_%H%M%S).log"

mkdir -p "$LOG_DIR"
script -q -c "$SHELL" "$LOG_FILE"

# Copiar log al directorio actual
cp "$LOG_FILE" "./ana_duarte.log"
echo "Log guardado en: ana_duarte.log"
EOF

sudo cp /tmp/auto_logger.sh /usr/local/bin/auto_logger
sudo chmod +x /usr/local/bin/auto_logger
sudo chown ana_duarte:ana_duarte /usr/local/bin/auto_logger

# Limpiar archivos temporales
rm -f /tmp/ana_bashrc /tmp/auto_logger.sh

# Crear archivo de información
echo -e "${BLUE}Creando archivo de información...${NC}"
cat > /home/ana_duarte/INFO_ANA_DUARTE.txt << 'EOF'
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
EOF

sudo chown ana_duarte:ana_duarte /home/ana_duarte/INFO_ANA_DUARTE.txt

# Actualizar el log principal
echo "" >> ana_duarte.log
echo "=== CONFIGURACIÓN COMPLETADA ===" >> ana_duarte.log
echo "Fecha: $(date)" >> ana_duarte.log
echo "Usuario: ana_duarte" >> ana_duarte.log
echo "Contraseña: AnaDuarte2024!" >> ana_duarte.log
echo "Estado: CONFIGURACIÓN EXITOSA" >> ana_duarte.log

echo -e "${GREEN}🎉 ¡Configuración completada exitosamente!${NC}"
echo ""
echo -e "${BLUE}📋 INFORMACIÓN IMPORTANTE:${NC}"
echo "Usuario: ana_duarte"
echo "Contraseña: AnaDuarte2024!"
echo "Directorio home: /home/ana_duarte"
echo ""
echo -e "${YELLOW}🚀 COMANDOS ÚTILES:${NC}"
echo "Para cambiar al usuario ana_duarte:"
echo "  su - ana_duarte"
echo ""
echo "Para iniciar sesión con logging automático:"
echo "  auto_logger"
echo ""
echo -e "${GREEN}✅ Todo listo! El archivo ana_duarte.log contiene todos los detalles.${NC}" 