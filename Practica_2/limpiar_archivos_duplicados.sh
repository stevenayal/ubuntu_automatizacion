#!/bin/bash

# Script para limpiar archivos duplicados y mal nombrados
# Ejecutar este script para mantener el directorio organizado

echo "=== LIMPIEZA DE ARCHIVOS DUPLICADOS ==="
echo "Fecha: $(date)"
echo ""

# Listar archivos antes de la limpieza
echo "Archivos antes de la limpieza:"
ls -la *.sh *.txt 2>/dev/null | grep -E "(practica_2|script_corregido)" || echo "No se encontraron archivos para limpiar"

echo ""
echo "Eliminando archivos duplicados y mal nombrados..."

# Eliminar archivos con nombres incorrectos
rm -f "Practica_2ript_corregido.txt" 2>/dev/null
rm -f "Practica_2ractica_2_final.sh" 2>/dev/null
rm -f "Practica_2tica_2_con_screenshots_corregido.sh" 2>/dev/null

# Eliminar archivos duplicados (mantener solo el funcional final)
rm -f "practica_2_corregida.sh" 2>/dev/null
rm -f "practica_2_simple.sh" 2>/dev/null
rm -f "practica_2_screenshots_fixed.sh" 2>/dev/null

echo "✓ Archivos duplicados eliminados"
echo ""

# Listar archivos después de la limpieza
echo "Archivos después de la limpieza:"
ls -la *.sh *.txt 2>/dev/null | grep -E "(practica_2|script_corregido)" || echo "No se encontraron archivos para mostrar"

echo ""
echo "=== ARCHIVO PRINCIPAL RECOMENDADO ==="
echo "✅ practica_2_funcional_final.sh - Script corregido y funcional"
echo ""
echo "Para ejecutar:"
echo "chmod +x practica_2_funcional_final.sh"
echo "./practica_2_funcional_final.sh"
echo ""
echo "=== LIMPIEZA COMPLETADA ===" 