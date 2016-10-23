#!/bin/bash
clear
fecha=$(date +%d/%m/%Y)
dia=`date +%d`
echo "Hoy es: $fecha" 
	if [ $dia -le 10 ]
		then
read -p "Ingrese su número de apartamento: " id_apto
if grep -wq $id_apto propietarios.txt 2> /dev/null
then
read -p "El pago corresponde al mes de: " corresponde_mes
monto5="1995"
echo -n "El precio es: $monto5"
grep -w -e $id_apto historial_pago.txt 
else
echo -n "Número de apartamento incorrecto, para volver a ingresar un apartamento nuevo presione cualquier tecla, para salir presione s: "
read op
if [ $op = s ]
then 
echo Saliendo...
fi 
fi	
	else 
read -p "Ingrese el número de apartemento: " id_apto
if grep -wq $id_apto propietarios.txt 2> /dev/null
then
read -p "Ingrese el mes a pagar en formato numérico: " corresponde_mes
monto="2100"
echo "Usted realizó el pago de $monto por el mes $corresponde_mes"
grep -v -w -e $id_apto historial_pago.txt > historial_pagoBaja.txt
grep -w -e $id_apto historial_pago.txt | sed "s/N$corresponde_mes/S$corresponde_mes/" >> historial_pagoBaja.txt 
mv historial_pagoBaja.txt historial_pago.txt
         

else
echo Numero de apartamento incorrecto
read op 
	if [ $op = "s" ]
then 
echo Saliendo...
	fi
fi 
fi
sleep 1
