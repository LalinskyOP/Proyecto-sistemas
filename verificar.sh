#!/bin/bash
clear 
read -p "Ingrese el número de apartamento: " id_apto 
if grep -wq $id_apto pagos.txt 2> /dev/null 
then
	echo -n "El pago ya fue realizado con éxito"

	exit
else
	echo -n "No hay ningun pago, para pagar presione cualquier tecla, para salir presione la tecla S:  "
	read op
	if [ $op = s ]
	then 
		echo -e "\n\e[;32mSaliendo...\e[0m"
sleep 1
clear
	fi
exit
fi
