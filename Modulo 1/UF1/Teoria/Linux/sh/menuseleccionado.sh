#!/bin/bash
select FICHERO in $( ls )
do
	echo "Has seleccionado $FICHERO como fichero"
	echo "Recuerda que si quieres salir de la seleccion, pulsa ctrl+c"
done

