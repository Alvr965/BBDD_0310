-- hint lo toca los administrdores muy viejos, tu no te preocupes, te sientes viejo pero no lo eres... Tanto.
SET NLS_LANG=AMERICAN_AMERICA.WE8MSWIN1252

 -- Con esta opcion, pones el lenguaje en estadounidense e indicas que el conjunto de lenguaje sea 1252
-- Despues puedes entrar a SQLPLUS y meter todo esto
SET PAGESIZE 1000
SET LINESIZE 1000;

SELECT COUNT(*) FROM EMPLOYEES;

--Las funciones de agregacion no tiene en cuenta los nulos, ese departamento no cuenta porque es fantasma al no tener un empleado. Pero si añado una columna en el que esa instancia tenga valor, las añadira aun teniendo nulos

SELECT AVG(COMMISSION_PCT)
FROM EMPLOYEES;

SELECT AVG(NVL(COMMISSION_PCT,0))
FROM EMPLOYEES;--

SELECT avg(DISTINCT COMMISSION_PCT)
FROM EMPLOYEES;

SELECT SUM(COMMISSION_PCT)/COUNT(EMPLOYEE_ID)"Comision Media de todos los empleados"
    , AVG(COMMISSION_PCT) "Comision media de los que cobran comision, ignorando los valores nulos"
    , AVG(NVL(COMMISSION_PCT,0)) "Comision media de todos los empleados que cobran comision, nula o no nula"
    , SUM(COMMISSION_PCT)/COUNT(COMMISSION_PCT) "Comision media de todos los empleados que cobran comision no nulo"
FROM EMPLOYEES;

SELECT DEPARTMENT_ID "Departamento"
    , COUNT(*) "nº empleados"
    , SUM(SALARY) "Salario Total"
    , AVG(SALARY) "Salario Medio"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1;

SELECT DEPARTMENT_ID "Departamento"
    , COUNT(*) "Total Empleados"
    , COUNT(COMMISSION_PCT) "Cobran Comision"
    , COUNT(DISTINCT COMMISSION_PCT) "Comisiones Distintas"
    , SUM(SALARY) "Salario Total"
    , AVG(SALARY) "Salario Medio"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1;

SELECT DEPARTMENT_ID "Departamento"
    , COUNT(*) "Total Empleados"
    , COUNT(COMMISSION_PCT) "Cobran Comision"
    , COUNT(DISTINCT COMMISSION_PCT) "Comisiones Distintas"
    , SUM(SALARY) "Salario Total"
    , AVG(SALARY) "Salario Medio"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >10
ORDER BY 1;

SELECT DEPARTMENT_ID "Departamento"
    , COUNT(*) "Total Empleados"
    , SUM(SALARY) "Salario Total"
    , AVG(SALARY) "Salario Medio"
FROM EMPLOYEES
WHERE FIRST_NAME BETWEEN 'Frederick' AND 'Ramon'
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >10
ORDER BY 1;

-- Primero se resuelve el WHERE, despues GROUP BY, a continuacion HAVING y por ultimo ORDER BY

SELECT EMPLOYEE_ID "Empleado"
    , SALARY "Salario Fijo"
    , SALARY*NVL(COMMISSION_PCT,0) "Salario Variable"
    , COALESCE(SALARY*(1+COMMISSION_PCT)
                , SALARY,0) "Salario Total"
FROM EMPLOYEES
ORDER BY 1;

SELECT EMPLOYEE_ID "Empleado"
    , SALARY "Salario Fijo"
    , SALARY*COMMISSION_PCT "Salario Variable"
    , SALARY*(1+COMMISSION_PCT) "Total Mal"
    , COALESCE(SALARY*(1+COMMISSION_PCT)
                , SALARY
                , 0) "Salario Total"
FROM EMPLOYEES
ORDER BY 1;

SELECT EMPLOYEE_ID "Empleado"
    , TO_CHAR(SALARY,'999G999D00') "Salario Fijo"
    , TO_CHAR(COMMISSION_PCT,'D99')
    , SALARY*COMMISSION_PCT "Salario Variable"
    , SALARY*(1+COMMISSION_PCT) "Total Mal"
    , COALESCE(SALARY*(1+COMMISSION_PCT)
                , SALARY
                , 0) "Salario Total"
FROM EMPLOYEES
ORDER BY 1;

2
SELECT COUNT(*) "NºEmpleados"
    , TO_CHAR(MIN(SALARY*COMMISSION_PCT),'999G999D99$') "Minima Comision"
    , TO_CHAR(MAX(SALARY*COMMISSION_PCT),'999G999D99$') "Maxima Comision"
    , TO_CHAR(AVG(SALARY*COMMISSION_PCT),'999G999D99$') "Comision Media"
FROM EMPLOYEES
WHERE COMMISSION_PCT>0;

3
SELECT DEPARTMENT_ID AS "ID."
       , TO_CHAR(MIN(SALARY * (1 + NVL(COMMISSION_PCT, 0))), '999G999D99L') "Salario Minimo Total"
       , TO_CHAR(MAX(SALARY * (1 + NVL(COMMISSION_PCT, 0))), '999G999D99L') "Salario Maximo Total"
       , TO_CHAR(AVG(SALARY * (1 + NVL(COMMISSION_PCT, 0))), '999G999D99L') "Salario Medio Total"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY "Salario Medio Total" DESC;

SELECT SYSDATE-HIRE_DATE FROM EMPLOYEES WHERE ROWNUM<3;

SELECT TO_CHAR(SYSDATE,'DD/MM/YYYY HH24:MI:SS') "Fecha Sistema"
    , TO_CHAR(HIRE_DATE,'DD/MM/YYYY HH24:MI:SS') "Fecha Contratacion"
    , MONTHS_BETWEEN(SYSDATE,HIRE_DATE) "Meses Transcurridos"
    , SYSDATE-HIRE_DATE  AS "Dias Transcurridos"
FROM EMPLOYEES
where ROWNUM<3;

4
SELECT JOB_ID "ID. Trabajo"
    , DEPARTMENT_ID "ID. Departamento"
    , COUNT(*) "Numero de Empleados"
    , TRUNC(AVG(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12)) "Años de media en cada departamento"
FROM EMPLOYEES
GROUP BY JOB_ID,DEPARTMENT_ID
HAVING COUNT(*)>10;

SELECT JOB_ID "ID. Trabajo"
    , DEPARTMENT_ID "ID. Departamento"
    , COUNT(*) "Numero de Empleados"
    , TO_CHAR(AVG(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12),'999') "Años de media en cada departamento"
FROM EMPLOYEES
GROUP BY JOB_ID,DEPARTMENT_ID
HAVING COUNT(*)>10;
--Si utilizas formateo o utilizas ROUND, te redondea, cosa que en algunas bases de datos puede resultar un problema o justamente lo que quieres, primero averigua que te esta pidiendo

5
SELECT REGION_ID,REGION_NAME FROM REGIONS;
SELECT * FROM COUNTRIES WHERE REGION_ID=1;
SELECT * FROM LOCATIONS WHERE COUNTRY_ID IN ('BE','CH','DE','DK','FR','IT','NL','UK');
SELECT * FROM DEPARTMENTS WHERE LOCATION_ID IN (2900,3000,2700,1000,1100,3100,2400,2500,2600);
DESC EMPLOYEES
DESC JOBS
SELECT JOB_ID "ID. Trabajo"
    , COUNT(*) "Num Empleados"
    , MIN(SALARY) "Salario Minimo"
    , MAX (SALARY) "Salario Maximo"
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN (40,70,80) AND JOB_ID NOT IN ('SA_MAN','SA_REP');

SELECT MIN_SALARY "Salario Minimo"
    , MAX_SALARY "Salario Maximo"
FROM JOBS
WHERE JOB_ID IN ('HR_REP','PR_REP');

--Solucion de Roberto
SELECT ','''||COUNTRY_ID||'''' 
FROM COUNTRIES 
WHERE REGION_ID=1;

SELECT ',''' || LOCATION_ID || ''''
FROM LOCATIONS
WHERE COUNTRY_ID IN ('BE'
,'CH'
,'DE'
,'DK'
,'FR'
,'IT'
,'NL'
,'UK');

SELECT ',''' || DEPARTMENT_ID || ''''
FROM DEPARTMENTS
WHERE LOCATION_ID IN ('2900'
,'3000'
,'2700'
,'1000'
,'1100'
,'3100'
,'2400'
,'2500'
,'2600');
SELECT COUNT(*) "Num Empleados"
    , TO_CHAR(MIN(COALESCE(SALARY * (1 + NVL(COMMISSION_PCT, 0)),SALARY,0)), '999G999D99L') "Salario Minimo Total"
    , TO_CHAR(MAX(COALESCE(SALARY * (1 + NVL(COMMISSION_PCT, 0)),SALARY,0)), '999G999D99L') "Salario Maximo Total"
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN ('40'
,'80'
,'70') AND JOB_ID NOT IN ('SA_MAN','SA_REP');
