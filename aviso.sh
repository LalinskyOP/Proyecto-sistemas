#!/bin/bash
clear
deudores=0
for ((i=1;i<=16;i++)); do  cont=$(grep -w $i historial_pago.txt | grep -o -e "N" | wc -l); if [ $cont -ge 4 ]; then  let deudores=$deudores+1; mkdir Deudores; nombre=$(grep -wq -e $i propietarios.txt | cut -d ":" -f2); apellido=$(grep -wq -e $i propietarios.txt | cut -d ":" -f3); fecha=$(date +%d/%m/%Y);suman=$(grep -w -e $i historial_pago.txt | grep -o "N" | wc -l); deuda=$(($suman * 2100))echo " $fecha\nApartamento: $i\nNombre: $nombre\nApellido: $apellido\nCantidad de meses a pagar: $suman\nDeuda a pagar: $deuda" > Deudores/"$nombre$apellido%i"; done
if [ $deudores!=0 ]
then echo "Hay $deudores inquilinos que deben cuatro meses o m$aacutes"
sleep 3
clear
'menuproyecto.sh'
else
'menuproyecto.sh'
fi

