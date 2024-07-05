#!/bin/bash 
if ! [ -d /media/usbdisk/scripts ]; then 
mkdir /media/usbdisk/scripts 
fi 
for programa in $( find ~ -iname “*sh” 2> /dev/null ); do 
echo “copiando el script :” $programa 
cp $programa /media/usbdisk 
done 
