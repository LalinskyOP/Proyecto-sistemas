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
1) ./verificar.sh ;;
2) ./ingreso.sh;;
3) ./menuproyecto.sh;;
*) echo Opcion incorrecta
esac
done

