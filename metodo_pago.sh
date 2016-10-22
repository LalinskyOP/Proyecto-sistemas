#!/bin/bash
clear
while [ "$var" != 3 ]
do
echo "¿De que forma desea realizar el pago?

1) Deposito bancario
2) En efectivo
3) Regresar al menú principal

Ingrese opción deseada: "
read var
case $var in
1) chmod u+x verificar.sh; ./verificar.sh ;;
2) chmod u+x ingreso.sh; ./ingreso.sh;;
3) echo -e '\e[0;32mRegresando...\e[0m' ; sleep 1;clear;;
*) echo -e "\n\e[0;31mOpcion incorrecta\e[0m";sleep 1; clear;;
esac
done

