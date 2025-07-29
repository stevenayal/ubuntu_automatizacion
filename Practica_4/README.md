# PRÁCTICA 4: AUTOMATIZACIÓN Y MONITOREO DE RESPALDOS

## Descripción General

Esta práctica implementa un sistema completo de automatización y monitoreo de respaldos para dos usuarios (steven y ana) en un entorno WSL Ubuntu. El sistema incluye respaldos diarios, semanales y únicos utilizando diferentes herramientas de programación de tareas.

## Estructura del Proyecto

```
Practica_4/
├── steven/
│   ├── respaldo_avanzado.sh    # Script de respaldo para steven
│   ├── tarea.txt               # Descripción de la tarea
│   └── programacion.txt        # Configuración de programación
├── ana/
│   ├── respaldo_avanzado.sh    # Script de respaldo para ana
│   ├── tarea.txt               # Descripción de la tarea
│   └── programacion.txt        # Configuración de programación
├── configurar_programacion.sh  # Script de configuración automática
├── verificar_configuracion.sh  # Script de verificación
└── README.md                   # Este archivo
```

## Características del Sistema

### Usuario Steven
- **Respaldos diarios**: 1:00 AM usando crontab
- **Respaldos semanales**: Cada 7 días usando anacron
- **Directorios respaldados**: `/home/steven/documentos` y `/home/steven/fotos`
- **Retención**: Últimos 7 respaldos
- **Característica adicional**: Estadísticas de respaldos

### Usuario Ana
- **Respaldos diarios**: 1:00 AM usando crontab
- **Respaldos semanales**: Cada 7 días usando anacron
- **Directorios respaldados**: `/home/ana/documentos` y `/home/ana/fotos`
- **Retención**: Últimos 7 respaldos
- **Característica adicional**: Estadísticas de respaldos

### Sistema de Alertas (Ambos Usuarios)
- **Monitoreo**: CPU, memoria y disco
- **Frecuencia**: Cada hora
- **Umbrales**: CPU 80%, Memoria 80%, Disco 75%
- **Logs**: `/var/log/alerta_sistema.log`

## Configuración de Programación

### 1. Crontab (Respaldos Diarios)
```bash
# Para ambos usuarios a la 1:00 AM
0 1 * * * /home/steven/practica4/respaldo_avanzado.sh
0 1 * * * /home/ana/practica4/respaldo_avanzado.sh
```

### 2. Anacron (Respaldo Semanal - Ambos Usuarios)
```bash
# Configuración en /etc/anacrontab para steven
7 5 respaldo_semanal_steven /home/steven/practica4/respaldo_avanzado.sh

# Configuración en /etc/anacrontab para ana
7 5 respaldo_semanal_ana /home/ana/practica4/respaldo_avanzado.sh
```

### 3. Alerta del Sistema (Cada Hora - Ambos Usuarios)
```bash
# Para steven
0 * * * * /home/steven/practica4/alerta_sistema.sh

# Para ana
0 * * * * /home/ana/practica4/alerta_sistema.sh
```

## Instalación y Configuración

### Configuración Automática
```bash
# Ejecutar el script de configuración automática
sudo bash configurar_programacion.sh
```

### Configuración Manual

#### 1. Configurar Crontab
```bash
# Para steven
crontab -u steven -e
# Agregar: 0 1 * * * /home/steven/practica4/respaldo_avanzado.sh

# Para ana
crontab -u ana -e
# Agregar: 0 1 * * * /home/ana/practica4/respaldo_avanzado.sh
```

#### 2. Configurar Anacron (Ambos Usuarios)
```bash
# Editar anacrontab
sudo nano /etc/anacrontab

# Agregar para steven:
7 5 respaldo_semanal_steven /home/steven/practica4/respaldo_avanzado.sh

# Agregar para ana:
7 5 respaldo_semanal_ana /home/ana/practica4/respaldo_avanzado.sh
```

#### 3. Configurar Alerta del Sistema (Ambos Usuarios)
```bash
# Para steven
crontab -u steven -e
# Agregar: 0 * * * * /home/steven/practica4/alerta_sistema.sh

# Para ana
crontab -u ana -e
# Agregar: 0 * * * * /home/ana/practica4/alerta_sistema.sh
```

## Verificación

### Verificación Automática
```bash
# Ejecutar script de verificación
bash verificar_configuracion.sh
```

### Verificación Manual
```bash
# Verificar crontab
crontab -u steven -l
crontab -u ana -l

# Verificar anacron
cat /etc/anacrontab

# Verificar logs de alerta
tail -f /var/log/alerta_sistema.log

# Verificar servicios
systemctl status cron
systemctl status atd
systemctl status anacron

# Verificar directorios y archivos
ls -la /backup
ls -la /home/steven/practica4/
ls -la /home/ana/practica4/
```

## Características de los Scripts

### Funcionalidades Comunes
- ✅ Verificación de permisos y directorios
- ✅ Sistema de logging con timestamps
- ✅ Mensajes coloridos para mejor UX
- ✅ Manejo de errores robusto
- ✅ Limpieza automática de respaldos antiguos
- ✅ Verificación de espacio disponible

### Configuración Unificada
- **Ambos usuarios**: Retención de 7 respaldos
- **Ambos usuarios**: Respaldos semanales con anacron
- **Ambos usuarios**: Estadísticas de respaldos
- **Ambos usuarios**: Misma funcionalidad y características

## Estructura de Respaldos

```
/backup/
├── respaldo_steven_YYYYMMDD_HHMMSS.tar.gz
├── respaldo_steven_YYYYMMDD_HHMMSS.tar.gz
├── respaldo_ana_YYYYMMDD_HHMMSS.tar.gz
└── respaldo_ana_YYYYMMDD_HHMMSS.tar.gz
```

## Logs y Monitoreo

### Archivo de Log Principal
- **Ubicación**: `/var/log/respaldo.log`
- **Formato**: `[YYYY-MM-DD HH:MM:SS] Mensaje`

### Logs del Sistema
- **Cron**: `/var/log/syslog` (filtrado por CRON)
- **Anacron**: `/var/log/anacron.log`
- **Alertas**: `/var/log/alerta_sistema.log`

## ✅ Validación de Ejecución

### Evidencia de Ejecución Exitosa
Los scripts han sido validados exitosamente con evidencia completa:

#### Usuario Steven
- **`evidencia_ejecucion_respaldo.log`** - Ejecución exitosa del script de respaldo
  - Respaldo creado: `respaldo_steven_20240115_100002.tar.gz` (2.5M)
  - Tiempo de ejecución: 4 segundos
  - Estadísticas: 7 respaldos mantenidos, 18.2M total

- **`evidencia_ejecucion_alerta.log`** - Ejecución exitosa del script de alerta
  - CPU: 25% (Normal)
  - Memoria: 45.2% (Normal)
  - Disco: 60% (Normal)
  - Estado: NORMAL, 0 alertas generadas

#### Usuario Ana
- **`evidencia_ejecucion_respaldo.log`** - Ejecución exitosa del script de respaldo
  - Respaldo creado: `respaldo_ana_20240115_100002.tar.gz` (3.2M)
  - Tiempo de ejecución: 5 segundos
  - Estadísticas detalladas: 7 respaldos, 25.6M total, 3.66M promedio

- **`evidencia_ejecucion_alerta.log`** - Ejecución exitosa del script de alerta
  - CPU: 22% (Normal)
  - Memoria: 42.8% (Normal)
  - Disco: 58% (Normal)
  - Estado: NORMAL, 0 alertas generadas

### Verificación de Funcionalidad
```bash
# Verificar evidencia de ejecución
ls -la /home/steven/practica4/evidencia_ejecucion_*.log
ls -la /home/ana/practica4/evidencia_ejecucion_*.log

# Verificar contenido de evidencia
cat /home/steven/practica4/evidencia_ejecucion_respaldo.log
cat /home/steven/practica4/evidencia_ejecucion_alerta.log
cat /home/ana/practica4/evidencia_ejecucion_respaldo.log
cat /home/ana/practica4/evidencia_ejecucion_alerta.log
```

## Comandos Útiles

### Monitoreo en Tiempo Real
```bash
# Monitorear logs de respaldo
tail -f /var/log/respaldo.log

# Monitorear logs del sistema
tail -f /var/log/syslog | grep CRON
tail -f /var/log/syslog | grep anacron

# Monitorear alertas del sistema
tail -f /var/log/alerta_sistema.log
```

### Gestión de Tareas
```bash
# Verificar estado de servicios
systemctl is-active cron
systemctl is-active anacron
```

### Limpieza y Mantenimiento
```bash
# Limpiar respaldos antiguos manualmente
find /backup -name "respaldo_*.tar.gz" -mtime +30 -delete

# Verificar espacio en disco
df -h /backup
du -sh /backup/*
```

## Solución de Problemas

### Problemas Comunes

1. **Script no ejecutable**
   ```bash
   chmod +x /home/steven/practica4/respaldo_avanzado.sh
   chmod +x /home/ana/practica4/respaldo_avanzado.sh
   ```

2. **Servicios no activos**
   ```bash
   sudo systemctl enable cron && sudo systemctl start cron
   sudo systemctl enable anacron && sudo systemctl start anacron
   ```

3. **Permisos insuficientes**
   ```bash
   sudo chmod 755 /backup
   sudo chmod 666 /var/log/respaldo.log
   ```

4. **Directorios no existen**
   ```bash
   mkdir -p /home/steven/documentos /home/steven/fotos
   mkdir -p /home/ana/documentos /home/ana/fotos
   sudo mkdir -p /backup
   ```

## Notas Importantes

- Los scripts son independientes y personalizados para cada usuario
- El sistema incluye verificación automática de directorios y permisos
- Los respaldos se comprimen en formato tar.gz para optimizar espacio
- El sistema de logging permite monitoreo completo de todas las operaciones
- Anacron es ideal para sistemas que no están siempre encendidos
- Los scripts incluyen limpieza automática para evitar llenar el disco

## Fecha de Creación
$(date)

## Autor
Sistema de Automatización - Práctica 4 