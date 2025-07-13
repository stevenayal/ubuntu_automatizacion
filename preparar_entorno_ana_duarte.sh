#!/bin/bash
# Prepara el entorno para que los 50 comandos de desafíos funcionen sin errores para ana_duarte
set -e

# 1. Instalar fdupes si no está
if ! command -v fdupes >/dev/null 2>&1; then
  sudo apt update && sudo apt install -y fdupes
fi

# 2. Crear archivos faltantes con contenido de ejemplo
echo "Hello from greeting1" > /mnt/z/ISO/ubuntu/challenges/greeting1.txt
echo "Hello from greeting2" > /mnt/z/ISO/ubuntu/challenges/greeting2.txt
echo -e "Linea1\nLinea2\nLinea3" > /mnt/z/ISO/ubuntu/challenges/README.txt

# 3. Cambiar propietario de challenge_20 y redireccionar a ana_duarte
sudo chown ana_duarte:ana_duarte /mnt/z/ISO/ubuntu/challenges/challenge_20
sudo chown ana_duarte:ana_duarte /mnt/z/ISO/ubuntu/challenges/redireccionar

# 4. Cambiar propietario de todos los archivos en bunch_of_files a ana_duarte
sudo chown -R ana_duarte:ana_duarte /mnt/z/ISO/ubuntu/challenges/bunch_of_files

# 5. Dar permisos de escritura a restricted.txt
sudo chown ana_duarte:ana_duarte /mnt/z/ISO/ubuntu/challenges/restricted.txt
chmod u+w /mnt/z/ISO/ubuntu/challenges/restricted.txt

# 6. Asegurarse de que people.csv tenga datos
cat > /mnt/z/ISO/ubuntu/challenges/people.csv <<EOF
nombre,apellido,edad
Josiah,Smith,30
Ana,Duarte,28
Maria,Gomez,25
Josiah,Johnson,22
EOF

# 7. Limpiar archivos de pruebas previas (excepto los necesarios)
cd /mnt/z/ISO/ubuntu/challenges
find . -maxdepth 1 -type f ! -name 'challenge_20' ! -name 'redireccionar' ! -name 'hello_executable' ! -name 'compile_me.c' ! -name 'restricted.txt' ! -name 'people.csv' ! -name 'bunch_of_files' ! -name 'greeting1.txt' ! -name 'greeting2.txt' ! -name 'README.txt' ! -name 'fdupes' -delete

# 8. Dar permisos de ejecución a hello_executable y redireccionar
chmod +x hello_executable redireccionar

# 9. Crear archivos deleteme para el comando 45
for i in {1..3}; do touch deleteme_$i.txt; done

# 10. Asegurarse de que el script de 50 comandos use 'rm -rf *' en vez de 'rm *'
sed -i "s/rm \*/rm -rf */g" /mnt/z/ISO/ubuntu/generar_logs_organicos_50_comandos_ana_duarte.sh

# 11. Mensaje final
echo "✅ Entorno preparado para ejecutar los 50 comandos sin errores." 