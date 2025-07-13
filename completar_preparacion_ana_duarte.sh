#!/bin/bash
# Completa la preparación del entorno para ana_duarte
set -e

echo "🔧 Completando preparación del entorno para ana_duarte..."

# 1. Crear challenge_20 ejecutable si no existe
if [ ! -f /mnt/z/ISO/ubuntu/challenges/challenge_20 ]; then
    echo '#!/bin/bash
echo "Challenge 20 ejecutado exitosamente"
echo "Este es un archivo de prueba para ana_duarte"' > /mnt/z/ISO/ubuntu/challenges/challenge_20
    chmod +x /mnt/z/ISO/ubuntu/challenges/challenge_20
fi

# 2. Crear redireccionar ejecutable si no existe
if [ ! -f /mnt/z/ISO/ubuntu/challenges/redireccionar ]; then
    echo '#!/bin/bash
echo "Redireccionando salida..."
echo "Este es el contenido que se redirige"' > /mnt/z/ISO/ubuntu/challenges/redireccionar
    chmod +x /mnt/z/ISO/ubuntu/challenges/redireccionar
fi

# 3. Crear hello_executable si no existe
if [ ! -f /mnt/z/ISO/ubuntu/challenges/hello_executable ]; then
    echo '#!/bin/bash
echo "Hello World desde ana_duarte!"' > /mnt/z/ISO/ubuntu/challenges/hello_executable
    chmod +x /mnt/z/ISO/ubuntu/challenges/hello_executable
fi

# 4. Crear compile_me.c válido
cat > /mnt/z/ISO/ubuntu/challenges/compile_me.c << 'EOF'
#include <stdio.h>
int main() {
    printf("Programa compilado exitosamente!\n");
    return 0;
}
EOF

# 5. Cambiar propietarios a ana_duarte
sudo chown ana_duarte:ana_duarte /mnt/z/ISO/ubuntu/challenges/challenge_20
sudo chown ana_duarte:ana_duarte /mnt/z/ISO/ubuntu/challenges/redireccionar
sudo chown ana_duarte:ana_duarte /mnt/z/ISO/ubuntu/challenges/hello_executable
sudo chown ana_duarte:ana_duarte /mnt/z/ISO/ubuntu/challenges/compile_me.c

# 6. Cambiar propietario de todo el directorio challenges a ana_duarte
sudo chown -R ana_duarte:ana_duarte /mnt/z/ISO/ubuntu/challenges/

# 7. Crear archivos deleteme para el comando 45
cd /mnt/z/ISO/ubuntu/challenges
for i in {1..3}; do 
    echo "archivo deleteme $i" > deleteme_$i.txt
done

# 8. Asegurar que people.csv tenga datos reales
cat > /mnt/z/ISO/ubuntu/challenges/people.csv << 'EOF'
nombre,apellido,edad
Josiah,Smith,30
Ana,Duarte,28
Maria,Gomez,25
Josiah,Johnson,22
Carlos,Rodriguez,35
EOF

# 9. Crear archivos de prueba en bunch_of_files
mkdir -p /mnt/z/ISO/ubuntu/challenges/bunch_of_files
echo "You found the needle in the haystack!" > /mnt/z/ISO/ubuntu/challenges/bunch_of_files/needle.txt
echo "archivo de prueba 1" > /mnt/z/ISO/ubuntu/challenges/bunch_of_files/file001.rand
echo "archivo de prueba 2" > /mnt/z/ISO/ubuntu/challenges/bunch_of_files/file002.rand
echo "archivo duplicado" > /mnt/z/ISO/ubuntu/challenges/bunch_of_files/file001.rand.copy

# 10. Cambiar propietario de bunch_of_files
sudo chown -R ana_duarte:ana_duarte /mnt/z/ISO/ubuntu/challenges/bunch_of_files/

echo "✅ Preparación completada. Entorno listo para los 50 comandos." 