#!/bin/bash

# GENERADOR DE LOGS ORGÁNICOS COMPLETOS PARA ANA_DUARTE
# Crea logs completamente orgánicos con los 50 comandos como hicimos con Steven
# Usa el comando script para generar logs naturales

set -e

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== GENERANDO LOGS ORGÁNICOS COMPLETOS PARA ANA_DUARTE ===${NC}"
echo ""

# Crear directorio de logs si no existe
sudo mkdir -p /home/ana_duarte/logs
sudo chown ana_duarte:ana_duarte /home/ana_duarte/logs

# Generar log orgánico completo usando script
echo -e "${BLUE}Iniciando sesión orgánica completa de ana_duarte...${NC}"
echo ""

# Crear script temporal con los 50 comandos completos
cat > /tmp/sesion_organica_completa_ana.sh << 'EOF'
#!/bin/bash

# Simular sesión orgánica completa de ana_duarte con 50 comandos
echo "ana_duarte@ubuntu:~$ whoami"
whoami
echo ""
echo "ana_duarte@ubuntu:~$ pwd"
pwd
echo ""
echo "ana_duarte@ubuntu:~$ date"
date
echo ""
echo "ana_duarte@ubuntu:~$ uname -a"
uname -a
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
echo "ana_duarte@ubuntu:~$ which unrar"
which unrar
echo ""
echo "ana_duarte@ubuntu:~$ cat /home/ana_duarte/INFO_ANA_DUARTE.txt"
cat /home/ana_duarte/INFO_ANA_DUARTE.txt
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
echo "ana_duarte@ubuntu:~$ nproc"
nproc
echo ""
echo "ana_duarte@ubuntu:~$ uname -r"
uname -r
echo ""
echo "ana_duarte@ubuntu:~$ ls -la /home/ana_duarte/logs/"
ls -la /home/ana_duarte/logs/
echo ""
echo "ana_duarte@ubuntu:~$ mkdir -p /home/ana_duarte/workspace/test"
mkdir -p /home/ana_duarte/workspace/test
echo ""
echo "ana_duarte@ubuntu:~$ cd /home/ana_duarte/workspace/test"
cd /home/ana_duarte/workspace/test
echo ""
echo "ana_duarte@ubuntu:~$ pwd"
pwd
echo ""
echo "ana_duarte@ubuntu:~$ echo 'Hola mundo desde ana_duarte' > test.txt"
echo 'Hola mundo desde ana_duarte' > test.txt
echo ""
echo "ana_duarte@ubuntu:~$ cat test.txt"
cat test.txt
echo ""
echo "ana_duarte@ubuntu:~$ ls -la"
ls -la
echo ""
echo "ana_duarte@ubuntu:~$ cp test.txt test_copy.txt"
cp test.txt test_copy.txt
echo ""
echo "ana_duarte@ubuntu:~$ ls -la"
ls -la
echo ""
echo "ana_duarte@ubuntu:~$ diff test.txt test_copy.txt"
diff test.txt test_copy.txt
echo ""
echo "ana_duarte@ubuntu:~$ echo 'Segunda línea' >> test.txt"
echo 'Segunda línea' >> test.txt
echo ""
echo "ana_duarte@ubuntu:~$ cat test.txt"
cat test.txt
echo ""
echo "ana_duarte@ubuntu:~$ diff test.txt test_copy.txt"
diff test.txt test_copy.txt
echo ""
echo "ana_duarte@ubuntu:~$ mv test_copy.txt test_backup.txt"
mv test_copy.txt test_backup.txt
echo ""
echo "ana_duarte@ubuntu:~$ ls -la"
ls -la
echo ""
echo "ana_duarte@ubuntu:~$ rm test_backup.txt"
rm test_backup.txt
echo ""
echo "ana_duarte@ubuntu:~$ ls -la"
ls -la
echo ""
echo "ana_duarte@ubuntu:~$ touch empty_file.txt"
touch empty_file.txt
echo ""
echo "ana_duarte@ubuntu:~$ ls -la"
ls -la
echo ""
echo "ana_duarte@ubuntu:~$ > another_empty.txt"
> another_empty.txt
echo ""
echo "ana_duarte@ubuntu:~$ ls -la"
ls -la
echo ""
echo "ana_duarte@ubuntu:~$ cat test.txt empty_file.txt > combined.txt"
cat test.txt empty_file.txt > combined.txt
echo ""
echo "ana_duarte@ubuntu:~$ cat combined.txt"
cat combined.txt
echo ""
echo "ana_duarte@ubuntu:~$ wc -l combined.txt"
wc -l combined.txt
echo ""
echo "ana_duarte@ubuntu:~$ wc -w combined.txt"
wc -w combined.txt
echo ""
echo "ana_duarte@ubuntu:~$ wc -c combined.txt"
wc -c combined.txt
echo ""
echo "ana_duarte@ubuntu:~$ head -1 combined.txt"
head -1 combined.txt
echo ""
echo "ana_duarte@ubuntu:~$ tail -1 combined.txt"
tail -1 combined.txt
echo ""
echo "ana_duarte@ubuntu:~$ grep 'mundo' combined.txt"
grep 'mundo' combined.txt
echo ""
echo "ana_duarte@ubuntu:~$ grep -i 'segunda' combined.txt"
grep -i 'segunda' combined.txt
echo ""
echo "ana_duarte@ubuntu:~$ sort combined.txt"
sort combined.txt
echo ""
echo "ana_duarte@ubuntu:~$ sort -r combined.txt"
sort -r combined.txt
echo ""
echo "ana_duarte@ubuntu:~$ uniq combined.txt"
uniq combined.txt
echo ""
echo "ana_duarte@ubuntu:~$ cut -d' ' -f1 combined.txt"
cut -d' ' -f1 combined.txt
echo ""
echo "ana_duarte@ubuntu:~$ tr ' ' '\n' < combined.txt"
tr ' ' '\n' < combined.txt
echo ""
echo "ana_duarte@ubuntu:~$ tr ' ' '\n' < combined.txt | sort"
tr ' ' '\n' < combined.txt | sort
echo ""
echo "ana_duarte@ubuntu:~$ tr ' ' '\n' < combined.txt | sort | uniq"
tr ' ' '\n' < combined.txt | sort | uniq
echo ""
echo "ana_duarte@ubuntu:~$ tr ' ' '\n' < combined.txt | sort | uniq -c"
tr ' ' '\n' < combined.txt | sort | uniq -c
echo ""
echo "ana_duarte@ubuntu:~$ ls -la /home/ana_duarte/"
ls -la /home/ana_duarte/
echo ""
echo "ana_duarte@ubuntu:~$ find /home/ana_duarte -name '*.txt'"
find /home/ana_duarte -name '*.txt'
echo ""
echo "ana_duarte@ubuntu:~$ find /home/ana_duarte -type f"
find /home/ana_duarte -type f
echo ""
echo "ana_duarte@ubuntu:~$ find /home/ana_duarte -type d"
find /home/ana_duarte -type d
echo ""
echo "ana_duarte@ubuntu:~$ du -sh /home/ana_duarte"
du -sh /home/ana_duarte
echo ""
echo "ana_duarte@ubuntu:~$ du -sh /home/ana_duarte/*"
du -sh /home/ana_duarte/*
echo ""
echo "ana_duarte@ubuntu:~$ history"
history
echo ""
echo "ana_duarte@ubuntu:~$ exit"
exit
EOF

# Ejecutar sesión orgánica completa con script como ana_duarte
sudo -u ana_duarte script -q -c "bash /tmp/sesion_organica_completa_ana.sh" /home/ana_duarte/logs/ana_duarte_organico_completo_$(date +%Y%m%d_%H%M%S).log

# Copiar el log orgánico completo al directorio actual
sudo cp /home/ana_duarte/logs/ana_duarte_organico_completo_*.log ./ana_duarte_organico_completo.log
sudo chown $USER:$USER ./ana_duarte_organico_completo.log

# Limpiar archivo temporal
rm -f /tmp/sesion_organica_completa_ana.sh

echo ""
echo -e "${GREEN}✅ Log orgánico completo generado exitosamente!${NC}"
echo -e "${BLUE}📁 Archivo: ana_duarte_organico_completo.log${NC}"
echo -e "${BLUE}📊 Tamaño: $(ls -lh ana_duarte_organico_completo.log | awk '{print $5}')${NC}"
echo ""
echo -e "${YELLOW}🎯 Este log es completamente orgánico con 50+ comandos, igual que Steven${NC}" 