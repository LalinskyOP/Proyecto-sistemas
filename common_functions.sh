#!/bin/bash


# obtiene total meses de deuda para un apto
# paramtros posicionales:
# 1: numero apartamento
function meses_deuda() {
  cat /tmp/pagos |grep "A${APT}"| tr " " "\n" |grep --count "N";
}


# verifica si un apartamento tiene mas de 4 meses de deuda
# paramtros posicionales:
# 1: numero apartamento
# devuelve: 1 si es moroso, o 0 (cero) si no lo es
function es_moroso () {
  APT=$1;
  MESES_DEUDA=$(meses_deuda $APT);
  if [[ $MESES_DEUDA -ge 4 ]]; then { echo "1"; } else { echo "0"; } fi;
}


function menu_consultas() {
  clear;
  while [ "$var" != 3 ]; do {
    echo " ¿Que desea consultar?
    1) Información acerca del propietario
    2) Consulta sobre deudas 
    3) Volver al menú principal 
    Ingrese su opción deseada: ";
    read var;
    case $var in
    1) ./propietario.sh;;
    2) ./deudas.sh;;
    3) echo -e '\e[0;32m Saliendo...\e[0m';sleep 1;clear;;
    *) echo -e '\e[0;31m Opción incorrecta\e[0m'
    esac;
  } done;
}

# verifica que un numero de apartamento es valido
# paramtros posicionales:
# 1: numero apartamento
# devuelve: 1 si no existe, o 0 (cero) si existe
function apartamento_es_valido () {
  APT=$1; 
  grep "^${APT}\:" /tmp/propietarios.txt 2>/dev/null 1>/dev/null;
  echo $?;
}
