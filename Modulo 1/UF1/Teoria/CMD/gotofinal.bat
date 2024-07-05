echo off
rem Programa: DEMO.BAT
echo ********************************************
echo ** Este programa copia todos los ficheros **
echo ** de la unidad A: al directorio actual **
echo ********************************************
pause
:Proceso
copy .\michi
echo Introduzca el siguiente disquete en michi: y pulse Enter
pause >nul
goto Proceso