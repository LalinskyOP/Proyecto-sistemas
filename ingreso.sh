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
	
		elif [ $meses -eq 1 -a $dia -ge 1 -a $dia -le 10 ]
		then 
		read -p "Usted debe $meses mes, y como esta realizando los pagos en fecha usted tiene un descuento del 5%, el pago seria por el monto de 1995 pesos. Si desea volver al menu principal presione s de lo contrario presione cualquier tecla para efectuar el pago: "  op
		if [ $op = "s" -o $op = "S" ]
		then
			echo -e '\e[0;32mRegresando...\e[0m'
			sleep 2
			clear
			exit
		else
			grep -w -v -e $id_apto historial_pago.txt > auxiliar_pago.txt
			grep -w -e $id_apto historial_pago.txt | sed -n 's/N/S/p' >> auxiliar_pago.txt
			mv auxiliar_pago.txt historial_pago.txt
			echo "El pago se registr&oacute correctamente. "
			sleep 2
			clear
			exit
		fi

		else
			read -p "Usted debe $meses meses. ¿Cuantos meses desea pagar? " debe
			if [ $debe -le $meses -a $debe -gt 0 ]
			then
				
				cont=1
				while [ $cont -le $debe ]
				do
				grep -w -v -e $id_apto historial_pago.txt > auxiliar_pago.txt
				grep -w -e $id_apto historial_pago.txt | sed -n 's/N/S/p' >> auxiliar_pago.txt
				mv auxiliar_pago.txt historial_pago.txt
				let cont=$cont+1
				
				done  						#NUNCA LLEGA A ESTA PARTE, NO TIRA EL MSJ
				echo "Pago realizado con exito."|
				sleep 3
				clear
				exit
			else
				echo "Dato incorrecto. Volviendo al menu principal..."
				sleep 2
				clear
				exit
			
			fi	  
 		fi
	fi

#Integrantes del equipo: Leandro Camarano, José Lecha y Renzo Villella 
#Grupo: 2°BH


