#!/bin/bash 
read -p "Introduce el numero de hijos: " NUMEROHIJOS
if [ $NUMEROHIJOS -lt 10 ]; then
	echo "eres una mentira hecha persona declarando que tienes, dicho con tus palabras, tan poca descendecia, eres una desgracia"
elif [ $NUMEROHIJOS -gt 50 ]; then
	echo "sigues mintiendo mas que la persona que nos dejo con mas deudas que granos en la playa"
elif [ $NUMEROHIJOS -eq 39 ]; then
	echo "por fin asumes tus responsabilidades"
fi
