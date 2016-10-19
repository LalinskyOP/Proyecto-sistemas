#!/bin/bash
clear 
read -p "Ingrese el número de apartamento: " id_apto 
if grep -wq $id_apto pagos.txt 2> /dev/null 
then
	echo -n "El pago ya fue realizado con éxito\n"
	exit
else
	echo -n "No hay ningun pago, para pagar presione cualquier tecla, para salir presione la tecla s"
	read op
	if [ $op = s ]
	then 
		echo -e '\e[1;32m Saliendo...\e[0m'
	fi
sleep 1
exit
fi
