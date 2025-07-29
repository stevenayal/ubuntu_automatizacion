# Práctica 2 - Script Corregido con Screenshots

## 📋 Descripción

Este script (`practica_2_funcional_final.sh`) es la versión corregida del script original que tenía múltiples errores. Ahora funciona correctamente y captura automáticamente screenshots de todos los ejercicios de la Práctica 2.

## 🔧 Errores Corregidos

### ❌ **Errores Originales:**
1. **Error de Directorio:** `No such file or directory` para archivos de screenshots
2. **Rutas Relativas Incorrectas:** Problemas al cambiar de directorio
3. **Funciones con Errores:** Typos y sintaxis incorrecta
4. **Timestamps Duplicados:** Múltiples timestamps en la misma función
5. **Variables No Definidas:** Problemas con comillas y variables

### ✅ **Soluciones Implementadas:**
1. **Directorio Creado Correctamente:** `mkdir -p "$SCREENSHOT_DIR"`
2. **Rutas Absolutas:** Uso de `$(pwd)` y rutas completas
3. **Funciones Corregidas:** Sintaxis correcta y nombres apropiados
4. **Timestamps Únicos:** Un timestamp por screenshot
5. **Variables Bien Definidas:** Comillas correctas y sintaxis apropiada

## 🚀 Cómo Usar

### 1. **En Ubuntu/WSL:**
```bash
cd Practica_2
chmod +x practica_2_funcional_final.sh
./practica_2_funcional_final.sh
```

### 2. **En Windows PowerShell:**
```powershell
cd Practica_2
wsl bash practica_2_funcional_final.sh
```

## 📁 Estructura del Script

### **Configuración:**
- `PASSWORD="practica2024"` - Contraseña fija (oculta información personal)
- `SCREENSHOT_DIR="screenshots_practica2"` - Directorio para screenshots

### **Funciones Principales:**
1. **`crear_screenshot(numero, descripcion)`** - Crea un nuevo archivo de screenshot
2. **`agregar_contenido(archivo, contenido)`** - Agrega contenido al screenshot

### **Ejercicios Automatizados:**
1. **Ejercicio 1:** Encriptación AES CBC y ECB
2. **Ejercicio 2:** Comparación de algoritmos de encriptación
3. **Ejercicio 3:** Generación y verificación de hashes

## 📸 Screenshots Generados

El script crea 15 screenshots numerados:

1. `screenshot_01_*` - Inicio Ejercicio 1
2. `screenshot_02_*` - Archivo plaintext
3. `screenshot_03_*` - Encriptación AES-128-CBC
4. `screenshot_04_*` - Encriptación AES-128-ECB
5. `screenshot_05_*` - Inicio Ejercicio 2
6. `screenshot_06_*` - Archivo de prueba
7. `screenshot_07_*` - Encriptación múltiples algoritmos
8. `screenshot_08_*` - Tabla de tiempos
9. `screenshot_09_*` - Desencriptación
10. `screenshot_10_*` - Inicio Ejercicio 3
11. `screenshot_11_*` - Hashes SHA1
12. `screenshot_12_*` - Archivo TeamPasswordManager
13. `screenshot_13_*` - Verificación MD5
14. `screenshot_14_*` - Verificación SHA256
15. `screenshot_15_*` - Resumen Final

## 🔒 Características de Seguridad

- **Contraseña Ocultada:** No se muestra la contraseña en los screenshots
- **Información Personal Protegida:** Solo se captura información técnica
- **Archivos Seguros:** Los archivos cifrados se crean correctamente

## 📊 Resultados Esperados

### **Ejercicio 1:**
- Archivo plaintext creado
- Archivos cifrados AES-128-CBC y AES-128-ECB
- Screenshots de cada paso

### **Ejercicio 2:**
- Archivo de prueba de 10MB
- Comparación de tiempos de encriptación (3DES, AES-128/192/256)
- Tabla de rendimiento
- Desencriptación exitosa

### **Ejercicio 3:**
- Hashes SHA1 de 5 textos diferentes
- Archivo TeamPasswordManager de prueba
- Verificación MD5 y SHA256 exitosa

## 🛠️ Requisitos

- **Sistema Operativo:** Ubuntu, WSL, o Linux
- **Herramientas:** OpenSSL, bc, dd, sha1sum, md5sum, sha256sum
- **Permisos:** Ejecución del script

## 📝 Notas Importantes

1. **Ejecutar en Ubuntu/WSL:** El script está diseñado para Linux
2. **Tiempo de Ejecución:** Aproximadamente 2-3 minutos
3. **Espacio en Disco:** Se crean archivos temporales de ~10MB
4. **Screenshots:** Se guardan en `screenshots_practica2/`

## 🎯 Beneficios

- ✅ **Sin Errores:** Script completamente funcional
- ✅ **Documentación Automática:** Screenshots de cada paso
- ✅ **Reproducible:** Resultados consistentes
- ✅ **Seguro:** Información personal protegida
- ✅ **Completo:** Todos los ejercicios automatizados

## 🔍 Verificación

Al finalizar, el script mostrará:
- Lista de todos los screenshots creados
- Total de archivos generados
- Confirmación de completación exitosa

---

**Script creado y corregido para la Práctica 2 de Linux - Encriptación y Hashing** 