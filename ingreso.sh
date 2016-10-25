#!/bin/bash
clear
fecha=$(date +%d/%m/%Y)
dia=`date +%d`
echo "Hoy es: $fecha" 

	read -p "Ingrese su número de apartamento: " id_apto
	if grep -wq $id_apto propietarios.txt 
	then
		meses=$(grep -w -e $id_apto historial_pago.txt | grep -o "N" | wc -l)
		if [ $meses -eq 0 ]
		then
			echo "Usted no debe ningun mes."
			sleep 3
			clear
			'./menuproyecto.sh'
		else
			read -p "Usted debe $meses meses. ¿Cuantos meses desea pagar?" debe
			if [ $debe -le $meses -a $debe -gt 0 ]
			then
				grep -q -v -e $id_apto historial_pago.txt > auxiliar.txt
				contador=1
				let repetir=$debe+1
				veces=1
				while [ $contador -gt 1 -a $contador -lt 10 -a $veces -lt $repetir ]
				do
				colum=$(grep -qw -e $id_apto historial_pago.txt | cut -d ":" -f$contador)
				
				if [ colum="N$contador" ]
				then 
					grep -qw -e $id_apto historial_pago.txt | sed 's/N$contador/S$contador/' >> auxiliar.txt
					mv auxiliar.txt historial_pago.txt
					let veces=$veces+1
					let contador=contador+1
				else 
					let contador=$contador+1
				fi
			done			
				echo "Pago realizado con exito."
				sleep 3
				clear
				'./menuproyecto.sh'
			else
				echo "Dato incorrecto. Volviendo al menu principal..."
				sleep 2
				clear
				'./menuproyecto.sh'
			
			fi	  
 		fi
	fi


