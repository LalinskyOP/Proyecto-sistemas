#!/bin/bash
clear
while [ "$var" != 3 ]
do
echo " ¿Que desea consultar?

1) Información acerca del propietario
2) Estado de cuenta  
3) Volver al menú principal 

Ingrese su opción deseada: "
read var
case $var in
1) ./propietario.sh;;
2) ./deudas.sh;;
3) echo -e '\e[0;32m Saliendo...\e[0m';sleep 1;clear;;
*) echo -e '\e[0;31m Opción incorrecta\e[0m'
esac 
done
