# 🚀 AUTOMATIZACIÓN COMPLETA UBUNTU + ANA_DUARTE

## 📋 Descripción

Este proyecto automatiza completamente la instalación de Ubuntu, la creación del usuario `ana_duarte` y la configuración de un sistema de logging automático. Todo el proceso se ejecuta con un solo comando y genera logs detallados en el archivo `ana_duarte.log`.

## 🎯 Características

- ✅ **Instalación automática de Ubuntu** (actualización del sistema)
- ✅ **Creación del usuario ana_duarte** con directorio home
- ✅ **Instalación de herramientas de desarrollo** (Python, Node.js, npm, etc.)
- ✅ **Herramientas de red** (net-tools, ping, traceroute, nmap)
- ✅ **Herramientas de monitoreo** (htop, iotop, sysstat)
- ✅ **Herramientas de compresión** (p7zip, unrar)
- ✅ **Sistema de logging automático** con logs orgánicos
- ✅ **Entorno personalizado** con aliases y funciones útiles
- ✅ **Directorios de trabajo** organizados (workspace, projects, documents, logs)

## 🚀 Comando de Ejecución

Para ejecutar toda la automatización en un solo comando:

```bash
./ejecutar_automatizacion_ana_duarte.sh
```

## 📁 Archivos del Proyecto

### Scripts Principales
- `automatizacion_completa_ana_duarte.sh` - Script principal de automatización
- `ejecutar_automatizacion_ana_duarte.sh` - Comando de un solo paso
- `automate_ana_duarte_setup.sh` - Script inicial (versión anterior)
- `completar_ana_duarte.sh` - Script de completado
- `finalizar_ana_duarte.sh` - Script de finalización

### Logs y Documentación
- `ana_duarte.log` - Log principal con todos los detalles de la instalación
- `README_AUTOMATIZACION_ANA_DUARTE.md` - Este archivo

## 👤 Información del Usuario Creado

| Campo | Valor |
|-------|-------|
| **Usuario** | ana_duarte |
| **Contraseña** | AnaDuarte2024! |
| **Directorio Home** | /home/ana_duarte |
| **Shell** | /bin/bash |
| **Grupos** | sudo, users |

## 🛠️ Herramientas Instaladas

### Desarrollo
- build-essential
- python3
- python3-pip
- nodejs
- npm

### Red
- net-tools
- iputils-ping
- traceroute
- nmap

### Monitoreo
- htop
- iotop
- sysstat

### Compresión
- p7zip-full
- unrar

### Básicas
- curl
- wget
- git
- vim
- nano
- tree
- unzip
- zip

## 📂 Estructura de Directorios Creados

```
/home/ana_duarte/
├── workspace/     # Área de trabajo
├── projects/      # Proyectos
├── documents/     # Documentos
├── logs/          # Logs de sesión
├── .bashrc        # Configuración personalizada
├── .profile       # Perfil de usuario
├── INFO_ANA_DUARTE.txt    # Información del usuario
└── test_ana_duarte.sh     # Script de prueba
```

## 🎮 Comandos Útiles

### Cambiar al Usuario
```bash
su - ana_duarte
```

### Probar Configuración
```bash
sudo -u ana_duarte bash /home/ana_duarte/test_ana_duarte.sh
```

### Logging Automático
```bash
auto_logger
```

### Ver Logs en Tiempo Real
```bash
tail -f ana_duarte.log
```

### Limpiar Logs Antiguos
```bash
cleanup_logs
```

## 📝 Sistema de Logging

### Log Principal
- **Archivo**: `ana_duarte.log`
- **Contenido**: Registro completo de la instalación y configuración
- **Formato**: Timestamps con colores y categorías

### Logs de Sesión
- **Ubicación**: `/home/ana_duarte/logs/`
- **Formato**: `ana_duarte_YYYYMMDD_HHMMSS.log`
- **Contenido**: Logs orgánicos de cada sesión de usuario

### Comando de Logging
```bash
log_session
```
Inicia una sesión con logging automático usando el comando `script`.

## 🔧 Configuración Personalizada

### Aliases Creados
- `ll` - Listar archivos con detalles
- `la` - Listar archivos ocultos
- `l` - Listar archivos en formato columna
- `..` - Ir al directorio padre
- `...` - Ir dos directorios arriba

### Variables de Entorno
- `EDITOR=nano`
- `VISUAL=nano`
- `PAGER=less`
- `HISTSIZE=10000`
- `HISTFILESIZE=20000`

### Prompt Personalizado
```
ana_duarte:/ruta/actual$ 
```

## 🧪 Pruebas y Verificación

### Script de Prueba
El script `test_ana_duarte.sh` verifica:
- Usuario actual
- Directorio actual
- Archivos y directorios creados
- Herramientas instaladas

### Verificación Manual
```bash
# Verificar usuario
id ana_duarte

# Verificar directorios
ls -la /home/ana_duarte/

# Verificar herramientas
which python3 nodejs npm htop iotop 7z unrar
```

## 📊 Logs Generados

### Ejemplo de Log Principal
```
=== LOG DE AUTOMATIZACIÓN COMPLETA ANA_DUARTE ===
Fecha de inicio: Sat Jul 12 21:00:00 -03 2025
================================================

[2025-07-12 21:00:01] INFO: Verificando requisitos previos...
[2025-07-12 21:00:02] SUCCESS: WSL (Windows Subsystem for Linux) detectado
[2025-07-12 21:00:03] SUCCESS: Permisos de sudo verificados
[2025-07-12 21:00:04] SUCCESS: Conectividad a internet verificada
[2025-07-12 21:00:05] Iniciando actualización del sistema Ubuntu...
...
=== INSTALACIÓN COMPLETADA ===
Usuario: ana_duarte
Contraseña: AnaDuarte2024!
Estado: CONFIGURACIÓN COMPLETA Y EXITOSA
```

## 🚨 Requisitos Previos

- Ubuntu (preferiblemente en WSL)
- Permisos de sudo
- Conectividad a internet
- Espacio en disco: ~2GB

## 🔄 Proceso de Instalación

1. **Verificación de requisitos** - WSL, sudo, internet
2. **Actualización del sistema** - apt update/upgrade
3. **Creación del usuario** - ana_duarte con directorio home
4. **Instalación de herramientas** - Desarrollo, red, monitoreo
5. **Configuración del entorno** - .bashrc, .profile, aliases
6. **Sistema de logging** - Script automático y comandos
7. **Archivos de información** - Documentación y pruebas
8. **Pruebas finales** - Verificación de configuración

## 🎉 Resultado Final

Al completar la automatización, tendrás:

- ✅ Usuario `ana_duarte` completamente configurado
- ✅ Herramientas de desarrollo instaladas
- ✅ Sistema de logging automático funcionando
- ✅ Entorno personalizado con aliases útiles
- ✅ Logs detallados de todo el proceso
- ✅ Documentación completa

## 📞 Soporte

Si encuentras algún problema:

1. Revisa el archivo `ana_duarte.log` para detalles
2. Ejecuta el script de prueba: `test_ana_duarte.sh`
3. Verifica los permisos: `ls -la /home/ana_duarte/`

---

**🎯 ¡Todo listo para usar! Ejecuta `su - ana_duarte` para comenzar.** 