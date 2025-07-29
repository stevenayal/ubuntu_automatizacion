# Práctica 2 - Criptografía y Hashing - Automatización Completa

## 📋 Descripción

Este script automatiza completamente todos los ejercicios de la Práctica 2 sobre criptografía y hashing en Linux. Genera automáticamente un documento de texto con todos los comandos ejecutados, resultados, análisis y respuestas a las preguntas planteadas.

## 🎯 Ejercicios Automatizados

### Ejercicio 1: Encriptación AES
- ✅ Crear directorio "ejercicio1"
- ✅ Crear archivo plaintext con `ls -R /`
- ✅ Encriptar con AES-128-CBC → archivo "cifrado"
- ✅ Encriptar con AES-128-ECB → archivo "cifrado-ecb"
- ✅ Mostrar contenido de archivos cifrados
- ✅ Comparar tamaños de archivos

### Ejercicio 2: Encriptación de Archivos Grandes
- ✅ Crear directorio "ejercicio2"
- ✅ Descargar archivo de prueba (200MB.zip)
- ✅ Encriptar con AES-128-CBC y medir tiempo
- ✅ Comparar tiempos de diferentes algoritmos:
  - DES3
  - AES-128-CBC
  - AES-192-CBC
  - AES-256-CBC
- ✅ Desencriptar y medir tiempo
- ✅ Verificar integridad del archivo desencriptado

### Ejercicio 3: Hashing y Verificación
- ✅ Crear directorio "ejercicio3"
- ✅ Generar hashes SHA1 de 5 textos diferentes
- ✅ Descargar instalador y verificar MD5
- ✅ Generar hash SHA256 y verificar
- ✅ Mostrar todos los hashes generados

## 📁 Archivos Generados

### Archivo Principal de Resultados
- **`practica2_resultados.txt`**: Documento completo con todos los comandos, resultados y análisis

### Capturas de Pantalla
- **`screenshots_practica2/`**: Carpeta con capturas de pantalla de cada paso
- Archivos de captura: `screenshot_ej1_*.txt`, `screenshot_ej2_*.txt`, `screenshot_ej3_*.txt`

### Directorios de Trabajo
- **`ejercicio1/`**: Archivos del ejercicio 1
- **`ejercicio2/`**: Archivos del ejercicio 2  
- **`ejercicio3/`**: Archivos del ejercicio 3

## 🚀 Cómo Ejecutar

### En Ubuntu/Linux:
```bash
cd Practica_2
chmod +x ejecutar_practica2_completa.sh
./ejecutar_practica2_completa.sh
```

### En WSL (Windows Subsystem for Linux):
```bash
cd /mnt/z/Proyectos/ubuntu_automatizacion/Practica_2
chmod +x ejecutar_practica2_completa.sh
./ejecutar_practica2_completa.sh
```

## 📊 Contenido del Reporte

El archivo `practica2_resultados.txt` incluye:

### 1. Información del Sistema
- Fecha y hora de ejecución
- Información del sistema operativo
- Versión de OpenSSL

### 2. Ejercicio 1 - Encriptación AES
- Comandos ejecutados con resultados
- Comparación de archivos cifrados (CBC vs ECB)
- Análisis de tamaños de archivos

### 3. Ejercicio 2 - Archivos Grandes
- Tiempos de encriptación para cada algoritmo
- Tabla comparativa de rendimiento
- Análisis de encriptación vs desencriptación

### 4. Ejercicio 3 - Hashing
- Hashes SHA1 de diferentes textos
- Verificación MD5 y SHA256
- Análisis de propiedades de hash

### 5. Análisis y Respuestas
- Respuestas a todas las preguntas planteadas
- Comparación de algoritmos
- Explicaciones técnicas

## 🔧 Características del Script

### Funciones Automáticas
- ✅ Creación automática de directorios
- ✅ Manejo de errores y fallbacks
- ✅ Captura de pantalla de cada comando
- ✅ Medición de tiempos de ejecución
- ✅ Verificación de integridad de archivos
- ✅ Generación de reporte completo

### Manejo de Errores
- Si no se puede descargar el archivo original, crea uno de prueba
- Si `ls -R /` falla, usa `/home` o crea contenido de prueba
- Verifica que todos los comandos se ejecuten correctamente

### Seguridad
- Usa contraseñas de prueba seguras
- No expone información sensible
- Limpia archivos temporales

## 📝 Estructura del Reporte

```
PRÁCTICA 2 - CRIPTOGRAFÍA Y HASHING
====================================

EJERCICIO 1: ENCRIPTACIÓN AES
==============================
=== Creando directorio ejercicio1 ===
Comando ejecutado: mkdir -p ejercicio1 && cd ejercicio1
Resultado:
[resultado del comando]

=== Creando archivo plaintext ===
Comando ejecutado: ls -R /home > plaintext
Resultado:
[resultado del comando]

[... continúa con todos los ejercicios ...]

ANÁLISIS Y RESPUESTAS
=====================
1. ¿Hay alguna diferencia notable al comparar el tiempo de encriptación vs desencriptación?
RESPUESTA: [análisis detallado]

[... más preguntas y respuestas ...]
```

## 🎓 Preguntas Respondidas

El script responde automáticamente a todas las preguntas planteadas:

1. **¿Hay alguna diferencia notable al comparar el tiempo de encriptación vs desencriptación?**
2. **¿Por qué los hashes SHA1 siempre tienen la misma longitud?**
3. **¿Cuál es la diferencia entre MD5 y SHA256?**
4. **¿Cuál es la diferencia entre CBC y ECB en AES?**

## 📈 Tabla de Tiempos

El script genera automáticamente una tabla con los tiempos de ejecución:

| Algoritmo    | Tiempo de Encriptación | Tiempo de Desencriptación |
|--------------|----------------------|---------------------------|
| DES3         | [tiempo medido]      | [tiempo medido]           |
| AES-128-CBC  | [tiempo medido]      | [tiempo medido]           |
| AES-192-CBC  | [tiempo medido]      | [tiempo medido]           |
| AES-256-CBC  | [tiempo medido]      | [tiempo medido]           |

## 🔍 Verificación de Resultados

Para verificar que todo funcionó correctamente:

```bash
# Ver el reporte completo
cat practica2_resultados.txt

# Ver las capturas de pantalla
ls -la screenshots_practica2/

# Verificar que los archivos se crearon
ls -la ejercicio1/ ejercicio2/ ejercicio3/
```

## ⚠️ Notas Importantes

1. **Ejecutar en Linux/Ubuntu**: Este script está diseñado para sistemas Linux
2. **Permisos**: Asegúrate de que el script tenga permisos de ejecución
3. **Espacio en disco**: Se crearán varios archivos, asegúrate de tener espacio suficiente
4. **Conexión a internet**: Necesaria para descargar archivos de prueba
5. **OpenSSL**: Debe estar instalado en el sistema

## 🎯 Resultado Final

Al finalizar la ejecución, tendrás:
- ✅ Un documento de texto completo con todos los resultados
- ✅ Capturas de pantalla de cada paso
- ✅ Análisis técnico detallado
- ✅ Respuestas a todas las preguntas
- ✅ Comparación de algoritmos de encriptación
- ✅ Verificación de integridad de archivos

**¡Listo para entregar como respuesta a la actividad!** 