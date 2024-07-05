@echo off
rem Programa: Copy.bat
echo Se estan copiando los ficheros %1, %2, %3 a carpetosa
copy %1 .\carpetosa
del %1 
copy %2 .\carpetosa
del %2
copy %3 .\carpetosa
del %3