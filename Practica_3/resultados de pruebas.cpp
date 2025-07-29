steven@stev:/mnt/z/Proyectos/ubuntu_automatizacion/Practica_3$ ./ejecutar_todas_las_pruebas.sh
========================================
    EJECUTOR DE TODAS LAS PRUEBAS      
========================================

Progreso: 1 de 4 pruebas completadas

Ejecutando: Prueba de Comandos Individuales
----------------------------------------
========================================
  PRUEBA DE COMANDOS INDIVIDUALES      
========================================

PRUEBA 1: Comandos de generación de contraseñas
------------------------------------------------
1.1 Generando contraseña débil (3 caracteres, solo números):
   Contraseña débil generada: '752'
   Longitud: 3 caracteres
   ✓ PASS - Contraseña débil válida

1.2 Generando contraseña normal (10 caracteres, alfanumérica):
   Contraseña normal generada: '1EyPet6DHV'
   Longitud: 10 caracteres
   ✓ PASS - Contraseña normal válida

PRUEBA 2: Comando htpasswd
------------------------------
2.1 Creando archivo de prueba con htpasswd:
   Archivo creado: temp_passwd.txt
   Contenido:
   testuser:$apr1$UqmEIpyO$EbcVvXyKCI4y7zZKIXgJc.
   ✓ PASS - Formato htpasswd correcto

PRUEBA 3: Comando hashcat
------------------------------
   ⚠ SKIP - hashcat no está instalado

PRUEBA 4: Comandos de procesamiento de archivos
------------------------------------------------
4.1 Creando archivo de prueba:
   Archivo creado: test_users.txt
   Contenido:
   usuario1:$hash1$pass1
   usuario2:$hash2$pass2
   usuario3:$hash3$pass3

4.2 Probando separación con IFS=:
   Usuario: 'usuario1', Hash: '$hash1$pass1'
   Usuario: 'usuario2', Hash: '$hash2$pass2'
   Usuario: 'usuario3', Hash: '$hash3$pass3'

4.3 Probando extracción de segunda columna:
   Segunda columna:
   $hash1$pass1
   $hash2$pass2
   $hash3$pass3

PRUEBA 5: Comandos de validación
--------------------------------
5.1 Verificando existencia de archivos:
   ✓ PASS - generararchivo.sh existe
   ✓ PASS - verificarpasswd.sh existe

5.2 Verificando permisos de ejecución:
   ✓ PASS - generararchivo.sh es ejecutable
   ✓ PASS - verificarpasswd.sh es ejecutable

5.3 Verificando comandos disponibles:
   ✓ PASS - htpasswd disponible
   ✗ FAIL - hashcat no disponible

PRUEBA 6: Comandos de manipulación de strings
--------------------------------------------
6.1 Probando grep para validación:
   ✓ PASS - grep encuentra el patrón

6.2 Probando wc para contar líneas:
   Archivo tiene 3 líneas
   ✓ PASS - Conteo de líneas correcto

========================================
           RESUMEN DE COMANDOS
========================================

Los comandos probados incluyen:
• Generación de contraseñas aleatorias
• Creación de archivos htpasswd
• Verificación de herramientas hashcat
• Procesamiento de archivos con IFS
• Validaciones de archivos y permisos
• Manipulación de strings y conteo

Pruebas de comandos individuales completadas

✓ Prueba de Comandos Individuales completado exitosamente

========================================

Progreso: 2 de 4 pruebas completadas

Ejecutando: Pruebas Simples
----------------------------------------
========================================
    PRUEBAS SIMPLES - Scripts de BASH
========================================

PRUEBA 1: Verificación de archivos
----------------------------------------
✓ PASS - Script generararchivo.sh existe
✓ PASS - Script verificarpasswd.sh existe

PRUEBA 2: Permisos de ejecución
----------------------------------------
✓ PASS - generararchivo.sh es ejecutable
✓ PASS - verificarpasswd.sh es ejecutable

PRUEBA 3: Verificación de dependencias
----------------------------------------
✓ PASS - htpasswd está instalado
✗ FAIL - hashcat está instalado
  → Para instalar: sudo apt-get install hashcat

PRUEBA 4: Validación de parámetros - generararchivo.sh
--------------------------------------------------------
✓ PASS - Validación sin parámetros funciona
✓ PASS - Validación con un parámetro funciona
✓ PASS - Validación t < d funciona

PRUEBA 5: Validación de parámetros - verificarpasswd.sh
--------------------------------------------------------
✓ PASS - Validación sin parámetros funciona
✓ PASS - Validación archivo inexistente funciona

PRUEBA 6: Generación de archivo de contraseñas
-----------------------------------------------
✓ PASS - Archivo passwd.txt se creó
✓ PASS - Archivo tiene 5 usuarios
✓ PASS - Formato de usuarios correcto
Contenido del archivo generado:
usuario1:$apr1$QSXE11j2$437hCdyAXfL7vKrjoY4d1/
usuario2:$apr1$.UXkSPyD$Y7aYVBK/74uGulIXjMHsd.
usuario3:$apr1$fLKdefS.$tNQcP/KHuoMB6mYn5i.hy/
usuario4:$apr1$fMcHKRTv$I6ynRqv4.lQgWC1lK086J.
usuario5:$apr1$mE0Y7FIB$njCGJBOZSwwDMVqfpITVD1


PRUEBA 7: Verificación de contraseñas débiles
--------------------------------------------
✗ FAIL - Script de verificación se ejecuta
  → hashcat no está instalado
PRUEBA 8: Prueba de integración completa
----------------------------------------
✗ FAIL - Integración: Prueba completa
  → Faltan dependencias (htpasswd o hashcat)

========================================
           RESUMEN DE PRUEBAS
========================================

Total de pruebas: 16
Pruebas exitosas: 13
Pruebas fallidas: 3
Algunas pruebas fallaron. Revisar errores.

✗ Pruebas Simples falló

========================================

Progreso: 3 de 4 pruebas completadas

Ejecutando: Pruebas Unitarias Completas
----------------------------------------
========================================
  PRUEBAS UNITARIAS - Scripts de BASH
========================================

PRUEBA 1: Verificación de archivos
----------------------------------------
✓ PASS - Script generararchivo.sh existe
✓ PASS - Script verificarpasswd.sh existe
✓ PASS - Script instalar_dependencias.sh existe

PRUEBA 2: Permisos de ejecución
----------------------------------------
✓ PASS - generararchivo.sh es ejecutable
✓ PASS - verificarpasswd.sh es ejecutable

PRUEBA 3: Verificación de dependencias
----------------------------------------
✓ PASS - htpasswd está instalado
✗ FAIL - hashcat está instalado
  → Instalando hashcat...
✓ PASS - hashcat se instaló correctamente

PRUEBA 4: Validación de parámetros - generararchivo.sh
--------------------------------------------------------
✓ PASS - Validación sin parámetros funciona
✓ PASS - Validación con un parámetro funciona
✓ PASS - Validación t < d funciona

PRUEBA 5: Validación de parámetros - verificarpasswd.sh
--------------------------------------------------------
✓ PASS - Validación sin parámetros funciona
✓ PASS - Validación archivo inexistente funciona

PRUEBA 6: Generación de archivo de contraseñas
-----------------------------------------------
✓ PASS - Archivo passwd.txt se creó
✓ PASS - Archivo tiene 5 usuarios
✓ PASS - Formato de usuarios correcto
Contenido del archivo generado:
usuario1:$apr1$3vBUz2Wp$aHQHHni0Cqq/IcjOBFajM/
usuario2:$apr1$q6CENfX9$XxIIKC4CJBoO7J3DTGZOV1
usuario3:$apr1$hqmBnLNx$pULZYMggej9chtXeTDwoh/
usuario4:$apr1$ji6G8z.z$XDqAUGzpCE6gy8piKZD5J/
usuario5:$apr1$SgdPGnP7$Oc42/EpFck2GWBp.nRYPM.


PRUEBA 7: Verificación de contraseñas débiles
--------------------------------------------
✓ PASS - Script de verificación se ejecuta
Salida de verificación:
Verificando contraseñas débiles en passwd.txt...
==============================================
Verificando usuario: usuario1
✗ usuario1 - Contraseña segura
Verificando usuario: usuario2
✗ usuario2 - Contraseña segura
Verificando usuario: usuario3
✗ usuario3 - Contraseña segura
Verificando usuario: usuario4
✗ usuario4 - Contraseña segura
Verificando usuario: usuario5
✗ usuario5 - Contraseña segura

Verificación completada.

PRUEBA 8: Prueba de integración completa
----------------------------------------
✓ PASS - Integración: 3 usuarios generados
✓ PASS - Integración: Verificación exitosa

PRUEBA 9: Pruebas de rendimiento básicas
--------------------------------------------
✓ PASS - Rendimiento: Generación < 10 segundos
Tiempo de generación: .075456122 segundos
✓ PASS - Rendimiento: Verificación < 30 segundos
Tiempo de verificación: 1.510070615 segundos

========================================
           RESUMEN DE PRUEBAS
========================================

Total de pruebas: 21
Pruebas exitosas: 20
Pruebas fallidas: 1
Algunas pruebas fallaron. Revisar errores.

✗ Pruebas Unitarias Completas falló

========================================

Progreso: 4 de 4 pruebas completadas

Ejecutando: Prueba de Integración
----------------------------------------
PRUEBA COMPLETA - Scripts de BASH
=================================

1. Generando archivo de contraseñas...
Ejecutando: ./generararchivo.sh 5 3
-----------------------------------
Generando archivo passwd.txt con 5 usuarios (3 con contraseñas débiles)...      
Generando usuario1 con contraseña débil: 569
Generando usuario2 con contraseña débil: 137
Generando usuario3 con contraseña débil: 041
Generando usuario4 con contraseña normal: D1ks2qLPkf
Generando usuario5 con contraseña normal: I2D7kdJptP
Archivo passwd.txt generado exitosamente!
Contenido del archivo:
======================
usuario1:$apr1$o/bTEhEG$1bbH5xU4mUja1rYkawjko/
usuario2:$apr1$lP0ow5QR$WSuUxb9kmeF2rdTwpuY7z.
usuario3:$apr1$Ben0Qri1$PNp/xdWthmlgmYn2xmpkB.
usuario4:$apr1$JDepUuaY$xfd22qxyIAxDgSJ0iPWnL0
usuario5:$apr1$Km35EVzI$KItohRjb08ic2nU2azdsp.

2. Verificando contraseñas débiles...
Ejecutando: ./verificarpasswd.sh passwd.txt
-------------------------------------------
Verificando contraseñas débiles en passwd.txt...
==============================================
Verificando usuario: usuario1
✗ usuario1 - Contraseña segura
Verificando usuario: usuario2
✗ usuario2 - Contraseña segura
Verificando usuario: usuario3
✗ usuario3 - Contraseña segura
Verificando usuario: usuario4
✗ usuario4 - Contraseña segura
Verificando usuario: usuario5
✗ usuario5 - Contraseña segura

Verificación completada.

3. Mostrando contenido final del archivo...
------------------------------------------
usuario1:$apr1$o/bTEhEG$1bbH5xU4mUja1rYkawjko/
usuario2:$apr1$lP0ow5QR$WSuUxb9kmeF2rdTwpuY7z.
usuario3:$apr1$Ben0Qri1$PNp/xdWthmlgmYn2xmpkB.
usuario4:$apr1$JDepUuaY$xfd22qxyIAxDgSJ0iPWnL0
usuario5:$apr1$Km35EVzI$KItohRjb08ic2nU2azdsp.

PRUEBA COMPLETADA
=================

✓ Prueba de Integración completado exitosamente

========================================

========================================
         RESUMEN FINAL GLOBAL
========================================

Total de pruebas ejecutadas: 48
Pruebas exitosas: 43
Pruebas fallidas: 5
Porcentaje de éxito: 89%

❌ Algunas pruebas fallaron.
Revisar los errores mostrados arriba.
steven@stev:/mnt/z/Proyectos/ubuntu_automatizacion/Practica_3$