#!/bin/bash

# Script final para práctica de comandos de línea
# Autor: Steven
# Este script ejecuta todos los desafíos y genera logs automáticamente

# Configuración
LOG_FILE="practica_final_$(date +%Y%m%d_%H%M%S).log"
CHALLENGES_DIR="/home/steven/command-line-challenges/challenges"

# Función para mostrar progreso
show_progress() {
    echo "🔄 $1..."
}

# Función para mostrar éxito
show_success() {
    echo "✅ $1"
}

# Función para mostrar información
show_info() {
    echo "ℹ️  $1"
}

# Iniciar práctica
echo "🚀 === INICIANDO PRÁCTICA FINAL DE COMANDOS ===" | tee "$LOG_FILE"
echo "📅 Fecha: $(date)" | tee -a "$LOG_FILE"
echo "👤 Usuario: $(whoami)" | tee -a "$LOG_FILE"
echo "💻 Sistema: $(uname -a)" | tee -a "$LOG_FILE"
echo "===============================================" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

# Verificar que estamos en el directorio home
show_progress "Navegando al directorio home"
cd /home/steven
show_success "Directorio actual: $(pwd)"

# Verificar repositorio
if [ ! -d "$CHALLENGES_DIR" ]; then
    show_progress "Descargando repositorio de desafíos"
    git clone https://github.com/mssalvatore/command-line-challenges.git
    show_success "Repositorio descargado"
else
    show_info "Repositorio ya existe"
fi

# Navegar al directorio de desafíos
cd "$CHALLENGES_DIR"
show_success "Directorio de desafíos: $(pwd)"

# Extraer desafíos si no están extraídos
if [ ! -d "challenges" ]; then
    show_progress "Extrayendo archivos de desafíos"
    tar -xzf challenges.tar.gz
    show_success "Archivos extraídos"
fi

# Navegar al directorio de desafíos
cd challenges

echo "" | tee -a "$LOG_FILE"
echo "📁 === EXPLORACIÓN DE ARCHIVOS ===" | tee -a "$LOG_FILE"
ls -la | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "📄 === CONTENIDO DE ARCHIVOS TXT ===" | tee -a "$LOG_FILE"
for file in *.txt; do
    if [ -f "$file" ]; then
        echo "📄 Archivo: $file" | tee -a "$LOG_FILE"
        echo "🔐 Permisos: $(ls -la "$file")" | tee -a "$LOG_FILE"
        echo "📝 Contenido:" | tee -a "$LOG_FILE"
        cat "$file" | tee -a "$LOG_FILE"
        echo "---" | tee -a "$LOG_FILE"
    fi
done

echo "" | tee -a "$LOG_FILE"
echo "🔍 === COMPARACIÓN DE ARCHIVOS ===" | tee -a "$LOG_FILE"
echo "Diferencias entre greeting1.txt y greeting2.txt:" | tee -a "$LOG_FILE"
diff greeting1.txt greeting2.txt | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "📊 === ESTADÍSTICAS ===" | tee -a "$LOG_FILE"
echo "📈 Total archivos: $(find . -type f | wc -l)" | tee -a "$LOG_FILE"
echo "🎲 Archivos .rand: $(find bunch_of_files/ -name '*.rand' | wc -l)" | tee -a "$LOG_FILE"
echo "📭 Archivos .empty: $(find bunch_of_files/ -name '*.empty' | wc -l)" | tee -a "$LOG_FILE"
echo "📄 Archivos .txt: $(find . -name '*.txt' | wc -l)" | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "🔎 === BÚSQUEDA DE ARCHIVOS ===" | tee -a "$LOG_FILE"
echo "Primeros 10 archivos .rand:" | tee -a "$LOG_FILE"
find bunch_of_files/ -name '*.rand' | head -10 | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "📏 === TAMAÑOS DE ARCHIVOS ===" | tee -a "$LOG_FILE"
echo "Tamaño de archivos .txt:" | tee -a "$LOG_FILE"
ls -lh *.txt | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "💾 === ESPACIO UTILIZADO ===" | tee -a "$LOG_FILE"
du -sh . | tee -a "$LOG_FILE"

# Crear archivo de resumen final
echo "" | tee -a "$LOG_FILE"
echo "📋 === CREANDO RESUMEN FINAL ===" | tee -a "$LOG_FILE"
{
    echo "🎯 === RESUMEN FINAL DE PRÁCTICA ==="
    echo "📅 Fecha: $(date)"
    echo "👤 Usuario: $(whoami)"
    echo "💻 Sistema: $(uname -a)"
    echo ""
    echo "📁 Archivos principales:"
    ls -la *.txt *.log 2>/dev/null || true
    echo ""
    echo "📊 Estadísticas finales:"
    echo "- Total archivos: $(find . -type f | wc -l)"
    echo "- Archivos .rand: $(find bunch_of_files/ -name '*.rand' | wc -l)"
    echo "- Archivos .empty: $(find bunch_of_files/ -name '*.empty' | wc -l)"
    echo "- Archivos .txt: $(find . -name '*.txt' | wc -l)"
    echo ""
    echo "🎉 ¡Práctica completada exitosamente!"
} > resumen_final.txt

show_success "Archivo de resumen creado: resumen_final.txt"

echo "" | tee -a "$LOG_FILE"
echo "🎉 === PRÁCTICA COMPLETADA ===" | tee -a "$LOG_FILE"
echo "📄 Log principal: $LOG_FILE" | tee -a "$LOG_FILE"
echo "📋 Resumen: resumen_final.txt" | tee -a "$LOG_FILE"
echo "📁 Directorio: $(pwd)" | tee -a "$LOG_FILE"
echo "=================================" | tee -a "$LOG_FILE"

show_success "¡Práctica completada exitosamente!"
show_info "Revisa los archivos generados para ver todos los resultados." 