read -p "Introoduce la nota de Matematicas: " NOTAMAT
read -p "Introoduce la nota de Lengua: " NOTALEN
read -p "Introduce la nota de Biologia: " NOTABIO
SUMA=$[$NOTAMAT + $NOTALEN + $NOTABIO]
MEDIA=$[$SUMA / 3]
echo la media de las notas en las siguientes asignaturas es $MEDIA

