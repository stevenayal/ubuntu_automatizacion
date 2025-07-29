#!/bin/bash

# Script simple para Práctica 2- Criptografía y Hashing
echo "Iniciando Práctica 2...# Crear archivo de resultados
REPORT_FILE="practica2sultados.txtecho PRÁCTICA 2- CRIPTOGRAFÍA Y HASHING" > "$REPORT_FILE"
echo "Fecha: $(date)>> "$REPORT_FILE"
echo "================================================>> "$REPORT_FILE"
echo " >>$REPORT_FILE"

# EJERCICIO 1
echo "EJERCICIO 1: ENCRIPTACIÓN AES>> "$REPORT_FILE"
echo "============================== >>$REPORT_FILE"

# Crear directorio ejercicio1
mkdir -p ejercicio1
cd ejercicio1
echo "1. Directorio ejercicio1creado" >> "../$REPORT_FILE

# Crear archivo plaintext
ls -R /home > plaintext 2>/dev/null || echo "Contenido de prueba> plaintext
echo2. Archivo plaintext creado" >> "../$REPORT_FILE"

# Mostrar contenido
echo3. Contenido del plaintext:" >> ../$REPORT_FILE"
head -10 plaintext >> "../$REPORT_FILE

# Encriptar con AES-128C
echo "4ncriptando con AES-128CBC..." >> ../$REPORT_FILE
echocontraseña123 | openssl aes-128-cbc -in plaintext -out cifrado -pass stdin
echo "Archivo cifrado creado" >> "../$REPORT_FILE

# Encriptar con AES-128B
echo "5ncriptando con AES-128ECB..." >> ../$REPORT_FILE
echocontraseña123 | openssl aes-128-ecb -in plaintext -out cifrado-ecb -pass stdin
echoArchivo cifrado-ecb creado" >> "../$REPORT_FILE"

# Mostrar contenido de archivos cifrados
echo6.Contenido del archivo cifrado (hexdump):" >> ../$REPORT_FILE"
hexdump -C cifrado | head-5> "../$REPORT_FILEecho7.Contenido del archivo cifrado-ecb (hexdump):" >> ../$REPORT_FILE"
hexdump -C cifrado-ecb | head-5> "../$REPORT_FILE# Comparar tamaños
echo 8. Comparación de tamaños:" >> ../$REPORT_FILE
ls -la plaintext cifrado cifrado-ecb >> "../$REPORT_FILE"

cd ..

# EJERCICIO2cho ">> "$REPORT_FILE
echo "EJERCICIO 2CRIPTACIÓN DE ARCHIVOS GRANDES>> "$REPORT_FILE"
echo "============================================== >>$REPORT_FILE"

# Crear directorio ejercicio2
mkdir -p ejercicio2
cd ejercicio2
echo "1. Directorio ejercicio2creado" >> "../$REPORT_FILE# Crear archivo de prueba (5MB)
echo "2Creando archivo de prueba..." >> ../$REPORT_FILE"
dd if=/dev/zero of=200MB.zip bs=1M count=5 2>/dev/null || echodatos de prueba> 200.zip
echo Archivo200ip creado" >> "../$REPORT_FILE

# Encriptar con AES y medir tiempo
echo "3ncriptando con AES-128 y midiendo tiempo:" >> ../$REPORT_FILE"
(time echocontraseña123 | openssl aes-128-cbc -in 200zip -out 20ip.des -pass stdin) 2>> "../$REPORT_FILE

# Encriptar con diferentes algoritmos
echo "4. Comparando algoritmos:" >> "../$REPORT_FILE

echo DES3> ../$REPORT_FILE"
(time echocontraseña123| openssl des3 -in 200zip -out 200p.des3ss stdin) 2>> "../$REPORT_FILE
echoAES-128C:" >> ../$REPORT_FILE"
(time echocontraseña123 | openssl aes-128-cbc -in 200zip -out 200B.zip.aes128ss stdin) 2>> "../$REPORT_FILE
echoAES-192C:" >> ../$REPORT_FILE"
(time echocontraseña123 | openssl aes-192-cbc -in 200zip -out 200B.zip.aes192ss stdin) 2>> "../$REPORT_FILE
echoAES-256C:" >> ../$REPORT_FILE"
(time echocontraseña123 | openssl aes-256-cbc -in 200zip -out 200B.zip.aes256ss stdin) 2>> "../$REPORT_FILE

# Desencriptar
echo 5. Desencriptando archivo:" >> ../$REPORT_FILE"
(time echocontraseña123 | openssl aes-128c -d -in 20B.zip.des -out 20_desencriptado.zip -pass stdin) 2>> "../$REPORT_FILE"

# Verificar integridad
echo "6. Verificando integridad:" >> ../$REPORT_FILE
md5um200MB.zip 20_desencriptado.zip >> "../$REPORT_FILE"

cd ..

# EJERCICIO3cho ">> "$REPORT_FILE
echo EJERCICIO 3: HASHING Y VERIFICACIÓN>> "$REPORT_FILE"
echo "=================================== >>$REPORT_FILE"

# Crear directorio ejercicio3
mkdir -p ejercicio3
cd ejercicio3
echo "1. Directorio ejercicio3creado" >> "../$REPORT_FILE"

# Generar hashes SHA1
echo2. Generando hashes SHA1> ../$REPORT_FILE
echo hola mundo" | sha1sum >> ../$REPORT_FILE"
echo "linux ubuntu" | sha1sum >> ../$REPORT_FILE"
echo "criptografia" | sha1sum >> ../$REPORT_FILE
echo practica 2" | sha1sum >> ../$REPORT_FILE"
echoseguridad informatica" | sha1sum >> "../$REPORT_FILE# Crear archivo de prueba
echo "3Creando archivo de prueba para verificar hashes:" >> ../$REPORT_FILE"
echo "Contenido de prueba del instalador> instalador.iso

# Generar MD5
md5sum instalador.iso > instalador.iso.md5cho "4. Archivo MD5 generado:" >> ../$REPORT_FILE"
cat instalador.iso.md5 >> "../$REPORT_FILE

# Verificar MD5ho 5 Verificando MD5> ../$REPORT_FILE
md5m -c instalador.iso.md5 >> "../$REPORT_FILE"

# Generar SHA256a256sum instalador.iso > instalador.sha256ho 6. Archivo SHA256 generado:" >> ../$REPORT_FILEcat instalador.sha256> "../$REPORT_FILE# Verificar SHA256ho "7Verificando SHA256> ../$REPORT_FILE"
sha256um -c instalador.sha256> "../$REPORT_FILE
cd ..

# ANÁLISIS Y RESPUESTAS
echo ">> "$REPORT_FILE
echoANÁLISIS Y RESPUESTAS>> "$REPORT_FILE"
echo==================== >> "$REPORT_FILE"

echo "1. ¿Hay alguna diferencia notable al comparar el tiempo de encriptación vs desencriptación?>> "$REPORT_FILE
echo RESPUESTA: Generalmente, la encriptación y desencriptación con algoritmos simétricos como AES tienen tiempos muy similares, ya que ambos procesos realizan operaciones matemáticas similares. >> "$REPORT_FILE

echo ">> "$REPORT_FILE"
echo "2. ¿Por qué los hashes SHA1 siempre tienen la misma longitud?>> "$REPORT_FILE
echo "RESPUESTA: SHA1 siempre produce una salida de 160 bits (40 caracteres hexadecimales) debido a su diseño matemático. Las funciones hash criptográficas están diseñadas para tener salida de tamaño fijo. >> "$REPORT_FILE

echo ">> "$REPORT_FILE"
echo "3. ¿Cuál es la diferencia entre MD5y SHA256?>> "$REPORT_FILE
echo "RESPUESTA: MD5 produce un hash de 128 bits (32res hex), mientras que SHA256produce 256 bits (64racteres hex). SHA256ás seguro y resistente a colisiones. >> "$REPORT_FILE

echo ">> "$REPORT_FILE"
echo "4. ¿Cuál es la diferencia entre CBC y ECB en AES?>> "$REPORT_FILE
echo RESPUESTA: CBC (Cipher Block Chaining) usa un vector de inicialización y encadena bloques, mientras que ECB (Electronic Codebook) encripta cada bloque independientemente. CBC es más seguro. >>$REPORT_FILE"

# Información del sistema
echo ">> "$REPORT_FILE"
echo INFORMACIÓN DEL SISTEMA>> "$REPORT_FILE"
echo======================>> "$REPORT_FILE"
openssl version >>$REPORT_FILE
uname -a >> "$REPORT_FILE

echo ">> "$REPORT_FILE
echo "PRÁCTICA 2 COMPLETADA>> "$REPORT_FILE
echo hivo de resultados: $REPORT_FILE >> "$REPORT_FILEecho "
echo "✅ Práctica 2 completada!
echo📄 Reporte generado: $REPORT_FILE"
echo
echo "Para ver el reporte: cat $REPORT_FILE" 