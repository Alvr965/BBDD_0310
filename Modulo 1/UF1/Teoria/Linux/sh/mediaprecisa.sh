read -p "Introduce la nota de matematicas: " NOTAMAT
read -p "Introduce la nota de lengua: " NOTALEN
read -p "Introduce la nota de quimica: " NOTAQUI
MEDIA=$(echo "scale=3; ($NOTAMAT + $NOTALEN + $NOTAQUI) / 3" | bc)
echo la media de las notas de las siguientes asignaturas es $MEDIA
