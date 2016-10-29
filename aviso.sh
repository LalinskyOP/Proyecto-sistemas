#!/bin/bash
clear
deudores=0
for ((i=1;i<=16;i++)); do  cont=$(grep -w $i historial_pago.txt | grep -o -e "N" | wc -l); if [ $cont -ge 4 ]; then  let deudores=$deudores+1; fi; done
if [ $deudores!=0 ]
then echo "Hay $deudores inquilinos que deben cuatro meses o m$aacutes"
sleep 3
clear
'menuproyecto.sh'
else
'menuproyecto.sh'
fi

