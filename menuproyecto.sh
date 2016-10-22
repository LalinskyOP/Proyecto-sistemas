#!/bin/bash
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
1) ./metodo_pago.sh;;
2) ./consulta.sh;;		
3) echo -e '\e[0;36m Saliendo...\n \e[0m' ; sleep 1; clear; exit 1  ;;
*) echo -e '\e[0;31m Opción incorrecta\e[0m' 
esac
done

