#!/bin/bash

echo "=== GENERANDO LOGS ORGÁNICOS PARA ANA_DUARTE (FORMATO IGUAL A STEVEN) ==="
echo "Fecha: $(date)"
echo ""

# Crear el script de sesión para ana_duarte
cat > /tmp/sesion_50_comandos_ana_steven_format.sh << 'EOF'
#!/bin/bash

# Configurar el prompt para que sea similar al de steven
export PS1='\[\033[?2004h\]\033]0;ana_duarte@ana: \w\007\[\033[?2004l\]\[\033[01;32m\]ana_duarte@ana\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$ '

# Navegar al directorio de desafíos
cd /mnt/z/ISO/ubuntu/challenges

# Mostrar información inicial
echo "=== PRÁCTICA DE 50 COMANDOS ==="
echo "Fecha: $(date)"
echo "Usuario: $(whoami)"
echo "Directorio: $(pwd)"
echo ""

# COMANDO 3: Listar contenido
echo "--- Comando 3: ls ---"
ls

# COMANDO 4: Crear "foo"
echo ""
echo "--- Comando 4: mkdir foo ---"
mkdir foo

# COMANDO 5: Crear foo/bar/1/2/3
echo ""
echo "--- Comando 5: mkdir -p foo/bar/1/2/3 ---"
mkdir -p foo/bar/1/2/3

# COMANDO 6: Eliminar foo
echo ""
echo "--- Comando 6: rm -rf foo ---"
rm -rf foo

# COMANDO 7: Imprimir "Hola mundo"
echo ""
echo "--- Comando 7: echo 'Hola mundo' ---"
echo "Hola mundo"

# COMANDO 8: Crear hello.txt
echo ""
echo "--- Comando 8: echo 'Hola mundo' > hello.txt ---"
echo "Hola mundo" > hello.txt

# COMANDO 9: Crear empty.txt
echo ""
echo "--- Comando 9: touch empty.txt ---"
touch empty.txt

# COMANDO 10: Eliminar empty.txt
echo ""
echo "--- Comando 10: rm empty.txt ---"
rm empty.txt

# COMANDO 11: Crear archivo vacío con redirección
echo ""
echo "--- Comando 11: > empty1.txt ---"
> empty1.txt

# COMANDO 12: Crear archivo vacío con :
echo ""
echo "--- Comando 12: : > empty2.txt ---"
: > empty2.txt

# COMANDO 13: Copiar hello.txt
echo ""
echo "--- Comando 13: cp hello.txt goodby.txt ---"
cp hello.txt goodby.txt

# COMANDO 14: Renombrar goodby.txt
echo ""
echo "--- Comando 14: mv goodby.txt hello_copy.txt ---"
mv goodby.txt hello_copy.txt

# COMANDO 15: Comparar archivos
echo ""
echo "--- Comando 15: diff hello.txt hello_copy.txt ---"
diff hello.txt hello_copy.txt

# COMANDO 16: Concatenar archivos
echo ""
echo "--- Comando 16: cat hello.txt hello_copy.txt > 2_hellos.txt ---"
cat hello.txt hello_copy.txt > 2_hellos.txt

# COMANDO 17: Ruta absoluta
echo ""
echo "--- Comando 17: pwd ---"
pwd

# COMANDO 18: Listar con permisos
echo ""
echo "--- Comando 18: ls -l ---"
ls -l

# COMANDO 19: Agregar texto a restricted.txt
echo ""
echo "--- Comando 19: echo 'Texto agregado' >> restricted.txt ---"
echo "Texto agregado" >> restricted.txt

# COMANDO 20: Ejecutar hello_executable
echo ""
echo "--- Comando 20: ./hello_executable ---"
./hello_executable

# COMANDO 21: Ejecutar challenge_20
echo ""
echo "--- Comando 21: chmod +x challenge_20 && ./challenge_20 ---"
chmod +x challenge_20
./challenge_20

# COMANDO 22: Compilar y ejecutar compile_me.c
echo ""
echo "--- Comando 22: gcc compile_me.c -o compilado && ./compilado ---"
gcc compile_me.c -o compilado
./compilado

# COMANDO 23: Ejecutar redirect y guardar en output.txt
echo ""
echo "--- Comando 23: ./redirect > output.txt ---"
./redirect > output.txt

# COMANDO 24: Fecha y hora actual
echo ""
echo "--- Comando 24: date ---"
date

# COMANDO 25: Procesos
echo ""
echo "--- Comando 25: ps aux ---"
ps aux

# COMANDO 26: Núcleos
echo ""
echo "--- Comando 26: nproc ---"
nproc

# COMANDO 27: Versión del kernel
echo ""
echo "--- Comando 27: uname -r ---"
uname -r

# COMANDO 28: Buscar needle
echo ""
echo "--- Comando 28: grep -r 'You found the needle in the haystack!' bunch_of_files/ ---"
grep -r "You found the needle in the haystack!" bunch_of_files/

# COMANDO 29: Primeras 25 líneas
echo ""
echo "--- Comando 29: head -n 25 people.csv ---"
head -n 25 people.csv

# COMANDO 30: Últimas 25 líneas
echo ""
echo "--- Comando 30: tail -n 25 people.csv ---"
tail -n 25 people.csv

# COMANDO 31: Diferencias entre archivos
echo ""
echo "--- Comando 31: diff greeting1.txt greeting2.txt ---"
diff greeting1.txt greeting2.txt

# COMANDO 32: Espera con impresión
echo ""
echo "--- Comando 32: echo 'Hola' && echo '¡mundo!' ---"
echo "Hola"
echo "¡mundo!"

# COMANDO 33: Crear archivo de 1MB
echo ""
echo "--- Comando 33: dd if=/dev/zero of=zero_1MB.bin bs=1M count=1 ---"
dd if=/dev/zero of=zero_1MB.bin bs=1M count=1

# COMANDO 34: Crear archivo de 2MB
echo ""
echo "--- Comando 34: dd if=/dev/zero of=zero_2MB.bin bs=1M count=2 ---"
dd if=/dev/zero of=zero_2MB.bin bs=1M count=2

# COMANDO 35: Contar líneas de README.txt
echo ""
echo "--- Comando 35: wc -l README.txt ---"
wc -l README.txt

# COMANDO 36: Mostrar últimas 5 líneas de README.txt
echo ""
echo "--- Comando 36: tail -n 5 README.txt ---"
tail -n 5 README.txt

# COMANDO 37: Mostrar primeras 5 líneas de README.txt
echo ""
echo "--- Comando 37: head -n 5 README.txt ---"
head -n 5 README.txt

# COMANDO 38: Extraer segunda columna de people.csv
echo ""
echo "--- Comando 38: cut -d',' -f2 people.csv ---"
cut -d',' -f2 people.csv

# COMANDO 39: Contar líneas de people.csv
echo ""
echo "--- Comando 39: wc -l people.csv ---"
wc -l people.csv

# COMANDO 40: Contar palabras de people.csv
echo ""
echo "--- Comando 40: wc -w people.csv ---"
wc -w people.csv

# COMANDO 41: Contar caracteres de people.csv
echo ""
echo "--- Comando 41: wc -c people.csv ---"
wc -c people.csv

# COMANDO 42: Medir tiempo de comando
echo ""
echo "--- Comando 42: time wc -l people.csv ---"
time wc -l people.csv

# COMANDO 43: Medir tiempo de comando con salida
echo ""
echo "--- Comando 43: time echo 'test' ---"
time echo "test"

# COMANDO 44: Contar archivos en directorio
echo ""
echo "--- Comando 44: ls | wc -l ---"
ls | wc -l

# COMANDO 45: Contar archivos con extensión .txt
echo ""
echo "--- Comando 45: ls *.txt | wc -l ---"
ls *.txt | wc -l

# COMANDO 46: Reemplazar texto en archivos
echo ""
echo "--- Comando 46: sed -i 's/Hello/Hola/g' greeting1.txt greeting2.txt ---"
sed -i 's/Hello/Hola/g' greeting1.txt greeting2.txt

# COMANDO 47: Mostrar progreso con rsync
echo ""
echo "--- Comando 47: rsync -av --progress bunch_of_files/ bunch_of_files_backup/ ---"
rsync -av --progress bunch_of_files/ bunch_of_files_backup/

# COMANDO 48: Eliminar archivos con extensión específica
echo ""
echo "--- Comando 48: rm -f *.bin ---"
rm -f *.bin

# COMANDO 49: Eliminar directorio
echo ""
echo "--- Comando 49: rm -rf bunch_of_files_backup ---"
rm -rf bunch_of_files_backup

# COMANDO 50: Mostrar resumen final
echo ""
echo "=== RESUMEN FINAL ==="
echo "Comandos ejecutados: 50"
echo "Archivos creados: $(ls | wc -l)"
echo "Directorio actual: $(pwd)"
echo "Usuario: $(whoami)"
echo "Fecha: $(date)"
echo "=== FIN DE LA PRÁCTICA ==="
EOF

# Dar permisos de ejecución
chmod +x /tmp/sesion_50_comandos_ana_steven_format.sh

echo "Ejecutando sesión con formato igual a Steven..."
echo ""

# Ejecutar script como ana_duarte con formato igual a Steven
sudo -u ana_duarte script -a ana_duarte_organico_igual_steven.log -c "bash /tmp/sesion_50_comandos_ana_steven_format.sh"

echo ""
echo "=== LOG GENERADO ==="
echo "Archivo: ana_duarte_organico_igual_steven.log"
echo "Tamaño: $(ls -lh ana_duarte_organico_igual_steven.log | awk '{print $5}')"
echo "Líneas: $(wc -l < ana_duarte_organico_igual_steven.log)"
echo ""

# Mostrar las primeras líneas para verificar el formato
echo "=== PRIMERAS LÍNEAS DEL LOG ==="
head -20 ana_duarte_organico_igual_steven.log

echo ""
echo "=== COMPARACIÓN DE FORMATOS ==="
echo "Steven (primeras líneas):"
head -5 steven_gracia.log
echo ""
echo "Ana (primeras líneas):"
head -5 ana_duarte_organico_igual_steven.log

echo ""
echo "¡Log orgánico generado con formato igual a Steven!" 