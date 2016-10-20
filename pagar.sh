#!/bin/bash
# set -x; # debug...
# sample data
# [kolita@lilith pt-stalk]$ cat /tmp/pagos 
# 1 2 3 4 5 6 7 8 9 10 11 12
# A1 Y Y Y N Y Y N Y N
# A2 N N N Y N Y Y N Y
# A3 Y Y Y N Y Y N Y N
# A4 Y Y Y N Y Y N Y N
# A5 Y Y Y N Y Y N Y N
# A6 Y Y Y N Y Y N Y N
# A7 Y Y Y N Y Y N Y N
# A8 Y Y Y N Y Y N Y N
# A9 Y Y Y N Y Y N Y N
# A10 Y Y Y N Y Y N Y N
# A11 Y Y Y N Y Y N Y N
# A12 Y Y Y N Y Y N Y N
# A13 Y Y Y N Y Y N Y N
# A14 Y Y Y N Y Y N Y N
# A15 Y Y Y N Y Y N Y N
# A16 Y Y Y N Y Y N Y N

#!/bin/bash
# set -x; # debug...

# load functions
source /tmp/common_functions.sh


cat /tmp/pagos;
echo "=================================================";

# esto hay que corregir el flujo para volver al menu anterior y tambien hay que abstraer el leer el # de apto a una funcion aparte
proximo="C"; # Continuar
while true; do {
  read -p "ingrese apartamento: " PAGO_APT;
  if [[ $(apartamento_es_valido $PAGO_APT) -gt 0 ]]; then {
    echo "'${PAGO_APT}' no es un numero de apartamento valido";
    read -p "presione S para salir o cualquier tecla para intentar nuevamente" proximo;
    if [[ $proximo == "S" ]]; then { # Salir
      break; 
    } fi;
  } else { 
    break; # exit loop
  } fi;
} done;

echo "$proximo"; read;


read -p "ingrese mes a pagar: " PAGO_MES;
PAGO_MES_POS=$(($PAGO_MES + 1)); # por la columna con el id de apartamento
TMP_FILE=$(mktemp); # obtengo nombre archivo temporal
echo "1 2 3 4 5 6 7 8 9 10 11 12" >> $TMP_FILE; # agregamos cabecera meses al archivo

while read APT_LINE; do { 
  APT=$(echo $APT_LINE |awk '{print $1}'); # extraigo # de apto
  if [[ "A${PAGO_APT}" == "${APT}" ]]; then { # si el apto actual en el while es el deseado...      
     APT_LINE_MES=$(echo $APT_LINE |cut -d " " -f $PAGO_MES_POS); # obtengo dato actual para el mes que se desea pagar
     if [[ "${APT_LINE_MES}" == "Y" ]]; then { # si ya pago...
       MSG="el mes ${PAGO_MES} para el apartamento ${PAGO_APT} ya esta pago";
       echo $APT_LINE >> $TMP_FILE;
     } else { # si no pago
       MSG="el pago del apartamento ${PAGO_APT} para el mes ${PAGO_MES} fue realizado con exito";
       IZQ=$(echo $APT_LINE |cut -d " " -f 1-$(( ${PAGO_MES_POS} - 1 ))); # cortamos la izquierda del mes a pagar
       DER=$(echo $APT_LINE |cut -d " " -f $(( ${PAGO_MES_POS} + 1 ))-); 
       echo "$IZQ Y $DER" >> $TMP_FILE;
     } fi;
     
     # verificar si estaba en archivo deudores
     if [[  $(es_moroso "$PAGO_APT") -gt 0 ]]; then {
       echo "$APT debe $(meses_deuda ${PAGO_APT})" >> /tmp/deudores;
     } fi;     
  } else {
     echo $APT_LINE >> $TMP_FILE;
  } fi;
} done <<< "$(cat /tmp/pagos |tail -n +2)";

mv /tmp/pagos /tmp/pagos.old.$(date +%s) && mv $TMP_FILE /tmp/pagos;
cat /tmp/pagos;
echo "${MSG}"; 
read -p "presione cualquier tecla para continuar.";
