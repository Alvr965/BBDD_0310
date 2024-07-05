#!/bin/bash 
clear
read -p "Introduce una palabra: " palabra
if [[ $palabra == J* ]]; then
	echo "Encontraste mi secreto"
else
	echo "Eres una desgracia"
fi
