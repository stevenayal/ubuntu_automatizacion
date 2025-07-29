#!/bin/bash

# Script para limpiar archivos innecesarios
# Autor: Steven

echo "🧹 Iniciando limpieza del directorio..."

# Limpiar archivos de log antiguos en /home/steven
echo "📁 Limpiando logs antiguos en /home/steven..."
cd /home/steven
rm -f 50_comandos_*.log
rm -f desafios_*.log
rm -f practica_*.log
rm -f practica_organica_*.log

# Limpiar scripts innecesarios
echo "📝 Eliminando scripts innecesarios..."
rm -f 50_comandos_completos.sh
rm -f 50_comandos_organicos.sh
rm -f desafios_completos.sh
rm -f ejecutar_desafios.sh
rm -f practica_automatica.sh
rm -f practica_comandos.sh
rm -f practica_final.sh
rm -f practica_ubuntu.sh
rm -f setup_practica.sh

# Limpiar archivos creados durante la práctica
echo "🗂️ Limpiando archivos de práctica en challenges..."
cd /home/steven/command-line-challenges/challenges

# Eliminar archivos creados por los comandos
rm -f 2_hellos.txt
rm -f a1.txt a2.txt a3.txt
rm -f b1.txt b2.txt b3.txt
rm -f c1.txt c2.txt c3.txt
rm -f empty1.txt empty2.txt
rm -f hello.txt hello_copy.txt
rm -f output.txt
rm -f people_pipe.csv
rm -f random_2MB.bin
rm -f zero_1MB.bin
rm -f compilado

# Eliminar logs dentro del directorio challenges
rm -f *.log

# Eliminar archivos de resumen
rm -f resumen_*.txt

# Restaurar archivos originales si fueron modificados
echo "🔄 Restaurando archivos originales..."
if [ -f "restricted.txt.backup" ]; then
    mv restricted.txt.backup restricted.txt
fi

# Verificar que los archivos originales estén intactos
echo "✅ Verificando archivos originales..."
ls -la greeting1.txt greeting2.txt restricted.txt challenge_20 compile_me.c hello_executable redirect people.csv

echo ""
echo "🧹 Limpieza completada!"
echo "📁 Archivos mantenidos:"
echo "  - Archivos originales de desafíos"
echo "  - Directorio bunch_of_files"
echo "  - Script practica_final_organica.sh (para uso futuro)"
echo ""
echo "🗑️ Archivos eliminados:"
echo "  - Todos los logs de práctica"
echo "  - Scripts de desarrollo"
echo "  - Archivos temporales creados durante la práctica" 