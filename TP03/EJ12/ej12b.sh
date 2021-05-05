#!/bin/bash
# EJERCICIO 12b
# Modificar el script creado en el inciso anterior para que 
# los números sean recibidos como parámetros. 
# El script debe controlar que los dos parámetros sean enviados.
# EJERCICIO 12a (ej anterior)
# Realizar un script que le solicite al usuario 2 números,
#los lea de la entrada Standard e imprima la multiplicación,
# suma, resta y cual es el mayor de los números leídos
if [ $# -eq 2 ];then
  echo "";
  echo "Valor 1er PARAM = "$1" | Valor 2do PARAM = " $2;
  echo "";
  echo "------------- SUMA ---------------";
  echo "El resultado de la suma es: `expr $1 + $2` ";
  echo "";
  echo "------------- RESTA --------------";
  echo "El resultado de la resta es: `expr $1 - $2`";
  echo "";
  echo "--------- MULTIPLICACION ---------";
  echo "El resultado de la multiplicacion : `expr $1 \* $2`";
  echo "";
  echo "--------- MAYOR NUMERO ---------";
  if [ $1 -gt $2 ];then 
   echo "Es mayor el numero: $1";
   else
    echo "Es mayor el numero: $2";
  fi
 else
   echo "ERROR EN EL PASAJE DE PARAMTEROS";
fi
