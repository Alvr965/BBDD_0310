#!/bin/bash 
function saludo { 
local NOMBRE="Jose Antonio" 
echo "Hola señor $NOMBRE encantado de conocerle" 
} 
NOMBRE="Juana" 
saludo 
echo "En el script principal, mi nombre es $NOMBRE"
