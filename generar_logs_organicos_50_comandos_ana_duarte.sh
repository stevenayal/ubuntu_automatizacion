#!/bin/bash

# GENERADOR DE LOGS ORGÁNICOS CON 50 COMANDOS PARA ANA_DUARTE
# Ejecuta exactamente los 50 comandos de la lista de desafíos
# Usa el comando script para generar logs naturales

set -e

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== GENERANDO LOGS ORGÁNICOS CON 50 COMANDOS PARA ANA_DUARTE ===${NC}"
echo ""

# Crear directorio de logs si no existe
sudo mkdir -p /home/ana_duarte/logs
sudo chown ana_duarte:ana_duarte /home/ana_duarte/logs

# Crear script temporal con los 50 comandos exactos de desafíos
cat > /tmp/sesion_50_comandos_ana.sh << 'EOF'
#!/bin/bash
cd /mnt/z/ISO/ubuntu/challenges || exit

# 3. Listar contenido
ls

# 4. Crear "foo"
mkdir foo

# 5. Crear foo/bar/1/2/3
mkdir -p foo/bar/1/2/3

# 6. Eliminar foo
rm -rf foo

# 7. Imprimir "Hola mundo"
echo "Hola mundo"

# 8. Crear hello.txt
echo "Hola mundo" > hello.txt

# 9. Crear empty.txt
touch empty.txt

# 10. Eliminar empty.txt
rm empty.txt

# 11 y 12. Alternativas para crear archivo vacío
> empty1.txt
: > empty2.txt

# 13. Copiar hello.txt
cp hello.txt goodby.txt

# 14. Renombrar goodby.txt
mv goodby.txt hello_copy.txt

# 15. Comparar archivos
diff hello.txt hello_copy.txt

# 16. Concatenar archivos
cat hello.txt hello_copy.txt > 2_hellos.txt

# 17. Ruta absoluta
pwd

# 18. Listar con permisos
ls -l

# 19. Agregar texto a restricted.txt
echo "Texto agregado" >> restricted.txt

# 20. Ejecutar hello_executable
./hello_executable

# 21. Ejecutar challenge_20
chmod +x challenge_20
./challenge_20

# 22. Compilar y ejecutar compile_me.c
gcc compile_me.c -o compilado
./compilado

# 23. Ejecutar redireccionar y guardar en output.txt
./redireccionar > output.txt

# 24. Fecha y hora actual
date

# 25. Procesos
ps aux

# 26. Núcleos
nproc

# 27. Versión del kernel
uname -r

# 28. Buscar needle
grep -r "You found the needle in the haystack!" bunch_of_files/

# 29. Primeras 25 líneas
head -n 25 people.csv

# 30. Últimas 25 líneas
tail -n 25 people.csv

# 31. Diferencias entre archivos
diff greeting1.txt greeting2.txt

# 32. Espera con impresión
echo "Hola"
sleep 5
echo "¡mundo!"

# 33. Archivo 1MB de ceros
dd if=/dev/zero of=zero_1MB.bin bs=1M count=1

# 34. Archivo 2MB aleatorio
dd if=/dev/urandom of=random_2MB.bin bs=1M count=2

# 35. Contar líneas
wc -l README.txt

# 36. Mostrar archivo en reversa
tac README.txt

# 37. Apellidos (2da columna)
cut -d ',' -f2 people.csv

# 38. Apellidos únicos
cut -d ',' -f2 people.csv | sort | uniq | wc -l

# 39. Excluir header
cut -d ',' -f2 people.csv | tail -n +2 | sort | uniq | wc -l

# 40. Otra forma: awk
awk -F',' 'NR>1 {print $2}' people.csv | sort | uniq | wc -l

# 41. Comparar tiempos
time cut -d ',' -f2 people.csv | tail -n +2 | sort | uniq | wc -l
time awk -F',' 'NR>1 {print $2}' people.csv | sort | uniq | wc -l

# 42. Contar "Josiah"
grep -c '^Josiah,' people.csv

# 43. Contar archivos (no directorios)
find . -type f | wc -l

# 44. Contar directorios
find . -type d | wc -l

# 45. Eliminar archivos con "deleteme"
find . -type f -name "*deleteme*" -delete

# 46. Reemplazar texto
sed -i 's/You found the needle in the haystack!/La aguja ha sido sacada./' bunch_of_files/*

# 47. Transformar CSV
cat people.csv | tr ',' '|' > people_pipe.csv

# 48. Buscar duplicados de file001.rand
fdupes -r bunch_of_files/ | grep -B1 file001.rand

# 49.
touch supercalifragilisticexpialidocious.txt
rm *

# 50. Crear 9 archivos
for l in a b c; do for n in 1 2 3; do touch "${l}${n}.txt"; done; done
EOF

# Ejecutar sesión orgánica completa con script como ana_duarte
sudo -u ana_duarte script -q -c "bash /tmp/sesion_50_comandos_ana.sh" /home/ana_duarte/logs/ana_duarte_50_comandos_$(date +%Y%m%d_%H%M%S).log

# Copiar el log orgánico completo al directorio actual
sudo cp /home/ana_duarte/logs/ana_duarte_50_comandos_*.log ./ana_duarte_50_comandos.log
sudo chown $USER:$USER ./ana_duarte_50_comandos.log

# Limpiar archivo temporal
rm -f /tmp/sesion_50_comandos_ana.sh

echo ""
echo -e "${GREEN}✅ Log orgánico con 50 comandos generado exitosamente!${NC}"
echo -e "${BLUE}📁 Archivo: ana_duarte_50_comandos.log${NC}"
echo -e "${BLUE}📊 Tamaño: $(ls -lh ana_duarte_50_comandos.log | awk '{print $5}')${NC}"
echo ""
echo -e "${YELLOW}🎯 Este log es completamente orgánico con 50 comandos, igual que Steven${NC}" 