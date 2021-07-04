#!/bin/bash
# Ejercicio1 shell scripting
# Se tiene un archivo con el listado de Información de los Aeropuertos de la República Argentina
# (archivo adjunto aeropuertos_detalle.csv) con la siguiente Información:
# En la primer fila se encuentra el encabezado con el título de las columnas(separados por ";"). Por ejemplo:
#   local;oaci;iata;tipo;denominacion;coordenadas;latitud;longitud;elev;uom_elev;ref;distancia_ref;
#   direccion_ref;condicion;control;region;fir;uso;trafico;sna;concesionado;provincia;inhab
# Luego, cada fila del archivo contiene la lista de valores para c/columna también separados x punto y coma(;).
# Su script va a recibir los siguientes parámetros:
#   1) El primer parámetro es un número de COLUMNA(siempre de ser mayor a 0).
#   2) El segundo es un número de FILA(siempre debe ser mayor a 1 y menor a la cantidad de filas del archivo).
# Su script debe devolver 3 valores(en el orden que se indica):
#  -El título de la columna(lo obtenemos de la primer fila).
#  -El valor de la fila indicada en el primer parámetro para la columna indicada en el segundo parámetro.
#  -El 3er valor es la cant de filas q poseen dicho valor para la colum indicada en el 2do parám en el archivo.
# Ejemplos:
#   1) Si recibo 4 y 10 debo imprimir:
#        tipo
#        Aeródromo
#        566
#    Explicación:
#     "tipo", es el título de la cuarta columna(lo encontramos en la primer fila)
#     "Aeródromo", es el valor de la 10ma fila para la columna tipo(contando desde encabezado q es la 1mer fila)
#     El valor "Aeródromo" para la columna "tipo" se repite 566 veces a lo largo del archivo.
#   2) Si recibo 1 y 2 debo imprimir:
#        local
#        ACB
#        1
#    Explicación:
#     "local", es el nombre de la columna.
#     "ACB", es el valor de la primer fila para la columna local
#     El valor "ACB" para la columna "local" se repite 1 veces a lo largo del archivo.
#   3) Si recibo 3 0, debo imprimir:
#        INVALID PARAMETERS
#    Explicación:
#     El número de columna debe ser mayor a 0
# Importante: Cada valor en una linea separada.
# Es imperativo y OBLIGATORIO q su script retorne valores en el orden indicado y como se detallo anteriormente.
# No imprima cosas innecesarias por pantalla. En tal caso el resultado se considera inválido.
# Debe validar la correctitud de los parámetros y si los mismos son inválidos su script simplemente debe
# imprimir en pantalla "INVALID PARAMETERS"(textual, no cambie el mensaje de error) y finalizar el error con
# una condición de finalización como corresponde a todo proceso bash que finaliza con error.
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
          echo "$error 4"                               # Mostrar Msj error  
          exit 4                                      # Error en nro fila sup tot filas del archivo = exit 4
        fi                                          # Fin if 4
      else                                          # sino ...no valido 2do param-> es menor a cabecera de arch
        echo "$error 3"                                 # Mostrar Msj error 
        exit 3                                        # Error en nro fila menor a la cabecera = exit 4
      fi                                           # Fin if 3
    else                                           #sino... 
      echo "$error 2"
      exit 2        #-> Error en columna = exit 2
    fi
  else
   echo "$error 1"
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
