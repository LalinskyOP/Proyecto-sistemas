#!/bin/bash
clear
read -p "Ingrese el número de apartamento del que desea consultar la información: " i
if grep -wq $i propietarios.txt 
then
	nom=$(grep -w -e $i propietarios.txt | cut -f2 -d ":")
	ape=$(grep -w -e $i propietarios.txt| cut -f3 -d ":")
	ci=$(grep -w -e $i propietarios.txt| cut -f4 -d ":")
	tel=$(grep -w -e $i propietarios.txt| cut -f5 -d ":")
	can=$(grep -w -e $i historial_pago.txt | grep -o "N" | wc -l)
	if [ $can -eq 0 ]
	then
	deu="No"
	else
	deu="Si"
	fi
	echo -e "Apartamento: $i\nNombre: $nom\nApellido: $ape\nCédula: $ci\nTeléfono: $tel\nDebe? $deu"
	echo ""
	read -p "Presione la tecla s para salir o cualquier otra tecla para regresar al menú anterior: " op
	if [op = s -o op = S]
	then
		echo -e "Saliendo..."
		sleep 1
		clear
		exit
	else
	'./consulta.sh'
fi
else 
echo -e '\e[0;31mOpción incorrecta\e[0m'
sleep 1
clear
exit
	fi
