#!/bin/bash


# RECIBE 3 PARAMETROS
provincia=$1
num_fila=$2
tipo_festividad=$3

nom_archivo="fiestas-y-festivales.csv"    # Var enlace al archivo c/datos 
total_filas=$(cat $nom_archivo | wc -l)   # Contar cant de lineas del archivo
error="INVALID PARAMETERS"                # Var error seteado (debe mostrarse si lo hay)

#VALIDACION
if [ $# -eq 3 ]; then                        # si la cantidad de parametros recibidos es 3. Entonces...
  if [ "$provincia" != " " ]; then            # si existe Pcia o 1er parametro no es vacio. Entonces... 
    if [ $num_fila -gt 1 ] ;    then           # si 2do param es mayor a 1(1er fila=encabezado No cuenta). Entonces... 
      if [ ! $num_fila -gt $total_filas ];then  # si 2do param no sea mayor al total de filas del archivo.  Entonces...
        if [ $tipo_festividad = " " ];then       # si no existe "tipo festividad" o 3er parametro es vacio.  Entonces...  
          echo "$error"                           # Mostrar error (falto 3er parametro)
          exit 4                                  # Salir de ejecucion con cod error 4 (s/ tercer parametro)
        fi                                       # Fin si tipo_festividad
      else                                      # sino ...
        echo "$error"                            # Mostrar error (fila pedida supera filas del archivo)
        exit 3                                   # Salir de ejec c/cod error 3 (3cer param sobrepasa tot fila archivo)
      fi                                       # Fin si 3r param NO es mayor al tot de filas 
    else                                      # sino ...
      echo "$error"
      exit 3
    fi
  else
    echo "$error"
    exit 2
  fi
else
  echo "$error"
  exit 1
fi
clear
# 1) Retornar cantidad de festividades en la provincia indicada en el primer parámetro
# contar las coincidencias listadas y filtradas c/1er param y la col 5 "provincia" del archivo y mostar-> pantalla 
echo "$(cat $nom_archivo | cut -d',' -f5 | grep "^$provincia$" | wc -l)"

# BUSCAR y MANTENER valor de la celda elegina col nombre "nombre de la festividad" (2do parametro)
# extraer dato de la columna 7(nombre) acotado desde inicio hasta las $num_fila quedandose c/ultima y guardarlo en var
nom_fest=$(cat $nom_archivo | head -n $num_fila | tail -n 1 | cut -d',' -f7)

# 2) El nombre de la festividad para la fila indicada en el segundo parámetro (el valor de la columna nombre).
echo "$nom_fest"

# 3)La cant de festividades de ese tipo (ignorando mayúsculas y minúsculas)
echo "$(cat $nom_archivo | cut -d',' -f18 | grep -i "$tipo_festividad" | wc -l)"
