#!/bin/bash
clear
nom_archivo="aeropuertos_detalle.csv"
num_columna=$1                            # 1) El 1er parám es núm de COLUMNA(siempre de ser mayor a 0).
num_fila=$2                               # 2) El 2do es núm de FILA(debe ser >1 y < a cant de filas d/archivo).
tot_filas=$(cat $nom_archivo | wc -l)  # Contar la cantidad de filas del archivo para validar 
error="INVALID PARAMETERS"                # Inicializar "error" con valor inicial
 
# validar "param <> a 2", "1er param no mayor a 0", "2do param menor a 1", "2do param mayor a total_filas

  if [ $# -eq 2 ]; then                          # si cant de param no es 2. Entonces... 
    if [ $num_columna -gt 0 ];then                # si si la columna pedida es mayor a 0. Entonces...
      if [ ! $num_fila -lt 1 ];then               # si numero de fila pedida no es menor a 1. Entonces... 
        if [ $num_fila -gt $tot_filas ];then       # si num de fila supera total filas archivo. Entonces...                                
          echo "$error"                               # Mostrar Msj error  
          exit 4                                      # Error en nro fila sup tot filas del archivo = exit 4
        fi                                          # Fin if 4
      else                                          # sino ...no valido 2do param-> es menor a cabecera de arch
        echo "$error"                                 # Mostrar Msj error 
        exit 3                                        # Error en nro fila menor a la cabecera = exit 4
      fi                                           # Fin if 3
    else                                           #sino... 
      echo "$error"
      exit 2        #-> Error en columna = exit 2
    fi
  else
   echo "$error"
   exit 1           #-> Error en la cant = exit 1
  fi

# Para el 3er valor pedido obtener el nombre de la comlumna 
nom_colum=$(cat $nom_archivo | head -n ${num_fila} | tail -n 1 | cut -d';' -f${num_columna})

#MOSTRAR LOS 3 VALORES SOLICITADOS
# Titulo de la columna->Mostar del archivo, desde la cabecera -1, filtrando por ";", valor de col nro= 1er param
echo "$(cat $nom_archivo | head -n 1 | cut -d';' -f${num_columna})"

# El valor Celda->Mostrar fila ="1er Param(num_columna)", columna= "2do Param(num_fila)"                ???
# El valor de la fila indicada en el primer parámetro para la columna indicada en el segundo parámetro. ???
echo "$(cat $nom_archivo | head -n ${num_fila} | tail -n 1 | cut -d';' -f${num_columna})"

#El 3er valor es la cant de filas q poseen dicho valor para la colum indicada en el 2do parám en el archivo.
echo "$(cat $nom_archivo | cut -d';' -f$num_columna | grep "$nom_colum" | wc -l)"


