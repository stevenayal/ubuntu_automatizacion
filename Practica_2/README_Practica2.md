# Práctica 2 - Automatización Completa

Este conjunto de scripts automatiza completamente la **Práctica 2** de Linux, que incluye ejercicios de criptografía, encriptación y generación de hashes.

## 📋 Contenido de la Práctica

### Ejercicio 1: Encriptación AES
- Crear archivo plaintext con `ls -R /`
- Encriptar con AES-128-CBC
- Encriptar con AES-128-ECB
- Mostrar contenido de archivos cifrados

### Ejercicio 2: Comparación de Algoritmos
- Descargar archivo de 200MB
- Encriptar con diferentes algoritmos (3DES, AES-128, AES-192, AES-256)
- Medir tiempos de ejecución
- Comparar tiempos de encriptación vs desencriptación

### Ejercicio 3: Generación de Hashes
- Generar hashes SHA1 de diferentes textos
- Descargar TeamPasswordManager
- Verificar MD5 y SHA256
- Generar archivos de verificación

## 🚀 Instalación y Uso

### 1. Instalar Dependencias

```bash
# Dar permisos de ejecución
chmod +x instalar_dependencias_practica2.sh

# Ejecutar instalador de dependencias
./instalar_dependencias_practica2.sh
```

### 2. Ejecutar Práctica Automatizada

```bash
# Dar permisos de ejecución
chmod +x practica_2_automatizada.sh

# Ejecutar práctica completa
./practica_2_automatizada.sh
```

### 3. Generar Reporte Completo

```bash
# Dar permisos de ejecución
chmod +x generar_reporte_practica2.sh

# Generar reporte con todos los comandos y resultados
./generar_reporte_practica2.sh
```

## 📁 Archivos Generados

### Directorios Creados:
- `ejercicio1/` - Archivos de encriptación AES
- `ejercicio2/` - Archivos de comparación de algoritmos
- `ejercicio3/` - Archivos de hashes y verificación

### Archivos de Salida:
- `Practica_2_Reporte_Completo.txt` - Reporte completo con todos los resultados
- Archivos cifrados y de hash en cada directorio correspondiente

## 🔧 Dependencias Requeridas

El script de instalación verifica e instala automáticamente:

- **OpenSSL** - Para encriptación/desencriptación
- **wget** - Para descargas de archivos
- **bc** - Para cálculos matemáticos
- **xxd** - Para visualización hexadecimal
- **sha1sum, md5sum, sha256sum** - Para generación de hashes

## 📊 Comandos Principales Utilizados

### Encriptación:
```bash
# AES-128-CBC
openssl aes-128-cbc -in archivo -out archivo.cifrado -k contraseña

# AES-128-ECB
openssl aes-128-ecb -in archivo -out archivo.cifrado -k contraseña

# 3DES
openssl des3 -in archivo -out archivo.cifrado -k contraseña

# AES-192-CBC
openssl aes-192-cbc -in archivo -out archivo.cifrado -k contraseña

# AES-256-CBC
openssl aes-256-cbc -in archivo -out archivo.cifrado -k contraseña
```

### Desencriptación:
```bash
openssl aes-128-cbc -d -in archivo.cifrado -out archivo.original -k contraseña
```

### Generación de Hashes:
```bash
# SHA1
echo "texto" | sha1sum

# MD5
md5sum archivo > archivo.md5

# SHA256
sha256sum archivo > archivo.sha256
```

### Verificación de Hashes:
```bash
md5sum -c archivo.md5
sha256sum -c archivo.sha256
```

## ⏱️ Medición de Tiempos

El script mide automáticamente los tiempos de ejecución para:
- Encriptación con diferentes algoritmos
- Desencriptación
- Generación de hashes

Los resultados se muestran en una tabla comparativa.

## 🔍 Características del Script

### Funciones Automatizadas:
- ✅ Creación automática de directorios
- ✅ Manejo de errores y fallos de red
- ✅ Creación de archivos de prueba si las descargas fallan
- ✅ Medición precisa de tiempos de ejecución
- ✅ Generación de reportes detallados
- ✅ Verificación de integridad de archivos
- ✅ Visualización de contenido de archivos cifrados

### Manejo de Errores:
- Verificación de existencia de comandos
- Fallback a archivos de prueba si las descargas fallan
- Validación de operaciones de encriptación
- Manejo de permisos de archivos

## 📝 Notas Importantes

1. **Contraseña**: El script solicitará una contraseña para la encriptación. Úsela consistentemente.

2. **Descargas**: Si la descarga del archivo de 200MB falla, se creará un archivo de prueba de 10MB.

3. **Permisos**: Asegúrese de que los scripts tengan permisos de ejecución.

4. **Espacio en Disco**: La práctica puede requerir varios cientos de MB de espacio.

5. **Tiempo de Ejecución**: Dependiendo del hardware, puede tomar varios minutos.

## 🐛 Solución de Problemas

### Error: "Permission denied"
```bash
chmod +x *.sh
```

### Error: "Command not found"
```bash
./instalar_dependencias_practica2.sh
```

### Error: "No space left on device"
```bash
# Limpiar archivos temporales
rm -rf ejercicio*/200MB.zip*
```

### Error: "Network is unreachable"
- El script creará archivos de prueba automáticamente
- Los resultados seguirán siendo válidos para la práctica

## 📞 Soporte

Si encuentra algún problema:

1. Verifique que todas las dependencias estén instaladas
2. Asegúrese de tener permisos de escritura en el directorio
3. Revise los logs de error en la consola
4. Ejecute el script de instalación de dependencias nuevamente

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Vea el archivo LICENSE para más detalles.

---

**¡Listo para ejecutar la Práctica 2 de forma completamente automatizada!** 