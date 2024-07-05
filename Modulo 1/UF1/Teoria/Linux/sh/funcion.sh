#!/bin/bash 
function doble {
echo "voy a doblar el valor de numero" 
let NUMERO=NUMERO*2
} 
NUMERO=3 
echo '$NUMERO vale : ' $NUMERO 
doble 				# llamamos a la función 
echo '$NUMERO vale : ' $NUMERO
