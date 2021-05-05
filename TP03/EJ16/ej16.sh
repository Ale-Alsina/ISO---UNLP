#!/bin/bash
# Realizar un script que reciba como parámetro una extensión y
# haga un reporte con 2columnas, el nombre de usuario 
# y la cantidad de archivos que posee con esa extensión. 
# Sedebe guardar el resultado en un archivo llamadoreporte.txt
clear;
# validar por la negativa sino exite parametro, fin script
# si exit status = 2 -> fin del script
if [ $# -eq 0 ]; then # si es 0 -> error no hay param
  echo "" >&2;
  echo "------------------------------------">&2;
  echo "| No existe paramtero: 'extension' |">&2;
  echo "------------------------------------">&2;
  echo "">&2;
  exit 2;  # terminar script con error 2
fi

# Continuar ...
#truncar archivo con datos o crear sino existe
echo "----------------------------" > reporte.txt;
echo "ARCHIVOS CON EXTENSION '.$1'">> reporte.txt; 
echo "----------------------------" >> reporte.txt;
#echo "" >> reporte.txt;
for linea in $(cat /etc/passwd | cut -d: -f 1,6); do
  user=$(echo $linea | cut -d: -f 1);
  home=$(echo $linea | cut -d: -f 2); 
  #solo usuarios con directorio personal real
  if [ -d $home ]; then
    echo -e "$user\t\t$(find $home -name "*.$1" | wc -l)" >> reporte.txt;
  fi
done
