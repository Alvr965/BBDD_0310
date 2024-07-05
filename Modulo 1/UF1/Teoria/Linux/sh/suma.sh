#!/bin/bash
SUMA=0
read -p "Introduzca un numero: " primero
read -p "Introduzca otro numero: " segundo
if [ $primero -gt $segundo ]; then
	echo "no sabes poner numeros adecuados, tienes que poner el primero mas pequeño que el segundo"
fi

for NUM in $( seq $primero $segundo)
	do let SUMA=SUMA+NUM
	done
echo "La summa desde $primero hasta $segundo es $SUMA"
