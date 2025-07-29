#!/bin/bash

# =============================================================================
# SCRIPT DE CONFIGURACIÓN Y SETUP
# Examen Final - Automatización y Monitoreo en Linux con Bash
# =============================================================================
#
# Descripción: Este script configura el entorno para la ejecución del
#              verificador de contraseñas débiles, creando archivos necesarios
#              y asignando permisos apropiados.
#
# Autor: Estudiante
# Fecha: $(date +%Y-%m-%d)
# =============================================================================

echo "=============================================="
echo "  CONFIGURACIÓN DEL ENTORNO"
echo "  Examen Final - Automatización Linux"
echo "=============================================="
echo ""

# Obtener el directorio actual
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Directorio de trabajo: $SCRIPT_DIR"
echo ""

# =============================================================================
# BLOQUE 1: CREACIÓN DEL ARCHIVO DE LOG
# =============================================================================
echo "1. Configurando archivo de log..."

# Crear el archivo de log si no existe
if [ ! -f "verificarpasswd.log" ]; then
    echo "   Creando archivo verificarpasswd.log..."
    touch verificarpasswd.log
    echo "   ✓ Archivo verificarpasswd.log creado exitosamente"
else
    echo "   ✓ Archivo verificarpasswd.log ya existe"
fi

# =============================================================================
# BLOQUE 2: ASIGNACIÓN DE PERMISOS AL SCRIPT PRINCIPAL
# =============================================================================
echo ""
echo "2. Configurando permisos del script principal..."

# Verificar si el script principal existe
if [ -f "verificarpasswd.sh" ]; then
    # Asignar permisos de ejecución (755)
    chmod 755 verificarpasswd.sh
    echo "   ✓ Permisos de ejecución asignados a verificarpasswd.sh"
    
    # Mostrar permisos actuales
    echo "   Permisos actuales: $(ls -la verificarpasswd.sh | awk '{print $1}')"
else
    echo "   ✗ ERROR: No se encontró el archivo verificarpasswd.sh"
    echo "   Asegúrese de que el script principal esté en el mismo directorio"
    exit 1
fi

# =============================================================================
# BLOQUE 3: ASIGNACIÓN DE PERMISOS AL ARCHIVO DE LOG
# =============================================================================
echo ""
echo "3. Configurando permisos del archivo de log..."

# Asignar permisos 644 al archivo de log
chmod 644 verificarpasswd.log
echo "   ✓ Permisos 644 asignados a verificarpasswd.log"

# Mostrar permisos actuales
echo "   Permisos actuales: $(ls -la verificarpasswd.log | awk '{print $1}')"

# =============================================================================
# BLOQUE 4: VERIFICACIÓN DE DEPENDENCIAS
# =============================================================================
echo ""
echo "4. Verificando dependencias del sistema..."

# Verificar si hashcat está disponible
if command -v hashcat >/dev/null 2>&1; then
    echo "   ✓ Hashcat está instalado"
    echo "   Versión: $(hashcat --version | head -n1)"
else
    echo "   ⚠ ADVERTENCIA: Hashcat no está instalado"
    echo "   Para instalar hashcat ejecute: sudo apt-get install hashcat"
    echo "   El script verificarpasswd.sh verificará esta dependencia al ejecutarse"
fi

# =============================================================================
# BLOQUE 5: VERIFICACIÓN FINAL
# =============================================================================
echo ""
echo "5. Verificación final de la configuración..."

# Listar archivos en el directorio
echo "   Archivos en el directorio actual:"
ls -la *.sh *.log 2>/dev/null || echo "   No se encontraron archivos .sh o .log"

# Verificar que todo esté configurado correctamente
echo ""
echo "=============================================="
echo "RESUMEN DE LA CONFIGURACIÓN"
echo "=============================================="

if [ -f "verificarpasswd.sh" ] && [ -x "verificarpasswd.sh" ]; then
    echo "✓ Script principal: verificarpasswd.sh (ejecutable)"
else
    echo "✗ Script principal: verificarpasswd.sh (problema con permisos)"
fi

if [ -f "verificarpasswd.log" ] && [ -r "verificarpasswd.log" ]; then
    echo "✓ Archivo de log: verificarpasswd.log (legible)"
else
    echo "✗ Archivo de log: verificarpasswd.log (problema con permisos)"
fi

if command -v hashcat >/dev/null 2>&1; then
    echo "✓ Dependencia: hashcat (disponible)"
else
    echo "⚠ Dependencia: hashcat (requiere instalación)"
fi

echo ""
echo "Configuración completada."
echo "Para ejecutar el script: ./verificarpasswd.sh <archivo_passwd>"
echo "==============================================" 