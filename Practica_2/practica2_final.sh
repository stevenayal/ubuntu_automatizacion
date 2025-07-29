#!/bin/bash

REPORT_FILE="practica2sultados.txtecho PRÁCTICA 2- CRIPTOGRAFÍA Y HASHING" > "$REPORT_FILE"
echo "Fecha: $(date)>> "$REPORT_FILE"
echo "================================================>> "$REPORT_FILE"
echo " >>$REPORT_FILE"

# EJERCICIO1[object Object]
  echo "EJERCICIO 1: ENCRIPTACIÓN AES"
  echo "=============================="
  mkdir -p ejercicio1
  cd ejercicio1
  echo "1. Directorio ejercicio1 creado"
  echo "2ando archivo plaintext con ls -R /home > plaintext"
  ls -R /home > plaintext 2>/dev/null || echo "Contenido de prueba para plaintext" > plaintext
  echo 3.Primeras 10líneas del archivo plaintext:head -10plaintext
  echo "4ncriptando con AES-128BC:  echocontraseña123 | openssl aes-128-cbc -in plaintext -out cifrado -pass stdin
  echo "5ncriptando con AES-128CB:  echocontraseña123 | openssl aes-128-ecb -in plaintext -out cifrado-ecb -pass stdin
  echo6.Contenido del archivo cifrado (hexdump):hexdump -C cifrado | head -5
  echo7.Contenido del archivo cifrado-ecb (hexdump):hexdump -C cifrado-ecb | head -5
  echo 8. Comparación de tamaños:"
  ls -la plaintext cifrado cifrado-ecb
  cd ..
} >> "$REPORT_FILE

echo " >>$REPORT_FILE"

# EJERCICIO2[object Object]
  echo "EJERCICIO 2CRIPTACIÓN DE ARCHIVOS GRANDES"
  echo "=============================================="
  mkdir -p ejercicio2
  cd ejercicio2
  echo "1. Directorio ejercicio2 creado"
  echo "2Creando archivo de prueba de 5MB (dd if=/dev/zero of=200MB.zip bs=1M count=5)"
  dd if=/dev/zero of=200MB.zip bs=1M count=5 2/dev/null
  echo "3ncriptando con AES-128 y midiendo tiempo:"
  (time echocontraseña123 | openssl aes-128-cbc -in 200zip -out 20ip.des -pass stdin) 2>&1  echo echo4. TABLA DE TIEMPOS DE ALGORITMOS DE ENCRIPTACIÓN:"
  echo "=================================================="
  echo "Algoritmo          | Tiempo de Encriptación"
  echo-------------------|------------------------  
  echo "DES3  DES3TIME=$(time echocontraseña123| openssl des3 -in 200zip -out 200p.des3-pass stdin 2 | grep real | awk '{print $2}')
  echo "DES3               | $DES3_TIME"
  
  echo "AES-128BC:AES128TIME=$(time echocontraseña123 | openssl aes-128-cbc -in 200zip -out 200B.zip.aes128-pass stdin 2 | grep real | awk '{print $2})
  echo "AES-128-CBC        | $AES128_TIME"
  
  echo "AES-192BC:AES192TIME=$(time echocontraseña123 | openssl aes-192-cbc -in 200zip -out 200B.zip.aes192-pass stdin 2 | grep real | awk '{print $2})
  echo "AES-192-CBC        | $AES192_TIME"
  
  echo "AES-256BC:AES256TIME=$(time echocontraseña123 | openssl aes-256-cbc -in 200zip -out 200B.zip.aes256-pass stdin 2 | grep real | awk '{print $2})
  echo "AES-256-CBC        | $AES256IME"
  
  echo
  echo 5. Desencriptando archivo y midiendo tiempo:"
  DECRYPT_TIME=$(time echocontraseña123 | openssl aes-128c -d -in 20B.zip.des -out 20_desencriptado.zip -pass stdin 2 | grep real | awk '{print $2}')
  echo "Tiempo de desencriptación: $DECRYPT_TIME"
  
  echo "6. Verificando integridad (md5um200MB.zip 20_desencriptado.zip):"
  md5um200MB.zip 20_desencriptado.zip
  cd ..
} >> "$REPORT_FILE

echo " >>$REPORT_FILE"

# EJERCICIO3[object Object]
  echo EJERCICIO 3: HASHING Y VERIFICACIÓN"
  echo "==================================="
  mkdir -p ejercicio3
  cd ejercicio3
  echo "1. Directorio ejercicio3 creadoecho2. Generando hashes SHA1 de cinco textos diferentes: for texto in "hola mundo nux ubuntucriptografia"practica 2"seguridad informatica"; do
    echo -n $texto | sha1
  done
  echo
  echo "PREGUNTA: ¿Por qué el resultado tiene siempre la misma cantidad de caracteres?
  echo "RESPUESTA: SHA1 siempre produce una salida de 160 bits (40 caracteres hexadecimales) sin importar el tamaño de la entrada."
  echo "3Creando archivo de prueba instalador.iso"
  echo "Contenido de prueba del instalador > instalador.iso
  echo "4. Generando y verificando MD5:"
  md5sum instalador.iso > instalador.iso.md5
  md5m -c instalador.iso.md5echo "5. Generando y verificando SHA256:"
  sha256sum instalador.iso > instalador.sha256ha256um -c instalador.sha256  echo ""
  echoMostrando hashes generados:"
  echo "MD5: cat instalador.iso.md5
  echo "SHA256  cat instalador.sha256
  cd ..
} >> "$REPORT_FILE

echo " >> "$REPORT_FILE"

echoANÁLISIS Y RESPUESTAS>> "$REPORT_FILE"
echo=====================>> "$REPORT_FILE"
echo "1. ¿Hay alguna diferencia notable al comparar el tiempo de encriptación vs desencriptación?>> "$REPORT_FILE
echo RESPUESTA: Generalmente, la encriptación y desencriptación con algoritmos simétricos como AES tienen tiempos muy similares, ya que ambos procesos realizan operaciones matemáticas similares.>> "$REPORT_FILE"
echo ">> "$REPORT_FILE"
echo "2. ¿Por qué los hashes SHA1 siempre tienen la misma longitud?>> "$REPORT_FILE
echo "RESPUESTA: SHA1 siempre produce una salida de 160 bits (40 caracteres hexadecimales) debido a su diseño matemático.>> "$REPORT_FILE"
echo ">> "$REPORT_FILE"
echo "3. ¿Cuál es la diferencia entre MD5y SHA256?>> "$REPORT_FILE
echo "RESPUESTA: MD5 produce un hash de 128 bits (32res hex), mientras que SHA256produce 256 bits (64racteres hex). SHA256ás seguro y resistente a colisiones que MD5.>> "$REPORT_FILE"
echo ">> "$REPORT_FILE"
echo "4. ¿Cuál es la diferencia entre CBC y ECB en AES?>> "$REPORT_FILE
echo RESPUESTA: CBC (Cipher Block Chaining) usa un vector de inicialización y encadena bloques, mientras que ECB (Electronic Codebook) encripta cada bloque independientemente. CBC es más seguro porque patrones idénticos en el texto plano no producen patrones idénticos en el texto cifrado.>> "$REPORT_FILE"
echo ">> "$REPORT_FILE"
echo INFORMACIÓN DEL SISTEMA>> "$REPORT_FILE"
echo=======================>> "$REPORT_FILE"
openssl version >>$REPORT_FILE
uname -a >> "$REPORT_FILE"
echo ">> "$REPORT_FILE
echo "PRÁCTICA 2 COMPLETADA>> "$REPORT_FILE
echo hivo de resultados: $REPORT_FILE>> "$REPORT_FILE"
echo "Fecha de finalización: $(date)>> "$REPORT_FILE"
echo "================================================>> "$REPORT_FILE
echo "✅ Práctica 2 completada!" 