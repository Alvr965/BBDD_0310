@echo off
chcp 65001
rem Programa: colourpalette.bat
:Menu
 cls
 echo Opciones de colores
 echo --------------------
 echo.
 echo B5: Fondo Aguamarina Claro con Fuente Morada
 echo 1F: Fondo Azul  con Fuente Blanca
 echo  3: Fondo Negro con Fuente Azul Claro
 echo 47: Fondo Rojo con Fuente Blanco
 echo 79: Fondo Blanco con Fuente Azul
 echo C0: Fondo Rojo con Fuente Negra
 echo S: Salir
 echo.
 choice /M "Elige una de las opciones" /C 123456S /D s /T 15
 if errorlevel 7 goto Salir
 if errorlevel 6 goto C0
 if errorlevel 5 goto 79
 if errorlevel 4 goto 47
 if errorlevel 3 goto 3
 if errorlevel 2 goto 1F
 if errorlevel 1 goto B5
 if errorlevel 0 goto Menu
:B5
 color B5 
 echo B5
 pause
 goto Menu
:1F
 color 1F
 echo 1F
 pause 
 goto Menu
:3 
 color 3
 echo 3
 pause
 goto Menu
:47 
 color 47
 echo 47
 pause
 goto Menu
:79 
 color 79
 echo 79
 pause
 goto Menu
:C0 
 color C0
 echo C0
 pause
 goto Menu
:Salir
 echo.