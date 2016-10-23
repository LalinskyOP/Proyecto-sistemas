#!/bin/bash
clear
read -p "Ingrese el número de apartamento del que desea consultar la información: " i
if grep -wq $i propietarios.txt 2> /dev/null
then
	nom=$(grep -w -e $i propietarios.txt | cut -f2 -d ":")
	ape=$(grep -w -e $i propietarios.txt| cut -f3 -d ":")
	ci=$(grep -w -e $i propietarios.txt| cut -f4 -d ":")
	tel=$(grep -w -e $i propietarios.txt| cut -f5 -d ":")
	grep -w -e $i historial_pago.txt > deudores.txt
	grep -e "N" deudores.txt > deudoresdos.txt
	mv deudoresdos.txt deudores.txt
	cadena=$(cat deudores.txt)
	if [ $cadena ]
	then
		deu="Si"
	else
		deu="No"
	fi 
	echo -e "Apartamento: $i\nNombre: $nom\nApellido: $ape\nCédula: $ci\nTeléfono: $tel\nDebe? $deu"
	
	echo ""
	read -p "Presione la tecla s para salir o cualquier otra tecla para regresar al menú anterior." op
	if [op = s -o op = S]
	then
		echo -e "Saliendo..."
		sleep 1
		clear
		exit
	else
	'./consulta.sh'
	fi
fi


