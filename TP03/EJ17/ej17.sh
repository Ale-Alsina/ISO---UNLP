#!/bin/bash
# Escribir un script que al ejecutarse imprima en pantalla
#  *los nombre de los archivos que se encuentran en el directorio actual,
#      -- intercambiando minúsculas por mayúsculas,
#      -- además de eliminar la letra a (mayúscula o minúscula).
#  *Ejemplo, directorio actual: IsO pepE Maria
#     Obtendré como resultado:
#                              iSo
#                              PEPe
#                              mRI

function checkDir(){          # funcion : verificar o crear el directorio para trabajar sobre el
  if [ -d $ruta ]; then       # si existe el directorio entonces
    ruta='./'$ruta;           # actualizar ubicacion del directorio
    cd './'$ruta;             # entrar al directorio de trabajo
  else                        #sino no existe
    mkdir $ruta;              # crear directorio
    echo "Se creara $ruta de prueba con archivos Iso, pepE y Maria";
    cd './'$ruta;                    # ingresar al directorio creado
    touch IsO pepE Maria;            # agregar o crear archivos 
  fi  
}

ruta="DIR";                          # simular un dir y crear 3 archivos "ponele el nom que quieras"
checkDir;                            # retorna con la ruta para ser tratado
ls  | tr a-zA-Z A-Za-z | tr -d [aA]; # tratar y mostrar resultado del la op
# Donde 
#    => 1ro tr -d [aA]       -> alimina tanto "a" como "A" de cadena c/nom arch
#    => 2do tr a-zA-Z A-Za-z -> intercambio de mayusc a minusc y visceversa
#    => 3ro lista el contenido


