@echo off
chcp 65001
rem Programa: choices.bat
:Menu
 cls
 echo UTILIDADES DE MS-DOS
 echo --------------------
 echo.
 echo A. Anti-Virus
 echo B. Backup
 echo D. Defragmentar
 echo E. Editor
 echo S. Salir
 echo.
 choice /M "Que quieres de mi?" /C abdes /D s /T 15
 if errorlevel 5 goto Salir
 if errorlevel 4 goto Editor
 if errorlevel 3 goto Defrag
 if errorlevel 2 goto Backup
 if errorlevel 1 goto Anti
 if errorlevel 0 goto Menu
:Anti
 echo Antivirus
pause
 goto Menu
:Backup
 echo Backup
pause 
goto Menu
:Defrag 
pause
echo Defrag
 goto Menu
:Editor
 echo Editing
pause
 goto Menu
:Salir
 echo.