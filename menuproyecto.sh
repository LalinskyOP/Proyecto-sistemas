#!/bin/bash
clear
deudores=0
for ((i=1;i<=16;i++)); do  cont=$(grep -w $i historial_pago.txt | grep -o -e "N" | wc -l); if [ $cont -ge 4 ]; then  let deudores=$deudores+1; fi; done
if [ $deudores!=0 ]; then echo "Hay $deudores inquilinos que deben cuatro meses o m$aacutes"; sleep 3; clear; fi

while [ "$var" != 3 ]
do
echo  " Bienvenidos 

1) Ingrese pago 
2) Consultas 
3) Salir

Ingrese la opcion deseada: "
read var
case $var in
1) chmod u+x metodo_pago.sh; ./metodo_pago.sh;;
2) chmod u+x consulta.sh; ./consulta.sh;;		
3) echo -e '\e[0;32m Saliendo...\n \e[0m'; sleep 1; clear; exit;;
*) echo -e "\n\e[0;31mOpcion incorrecta\e[0m"; sleep 1; clear;; 
esac
done
done

#Integrantes del equipo: Leandro Camarano, José Lecha y Renzo Villella 
#Grupo: 2°BH

