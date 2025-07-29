#!/bin/bash

# Script de Pruebas Simples para Scripts de BASH
# Uso: ./pruebas_simples.sh

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Contador de pruebas
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0

# Función para imprimir resultados
print_result() {
    local test_name="$1"
    local result="$2"
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    
    if [ "$result" = "PASS" ]; then
        echo -e "${GREEN}✓ PASS${NC} - $test_name"
        PASSED_TESTS=$((PASSED_TESTS + 1))
    else
        echo -e "${RED}✗ FAIL${NC} - $test_name"
        FAILED_TESTS=$((FAILED_TESTS + 1))
    fi
}

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}    PRUEBAS SIMPLES - Scripts de BASH  ${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Limpiar archivos de pruebas anteriores
rm -f passwd.txt test_output.txt temp_*.txt
rm -f hashcat.potfile
rm -rf "$HOME/.hashcat"/*.potfile 2>/dev/null

# ========================================
# PRUEBA 1: Verificar que los scripts existen
# ========================================
echo -e "${YELLOW}PRUEBA 1: Verificación de archivos${NC}"
echo "----------------------------------------"

if [ -f "generararchivo.sh" ]; then
    print_result "Script generararchivo.sh existe" "PASS"
else
    print_result "Script generararchivo.sh existe" "FAIL"
fi

if [ -f "verificarpasswd.sh" ]; then
    print_result "Script verificarpasswd.sh existe" "PASS"
else
    print_result "Script verificarpasswd.sh existe" "FAIL"
fi

echo ""

# ========================================
# PRUEBA 2: Hacer ejecutables los scripts
# ========================================
echo -e "${YELLOW}PRUEBA 2: Permisos de ejecución${NC}"
echo "----------------------------------------"

chmod +x *.sh

if [ -x "generararchivo.sh" ]; then
    print_result "generararchivo.sh es ejecutable" "PASS"
else
    print_result "generararchivo.sh es ejecutable" "FAIL"
fi

if [ -x "verificarpasswd.sh" ]; then
    print_result "verificarpasswd.sh es ejecutable" "PASS"
else
    print_result "verificarpasswd.sh es ejecutable" "FAIL"
fi

echo ""

# ========================================
# PRUEBA 3: Verificar dependencias
# ========================================
echo -e "${YELLOW}PRUEBA 3: Verificación de dependencias${NC}"
echo "----------------------------------------"

if command -v htpasswd >/dev/null 2>&1; then
    print_result "htpasswd está instalado" "PASS"
else
    print_result "htpasswd está instalado" "FAIL"
    echo -e "${YELLOW}  → Para instalar: sudo apt-get install apache2-utils${NC}"
fi

if command -v hashcat >/dev/null 2>&1; then
    print_result "hashcat está instalado" "PASS"
else
    print_result "hashcat está instalado" "FAIL"
    echo -e "${YELLOW}  → Para instalar: sudo apt-get install hashcat${NC}"
fi

echo ""

# ========================================
# PRUEBA 4: Validación de parámetros - generararchivo.sh
# ========================================
echo -e "${YELLOW}PRUEBA 4: Validación de parámetros - generararchivo.sh${NC}"
echo "--------------------------------------------------------"

# Prueba sin parámetros
output=$(./generararchivo.sh 2>&1)
if echo "$output" | grep -q "Debe especificar 2 parámetros"; then
    print_result "Validación sin parámetros funciona" "PASS"
else
    print_result "Validación sin parámetros funciona" "FAIL"
    echo "  Salida: $output"
fi

# Prueba con un parámetro
output=$(./generararchivo.sh 5 2>&1)
if echo "$output" | grep -q "Debe especificar 2 parámetros"; then
    print_result "Validación con un parámetro funciona" "PASS"
else
    print_result "Validación con un parámetro funciona" "FAIL"
    echo "  Salida: $output"
fi

# Prueba con parámetros inválidos (t < d)
output=$(./generararchivo.sh 3 5 2>&1)
if echo "$output" | grep -q "debe ser mayor"; then
    print_result "Validación t < d funciona" "PASS"
else
    print_result "Validación t < d funciona" "FAIL"
    echo "  Salida: $output"
fi

echo ""

# ========================================
# PRUEBA 5: Validación de parámetros - verificarpasswd.sh
# ========================================
echo -e "${YELLOW}PRUEBA 5: Validación de parámetros - verificarpasswd.sh${NC}"
echo "--------------------------------------------------------"

# Prueba sin parámetros
output=$(./verificarpasswd.sh 2>&1)
if echo "$output" | grep -q "Debe especificar un nombre de archivo"; then
    print_result "Validación sin parámetros funciona" "PASS"
else
    print_result "Validación sin parámetros funciona" "FAIL"
    echo "  Salida: $output"
fi

# Prueba con archivo inexistente
output=$(./verificarpasswd.sh archivo_inexistente.txt 2>&1)
if echo "$output" | grep -q "no se encuentra"; then
    print_result "Validación archivo inexistente funciona" "PASS"
else
    print_result "Validación archivo inexistente funciona" "FAIL"
    echo "  Salida: $output"
fi

echo ""

# ========================================
# PRUEBA 6: Generación de archivo de contraseñas
# ========================================
echo -e "${YELLOW}PRUEBA 6: Generación de archivo de contraseñas${NC}"
echo "-----------------------------------------------"

# Solo ejecutar si htpasswd está disponible
if command -v htpasswd >/dev/null 2>&1; then
    # Generar archivo de prueba
    output=$(./generararchivo.sh 5 3 2>&1)
    
    if [ -f "passwd.txt" ]; then
        print_result "Archivo passwd.txt se creó" "PASS"
        
        # Verificar que tiene 5 líneas
        line_count=$(wc -l < passwd.txt)
        if [ "$line_count" -eq 5 ]; then
            print_result "Archivo tiene 5 usuarios" "PASS"
        else
            print_result "Archivo tiene 5 usuarios" "FAIL"
            echo "  Líneas encontradas: $line_count"
        fi
        
        # Verificar formato de las líneas
        if grep -q "^usuario[1-5]:" passwd.txt; then
            print_result "Formato de usuarios correcto" "PASS"
        else
            print_result "Formato de usuarios correcto" "FAIL"
        fi
        
        # Mostrar contenido para verificación
        echo -e "${BLUE}Contenido del archivo generado:${NC}"
        cat passwd.txt
        echo ""
        
    else
        print_result "Archivo passwd.txt se creó" "FAIL"
        echo "  Salida: $output"
    fi
else
    print_result "Archivo passwd.txt se creó" "SKIP"
    echo "  → htpasswd no está instalado, omitiendo prueba"
fi

echo ""

# ========================================
# PRUEBA 7: Verificación de contraseñas débiles
# ========================================
echo -e "${YELLOW}PRUEBA 7: Verificación de contraseñas débiles${NC}"
echo "--------------------------------------------"

# Solo ejecutar si hashcat está disponible y existe el archivo
if command -v hashcat >/dev/null 2>&1 && [ -f "passwd.txt" ]; then
    # Ejecutar verificación
    output=$(./verificarpasswd.sh passwd.txt 2>&1)
    
    if echo "$output" | grep -q "Verificando usuario:"; then
        print_result "Script de verificación se ejecuta" "PASS"
    else
        print_result "Script de verificación se ejecuta" "FAIL"
        echo "  Salida: $output"
    fi
    
    # Mostrar salida para verificación
    echo -e "${BLUE}Salida de verificación:${NC}"
    echo "$output"
    echo ""
    
else
    if [ ! -f "passwd.txt" ]; then
        print_result "Script de verificación se ejecuta" "SKIP"
        echo "  → Archivo passwd.txt no existe"
    else
        print_result "Script de verificación se ejecuta" "SKIP"
        echo "  → hashcat no está instalado"
    fi
fi

# ========================================
# PRUEBA 8: Prueba de integración completa
# ========================================
echo -e "${YELLOW}PRUEBA 8: Prueba de integración completa${NC}"
echo "----------------------------------------"

# Solo ejecutar si ambas herramientas están disponibles
if command -v htpasswd >/dev/null 2>&1 && command -v hashcat >/dev/null 2>&1; then
    # Limpiar archivo anterior
    rm -f passwd.txt
    
    # Generar archivo con configuración específica
    output=$(./generararchivo.sh 3 2 2>&1)
    
    if [ -f "passwd.txt" ]; then
        # Verificar que se generaron 3 usuarios
        user_count=$(wc -l < passwd.txt)
        if [ "$user_count" -eq 3 ]; then
            print_result "Integración: 3 usuarios generados" "PASS"
        else
            print_result "Integración: 3 usuarios generados" "FAIL"
            echo "  Usuarios encontrados: $user_count"
        fi
        
        # Verificar que el archivo se puede procesar
        if ./verificarpasswd.sh passwd.txt >/dev/null 2>&1; then
            print_result "Integración: Verificación exitosa" "PASS"
        else
            print_result "Integración: Verificación exitosa" "FAIL"
        fi
        
    else
        print_result "Integración: Archivo generado" "FAIL"
        echo "  Salida: $output"
    fi
else
    print_result "Integración: Prueba completa" "SKIP"
    echo "  → Faltan dependencias (htpasswd o hashcat)"
fi

echo ""

# ========================================
# RESUMEN FINAL
# ========================================
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}           RESUMEN DE PRUEBAS          ${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "Total de pruebas: ${TOTAL_TESTS}"
echo -e "${GREEN}Pruebas exitosas: ${PASSED_TESTS}${NC}"
echo -e "${RED}Pruebas fallidas: ${FAILED_TESTS}${NC}"

# Contar pruebas omitidas
SKIPPED_TESTS=$((TOTAL_TESTS - PASSED_TESTS - FAILED_TESTS))
if [ $SKIPPED_TESTS -gt 0 ]; then
    echo -e "${YELLOW}Pruebas omitidas: ${SKIPPED_TESTS}${NC}"
fi

if [ $FAILED_TESTS -eq 0 ]; then
    if [ $PASSED_TESTS -gt 0 ]; then
        echo -e "${GREEN}¡TODAS LAS PRUEBAS PASARON!${NC}"
        exit 0
    else
        echo -e "${YELLOW}No se ejecutaron pruebas (faltan dependencias)${NC}"
        exit 0
    fi
else
    echo -e "${RED}Algunas pruebas fallaron. Revisar errores.${NC}"
    exit 1
fi 