#!/bin/bash
# EJERCICIO 13c
# Renombrando Archivos: 
#  haga un script que renombre solo archivos de un directorio pasado
#  como parametro agregandole una CADENA, contemplando las opciones:
#  “-a CADENA”: renombra fichero concat CADENA al final d/nom d/arch
#  “-b CADENA”: renombra fichero concat CADENA al princ d/nom d/arch
# Ejemplo:
#   Si tengo l/sigtes archivos: /tmp/a /tmp/b
#   Al ejecutar:                ./renombra /tmp/ -a EJ
#   Obtendré como resultado:    /tmp/aEJ /tmp/bEJ
#   Y si ejecuto:               ./renombra /tmp/ -b EJ
#   El resultado será:          /tmp/EJa /tmp/EJb

# $1 directorio, $2 opcion a o b, $3 CADENA
# por simplicidad y orden $1 estara dentro dir donde corre el script
dir=$1;             # guarda param string (directorio)
ruta="`pwd`/TEMP"; # apunta al directorio del script(mantiene orden)

if [ -d "TEMP" ]; then # Consultar si existe dir temp dentro
  cd $ruta;           # si existe ir a ese dir temp y trabajar ahi
else               #sino
  mkdir "TEMP";    # crear dir donde trabajara el script
  cd $ruta;        # ir a ese dir temp
  mkdir $dir;      # crear el dir x ser la 1er vez.
  for i in {1..2}; do  #crear dentro del dir pasado por PARAM
    mkdir "$ruta/$dir/d$i";  # 2 directorios
    touch "$ruta/$dir/f$i";  # 2 archivos
  done 
fi

clear;

# validar parametros = 3
if [ $# -eq 3 ]; then
  if [ -e $dir ];then
    case $2 in
      "a")
           for i in $(ls $dir); do
             mv $dir/$i $dir/$i$3
             done
             ;;
      "b")
           for i in $(ls $dir); do
             mv $dir/$i $dir/$3$i
             done
             ;;
    esac
    else
      echo ""; echo "-----------------------------";
      echo "No existe el directorio";
      echo "-----------------------------";echo ""; 
  fi
else
   echo ""; echo "-----------------------------";
   echo "Cantidad de parametros incorrectos"
   echo "-----------------------------";echo ""; 
fi
