Centrarse en la sentencia SELECT desde 286

chcp 1252 --Permite leer las tildes, ponerlo antes de entrar en SQLPLUS

C:\Users\Alvaro>SQLPLUS HR/HR@localhost/XEPDB1

SQL*Plus: Release 21.0.0.0.0 - Production on Mié Sep 25 17:33:26 2024
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Hora de Última Conexión Correcta: Mié Sep 25 2024 16:58:13 +02:00

Conectado a:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL>-- A partir de aqui y a menos que no se diga, asume siempre que SQL> esta a la izquierda de cada clausula

SET PAGESIZE 1000;
SET LINESIZE 1000;
SELECT TABLE_NAME FROM USER_TABLES; -- Descubres el nombre de las tablas que se encuentra dentro del diccionario de datos

1
DESC EMPLOYEES; -- Con eso descubures el numero de atributos que tiene esa entidad
SELECT * 
FROM EMPLOYEES;
-- Cada uno de las lineas se denominan clausulas
COLUMN EMAIL FORMAT A15 -- Le estoy diciendo que lo quiero en formato alfanumerico con un espacio de 15, esto es ir jugando con los espacios
l -- Lista el contenido del buffer

2
DESC EMPLOYEES;
DESC USER_TAB_COLUMNS;

SELECT EMPLOYEE_ID AS "Id.",
FIRST_NAME AS "Nombre",
LAST_NAME AS "Apellido",
EMAIL AS "Correo",
PHONE_NUMBER AS "Telefono",
HIRE_DATE AS "Fecha_Contrata",
JOB_ID AS "Id_Trabajo",
SALARY AS "Salario",
COMMISSION_PCT AS "Porc_Comision",
MANAGER_ID AS "Id_Jefe",
DEPARTMENT_ID AS "Id_Departamento"
FROM EMPLOYEES; --Nombre de las columnas que tiene la tabla

SELECT ',' ||COLUMN_NAME|| AS ""  
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME='EMPLOYEES' --Nombre de las columnas que tiene la tabla

SELECT * 
FROM EMPLOYEES 
"EMPLEADIÑOS";

3
SELECT * FROM DEPARTMENTS
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME='Public Relations';

4
SELECT * FROM DEPARTMENTS

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID=70;

5
SELECT LOCATION_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_ID=70;

SELECT CITY
FROM LOCATIONS
WHERE LOCATION_ID=2700;

--SELECT LOCATIONS.CITY
--FROM DEPARTMENTS
--JOIN LOCATIONS
--ON DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID
--WHERE DEPARTMENTS.DEPARTMENT_NAME = 'Public Relations';

6
SELECT DISTINCT DEPARTMENT_ID 
FROM EMPLOYEES;

SELECT DISTINCT NVL(DEPARTMENT_ID,0) 
FROM EMPLOYEES; -- Analiza el dato y si encuentra un nulo, le asigna un valor que nosotros decidamos

SELECT DISTINCT NVL(DEPARTMENT_ID,0) 
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL;

7
SELECT DISTINCT JOB_ID FROM EMPLOYEES;

SELECT DISTINCT ' OR JOB_ID= '''||JOB_ID||''''
FROM EMPLOYEES; --Esto sirve para generar todas las clausulas para requerir obtener el titulo proveniente de la tabla jobs
SELECT JOB_TITLE "Trabajo"
FROM jobs
WHERE  JOB_ID= 'AC_ACCOUNT'
 OR JOB_ID= 'AC_MGR'
 OR JOB_ID= 'AD_ASST'
 OR JOB_ID= 'AD_PRES'
 OR JOB_ID= 'AD_VP'
 OR JOB_ID= 'FI_ACCOUNT'
 OR JOB_ID= 'FI_MGR'
 OR JOB_ID= 'HR_REP'
 OR JOB_ID= 'IT_PROG'
 OR JOB_ID= 'MK_MAN'
 OR JOB_ID= 'MK_REP'
 OR JOB_ID= 'PR_REP'
 OR JOB_ID= 'PU_CLERK'
 OR JOB_ID= 'PU_MAN'
 OR JOB_ID= 'SA_MAN'
 OR JOB_ID= 'SA_REP'
 OR JOB_ID= 'SH_CLERK'
 OR JOB_ID= 'ST_CLERK'
 OR JOB_ID= 'ST_MAN';

8
SELECT EMPLOYEE_ID, FIRST_NAME,JOB_ID
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_a%'; --La barra baja representa que tiene que haber un caracter de forma obligatoria y el porcentaje indica que hay o ninguno o varios caracteres

9 
SELECT COUNTRY_ID
FROM COUNTRIES
WHERE COUNTRY_NAME='United Kingdom';

SELECT LOCATION_ID
FROM LOCATIONS
WHERE COUNTRY_ID='UK';

SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE LOCATION_ID IN (2400,2500,2600);

10
SELECT COUNTRY_ID
FROM COUNTRIES
WHERE COUNTRY_NAME='United Kingdom';

SELECT LOCATION_ID
FROM LOCATIONS
WHERE COUNTRY_ID='UK';

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE LOCATION_ID IN (2400,2500,2600);

SELECT JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (40,80) 
    AND COMMISSION_PCT IS NULL
    AND FIRST_NAME LIKE '%s%n';

SELECT JOB_TITLE 
FROM JOBS 
WHERE JOB_ID ='HR_REP';

11
SELECT DEPARTMENT_ID 
FROM DEPARTMENTS 
WHERE DEPARTMENT_NAME='Sales';

SELECT EMPLOYEE_ID 
FROM EMPLOYEES 
WHERE FIRST_NAME='Steven' AND LAST_NAME='King';

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID=80 AND MANAGER_ID =100
ORDER BY SALARY,HIRE_DATE;

12
SELECT COUNTRY_NAME
FROM COUNTRIES
WHERE REGION_ID IN (1,3)
ORDER BY REGION_ID,COUNTRY_NAME;

13
SELECT JOB_ID FROM JOBS WHERE lower(JOB_TITLE) LIKE '%sale%';

SELECT FIRST_NAME "Nombre", LAST_NAME "Apellido", (SALARY*(1+COMMISSION_PCT))"Salario Total"
FROM EMPLOYEES
WHERE JOB_ID IN ('SA_MAN','SA_REP')
ORDER BY "Apellido","Nombre";

14
SELECT * FROM DEPARTMENTS;

SELECT * FROM DEPARTMENTS
ORDER BY LOCATION_ID,DEPARTMENT_NAME;

15
SELECT *
FROM EMPLOYEES
WHERE JOB_ID IN ('SA_MAN','SA_REP')
ORDER BY HIRE_DATE DESC, EMPLOYEE_ID;