#!/bin/bash
# EJERCICIO 12a
# Realizar un script que le solicite al usuario 2 números,
#los lea de la entrada Standard e imprima la multiplicación,
# suma, resta y cual es el mayor de los números leídos
 echo -n "INGRESE 2 NUMEROS(separados por espacio) : ";  read num1 num2;
 echo "";
 echo "------------- SUMA ---------------";
 echo "El resultado de la suma es: `expr $num1 + $num2` ";
 echo "";
 echo "------------- RESTA --------------";
 echo "El resultado de la resta es: `expr $num1 - $num2`";
 echo "";
 echo "--------- MULTIPLICACION ---------";
 echo "El resultado de la multiplicacion : `expr $num1 \* $num2`";
 echo "";
 echo "--------- MAYOR NUMERO ---------";
 if [ $num1 -gt $num2 ];then 
  echo "Es mayor el numero: $num1";
  else
   echo "Es mayor el numero: $num2";
fi
