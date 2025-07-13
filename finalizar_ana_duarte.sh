#!/bin/bash

# Script final para completar la configuración de ana_duarte
# Corrige problemas de permisos y finaliza la configuración

set -e

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== FINALIZANDO CONFIGURACIÓN ANA_DUARTE ===${NC}"

# Corregir permisos del directorio home
echo -e "${BLUE}Corrigiendo permisos...${NC}"
sudo chown -R ana_duarte:ana_duarte /home/ana_duarte/
sudo chmod 755 /home/ana_duarte/

# Crear archivo de información con permisos correctos
echo -e "${BLUE}Creando archivo de información...${NC}"
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

# Crear script de prueba para ana_duarte
echo -e "${BLUE}Creando script de prueba...${NC}"
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

# Actualizar el log principal
echo "" >> ana_duarte.log
echo "=== CONFIGURACIÓN FINALIZADA ===" >> ana_duarte.log
echo "Fecha: $(date)" >> ana_duarte.log
echo "Usuario: ana_duarte" >> ana_duarte.log
echo "Contraseña: AnaDuarte2024!" >> ana_duarte.log
echo "Estado: CONFIGURACIÓN COMPLETA Y EXITOSA" >> ana_duarte.log
echo "Herramientas instaladas: build-essential, python3, nodejs, npm, net-tools, nmap, htop, iotop, sysstat, p7zip, unrar" >> ana_duarte.log
echo "Directorios creados: workspace, projects, documents, logs" >> ana_duarte.log

# Probar el usuario ana_duarte
echo -e "${BLUE}Probando configuración del usuario ana_duarte...${NC}"
sudo -u ana_duarte bash -c 'echo "Prueba exitosa: Usuario ana_duarte funciona correctamente"'

echo -e "${GREEN}🎉 ¡Configuración finalizada exitosamente!${NC}"
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
echo "Para probar la configuración:"
echo "  sudo -u ana_duarte bash /home/ana_duarte/test_ana_duarte.sh"
echo ""
echo "Para iniciar sesión con logging automático:"
echo "  auto_logger"
echo ""
echo -e "${GREEN}✅ Todo listo! El archivo ana_duarte.log contiene todos los detalles.${NC}" 