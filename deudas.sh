#!/bin/bash
clear
read -p "Ingrese el número de su apartamento: " i
if grep -wq -e $i propietarios.txt 2> /dev/null
then
	nom=$(grep -w -e $i propietarios.txt | cut -f2 -d ":")
	ape=$(grep -w -e $i propietarios.txt| cut -f3 -d ":")
	ci=$(grep -w -e $i propietarios.txt| cut -f4 -d ":")
	tel=$(grep -w -e $i propietarios.txt| cut -f5 -d ":")
	suman=$(grep -w -e $i historial_pago.txt | grep -o "N" | wc -l)
	deu=$(($suman * 2100))
	echo -e "Apartamento: $i\nNombre: $nom\nApellido: $ape\nCédula: $ci\nTeléfono: $tel\n Meses a pagar: $suman\nTiene que pagar: $deu pesos"
	read -p "Para volver presione cualquier tecla: " op
	if [ $op ]
	then
	sleep 1
	clear
	'./consulta.sh'	
	
	fi
else
echo -e "\n\e[0;31mOpcion incorrecta\e[0m"
sleep 1
clear
exit
fi
