@echo off
if "%1"=="" goto end
if exist %1 goto borrar
:borrar del %1
goto fin
:aviso
echo El fichero no existe cazurro
:fin
echo Eliminiacion commpletada
:end
echo Muerte subita