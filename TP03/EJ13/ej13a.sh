#!/bin/bash
# EJERCICIO 13a
# Realizar un script q visualice por pantalla 
# los núm del 1 al 100 así como sus cuadrados
echo ""; echo "Con for ((x=1; c<=100; c++)){  ...  }";
for (( c=1; c<=100; c++ )){
   echo "Num: $c   | Su cuadrado: $((c ** 2))";
   #sleep 1;
 }
echo ""; echo "Con for x in 1..100;do   ...   done";
## OTRA ALTERNATIVA
for i in {1..100};do
  echo "Num: $i   | Su cuadrado: $((i ** 2))";
  sleep 1;
  done
