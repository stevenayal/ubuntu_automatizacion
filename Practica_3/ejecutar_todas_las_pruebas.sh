#!/bin/bash

# Script maestro para ejecutar todas las pruebas
# Uso: ./ejecutar_todas_las_pruebas.sh

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Contador global de pruebas
TOTAL_GLOBAL=0
PASSED_GLOBAL=0
FAILED_GLOBAL=0

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}    EJECUTOR DE TODAS LAS PRUEBAS      ${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Función para ejecutar una prueba y contar resultados
run_test() {
    local test_name="$1"
    local test_script="$2"
    
    echo -e "${PURPLE}Ejecutando: $test_name${NC}"
    echo "----------------------------------------"
    
    if [ -f "$test_script" ]; then
        chmod +x "$test_script"
        
        # Ejecutar prueba y capturar salida
        output=$(./"$test_script" 2>&1)
        exit_code=$?
        
        # Mostrar salida
        echo "$output"
        
        # Contar resultados si el script reporta PASS/FAIL
        if echo "$output" | grep -q "PASS\|FAIL"; then
            pass_count=$(echo "$output" | grep -c "✓ PASS")
            fail_count=$(echo "$output" | grep -c "✗ FAIL")
            
            TOTAL_GLOBAL=$((TOTAL_GLOBAL + pass_count + fail_count))
            PASSED_GLOBAL=$((PASSED_GLOBAL + pass_count))
            FAILED_GLOBAL=$((FAILED_GLOBAL + fail_count))
        fi
        
        echo ""
        if [ $exit_code -eq 0 ]; then
            echo -e "${GREEN}✓ $test_name completado exitosamente${NC}"
        else
            echo -e "${RED}✗ $test_name falló${NC}"
        fi
        
    else
        echo -e "${RED}✗ Script $test_script no encontrado${NC}"
    fi
    
    echo ""
    echo "========================================"
    echo ""
}

# Función para mostrar progreso
show_progress() {
    echo -e "${YELLOW}Progreso: $1 de $2 pruebas completadas${NC}"
    echo ""
}

# ========================================
# PRUEBA 1: Comandos individuales
# ========================================
show_progress 1 4
run_test "Prueba de Comandos Individuales" "prueba_comandos_individuales.sh"

# ========================================
# PRUEBA 2: Pruebas simples
# ========================================
show_progress 2 4
run_test "Pruebas Simples" "pruebas_simples.sh"

# ========================================
# PRUEBA 3: Pruebas unitarias completas
# ========================================
show_progress 3 4
run_test "Pruebas Unitarias Completas" "pruebas_unitarias.sh"

# ========================================
# PRUEBA 4: Prueba de integración
# ========================================
show_progress 4 4
run_test "Prueba de Integración" "ejecutar_prueba_completa.sh"

# ========================================
# RESUMEN FINAL
# ========================================
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}         RESUMEN FINAL GLOBAL          ${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "Total de pruebas ejecutadas: ${TOTAL_GLOBAL}"
echo -e "${GREEN}Pruebas exitosas: ${PASSED_GLOBAL}${NC}"
echo -e "${RED}Pruebas fallidas: ${FAILED_GLOBAL}${NC}"

# Calcular porcentaje de éxito
if [ $TOTAL_GLOBAL -gt 0 ]; then
    success_rate=$((PASSED_GLOBAL * 100 / TOTAL_GLOBAL))
    echo -e "${BLUE}Porcentaje de éxito: ${success_rate}%${NC}"
fi

echo ""
if [ $FAILED_GLOBAL -eq 0 ] && [ $TOTAL_GLOBAL -gt 0 ]; then
    echo -e "${GREEN}🎉 ¡TODAS LAS PRUEBAS PASARON! 🎉${NC}"
    echo -e "${GREEN}Los scripts están funcionando correctamente.${NC}"
    exit 0
elif [ $TOTAL_GLOBAL -eq 0 ]; then
    echo -e "${YELLOW}⚠ No se ejecutaron pruebas${NC}"
    echo -e "${YELLOW}Verificar que los scripts de prueba existan.${NC}"
    exit 0
else
    echo -e "${RED}❌ Algunas pruebas fallaron.${NC}"
    echo -e "${YELLOW}Revisar los errores mostrados arriba.${NC}"
    exit 1
fi 