#!/bin/bash
# EJERCICIO 13b
# Crear un script que muestre 3 opciones al usuario:
# Listar, DondeEstoy y QuienEsta.
# Según la opción elegida se le debe mostrar:
#  - Listar: lista el contenido del directoria actual.
#  - DondeEstoy: muestra el directorio donde me encuentro ubicado.
#  - QuienEsta: muestra los usuarios conectados al sistema.

function listar(){
    echo ""
    echo "-----------------lISTAR CONTENIDO DIRECTORIO ACTUAL-------------------------"
    echo `ls`;
    echo "----------------------------------------------------------------------------"
    echo ""
}
function mostrar(){
    echo ""
    echo "--------------------------MOSTRAR DIR ACTUAL--------------------------------"
    echo `pwd`
    echo "----------------------------------------------------------------------------"
    echo "" 
}
function usuarios(){
    echo ""
    echo "----USUARIOS CONECTADOS-----------"
    echo `whoami`
    echo "----------------------------------"
    echo ""
}
function ejecutar (){
  case $opcion in
    "1")
        listar
        ;;
    "2")
        mostrar
        ;;
    "3")
        usuarios
        ;;
      *)
        echo "Opcion elegida no valida para el menu..."
  esac  
}
until  [ "$opcion" = "F" ] || [ "$opcion" = "f" ]; do
  clear
  echo Seleccione la opcion deseada
  echo
  echo 1- Listar directorio actual
  echo
  echo 2- Mostrar directorio actual
  echo
  echo 3- Usuarios conectados
  echo
  echo "f o F -> Salir..."
  echo
  read -n 1 -p "Introduzca una de opcion: " opcion;
  echo
  if [ "$opcion" = "1" ] || [ "$opcion" = "2" ]|| [ "$opcion" = "3" ]; then
    ejecutar
    read -n 1 -p "Pulse una tecla para continuar..." tecla
  fi
done
