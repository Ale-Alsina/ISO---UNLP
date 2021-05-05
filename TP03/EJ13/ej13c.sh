#!/bin/bash
# EJERCICIO 13c
# Crear un script que reciba como parámetro el nombre de un archivo e informe si el
# mismo existe o no, y en caso afirmativo indique si es un directorio o un archivo. En
# caso de que no exista el archivo/directorio cree un directorio con el nombre recibido
# como parámetro.

str=$1;                  # guarda param string (archivo/directorio)
mkdir "`pwd`/Ej13c";     # crear dir donde trabajara el script
ruta="`pwd`/Ej13c/$str"; # apuntar a ese directorio(mantiene orden)

if [ $# -gt 0 ]; then #-> si exiten paramtros entonces ...
  clear; echo "";
  if [ $# -eq 1 ]; then #--> si exiten param y es solo 1
    test -f $ruta;             # consultar si es tipo: Archivo
    if [ $? -eq 0 ]; then      #---> si consulta = 0 (ok) entonces...
      echo "$str --> Es un Archivo..."; #Informar que es Arhcivo
      else #---> sino es archivo entonces...
        test -d $ruta;         # consultar si es tipo: Directorio
         if [ $? -eq 0 ]; then # 
         echo "$str --> Es un Directorio...";
           else
             echo "ERROR! - $str - Inexistente, se creara directorio con ese nombre";
             mkdir $ruta;
             echo "La ruta es: $ruta";
             echo "";
           fi 
      fi
    else #--> Sino demasiados parametros-> informar error
      echo "---------------------------------";
      echo " ERROR!- Demasiados paramteros...";
      echo "---------------------------------";
      echo "";
    fi
  else #-> Sino No existieron parametros-> informar error
    clear; echo "";
    echo "--------------------------";
    echo " ERROR!- Sin paramtero...";
    echo "--------------------------";
    echo "";
fi

