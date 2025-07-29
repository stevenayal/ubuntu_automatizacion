#!/bin/bash

# Script para probar comandos individuales utilizados en los scripts
# Uso: ./prueba_comandos_individuales.sh

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  PRUEBA DE COMANDOS INDIVIDUALES      ${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# ========================================
# PRUEBA 1: Comandos de generación de contraseñas
# ========================================
echo -e "${YELLOW}PRUEBA 1: Comandos de generación de contraseñas${NC}"
echo "------------------------------------------------"

echo "1.1 Generando contraseña débil (3 caracteres, solo números):"
weak_pass=$(head -c 500 /dev/urandom | tr -dc '0-9' | cut -c -3)
echo "   Contraseña débil generada: '$weak_pass'"
echo "   Longitud: ${#weak_pass} caracteres"
if [ ${#weak_pass} -eq 3 ] && [[ "$weak_pass" =~ ^[0-9]+$ ]]; then
    echo -e "   ${GREEN}✓ PASS${NC} - Contraseña débil válida"
else
    echo -e "   ${RED}✗ FAIL${NC} - Contraseña débil inválida"
fi

echo ""
echo "1.2 Generando contraseña normal (10 caracteres, alfanumérica):"
normal_pass=$(head -c 500 /dev/urandom | tr -dc 'a-zA-Z0-9' | cut -c -10)
echo "   Contraseña normal generada: '$normal_pass'"
echo "   Longitud: ${#normal_pass} caracteres"
if [ ${#normal_pass} -eq 10 ] && [[ "$normal_pass" =~ ^[a-zA-Z0-9]+$ ]]; then
    echo -e "   ${GREEN}✓ PASS${NC} - Contraseña normal válida"
else
    echo -e "   ${RED}✗ FAIL${NC} - Contraseña normal inválida"
fi

echo ""

# ========================================
# PRUEBA 2: Comando htpasswd
# ========================================
echo -e "${YELLOW}PRUEBA 2: Comando htpasswd${NC}"
echo "------------------------------"

if command -v htpasswd >/dev/null 2>&1; then
    echo "2.1 Creando archivo de prueba con htpasswd:"
    
    # Crear archivo temporal
    temp_file="temp_passwd.txt"
    rm -f "$temp_file"
    
    # Crear usuario de prueba
    htpasswd -b -c "$temp_file" "testuser" "testpass" 2>/dev/null
    
    if [ -f "$temp_file" ]; then
        echo "   Archivo creado: $temp_file"
        echo "   Contenido:"
        cat "$temp_file" | sed 's/^/   /'
        
        # Verificar formato
        if grep -q "^testuser:" "$temp_file"; then
            echo -e "   ${GREEN}✓ PASS${NC} - Formato htpasswd correcto"
        else
            echo -e "   ${RED}✗ FAIL${NC} - Formato htpasswd incorrecto"
        fi
        
        # Limpiar
        rm -f "$temp_file"
    else
        echo -e "   ${RED}✗ FAIL${NC} - No se pudo crear archivo"
    fi
else
    echo -e "   ${YELLOW}⚠ SKIP${NC} - htpasswd no está instalado"
fi

echo ""

# ========================================
# PRUEBA 3: Comando hashcat
# ========================================
echo -e "${YELLOW}PRUEBA 3: Comando hashcat${NC}"
echo "------------------------------"

if command -v hashcat >/dev/null 2>&1; then
    echo "3.1 Verificando versión de hashcat:"
    version=$(hashcat --version | head -1)
    echo "   $version"
    echo -e "   ${GREEN}✓ PASS${NC} - hashcat disponible"
    
    echo ""
    echo "3.2 Verificando modos disponibles:"
    if hashcat -h | grep -q "1600"; then
        echo -e "   ${GREEN}✓ PASS${NC} - Modo 1600 (Apache MD5) disponible"
    else
        echo -e "   ${RED}✗ FAIL${NC} - Modo 1600 no disponible"
    fi
    
    if hashcat -h | grep -q "3.*Brute-force"; then
        echo -e "   ${GREEN}✓ PASS${NC} - Modo 3 (Brute-force) disponible"
    else
        echo -e "   ${RED}✗ FAIL${NC} - Modo 3 no disponible"
    fi
    
else
    echo -e "   ${YELLOW}⚠ SKIP${NC} - hashcat no está instalado"
fi

echo ""

# ========================================
# PRUEBA 4: Comandos de procesamiento de archivos
# ========================================
echo -e "${YELLOW}PRUEBA 4: Comandos de procesamiento de archivos${NC}"
echo "------------------------------------------------"

echo "4.1 Creando archivo de prueba:"
test_file="test_users.txt"
cat > "$test_file" << EOF
usuario1:$apr1\$hash1\$pass1
usuario2:$apr1\$hash2\$pass2
usuario3:$apr1\$hash3\$pass3
EOF

echo "   Archivo creado: $test_file"
echo "   Contenido:"
cat "$test_file" | sed 's/^/   /'

echo ""
echo "4.2 Probando separación con IFS=:"
while IFS=: read -r user hash; do
    echo "   Usuario: '$user', Hash: '$hash'"
done < "$test_file"

echo ""
echo "4.3 Probando extracción de segunda columna:"
second_col=$(cut -d ":" -f 2 "$test_file")
echo "   Segunda columna:"
echo "$second_col" | sed 's/^/   /'

# Limpiar
rm -f "$test_file"

echo ""

# ========================================
# PRUEBA 5: Comandos de validación
# ========================================
echo -e "${YELLOW}PRUEBA 5: Comandos de validación${NC}"
echo "--------------------------------"

echo "5.1 Verificando existencia de archivos:"
if [ -f "generararchivo.sh" ]; then
    echo -e "   ${GREEN}✓ PASS${NC} - generararchivo.sh existe"
else
    echo -e "   ${RED}✗ FAIL${NC} - generararchivo.sh no existe"
fi

if [ -f "verificarpasswd.sh" ]; then
    echo -e "   ${GREEN}✓ PASS${NC} - verificarpasswd.sh existe"
else
    echo -e "   ${RED}✗ FAIL${NC} - verificarpasswd.sh no existe"
fi

echo ""
echo "5.2 Verificando permisos de ejecución:"
chmod +x *.sh 2>/dev/null

if [ -x "generararchivo.sh" ]; then
    echo -e "   ${GREEN}✓ PASS${NC} - generararchivo.sh es ejecutable"
else
    echo -e "   ${RED}✗ FAIL${NC} - generararchivo.sh no es ejecutable"
fi

if [ -x "verificarpasswd.sh" ]; then
    echo -e "   ${GREEN}✓ PASS${NC} - verificarpasswd.sh es ejecutable"
else
    echo -e "   ${RED}✗ FAIL${NC} - verificarpasswd.sh no es ejecutable"
fi

echo ""
echo "5.3 Verificando comandos disponibles:"
if command -v htpasswd >/dev/null 2>&1; then
    echo -e "   ${GREEN}✓ PASS${NC} - htpasswd disponible"
else
    echo -e "   ${RED}✗ FAIL${NC} - htpasswd no disponible"
fi

if command -v hashcat >/dev/null 2>&1; then
    echo -e "   ${GREEN}✓ PASS${NC} - hashcat disponible"
else
    echo -e "   ${RED}✗ FAIL${NC} - hashcat no disponible"
fi

echo ""

# ========================================
# PRUEBA 6: Comandos de manipulación de strings
# ========================================
echo -e "${YELLOW}PRUEBA 6: Comandos de manipulación de strings${NC}"
echo "--------------------------------------------"

echo "6.1 Probando grep para validación:"
test_string="Error: Debe especificar 2 parámetros"
if echo "$test_string" | grep -q "Debe especificar 2 parámetros"; then
    echo -e "   ${GREEN}✓ PASS${NC} - grep encuentra el patrón"
else
    echo -e "   ${RED}✗ FAIL${NC} - grep no encuentra el patrón"
fi

echo ""
echo "6.2 Probando wc para contar líneas:"
temp_file="temp_lines.txt"
echo "línea1" > "$temp_file"
echo "línea2" >> "$temp_file"
echo "línea3" >> "$temp_file"

line_count=$(wc -l < "$temp_file")
echo "   Archivo tiene $line_count líneas"
if [ "$line_count" -eq 3 ]; then
    echo -e "   ${GREEN}✓ PASS${NC} - Conteo de líneas correcto"
else
    echo -e "   ${RED}✗ FAIL${NC} - Conteo de líneas incorrecto"
fi

rm -f "$temp_file"

echo ""

# ========================================
# RESUMEN
# ========================================
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}           RESUMEN DE COMANDOS         ${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo "Los comandos probados incluyen:"
echo "• Generación de contraseñas aleatorias"
echo "• Creación de archivos htpasswd"
echo "• Verificación de herramientas hashcat"
echo "• Procesamiento de archivos con IFS"
echo "• Validaciones de archivos y permisos"
echo "• Manipulación de strings y conteo"
echo ""
echo -e "${GREEN}Pruebas de comandos individuales completadas${NC}" 