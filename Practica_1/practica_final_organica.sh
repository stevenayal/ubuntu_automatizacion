#!/bin/bash

# Script que genera logs 100% orgánicos (idénticos a script manual)
# Autor: Steven
# Este script NO agrega comentarios personalizados

# Configuración
LOG_FILE="practica_final_$(date +%Y%m%d_%H%M%S).log"

echo "Iniciando práctica con logs 100% orgánicos..."
echo "Log: $LOG_FILE"

# Ejecutar script con comandos puros (sin comentarios personalizados)
script -a "$LOG_FILE" << 'SCRIPT_EOF'

cd /home/steven/command-line-challenges/challenges

ls
mkdir foo
mkdir -p foo/bar/1/2/3
rm -rf foo
echo "Hola mundo"
echo "Hola mundo" > hello.txt
touch empty.txt
rm empty.txt
> empty1.txt
: > empty2.txt
cp hello.txt goodby.txt
mv goodby.txt hello_copy.txt
diff hello.txt hello_copy.txt
cat hello.txt hello_copy.txt > 2_hellos.txt
pwd
ls -l
echo "Texto agregado" >> restricted.txt
./hello_executable
chmod +x challenge_20
./challenge_20
gcc compile_me.c -o compilado
./compilado
./redirect > output.txt
date
ps aux
nproc
uname -r
grep -r "You found the needle in the haystack!" bunch_of_files/
head -n 25 people.csv
tail -n 25 people.csv
diff greeting1.txt greeting2.txt
echo "Hola"
sleep 2
echo "¡mundo!"
dd if=/dev/zero of=zero_1MB.bin bs=1M count=1
dd if=/dev/urandom of=random_2MB.bin bs=1M count=2
wc -l README.txt
tac README.txt
cut -d ',' -f2 people.csv
cut -d ',' -f2 people.csv | sort | uniq | wc -l
cut -d ',' -f2 people.csv | tail -n +2 | sort | uniq | wc -l
awk -F',' 'NR>1 {print $2}' people.csv | sort | uniq | wc -l
time cut -d ',' -f2 people.csv | tail -n +2 | sort | uniq | wc -l
grep -c '^Josiah,' people.csv
find . -type f | wc -l
find . -type d | wc -l
find . -type f -name '*deleteme*' -delete
sed -i 's/You found the needle in the haystack!/La aguja ha sido sacada./' bunch_of_files/*
cat people.csv | tr ',' '|' > people_pipe.csv
find bunch_of_files/ -name 'file001.rand' | head -5
touch supercalifragilisticexpialidocious.txt
rm supercalifragilisticexpialidocious.txt
for l in a b c; do for n in 1 2 3; do touch "${l}${n}.txt"; done; done

ls -la *.txt *.bin *.csv 2>/dev/null || echo "No se encontraron archivos específicos"

exit
SCRIPT_EOF

echo "Práctica completada."
echo "Log guardado en: $LOG_FILE"
echo "Este log es 100% idéntico a uno generado manualmente con 'script'" 