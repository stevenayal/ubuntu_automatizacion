#!/bin/bash

# Script de 50 comandos de práctica de línea de comandos
# Autor: Steven
# Este script ejecuta todos los 50 comandos y genera logs automáticamente

# Configuración
LOG_FILE="50_comandos_$(date +%Y%m%d_%H%M%S).log"
CHALLENGES_DIR="/home/steven/command-line-challenges/challenges"

# Función para ejecutar comando y loggear
ejecutar_comando() {
    local numero=$1
    local comando="$2"
    local descripcion="$3"
    
    echo "" | tee -a "$LOG_FILE"
    echo "=== COMANDO $numero: $descripcion ===" | tee -a "$LOG_FILE"
    echo "Comando: $comando" | tee -a "$LOG_FILE"
    echo "Directorio: $(pwd)" | tee -a "$LOG_FILE"
    echo "Salida:" | tee -a "$LOG_FILE"
    echo "----------------------------------------" | tee -a "$LOG_FILE"
    
    # Ejecutar comando y capturar salida
    eval "$comando" >> "$LOG_FILE" 2>&1
    local exit_code=$?
    
    echo "----------------------------------------" | tee -a "$LOG_FILE"
    echo "Código de salida: $exit_code" | tee -a "$LOG_FILE"
    
    if [ $exit_code -eq 0 ]; then
        echo "✅ Comando $numero ejecutado exitosamente" | tee -a "$LOG_FILE"
    else
        echo "❌ Comando $numero falló (código: $exit_code)" | tee -a "$LOG_FILE"
    fi
}

# Iniciar script
echo "🚀 === INICIANDO 50 COMANDOS DE PRÁCTICA ===" | tee "$LOG_FILE"
echo "📅 Fecha: $(date)" | tee -a "$LOG_FILE"
echo "👤 Usuario: $(whoami)" | tee -a "$LOG_FILE"
echo "💻 Sistema: $(uname -a)" | tee -a "$LOG_FILE"
echo "=============================================" | tee -a "$LOG_FILE"

# Navegar al directorio de desafíos
cd "$CHALLENGES_DIR" || {
    echo "❌ Error: No se pudo navegar al directorio de desafíos" | tee -a "$LOG_FILE"
    exit 1
}

echo "✅ Navegando al directorio: $(pwd)" | tee -a "$LOG_FILE"

# COMANDO 3: Listar contenido
ejecutar_comando 3 "ls" "Listar contenido del directorio"

# COMANDO 4: Crear "foo"
ejecutar_comando 4 "mkdir foo" "Crear directorio foo"

# COMANDO 5: Crear foo/bar/1/2/3
ejecutar_comando 5 "mkdir -p foo/bar/1/2/3" "Crear estructura de directorios anidados"

# COMANDO 6: Eliminar foo
ejecutar_comando 6 "rm -rf foo" "Eliminar directorio foo y todo su contenido"

# COMANDO 7: Imprimir "Hola mundo"
ejecutar_comando 7 "echo 'Hola mundo'" "Imprimir mensaje Hola mundo"

# COMANDO 8: Crear hello.txt
ejecutar_comando 8 "echo 'Hola mundo' > hello.txt" "Crear archivo hello.txt con contenido"

# COMANDO 9: Crear empty.txt
ejecutar_comando 9 "touch empty.txt" "Crear archivo vacío empty.txt"

# COMANDO 10: Eliminar empty.txt
ejecutar_comando 10 "rm empty.txt" "Eliminar archivo empty.txt"

# COMANDO 11: Crear archivo vacío con redirección
ejecutar_comando 11 "> empty1.txt" "Crear archivo vacío con redirección"

# COMANDO 12: Crear archivo vacío con :
ejecutar_comando 12 ": > empty2.txt" "Crear archivo vacío con comando :"

# COMANDO 13: Copiar hello.txt
ejecutar_comando 13 "cp hello.txt goodby.txt" "Copiar hello.txt a goodby.txt"

# COMANDO 14: Renombrar goodby.txt
ejecutar_comando 14 "mv goodby.txt hello_copy.txt" "Renombrar goodby.txt a hello_copy.txt"

# COMANDO 15: Comparar archivos
ejecutar_comando 15 "diff hello.txt hello_copy.txt" "Comparar archivos hello.txt y hello_copy.txt"

# COMANDO 16: Concatenar archivos
ejecutar_comando 16 "cat hello.txt hello_copy.txt > 2_hellos.txt" "Concatenar archivos en 2_hellos.txt"

# COMANDO 17: Ruta absoluta
ejecutar_comando 17 "pwd" "Mostrar ruta absoluta actual"

# COMANDO 18: Listar con permisos
ejecutar_comando 18 "ls -l" "Listar archivos con permisos detallados"

# COMANDO 19: Agregar texto a restricted.txt
ejecutar_comando 19 "echo 'Texto agregado' >> restricted.txt" "Agregar texto a restricted.txt"

# COMANDO 20: Ejecutar hello_executable
ejecutar_comando 20 "./hello_executable" "Ejecutar archivo hello_executable"

# COMANDO 21: Ejecutar challenge_20
ejecutar_comando 21 "chmod +x challenge_20 && ./challenge_20" "Dar permisos y ejecutar challenge_20"

# COMANDO 22: Compilar y ejecutar compile_me.c
ejecutar_comando 22 "gcc compile_me.c -o compilado && ./compilado" "Compilar y ejecutar compile_me.c"

# COMANDO 23: Ejecutar redirect y guardar en output.txt
ejecutar_comando 23 "./redirect > output.txt" "Ejecutar redirect y guardar salida en output.txt"

# COMANDO 24: Fecha y hora actual
ejecutar_comando 24 "date" "Mostrar fecha y hora actual"

# COMANDO 25: Procesos
ejecutar_comando 25 "ps aux" "Mostrar todos los procesos"

# COMANDO 26: Núcleos
ejecutar_comando 26 "nproc" "Mostrar número de núcleos de CPU"

# COMANDO 27: Versión del kernel
ejecutar_comando 27 "uname -r" "Mostrar versión del kernel"

# COMANDO 28: Buscar needle
ejecutar_comando 28 "grep -r 'You found the needle in the haystack!' bunch_of_files/" "Buscar texto específico en bunch_of_files"

# COMANDO 29: Primeras 25 líneas
ejecutar_comando 29 "head -n 25 people.csv" "Mostrar primeras 25 líneas de people.csv"

# COMANDO 30: Últimas 25 líneas
ejecutar_comando 30 "tail -n 25 people.csv" "Mostrar últimas 25 líneas de people.csv"

# COMANDO 31: Diferencias entre archivos
ejecutar_comando 31 "diff greeting1.txt greeting2.txt" "Mostrar diferencias entre greeting1.txt y greeting2.txt"

# COMANDO 32: Espera con impresión
ejecutar_comando 32 "echo 'Hola' && sleep 2 && echo '¡mundo!'" "Imprimir mensaje, esperar y imprimir otro"

# COMANDO 33: Archivo 1MB de ceros
ejecutar_comando 33 "dd if=/dev/zero of=zero_1MB.bin bs=1M count=1" "Crear archivo de 1MB con ceros"

# COMANDO 34: Archivo 2MB aleatorio
ejecutar_comando 34 "dd if=/dev/urandom of=random_2MB.bin bs=1M count=2" "Crear archivo de 2MB con datos aleatorios"

# COMANDO 35: Contar líneas
ejecutar_comando 35 "wc -l README.txt" "Contar líneas en README.txt"

# COMANDO 36: Mostrar archivo en reversa
ejecutar_comando 36 "tac README.txt" "Mostrar README.txt en orden reverso"

# COMANDO 37: Apellidos (2da columna)
ejecutar_comando 37 "cut -d ',' -f2 people.csv" "Extraer segunda columna (apellidos) de people.csv"

# COMANDO 38: Apellidos únicos
ejecutar_comando 38 "cut -d ',' -f2 people.csv | sort | uniq | wc -l" "Contar apellidos únicos"

# COMANDO 39: Excluir header
ejecutar_comando 39 "cut -d ',' -f2 people.csv | tail -n +2 | sort | uniq | wc -l" "Contar apellidos únicos excluyendo header"

# COMANDO 40: Otra forma: awk
ejecutar_comando 40 "awk -F',' 'NR>1 {print \$2}' people.csv | sort | uniq | wc -l" "Usar awk para contar apellidos únicos"

# COMANDO 41: Comparar tiempos
ejecutar_comando 41 "time cut -d ',' -f2 people.csv | tail -n +2 | sort | uniq | wc -l" "Medir tiempo del comando cut"

# COMANDO 42: Contar "Josiah"
ejecutar_comando 42 "grep -c '^Josiah,' people.csv" "Contar líneas que empiecen con Josiah"

# COMANDO 43: Contar archivos (no directorios)
ejecutar_comando 43 "find . -type f | wc -l" "Contar archivos (no directorios)"

# COMANDO 44: Contar directorios
ejecutar_comando 44 "find . -type d | wc -l" "Contar directorios"

# COMANDO 45: Eliminar archivos con "deleteme"
ejecutar_comando 45 "find . -type f -name '*deleteme*' -delete" "Eliminar archivos que contengan 'deleteme' en el nombre"

# COMANDO 46: Reemplazar texto
ejecutar_comando 46 "sed -i 's/You found the needle in the haystack!/La aguja ha sido sacada./' bunch_of_files/*" "Reemplazar texto en archivos"

# COMANDO 47: Transformar CSV
ejecutar_comando 47 "cat people.csv | tr ',' '|' > people_pipe.csv" "Transformar CSV cambiando comas por pipes"

# COMANDO 48: Buscar duplicados (simulado)
ejecutar_comando 48 "find bunch_of_files/ -name 'file001.rand' | head -5" "Buscar archivos file001.rand (simulación de duplicados)"

# COMANDO 49: Crear y eliminar archivo
ejecutar_comando 49 "touch supercalifragilisticexpialidocious.txt && rm supercalifragilisticexpialidocious.txt" "Crear y eliminar archivo con nombre largo"

# COMANDO 50: Crear 9 archivos
ejecutar_comando 50 "for l in a b c; do for n in 1 2 3; do touch \"\${l}\${n}.txt\"; done; done" "Crear 9 archivos con bucles anidados"

# Resumen final
echo "" | tee -a "$LOG_FILE"
echo "🎉 === RESUMEN FINAL ===" | tee -a "$LOG_FILE"
echo "📄 Log guardado en: $LOG_FILE" | tee -a "$LOG_FILE"
echo "📁 Directorio de trabajo: $(pwd)" | tee -a "$LOG_FILE"
echo "📊 Archivos creados:" | tee -a "$LOG_FILE"
ls -la *.txt *.bin *.csv 2>/dev/null | tee -a "$LOG_FILE" || echo "No se encontraron archivos específicos" | tee -a "$LOG_FILE"
echo "=================================" | tee -a "$LOG_FILE"

echo "✅ ¡Los 50 comandos han sido ejecutados!"
echo "📄 Revisa el archivo $LOG_FILE para ver todos los resultados." 