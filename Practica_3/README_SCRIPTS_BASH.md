# Scripts de BASH - Práctica 3

## Descripción General

Esta práctica implementa dos scripts de BASH para generar y verificar contraseñas:

1. **`generararchivo.sh`**: Genera un archivo de contraseñas con usuarios que tienen contraseñas débiles y normales
2. **`verificarpasswd.sh`**: Verifica qué usuarios tienen contraseñas débiles usando hashcat

## Explicación Detallada de Comandos

### Comandos en `generararchivo.sh`

#### Generación de Contraseñas Aleatorias
```bash
head -c 500 /dev/urandom | tr -dc '0-9' | cut -c -3
```
- `head -c 500 /dev/urandom`: Lee 500 bytes de datos aleatorios del dispositivo `/dev/urandom`
- `tr -dc '0-9'`: Elimina todos los caracteres excepto dígitos (0-9)
- `cut -c -3`: Toma solo los primeros 3 caracteres

```bash
head -c 500 /dev/urandom | tr -dc 'a-zA-Z0-9' | cut -c -10
```
- Similar al anterior, pero incluye letras y números, y toma 10 caracteres

#### Creación de Usuarios con htpasswd
```bash
htpasswd -b -c archivo usuario contraseña
```
- `htpasswd`: Herramienta para crear archivos de contraseñas en formato Apache
- `-b`: Modo batch (no interactivo)
- `-c`: Crear archivo nuevo (solo para el primer usuario)

### Comandos en `verificarpasswd.sh`

#### Procesamiento de Archivos
```bash
while IFS=: read -r usuario hash; do
```
- `IFS=:`: Establece el separador de campos como ":"
- `read -r usuario hash`: Lee dos variables separadas por ":"

#### Verificación con Hashcat
```bash
hashcat -m 1600 -a 3 archivo_hash "?d?d?d" --increment --increment-min=1 --increment-max=4
```
- `hashcat`: Herramienta para crackear hashes
- `-m 1600`: Modo Apache MD5
- `-a 3`: Ataque de fuerza bruta
- `?d?d?d`: Máscara para probar solo dígitos
- `--increment`: Probar longitudes incrementales
- `--increment-min=1`: Longitud mínima
- `--increment-max=4`: Longitud máxima

## Archivos Incluidos

### Scripts Principales
- `generararchivo.sh`: Script principal para generar archivo de contraseñas
- `verificarpasswd.sh`: Script para verificar contraseñas débiles

### Scripts de Utilidad
- `instalar_dependencias.sh`: Script para instalar herramientas necesarias
- `ejecutar_prueba_completa.sh`: Script de prueba completa
- `limpiar_archivos.sh`: Script para limpiar archivos generados

### Scripts de Pruebas Unitarias
- `prueba_comandos_individuales.sh`: Prueba comandos individuales utilizados
- `pruebas_simples.sh`: Pruebas básicas sin dependencias externas
- `pruebas_unitarias.sh`: Pruebas unitarias completas con rendimiento
- `ejecutar_todas_las_pruebas.sh`: Script maestro que ejecuta todas las pruebas

### Documentación
- `comandos_bash.txt`: Especificaciones originales
- `README_SCRIPTS_BASH.md`: Este archivo de documentación

## Instalación y Uso

### 1. Instalar Dependencias
```bash
chmod +x instalar_dependencias.sh
./instalar_dependencias.sh
```

### 2. Ejecutar Prueba Completa
```bash
chmod +x ejecutar_prueba_completa.sh
./ejecutar_prueba_completa.sh
```

### 3. Uso Individual

#### Generar archivo de contraseñas:
```bash
chmod +x generararchivo.sh
./generararchivo.sh 5 3
```
- Parámetro 1: Total de usuarios (5)
- Parámetro 2: Usuarios con contraseñas débiles (3)

#### Verificar contraseñas débiles:
```bash
chmod +x verificarpasswd.sh
./verificarpasswd.sh passwd.txt
```

### 4. Ejecutar Pruebas Unitarias

#### Ejecutar todas las pruebas:
```bash
chmod +x ejecutar_todas_las_pruebas.sh
./ejecutar_todas_las_pruebas.sh
```

#### Ejecutar pruebas individuales:
```bash
# Pruebas de comandos individuales
./prueba_comandos_individuales.sh

# Pruebas simples (sin dependencias externas)
./pruebas_simples.sh

# Pruebas unitarias completas
./pruebas_unitarias.sh

# Prueba de integración
./ejecutar_prueba_completa.sh
```

### 5. Limpiar archivos generados:
```bash
./limpiar_archivos.sh
```

## Validaciones Implementadas

### En `generararchivo.sh`:
- ✅ Verificación de número de parámetros
- ✅ Validación de que total > débiles
- ✅ Verificación de instalación de htpasswd
- ✅ Manejo de archivos existentes

### En `verificarpasswd.sh`:
- ✅ Verificación de parámetros
- ✅ Validación de existencia del archivo
- ✅ Verificación de instalación de hashcat
- ✅ Procesamiento seguro de archivos

## Formato de Salida

### Archivo passwd.txt generado:
```
usuario1:$apr1$hash1$contraseña1
usuario2:$apr1$hash2$contraseña2
usuario3:$apr1$hash3$contraseña3
usuario4:$apr1$hash4$contraseña4
usuario5:$apr1$hash5$contraseña5
```

### Salida de verificación:
```
Verificando usuario: usuario1
✓ usuario1 - CONTRASEÑA DÉBIL DETECTADA
Verificando usuario: usuario2
✓ usuario2 - CONTRASEÑA DÉBIL DETECTADA
...
```

## Notas Técnicas

1. **Contraseñas Débiles**: 3 caracteres, solo números
2. **Contraseñas Normales**: 10 caracteres, alfanuméricas
3. **Formato de Hash**: Apache MD5 (modo 1600 en hashcat)
4. **Límite de Verificación**: Hasta 4 caracteres para detectar débiles

## Pruebas Unitarias

### Tipos de Pruebas Implementadas

1. **Pruebas de Comandos Individuales**: Verifican que cada comando utilizado funcione correctamente
2. **Pruebas Simples**: Validaciones básicas sin dependencias externas
3. **Pruebas Unitarias Completas**: Pruebas exhaustivas con medición de rendimiento
4. **Pruebas de Integración**: Verifican que los scripts trabajen juntos correctamente

### Cobertura de Pruebas

- ✅ Validación de parámetros
- ✅ Verificación de dependencias
- ✅ Generación de archivos
- ✅ Procesamiento de datos
- ✅ Manejo de errores
- ✅ Rendimiento básico
- ✅ Integración entre scripts

### Ejecución de Pruebas

```bash
# Ejecutar todas las pruebas
./ejecutar_todas_las_pruebas.sh

# Ver resultados detallados
./pruebas_simples.sh
```

## Solución de Problemas

### Error: "htpasswd no está instalado"
```bash
sudo apt-get install apache2-utils
```

### Error: "Hashcat debe estar instalado"
```bash
sudo apt-get install hashcat
```

### Error de permisos
```bash
chmod +x *.sh
```

### Error en pruebas unitarias
```bash
# Verificar que todas las dependencias estén instaladas
./instalar_dependencias.sh

# Ejecutar pruebas simples primero
./pruebas_simples.sh
``` 