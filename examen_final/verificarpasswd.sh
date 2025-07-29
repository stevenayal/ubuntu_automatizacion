#!/bin/bash

# =============================================================================
# SCRIPT DE VERIFICACIÓN DE CONTRASEÑAS DÉBILES
# Examen Final - Automatización y Monitoreo en Linux con Bash
# =============================================================================
# 
# Descripción: Este script verifica contraseñas débiles en un archivo passwd
#              utilizando hashcat y registra todos los resultados en un archivo de log
#              con marcas de tiempo.
#
# Uso: ./verificarpasswd.sh <archivo_passwd>
#
# Autor: Estudiante
# Fecha: $(date +%Y-%m-%d)
# =============================================================================

# Función para registrar mensajes en el log con marca de tiempo
log_message() {
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] $1" >> verificarpasswd.log
}

# Función para registrar errores en el log
log_error() {
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] ERROR: $1" >> verificarpasswd.log
}

# Función para mostrar mensaje de inicio
show_banner() {
    echo "=============================================="
    echo "  VERIFICADOR DE CONTRASEÑAS DÉBILES"
    echo "  Examen Final - Automatización Linux"
    echo "=============================================="
    echo ""
}

# =============================================================================
# BLOQUE 1: VALIDACIÓN DE PARÁMETROS
# =============================================================================
log_message "Iniciando ejecución del script verificarpasswd.sh"

# Verificar si se proporcionó el parámetro requerido
if [ $# -eq 0 ]; then
    log_error "No se especificó ningún archivo de entrada"
    echo "Error: Debe especificar un nombre de archivo"
    echo "Uso: $0 <archivo_passwd>"
    log_message "Ejecución terminada con error - parámetros incorrectos"
    exit 1
fi

archivo=$1
log_message "Archivo de entrada especificado: $archivo"

# =============================================================================
# BLOQUE 2: VERIFICACIÓN DE EXISTENCIA DEL ARCHIVO
# =============================================================================
log_message "Verificando existencia del archivo de entrada"

if [ ! -f "$archivo" ]; then
    log_error "El archivo '$archivo' no existe o no es accesible"
    echo "Error: Archivo '$archivo' no se encuentra"
    echo "Verifique que el archivo existe y tiene permisos de lectura"
    log_message "Ejecución terminada con error - archivo no encontrado"
    exit 1
fi

log_message "Archivo '$archivo' encontrado y accesible"

# =============================================================================
# BLOQUE 3: VERIFICACIÓN DE DEPENDENCIAS
# =============================================================================
log_message "Verificando dependencias del sistema"

# Verificar si hashcat está instalado
if [ ! -f "/usr/bin/hashcat" ]; then
    log_error "Hashcat no está instalado en el sistema"
    echo "Error: Hashcat debe estar instalado"
    echo "Instale hashcat ejecutando: sudo apt-get install hashcat"
    log_message "Ejecución terminada con error - hashcat no disponible"
    exit 1
fi

log_message "Hashcat encontrado en /usr/bin/hashcat"

# =============================================================================
# BLOQUE 4: PROCESAMIENTO PRINCIPAL
# =============================================================================
show_banner
log_message "Iniciando verificación de contraseñas débiles"
echo "Verificando contraseñas débiles en $archivo..."
echo "=============================================="

# Contador para usuarios con contraseñas débiles
usuarios_debiles=0
total_usuarios=0

# Procesar cada línea del archivo passwd
while IFS=: read -r usuario hash; do
    # Verificar que la línea no esté vacía y contenga datos válidos
    if [ -n "$usuario" ] && [ -n "$hash" ]; then
        total_usuarios=$((total_usuarios + 1))
        log_message "Procesando usuario: $usuario"
        echo "Verificando usuario: $usuario"
        
        # Crear archivo temporal con el hash para hashcat
        temp_hash_file=$(mktemp)
        echo "$usuario:$hash" > "$temp_hash_file"
        
        # =============================================================================
        # BLOQUE 5: ANÁLISIS CON HASHCAT
        # =============================================================================
        # Configuración de hashcat para detectar contraseñas débiles:
        # -m 1600: formato Apache MD5
        # -a 3: ataque de fuerza bruta
        # ?d?d?d: máscara para dígitos (0-9)
        # --increment: probar longitudes incrementales
        # --increment-min=1: longitud mínima de 1 carácter
        # --increment-max=4: longitud máxima de 4 caracteres (contraseñas débiles)
        # -o /dev/null: no guardar resultados, solo verificar si se encuentra
        
        log_message "Ejecutando hashcat para usuario $usuario"
        result=$(hashcat -m 1600 -a 3 "$temp_hash_file" "?d?d?d" --increment --increment-min=1 --increment-max=4 -o /dev/null 2>/dev/null)
        exit_code=$?
        
        # =============================================================================
        # BLOQUE 6: EVALUACIÓN DE RESULTADOS
        # =============================================================================
        if [ $exit_code -eq 0 ]; then
            # Hashcat encontró la contraseña (contraseña débil)
            log_message "CONTRASEÑA DÉBIL DETECTADA para usuario: $usuario"
            echo "✓ $usuario - CONTRASEÑA DÉBIL DETECTADA"
            usuarios_debiles=$((usuarios_debiles + 1))
        else
            # Hashcat no encontró la contraseña (contraseña segura)
            log_message "Contraseña segura para usuario: $usuario"
            echo "✗ $usuario - Contraseña segura"
        fi
        
        # Limpiar archivo temporal
        rm -f "$temp_hash_file"
        log_message "Archivo temporal eliminado para usuario $usuario"
    else
        log_message "Línea vacía o inválida encontrada, saltando..."
    fi
done < "$archivo"

# =============================================================================
# BLOQUE 7: GENERACIÓN DE REPORTE FINAL
# =============================================================================
echo ""
echo "=============================================="
echo "RESUMEN DE LA VERIFICACIÓN"
echo "=============================================="
echo "Total de usuarios procesados: $total_usuarios"
echo "Usuarios con contraseñas débiles: $usuarios_debiles"
echo "Usuarios con contraseñas seguras: $((total_usuarios - usuarios_debiles))"

# Registrar resumen en el log
log_message "Resumen final - Total usuarios: $total_usuarios, Débiles: $usuarios_debiles"
log_message "Verificación completada exitosamente"

echo ""
echo "Verificación completada."
echo "Consulte el archivo verificarpasswd.log para más detalles."
echo "=============================================="

# =============================================================================
# FIN DEL SCRIPT
# ============================================================================= 