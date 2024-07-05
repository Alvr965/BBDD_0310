@echo off
chcp 65001
rem Programa: copiabarata.bat
xcopy /I /E "c:\users\Mañanas\Documents" "c:\users\Mañanas\cosis_cososas"
if errorlevel 1 goto Error
if errorlevel 0 echo ¡La copia fue correcta!
goto Final
:Error
 echo Se produjo un error durante la copia
:Final
