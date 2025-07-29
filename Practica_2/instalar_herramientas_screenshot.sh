#!/bin/bash

# Script para instalar herramientas de captura de pantalla
# Para complementar los screenshots de texto con capturas visuales

echo "=== INSTALANDO HERRAMIENTAS DE CAPTURA DE PANTALLA ==="
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

# Lista de herramientas de captura de pantalla
echo "Instalando herramientas de captura de pantalla..."
echo ""

# scrot (captura de pantalla simple)
instalar_paquete "scrot" "scrot"

# imagemagick (para procesamiento de imágenes)
instalar_paquete "imagemagick" "ImageMagick"

# xvfb (para capturas en modo headless)
instalar_paquete "xvfb" "Xvfb"

# gnome-screenshot (para entornos GNOME)
instalar_paquete "gnome-screenshot" "gnome-screenshot"

# spectacle (para entornos KDE)
instalar_paquete "spectacle" "spectacle"

# Verificar herramientas instaladas
echo "=== VERIFICACIÓN DE HERRAMIENTAS ==="
echo ""

herramientas=("scrot" "convert" "xvfb" "gnome-screenshot" "spectacle")

for herramienta in "${herramientas[@]}"; do
    if comando_existe "$herramienta"; then
        echo "✓ $herramienta disponible"
    else
        echo "✗ $herramienta no disponible"
    fi
done

echo ""
echo "=== CONFIGURACIÓN COMPLETA ==="
echo ""
echo "Herramientas de captura de pantalla instaladas:"
echo "- scrot: Captura de pantalla simple"
echo "- ImageMagick: Procesamiento de imágenes"
echo "- Xvfb: Servidor X virtual (para capturas headless)"
echo "- gnome-screenshot: Para entornos GNOME"
echo "- spectacle: Para entornos KDE"
echo ""
echo "Para usar capturas visuales, ejecute:"
echo "  ./practica_2_con_screenshots.sh"
echo ""
echo "Los screenshots se guardarán en: screenshots_practica2/" 