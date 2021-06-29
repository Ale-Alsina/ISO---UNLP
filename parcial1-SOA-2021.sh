#!/bin/bash
# Debe escribir un script de bash en el archivo script.sh que lea una serie de valores por la entrada estandard.
# Por cada entrada del usuario, se debe validar que se cumple con el siguiente formato:
#   •  Deben ser solo letras.
#   •  Ademas debe verif q el usuario NO REPITA valores,es decir q no vale ingresar mismo valor mas de una vez.
#   •  La cantidad de letras del valor ingresado no debe ser mayor 10.
# SOLO PARA LOS QUE ADEUDAN AUTO EVALUACIONES:
#   •  Las letras deben ser todas mayúsc o todas minúsc. Es decir q no se pueden mezclar mayúsculas y minúsculas
#
# -El script termina cuando el usuario ingresa una linea vacía (<-"Enter"->).
# -Al final del script debe informar cuantos valores válidos e inválidos ha ingresado el usuario.
# -Si el usuario no cometió errores el script debe finalizar como todo proceso en Unix que termina correctamente,
#  caso contrario, como todo proceso en Unix que finaliza con errores.
#
# Restricciones
#   Debe utilizar una (o mas) funciones para organizar las validaciones.
#   Es decir que las validaciones no deben estar en el cuerpo principal del script.

vValores=();
errores=0;

function validar_longitud() {               #
  if [ $(expr length "$1") -le 10 ]; then
    return 0;
  else
    return 1;
  fi
}

function validar_solo_numeros() {
  son_caracteres='^[a-zA-Z]+$';
  if ! [[ $1 =~ $son_caracteres ]] ; then
    return 1;
  else
    return 0;
  fi
}

function validar_solo_mayusculas() {
  todas_mayusculas='^[A-Z]+$';
  if ! [[ $1 =~ $todas_mayusculas ]] ; then
    return 1;
  else
    return 0;
  fi
}

function validar_solo_minisculas() {
  todas_minusculas='^[a-z]+$';
  if ! [[ $1 =~ $todas_minusculas ]] ; then
    return 1;
  else
    return 0;
  fi
}

function validar_si_existe_elemento() {
  existe=0;
  for elemento in ${vector_elementos[*]}; do #bucle para recorrer los elementos del vector
    if [ $elemento = $1 ];then
      return 1;
    fi
  done
  return 0; #finaliza el recorrido del vector por lo tanto no existe el elemento
}


function validar() {
  #valido la longitud de la cadena ingresada
  validar_longitud $1;
  if [ $? -eq 0 ]; then
    #valido si la cadena tiene numeros
    validar_solo_numeros $1;
    if [ $? -eq 1 ] ; then
   	  echo "ERROR: contiene numeros";
      errores=$((errores+1));
    else
      #valido si son todas mayusculas
      validar_solo_mayusculas $1;
      if [ $? -eq 1 ] ; then
        #si no son mayusculas valido si son todas minusculas
        validar_solo_minisculas $1;
        if [ $? -eq 1 ] ; then
          echo "ERROR: combinacion de mayusculas y minusculas";
          errores=$((errores+1));	
        else
          #valido si ya ingreso el valor antes
          validar_si_existe_elemento $1;
          if [ $? -eq 0 ];then
            vector_elementos=( "${vector_elementos[@]}" $1 ); #si no existe el elemento lo agrego al vector
          else
            echo "ERROR: elemento ya ingresado previamente";
            errores=$((errores+1));
          fi
        fi
      else
        #valido si ya ingreso el valor antes
        validar_si_existe_elemento $1;
        if [ $? -eq 0 ];then
          vector_elementos=( "${vector_elementos[@]}" $1 ); #si no existe el elemento lo agrego al vector
        else
          echo "ERROR: elemento ya ingresado previamente";
          errores=$((errores+1));
        fi
      fi
    fi
  else
    echo "ERROR: el valor ingresado supera los 10 caracteres";
    errores=$((errores+1));
  fi
}

############################################# MAIN ############################################
clear
echo -n "Ingrese un valor: ";
read valor;
while [ "$valor" ]; do #bucle hasta que el usuario ingrese enter 
  validar $valor;	#invoco a la función con el valor ingresado por entrada estandar	
	echo -n "Ingrese otro valor: ";
  read valor;
done
echo "La cantidad de errores es $errores"
echo "La cantidad de valores validos es ${#vector_elementos[*]}" "=>" "${vector_elementos[*]}"
 
if [ $errores -eq 0 ];then
	exit 0;
else
	exit 1;
fi;
