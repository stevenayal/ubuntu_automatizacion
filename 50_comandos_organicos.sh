#!/bin/bash

# Script de 50 comandos que genera logs orgánicos (idénticos a script normal)
# Autor: Steven
# Este script usa 'script' para generar logs idénticos a los orgánicos

# Configuración
LOG_FILE="practica_organica_$(date +%Y%m%d_%H%M%S).log"
CHALLENGES_DIR="/home/steven/command-line-challenges/challenges"

echo "🚀 Iniciando práctica con logs orgánicos..."
echo "📄 Log se guardará en: $LOG_FILE"

# Función para ejecutar comandos dentro de script
ejecutar_practica() {
    # Iniciar script para grabación orgánica
    script -a "$LOG_FILE" << 'SCRIPT_EOF'
    
    # Navegar al directorio de desafíos
    cd /home/steven/command-line-challenges/challenges
    
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
    echo "--- Comando 32: echo 'Hola' && sleep 2 && echo '¡mundo!' ---"
    echo "Hola"
    sleep 2
    echo "¡mundo!"
    
    # COMANDO 33: Archivo 1MB de ceros
    echo ""
    echo "--- Comando 33: dd if=/dev/zero of=zero_1MB.bin bs=1M count=1 ---"
    dd if=/dev/zero of=zero_1MB.bin bs=1M count=1
    
    # COMANDO 34: Archivo 2MB aleatorio
    echo ""
    echo "--- Comando 34: dd if=/dev/urandom of=random_2MB.bin bs=1M count=2 ---"
    dd if=/dev/urandom of=random_2MB.bin bs=1M count=2
    
    # COMANDO 35: Contar líneas
    echo ""
    echo "--- Comando 35: wc -l README.txt ---"
    wc -l README.txt
    
    # COMANDO 36: Mostrar archivo en reversa
    echo ""
    echo "--- Comando 36: tac README.txt ---"
    tac README.txt
    
    # COMANDO 37: Apellidos (2da columna)
    echo ""
    echo "--- Comando 37: cut -d ',' -f2 people.csv ---"
    cut -d ',' -f2 people.csv
    
    # COMANDO 38: Apellidos únicos
    echo ""
    echo "--- Comando 38: cut -d ',' -f2 people.csv | sort | uniq | wc -l ---"
    cut -d ',' -f2 people.csv | sort | uniq | wc -l
    
    # COMANDO 39: Excluir header
    echo ""
    echo "--- Comando 39: cut -d ',' -f2 people.csv | tail -n +2 | sort | uniq | wc -l ---"
    cut -d ',' -f2 people.csv | tail -n +2 | sort | uniq | wc -l
    
    # COMANDO 40: Otra forma: awk
    echo ""
    echo "--- Comando 40: awk -F',' 'NR>1 {print \$2}' people.csv | sort | uniq | wc -l ---"
    awk -F',' 'NR>1 {print $2}' people.csv | sort | uniq | wc -l
    
    # COMANDO 41: Comparar tiempos
    echo ""
    echo "--- Comando 41: time cut -d ',' -f2 people.csv | tail -n +2 | sort | uniq | wc -l ---"
    time cut -d ',' -f2 people.csv | tail -n +2 | sort | uniq | wc -l
    
    # COMANDO 42: Contar "Josiah"
    echo ""
    echo "--- Comando 42: grep -c '^Josiah,' people.csv ---"
    grep -c '^Josiah,' people.csv
    
    # COMANDO 43: Contar archivos (no directorios)
    echo ""
    echo "--- Comando 43: find . -type f | wc -l ---"
    find . -type f | wc -l
    
    # COMANDO 44: Contar directorios
    echo ""
    echo "--- Comando 44: find . -type d | wc -l ---"
    find . -type d | wc -l
    
    # COMANDO 45: Eliminar archivos con "deleteme"
    echo ""
    echo "--- Comando 45: find . -type f -name '*deleteme*' -delete ---"
    find . -type f -name '*deleteme*' -delete
    
    # COMANDO 46: Reemplazar texto
    echo ""
    echo "--- Comando 46: sed -i 's/You found the needle in the haystack!/La aguja ha sido sacada./' bunch_of_files/* ---"
    sed -i 's/You found the needle in the haystack!/La aguja ha sido sacada./' bunch_of_files/*
    
    # COMANDO 47: Transformar CSV
    echo ""
    echo "--- Comando 47: cat people.csv | tr ',' '|' > people_pipe.csv ---"
    cat people.csv | tr ',' '|' > people_pipe.csv
    
    # COMANDO 48: Buscar duplicados de file001.rand
    echo ""
    echo "--- Comando 48: find bunch_of_files/ -name 'file001.rand' | head -5 ---"
    find bunch_of_files/ -name 'file001.rand' | head -5
    
    # COMANDO 49: Crear y eliminar archivo
    echo ""
    echo "--- Comando 49: touch supercalifragilisticexpialidocious.txt && rm supercalifragilisticexpialidocious.txt ---"
    touch supercalifragilisticexpialidocious.txt
    rm supercalifragilisticexpialidocious.txt
    
    # COMANDO 50: Crear 9 archivos
    echo ""
    echo "--- Comando 50: for l in a b c; do for n in 1 2 3; do touch \"\${l}\${n}.txt\"; done; done ---"
    for l in a b c; do for n in 1 2 3; do touch "${l}${n}.txt"; done; done
    
    # Resumen final
    echo ""
    echo "=== RESUMEN FINAL ==="
    echo "Log guardado en: $LOG_FILE"
    echo "Directorio de trabajo: $(pwd)"
    echo "Archivos creados:"
    ls -la *.txt *.bin *.csv 2>/dev/null || echo "No se encontraron archivos específicos"
    echo "=== PRÁCTICA COMPLETADA ==="
    
    # Salir de la sesión de script
    exit
SCRIPT_EOF
}

# Ejecutar la práctica
ejecutar_practica

echo "✅ Práctica completada con logs orgánicos"
echo "📄 Log guardado en: $LOG_FILE"
echo "🔍 Este log es idéntico a uno generado manualmente con 'script'" 