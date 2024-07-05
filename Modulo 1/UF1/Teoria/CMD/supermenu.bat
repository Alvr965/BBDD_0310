@echo off
chcp 65001
rem Programa: supermenu.bat

:Menu
cls
echo *********************
echo ** superdupermenu **
echo *********************
echo 1: Vamos a Documentos
echo 2: Vamos a Downloads
echo 3: Preguntemos a San Google
echo 4: Quieres otro menu? Te doy otro menu eh
echo S: Chaito
echo.
 choice /M "Elige una de las opciones" /C 1234S /D s /T 15
 if errorlevel 5 goto Salir
 if errorlevel 4 goto AnotherMenu
 if errorlevel 3 goto Google
 if errorlevel 2 goto Downloads
 if errorlevel 1 goto Documents
 if errorlevel 0 goto Menu

:Documents
echo Vamos a Documentos
cd \users\Mañanas\Documents
pause
goto Menu

:Downloads
echo Vamos a Downloads
cd \users\Mañanas\Downloads
pause
goto Menu

:Google
echo San Google i choose you
start msedge www.google.es
pause
goto Menu

:AnotherMenu
echo toma dos libertazas
echo 1b) Procesos activos
echo 2b) Matar un proceso activo
echo 3b) Cerramos el negocio
echo 4b) Volvemos al Menu principal

:leloop
choice /C 1234 /N /M "Elija su pildora roja: " /D 4 /T 10
set seleccion=%errorlevel%
if errorlevel 4 goto Menu
if errorlevel 3 goto Shutdown
if errorlevel 2 goto Kill
if errorlevel 1 goto Listing
if errorlevel 0 goto AnotherMenu

:Listing
echo toma todos los procesos activos
tasklist
pause
goto AnotherMenu

:Kill
set /P pid=Introduce el PID del proceso que deseas detener: 
taskkill /pid %pid%
pause
goto AnotherMenu

:Shutdown
echo Goodbye my only fiend in 20 seconds, utiliza shutdown /a para abortar
shutdown \s \t 20
goto Salir

:Salir
echo.