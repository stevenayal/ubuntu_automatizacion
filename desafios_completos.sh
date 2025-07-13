#!/bin/bash

# Script completo de desafíos de línea de comandos
# Autor: Steven

# Crear archivo de log con timestamp
LOG_FILE="desafios_$(date +%Y%m%d_%H%M%S).log"

echo "=== DESAFÍOS DE LÍNEA DE COMANDOS ===" | tee "$LOG_FILE"
echo "Fecha: $(date)" | tee -a "$LOG_FILE"
echo "Usuario: $(whoami)" | tee -a "$LOG_FILE"
echo "Sistema: $(uname -a)" | tee -a "$LOG_FILE"
echo "=====================================" | tee -a "$LOG_FILE"

# Navegar al directorio de desafíos
cd /home/steven/command-line-challenges/challenges

echo "" | tee -a "$LOG_FILE"
echo "=== DESAFÍO 1: EXPLORAR ARCHIVOS ===" | tee -a "$LOG_FILE"
ls -la | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "=== DESAFÍO 2: CONTENIDO DE ARCHIVOS TXT ===" | tee -a "$LOG_FILE"
for file in *.txt; do
    if [ -f "$file" ]; then
        echo "Archivo: $file" | tee -a "$LOG_FILE"
        echo "Permisos: $(ls -la "$file")" | tee -a "$LOG_FILE"
        echo "Contenido:" | tee -a "$LOG_FILE"
        cat "$file" | tee -a "$LOG_FILE"
        echo "---" | tee -a "$LOG_FILE"
    fi
done

echo "" | tee -a "$LOG_FILE"
echo "=== DESAFÍO 3: COMPARAR ARCHIVOS ===" | tee -a "$LOG_FILE"
echo "Diferencias entre greeting1.txt y greeting2.txt:" | tee -a "$LOG_FILE"
diff greeting1.txt greeting2.txt | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "=== DESAFÍO 4: CONTAR LÍNEAS ===" | tee -a "$LOG_FILE"
echo "Líneas en greeting1.txt: $(wc -l < greeting1.txt)" | tee -a "$LOG_FILE"
echo "Líneas en greeting2.txt: $(wc -l < greeting2.txt)" | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "=== DESAFÍO 5: ESTADÍSTICAS DE ARCHIVOS ===" | tee -a "$LOG_FILE"
echo "Total archivos: $(find . -type f | wc -l)" | tee -a "$LOG_FILE"
echo "Archivos .rand: $(find bunch_of_files/ -name '*.rand' | wc -l)" | tee -a "$LOG_FILE"
echo "Archivos .empty: $(find bunch_of_files/ -name '*.empty' | wc -l)" | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "=== DESAFÍO 6: BUSCAR ARCHIVOS ESPECÍFICOS ===" | tee -a "$LOG_FILE"
echo "Primeros 10 archivos .rand:" | tee -a "$LOG_FILE"
find bunch_of_files/ -name '*.rand' | head -10 | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "Primeros 5 archivos .empty:" | tee -a "$LOG_FILE"
find bunch_of_files/ -name '*.empty' | head -5 | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "=== DESAFÍO 7: TAMAÑO DE ARCHIVOS ===" | tee -a "$LOG_FILE"
echo "Tamaño de archivos .txt:" | tee -a "$LOG_FILE"
ls -lh *.txt | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "=== DESAFÍO 8: BUSCAR CONTENIDO ===" | tee -a "$LOG_FILE"
echo "Archivos que contienen 'Hello':" | tee -a "$LOG_FILE"
grep -l 'Hello' *.txt | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "=== DESAFÍO 9: ORDENAR ARCHIVOS ===" | tee -a "$LOG_FILE"
echo "Archivos ordenados por fecha:" | tee -a "$LOG_FILE"
ls -lt *.txt | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "=== DESAFÍO 10: ESPACIO UTILIZADO ===" | tee -a "$LOG_FILE"
echo "Espacio usado por directorio:" | tee -a "$LOG_FILE"
du -sh . | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "=== DESAFÍO 11: CREAR ARCHIVO DE RESUMEN ===" | tee -a "$LOG_FILE"
echo "Creando archivo de resumen..." | tee -a "$LOG_FILE"
{
    echo "=== RESUMEN DE DESAFÍOS ==="
    echo "Fecha: $(date)"
    echo "Usuario: $(whoami)"
    echo ""
    echo "Archivos encontrados:"
    ls -la
    echo ""
    echo "Estadísticas:"
    echo "- Total archivos: $(find . -type f | wc -l)"
    echo "- Archivos .rand: $(find bunch_of_files/ -name '*.rand' | wc -l)"
    echo "- Archivos .empty: $(find bunch_of_files/ -name '*.empty' | wc -l)"
    echo "- Archivos .txt: $(find . -name '*.txt' | wc -l)"
} > resumen_desafios.txt

echo "Archivo de resumen creado: resumen_desafios.txt" | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "=== DESAFÍOS COMPLETADOS ===" | tee -a "$LOG_FILE"
echo "Log guardado en: $LOG_FILE" | tee -a "$LOG_FILE"
echo "Directorio de trabajo: $(pwd)" | tee -a "$LOG_FILE"
echo "=========================================" | tee -a "$LOG_FILE"

echo "¡Todos los desafíos completados exitosamente!"
echo "Revisa el archivo $LOG_FILE para ver todos los resultados." 