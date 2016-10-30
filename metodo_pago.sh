#!/bin/bash
clear
while [ "$var" != 0 ]
do
echo "*****************************************
| ¿De que forma desea realizar el pago? |
|					|
| 1) Deposito bancario			|
| 2) En efectivo			|
| 3) Regresar al menú principal		|
|					|
| Ingrese opción deseada:		|
***************************************** "		
read var
case $var in
1) ./verificar.sh ;;
2) ./ingreso.sh;;
3) echo -e '\e[0;32mRegresando...\e[0m' ; sleep 1;clear; sh menuproyecto.sh; exit;;
*) echo -e "\n\e[0;31mOpcion incorrecta\e[0m";sleep 1; clear;;
esac
done


#Integrantes del equipo: Leandro Camarano, José Lecha y Renzo Villella 
#Grupo: 2°BH

