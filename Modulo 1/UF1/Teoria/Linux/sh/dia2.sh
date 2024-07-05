#!/bin/bash 
DIA=$( date +%d )
if [ $DIA -lt 15 ]; then
	echo "Estamos en los primeros quince dias para que te enteres"
else
	echo "NO estamos en los primeros quince dias para que no te enteres"
fi
