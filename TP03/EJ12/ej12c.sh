#!/bin/bash
# EJERCICIO 12c
# Realizar una calculadora que ejecute las 4 operaciones básicas: +, - ,*,%.
# Esta calculadora debe funcionar recibiendo la operación y los 2 números como parámetros

if [ $# -ne 3 ];then
   echo "Error de parametros"
   exit 1 # Error
 else
  case $2 in
    "\*") echo "Multiplicacion" $1 " * " $3;
         echo "El resultado : `expr $1 \* $3`";
         echo ""
         ;;
    "/") echo "Divicion" $1 " / " $3;
         echo "El resultado : Entero `expr $1 / $3` y Resto `expr $1 % $3`";
         echo ""
         ;; 
    "+") echo "Suma" $1 " + " $3;
         echo "El resultado : `expr $1 + $3`";
         echo ""
         ;;   
    "-") echo "Resta" $1 " - " $3;
         echo "El resultado : `expr $1 - $3`";
         echo ""
         ;;    
  esac
 fi
