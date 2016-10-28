#!/bin/bash
clear

for (( i=1 ; i<=16 ; i++ ))
do
deudores=$(grep -o -w "N" historial_pago.txt | wc -l)
echo "Hay $deudores inquilinos que deben 4 o más meses"
sleep 3
clear

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

