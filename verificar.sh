#!/bin/bash
clear
read -p "Ingrese el número de apartamento: " id_apto
if grep -wq $id_apto propietarios.txt 2> /dev/null
then
	read -p "Ingrese mes a pagar con formato numérico: " mes
	m=$(grep -w -e $id_apto historial_pago.txt|cut -d ":" -f$mes)
	if [ $m == S$mes ]
	then 
		echo Ese mes ya está pago.
		sleep 1
		exit
	else
		read -p "Este mes no está pago, si desea salir 			presione la tecla s, si desea proceder con el pago 			presione cualquier tecla: " op 
		if [ $op = s -o $op = S ]
		then	
			echo Saliendo...	
			sleep 1
			clear 
			exit
		else
		'./ingreso.sh'
		fi	
	fi
else
echo -e "\n\e[0;31mOpcion incorrecta\e[0m"
sleep 1
clear exit
fi
	
	
