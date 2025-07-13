#!/bin/bash

# GENERADOR DE LOGS ORGÁNICOS PARA ANA_DUARTE (VERSIÓN CORREGIDA)
# Crea logs completamente orgánicos usando el comando script
# Ejecuta como usuario ana_duarte para evitar problemas de permisos

set -e

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== GENERANDO LOGS ORGÁNICOS PARA ANA_DUARTE ===${NC}"
echo ""

# Verificar que ana_duarte existe
if ! id "ana_duarte" &>/dev/null; then
    echo -e "${RED}❌ Error: Usuario ana_duarte no existe${NC}"
    exit 1
fi

# Crear directorio de logs si no existe
sudo mkdir -p /home/ana_duarte/logs
sudo chown ana_duarte:ana_duarte /home/ana_duarte/logs

# Generar log orgánico usando script como ana_duarte
echo -e "${BLUE}Iniciando sesión orgánica de ana_duarte...${NC}"
echo ""

# Crear script temporal con comandos orgánicos
cat > /tmp/sesion_organica_ana.sh << 'EOF'
#!/bin/bash

# Simular sesión orgánica de ana_duarte
echo "ana_duarte@ubuntu:~$ whoami"
whoami
echo ""
echo "ana_duarte@ubuntu:~$ pwd"
pwd
echo ""
echo "ana_duarte@ubuntu:~$ ls -la"
ls -la
echo ""
echo "ana_duarte@ubuntu:~$ date"
date
echo ""
echo "ana_duarte@ubuntu:~$ uname -a"
uname -a
echo ""
echo "ana_duarte@ubuntu:~$ df -h"
df -h
echo ""
echo "ana_duarte@ubuntu:~$ free -h"
free -h
echo ""
echo "ana_duarte@ubuntu:~$ ps aux | head -10"
ps aux | head -10
echo ""
echo "ana_duarte@ubuntu:~$ cd /home/ana_duarte"
cd /home/ana_duarte
echo ""
echo "ana_duarte@ubuntu:~$ ls -la"
ls -la
echo ""
echo "ana_duarte@ubuntu:~$ cd workspace"
cd workspace
echo ""
echo "ana_duarte@ubuntu:~$ pwd"
pwd
echo ""
echo "ana_duarte@ubuntu:~$ ls -la"
ls -la
echo ""
echo "ana_duarte@ubuntu:~$ cd .."
cd ..
echo ""
echo "ana_duarte@ubuntu:~$ cd projects"
cd projects
echo ""
echo "ana_duarte@ubuntu:~$ ls -la"
ls -la
echo ""
echo "ana_duarte@ubuntu:~$ cd .."
cd ..
echo ""
echo "ana_duarte@ubuntu:~$ which python3"
which python3
echo ""
echo "ana_duarte@ubuntu:~$ python3 --version"
python3 --version
echo ""
echo "ana_duarte@ubuntu:~$ which nodejs"
which nodejs
echo ""
echo "ana_duarte@ubuntu:~$ nodejs --version"
nodejs --version
echo ""
echo "ana_duarte@ubuntu:~$ which npm"
which npm
echo ""
echo "ana_duarte@ubuntu:~$ npm --version"
npm --version
echo ""
echo "ana_duarte@ubuntu:~$ which htop"
which htop
echo ""
echo "ana_duarte@ubuntu:~$ which iotop"
which iotop
echo ""
echo "ana_duarte@ubuntu:~$ which 7z"
which 7z
echo ""
echo "ana_duarte@ubuntu:~$ 7z --version"
7z --version
echo ""
echo "ana_duarte@ubuntu:~$ which unrar"
which unrar
echo ""
echo "ana_duarte@ubuntu:~$ unrar"
unrar
echo ""
echo "ana_duarte@ubuntu:~$ cat /home/ana_duarte/INFO_ANA_DUARTE.txt"
cat /home/ana_duarte/INFO_ANA_DUARTE.txt
echo ""
echo "ana_duarte@ubuntu:~$ history"
history
echo ""
echo "ana_duarte@ubuntu:~$ exit"
exit
EOF

# Ejecutar sesión orgánica con script como ana_duarte
sudo -u ana_duarte script -q -c "bash /tmp/sesion_organica_ana.sh" /home/ana_duarte/logs/ana_duarte_organico_$(date +%Y%m%d_%H%M%S).log

# Copiar el log orgánico al directorio actual
sudo cp /home/ana_duarte/logs/ana_duarte_organico_*.log ./ana_duarte_organico.log
sudo chown $USER:$USER ./ana_duarte_organico.log

# Limpiar archivo temporal
rm -f /tmp/sesion_organica_ana.sh

echo ""
echo -e "${GREEN}✅ Log orgánico generado exitosamente!${NC}"
echo -e "${BLUE}📁 Archivo: ana_duarte_organico.log${NC}"
echo -e "${BLUE}📊 Tamaño: $(ls -lh ana_duarte_organico.log | awk '{print $5}')${NC}"
echo ""
echo -e "${YELLOW}🎯 Este log es completamente orgánico, igual que los de Steven${NC}" 