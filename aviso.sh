#!/bin/bash
clear
chmod u+x menuproyecto.sh
chmod u+x metodo_pago.sh
chmod u+x consulta.sh
chmod u+x deuda.sh
chmod u+x ingreso.sh
chmod u+x verificar.sh
chmod u+x propietario.sh
deudores=0
if [ Deudores ]
then
	for ((i=1;i<=16;i++))
	do  
	cont=$(grep -w $i historial_pago.txt | grep -o -e "N" | wc -l)
	if [ $cont -ge 4 ]
	then  
		let deudores=$deudores+1
		nombre=$(grep -w -e $i propietarios.txt | cut -d ":" -f2)
		apellido=$(grep -w -e $i propietarios.txt | cut -d ":" -f3)
		fecha=$(date +%d/%m/%Y)
		suman=$(grep -w -e $i historial_pago.txt | grep -o "N" | wc -l)
		deuda=$(($suman * 2100))
		echo -e " $fecha\nApartamento: $i\nNombre: $nombre\nApellido: $apellido\nCantidad de meses a pagar: $suman\nDeuda a pagar: $deuda" > Deudores/"$nombre$apellido$i"
	fi
	done
else
mkdir Deudores
for ((i=1;i<=16;i++))
do  
cont=$(grep -w $i historial_pago.txt | grep -o -e "N" | wc -l)
if [ $cont -ge 4 ]
then  
	let deudores=$deudores+1
	nombre=$(grep -w -e $i propietarios.txt | cut -d ":" -f2)
	apellido=$(grep -w -e $i propietarios.txt | cut -d ":" -f3)
	fecha=$(date +%d/%m/%Y)
	suman=$(grep -w -e $i historial_pago.txt | grep -o "N" | wc -l)
	deuda=$(($suman * 2100))
	echo -e " $fecha\nApartamento: $i\nNombre: $nombre\nApellido: $apellido\nCantidad de meses a pagar: $suman\nDeuda a pagar: $deuda" > Deudores/"$nombre$apellido$i"
fi
done
fi
if [ $deudores!=0 ]
then
	echo "Hay $deudores inquilinos que deben cuatro meses o mas de alquiler."
	sleep 3
	clear
	'./menuproyecto.sh'
else
	'./menuproyecto.sh'
fi

#Integrantes del equipo: Leandro Camarano, José Lecha y Renzo Villella 
#Grupo: 2°BH
