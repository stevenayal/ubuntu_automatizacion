# 📸 Práctica 2 - Sistema de Captura de Screenshots

Este sistema automatiza la captura de screenshots durante la ejecución de la Práctica 2, documentando visualmente todo el proceso de criptografía.

## 🎯 Características del Sistema de Screenshots

### ✅ **Captura Automática:**
- **Screenshots de texto** - Captura todo el output de la consola
- **Timestamps** - Cada screenshot incluye fecha y hora exacta
- **Numeración secuencial** - Organización clara de los pasos
- **Información oculta** - Protege datos personales del usuario

### 🔒 **Privacidad y Seguridad:**
- **Contraseña fija** - Usa `practica2024` en lugar de contraseñas personales
- **Información oculta** - No expone datos del usuario
- **Logs limpios** - Sin información personal en los archivos

## 📁 Estructura de Screenshots

```
screenshots_practica2/
├── screenshot_01_[timestamp].txt    # Inicio Ejercicio 1
├── screenshot_02_[timestamp].txt    # Archivo plaintext creado
├── screenshot_03_[timestamp].txt    # Encriptación AES-128-CBC
├── screenshot_04_[timestamp].txt    # Encriptación AES-128-ECB
├── screenshot_05_[timestamp].txt    # Inicio Ejercicio 2
├── screenshot_06_[timestamp].txt    # Archivo de prueba creado
├── screenshot_07_[timestamp].txt    # Encriptación múltiples algoritmos
├── screenshot_08_[timestamp].txt    # Tabla de tiempos
├── screenshot_09_[timestamp].txt    # Desencriptación
├── screenshot_10_[timestamp].txt    # Inicio Ejercicio 3
├── screenshot_11_[timestamp].txt    # Hashes SHA1
├── screenshot_12_[timestamp].txt    # Archivo TeamPasswordManager
├── screenshot_13_[timestamp].txt    # Verificación MD5
├── screenshot_14_[timestamp].txt    # Verificación SHA256
└── screenshot_15_[timestamp].txt    # Resumen Final
```

## 🚀 Cómo Usar

### **Paso 1: Instalar dependencias**
```bash
cd Practica_2
chmod +x instalar_dependencias_practica2.sh
./instalar_dependencias_practica2.sh
```

### **Paso 2: Instalar herramientas de screenshot (opcional)**
```bash
chmod +x instalar_herramientas_screenshot.sh
./instalar_herramientas_screenshot.sh
```

### **Paso 3: Ejecutar práctica con screenshots**
```bash
chmod +x practica_2_con_screenshots.sh
./practica_2_con_screenshots.sh
```

## 📊 Contenido de Cada Screenshot

### **Screenshot 01-04: Ejercicio 1**
- Creación de directorios
- Generación de archivo plaintext
- Encriptación AES-128-CBC
- Encriptación AES-128-ECB
- Visualización de archivos cifrados

### **Screenshot 05-09: Ejercicio 2**
- Creación de archivo de prueba
- Encriptación con múltiples algoritmos
- Medición de tiempos de ejecución
- Tabla comparativa de rendimiento
- Desencriptación y comparación

### **Screenshot 10-14: Ejercicio 3**
- Generación de hashes SHA1
- Creación de archivo de prueba
- Verificación MD5
- Verificación SHA256
- Análisis de resultados

### **Screenshot 15: Resumen Final**
- Resumen de todos los ejercicios
- Lista de archivos generados
- Estadísticas de screenshots
- Fecha y hora de finalización

## 🔧 Configuración Avanzada

### **Personalizar contraseña:**
Edita la variable `PASSWORD` en el script:
```bash
PASSWORD="tu_contraseña_segura"
```

### **Cambiar directorio de screenshots:**
Modifica la variable `DIRECTORIO_SCREENSHOTS`:
```bash
DIRECTORIO_SCREENSHOTS="mi_carpeta_screenshots"
```

### **Agregar más puntos de captura:**
Usa la función `capturar_screenshot`:
```bash
capturar_screenshot "Descripción del paso" "numero"
```

## 📈 Ventajas del Sistema

### **Para el Estudiante:**
- ✅ Documentación visual completa
- ✅ No necesita tomar screenshots manualmente
- ✅ Protección de información personal
- ✅ Organización automática de archivos

### **Para el Profesor:**
- ✅ Evidencia visual de cada paso
- ✅ Verificación de comandos ejecutados
- ✅ Tiempos de ejecución documentados
- ✅ Resultados claros y organizados

### **Para la Evaluación:**
- ✅ Proceso completo documentado
- ✅ Resultados verificables
- ✅ Análisis de rendimiento incluido
- ✅ Formato profesional y consistente

## 🛠️ Herramientas Utilizadas

### **Captura de Texto:**
- `tee` - Captura output en tiempo real
- `date` - Timestamps precisos
- `ls` - Información de archivos
- `head` - Visualización de contenido

### **Captura Visual (Opcional):**
- `scrot` - Captura de pantalla simple
- `gnome-screenshot` - Para entornos GNOME
- `spectacle` - Para entornos KDE
- `ImageMagick` - Procesamiento de imágenes

## 📝 Notas Importantes

1. **Privacidad:** La contraseña real nunca se muestra en los screenshots
2. **Organización:** Los archivos se nombran automáticamente con timestamps
3. **Completitud:** Cada paso importante se documenta
4. **Verificabilidad:** Todos los comandos y resultados se capturan

## 🎉 Resultado Final

Al finalizar la ejecución, tendrás:
- **15+ screenshots** documentando todo el proceso
- **Carpeta organizada** con timestamps
- **Información completa** sin datos personales
- **Evidencia visual** de cada ejercicio completado

**¡Documentación profesional y completa de la Práctica 2!** 