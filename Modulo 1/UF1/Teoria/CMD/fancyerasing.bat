@echo off
if not exist %1 goto aviso
if exist %1 goto borrar
:borrar del %1
goto fin
:aviso
echo El fichero no existe cazurro
:fin
echo Eliminiacion commpletada