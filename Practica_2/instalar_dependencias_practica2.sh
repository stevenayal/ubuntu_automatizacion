#!/bin/bash

# Script para instalar dependencias necesarias para la Práctica 2
# Este script verifica e instala las herramientas necesarias

echo "=== INSTALANDO DEPENDENCIAS PARA PRÁCTICA 2 ==="
echo ""

# Función para verificar si un comando existe
comando_existe() {
    command -v "$1" &> /dev/null
}

# Función para instalar paquete
instalar_paquete() {
    local paquete=$1
    local nombre=$2
    
    echo "Verificando $nombre..."
    if comando_existe "$paquete"; then
        echo "✓ $nombre ya está instalado"
    else
        echo "✗ $nombre no está instalado. Instalando..."
        
        # Detectar sistema operativo
        if [ -f /etc/debian_version ]; then
            # Debian/Ubuntu
            sudo apt-get update
            sudo apt-get install -y "$paquete"
        elif [ -f /etc/redhat-release ]; then
            # Red Hat/CentOS/Fedora
            sudo yum install -y "$paquete" || sudo dnf install -y "$paquete"
        elif [ -f /etc/arch-release ]; then
            # Arch Linux
            sudo pacman -S --noconfirm "$paquete"
        else
            echo "Sistema operativo no reconocido. Instale manualmente: $paquete"
        fi
    fi
    echo ""
}

# Lista de paquetes necesarios
echo "Verificando e instalando paquetes necesarios..."
echo ""

# OpenSSL (para encriptación)
instalar_paquete "openssl" "OpenSSL"

# wget (para descargas)
instalar_paquete "wget" "wget"

# bc (para cálculos matemáticos)
instalar_paquete "bc" "bc"

# xxd (para visualización hexadecimal)
instalar_paquete "xxd" "xxd"

# Verificar herramientas de hash (generalmente vienen con el sistema)
echo "Verificando herramientas de hash..."
if comando_existe "sha1sum"; then
    echo "✓ sha1sum disponible"
else
    echo "✗ sha1sum no disponible"
fi

if comando_existe "md5sum"; then
    echo "✓ md5sum disponible"
else
    echo "✗ md5sum no disponible"
fi

if comando_existe "sha256sum"; then
    echo "✓ sha256sum disponible"
else
    echo "✗ sha256sum no disponible"
fi

echo ""

# Verificar permisos de ejecución
echo "Configurando permisos de ejecución..."
chmod +x practica_2_automatizada.sh
chmod +x generar_reporte_practica2.sh
echo "✓ Permisos configurados"
echo ""

# Crear directorio de trabajo si no existe
echo "Creando directorio de trabajo..."
mkdir -p practica2_trabajo
echo "✓ Directorio practica2_trabajo creado"
echo ""

# Verificación final
echo "=== VERIFICACIÓN FINAL ==="
echo ""

# Verificar OpenSSL
if comando_existe "openssl"; then
    echo "✓ OpenSSL: $(openssl version)"
else
    echo "✗ OpenSSL no disponible"
fi

# Verificar wget
if comando_existe "wget"; then
    echo "✓ wget disponible"
else
    echo "✗ wget no disponible"
fi

# Verificar bc
if comando_existe "bc"; then
    echo "✓ bc disponible"
else
    echo "✗ bc no disponible"
fi

# Verificar xxd
if comando_existe "xxd"; then
    echo "✓ xxd disponible"
else
    echo "✗ xxd no disponible"
fi

echo ""
echo "=== INSTALACIÓN COMPLETADA ==="
echo ""
echo "Para ejecutar la práctica automatizada:"
echo "  ./practica_2_automatizada.sh"
echo ""
echo "Para generar el reporte completo:"
echo "  ./generar_reporte_practica2.sh"
echo ""
echo "Los archivos se crearán en el directorio actual." 