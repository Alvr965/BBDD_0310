#!/bin/bash

read -n 4 -p "Introduzca la numeracion asignada al conteo de ciclos de translacion que le correspondan: " horoscopo
let asignacion=horoscopo%12
echo $asignacion
case $asignacion in
	0)
		echo "Te ha tocado ser de El Mono" ;;
	1)
                echo "Te ha tocado ser de El Gallo" ;;
	2)
                echo "Te ha tocado ser de El Perro" ;;
	3)
                echo "Te ha tocado ser de El Cerdi" ;;
	4)
                echo "Te ha tocado ser de La Rgate" ;;
	5)
                echo "Te ha tocado ser de La Bueyasion" ;;
	6)
                echo "Te ha tocado ser de El Tigreton" ;;
	7)
                echo "Te ha tocado ser de le Bunnismo" ;;
	8)
                echo "Te ha tocado ser de El Rawr grande" ;;
	9)
                echo "Te ha tocado ser de La Anaconda" ;;
	10)
                echo "Te ha tocado ser de El unicornio sin cuerno" ;;
	11)
                echo "Te ha tocado ser de El primo de Belcebu" ;;
esac
