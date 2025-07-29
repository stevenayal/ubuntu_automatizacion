#!/bin/bash

# Script para unificar todos los logs orgánicos en steven.log
# Autor: Steven

cd ~

# Eliminar log previo si existe
rm -f steven.log

# Buscar y concatenar todos los logs orgánicos
for log in practica_organica_*.log practica_final_*.log 50_comandos_*.log command-line-challenges/challenges/*.log; do
  if [ -f "$log" ]; then
    cat "$log" >> steven.log
    echo -e "\n\n" >> steven.log
  fi
done

echo "✅ Todos los logs orgánicos han sido unificados en steven.log"
ls -lh steven.log 