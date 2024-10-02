ADD MONTHS
--Añade una cantidad de meses al dia determinado, si la fecha determinada es el ultimo dia de un mes y la del mes correspoondiente al hacer la suma es anterior (31 antes y 28 si acaba en febrero). Te pondra 28 o 29 si el año es bisiesto
SELECT LAST_NAME "Apellido"
    , HIRE_DATE "Fecha Contratacion"
    , ADD_MONTHS(HIRE_DATE,6) "Fecha Contratacion mas 6 meses"
FROM EMPLOYEES;

CURRENT_DATE
-- Devuelve la fecha y hora en funcion de la zona horaria

SYSDATE
-- Devuelve la fecha y hora del sistema operativo

--Si quieres recuperar la fecha y hora del sistema habiendo retrasado previamente la zona horaria 5 horas del sistema
ALTER SESSION SET TIME_ZONE ='-5:0';
ALTER SESSION SET
    NLS_DATE_FORMAT + 'DD-MON-YYYY HH24:MI:SS';
SELECT CURRENT_DATE "Sesion"
    , SYSDATE "Sistema Operativo"
FROM DUAL;
LAST_DAY
--Devuelve la fecha del ultimo dia del mes perteneciente a la fecha dada

MONTHS_BETWEEN
-- Del ultimo dia del mes al ultimo dia del anterior mes, si los introduces en la funcion, te saldra uno. Pero si calculas del primer dia del mes al ultimo dia del mes, obtendras casi 1

NEXT_DAY
--Devuelve el siguiente dia/mes/año que se corresponde con la fecha que introduzcas y tienes que poner en texto el dia de la semana cuya fecha quieras conocer.
NEXT_DAY(SYSDATE,'Miercoles') "Proximo Miercoles"

ROUND
-- Redondea la fecha a la unidad indicada en el formato. Si este se omite, se redondea al dia mas proximo
ROUND(HIRE_DATE,'YEAR')

TRUNC
--Trunca la fecha a la unidad indicada en el formato. Si se omite el formato, se trunca el dia

GREATEST 
-- Devuelve el valor maximo de la lista que introduzcas
LEAST 
-- Devuelve el valor minimo de la lista que introduzcas

NVL
-- Das dos expresiones, si la primera es nula, devuelve la segunda. SOLO PUEDE HABER DOS Y DEL MISMO tutorialesprogramacionya

COALESCE
-- Colocas varias expresiones y se iran devolviendo en caso que la anterior sea nula, SI TODAS SON NULAS, SE DEVUELVE NULO

DECODE
--Evalua la expresion y la compara con los posibles resultados uno por uno, si se corresponde con alguno, devuelve el resultado asociado. Si no encuentra ninguno, devuelve nulo o el valor que hayas colocado por defecto
SELECT EMPLOYEE_ID
    , HIRE_DATE
    , DECODE(TO_CHAR(HIRE_DATE,'MM')
             ,'06','Junio'
             ,'No es Junio') "Junio o no Junio"
FROM EMPLOYEES;


CASE
-- Utiliza la misma logica que DECODE, pero utiliza clausulas condicionales en vez de parejas de patron resultado separados por comas
SELECT EMPLOYEE_ID
    , HIRE_DATE
    , (CASE TO_CHAR(HIRE_DATE,'MM')
             WHEN '06' THEN 'Junio'
             ELSE 'No es Junio'
             END) "Junio o no Junio"
FROM EMPLOYEES;
--Solucion de Roberto
SELECT EMPLOYEE_ID
    , HIRE_DATE
    , DECODE TO_NUMBER(TO_CHAR(HIRE_DATE,'MM'))
             ,1,'Enero'
             ,2,'Febrero'
             ,3,'Marzo'
             ,'Posterior a Marzo') "DECODE"
    ,CASE TO_NUMBER(TO_CHAR(HIRE_DATE,'MM'))
        WHEN 06 THEN 'Junio'
        ELSE 'No es Junio'
     END "CASE"
FROM EMPLOYEES;
-----------------------------ELEMENTOS DE CONVERSION------------------------

--Si quieres el signo del euro, tienes que poner
SELECT EMPLOYEE_ID
    ,TO_CHAR(SALARY,'99,999.999U')
FROM EMPLOYEES;

SELECT TO_CHAR(SYSDATE, 'J SSSSS') FROM DUAL;
-- Dias transcurridos del 4312 B.C y la cantidad de segundos desde medianoche
PERSONALIZADO
SELECT TO_CHAR(SYSDATE
						,'"Las "HH24:MI:SS " del " day, DD " de " MM " del año " YY.') "Formateada"
    , TO_CHAR(
			TO_DATE(
				TO_CHAR(SYSDATE
                        ,'"Las " HH24:MI:SS " del " day, DD " de " months, MM " del año " year, YY.')
				,'"Las " HH24:MI:SS " del " day, DD " de " months, MM " del año " year, YY.')
	,'DD/MM/YYYY HH24:MI:SS')  "Joseada"
FROM DUAL;

5
SELECT EMPLOYEE_ID,
    , TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12)
FROM EMPLOYEES
WHERE DEPARTMENT_ID =100
ORDER BY 1
UNION
SELECT 'Media'
    , TRUNC(AVG(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12))
FROM EMPLOYEES
WHERE DEPARTMENT_ID	=100;

6
SELECT EMPLOYEE_ID
	, ADD_MONTHS(HIRE_DATE,25*12)"Fecha de su vigesimoquinto aniversario"
FROM EMPLOYEES
ORDER BY 1;

7
SELECT EMPLOYEE_ID "ID"
FROM EMPLOYEES
WHERE SUBSTR(EMPLOYEE_ID,-2,1)=2
ORDER BY 1;
--Solucion de Roberto
SELECT EMPLOYEE_ID "ID"
FROM EMPLOYEES
WHERE SUBSTR(EMPLOYEE_ID,-2,1)=2
    AND SUBSTR(EMPLOYEE_ID,LENGTH(EMPLOYEE_ID)-1,1)=2
-- Busca un patron en el que el penultimo valor es 2
    AND TO_CHAR(EMPLOYEE_ID) LIKE '%2_'
--  Utilizas el modulo
    AND MOD(TRUNC(EMPLOYEE_ID/10),10)=2
ORDER BY 1;

10
SELECT HIRE_DATE "Fecha Contratacion"
    , TO_CHAR(HIRE_DATE, 'dd/mm/') || TO_CHAR(SYSDATE,'yy')
    , DECODE(SIGN(TRUNC(SYSDATE, 'DD')
            -
            TO_DATE(TO_CHAR(HIRE_DATE, 'dd/mm/') || TO_CHAR(SYSDATE,'YY')))
            , -1, 'Negativo'
            , 'Positivo')
    ,DECODE(SIGN(TRUNC(SYSDATE,'DD')
            -
            TO_DATE(TO_CHAR(HIRE_DATE,'dd/mm/')|| TO_CHAR(SYSDATE,'YY')))
            ,-1, TO_DATE(TO_CHAR(HIRE_DATE,'dd/mm/')|| TO_CHAR(SYSDATE,'YY'))
            , TO_DATE(TO_CHAR(HIRE_DATE,'dd/mm/')|| TO_NUMBER(TO_CHAR(SYSDATE,'YY')+1)))
FROM EMPLOYEES;
--Funciona solo en el nuestro
SELECT HIRE_DATE "Fecha Contratacion"
    , TO_CHAR(HIRE_DATE, 'dd/mon/') || TO_CHAR(SYSDATE,'yy')
    , DECODE(SIGN(TRUNC(SYSDATE, 'DD')
            -
            TO_DATE(TO_CHAR(HIRE_DATE, 'dd/mon/') || TO_CHAR(SYSDATE,'YY')))
            , -1, 'Negativo'
            , 'Positivo')
    ,DECODE(SIGN(TRUNC(SYSDATE,'DD')
            -
            TO_DATE(TO_CHAR(HIRE_DATE,'dd/mon/')|| TO_CHAR(SYSDATE,'YY')))
            ,-1, TO_DATE(TO_CHAR(HIRE_DATE,'dd/mon/')|| TO_CHAR(SYSDATE,'YY'))
            , TO_DATE(TO_CHAR(HIRE_DATE,'dd/mon/')|| TO_NUMBER(TO_CHAR(SYSDATE,'YY')+1)))
FROM EMPLOYEES;

--Importe gratificacion
SELECT DEPARTMENT_ID "Nº Departamento",
-- Obtencion de la abreviatura del Trabajo
       INITCAP(SUBSTR(JOB_ID,INSTR(JOB_ID, '_',1,1)+1,3)) "Abreviatura Trabajo",
       HIRE_DATE "Fecha Contratacion",
       -- Calcular la fecha del próximo cumpleaños
       DECODE(SIGN(TRUNC(SYSDATE, 'DD') - 
              TO_DATE(TO_CHAR(HIRE_DATE, 'dd/mon/') || TO_CHAR(SYSDATE, 'YYYY'), 'dd/mon/yyyy')),
              -1, TO_DATE(TO_CHAR(HIRE_DATE, 'dd/mon/') || TO_CHAR(SYSDATE, 'YYYY'), 'dd/mon/yyyy'),
              TO_DATE(TO_CHAR(HIRE_DATE, 'dd/mon/') || TO_CHAR(TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) + 1), 'dd/mon/yyyy')) 
              AS "Fecha Proximo Cumpleaños",
       -- Calcular los días restantes hasta el próximo cumpleaños
       DECODE(SIGN(TRUNC(SYSDATE, 'DD') - 
              TO_DATE(TO_CHAR(HIRE_DATE, 'dd/mon/') || TO_CHAR(SYSDATE, 'YYYY'), 'dd/mon/yyyy')),
              -1, TO_DATE(TO_CHAR(HIRE_DATE, 'dd/mon/') || TO_CHAR(SYSDATE, 'YYYY'), 'dd/mon/yyyy'),
              TO_DATE(TO_CHAR(HIRE_DATE, 'dd/mon/') || TO_CHAR(TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) + 1), 'dd/mon/yyyy')) 
              - TRUNC(SYSDATE) || ' Dias' AS "Dias Hasta Cumpleaños",
       -- Cálculo de la gratificación
       TRUNC((SALARY * (1 + NVL(COMMISSION_PCT, 0)) * 0.05)) || '$' AS "Gratificacion"
FROM EMPLOYEES
ORDER BY "Nº Departamento",
         "Fecha Proximo Cumpleaños",
         "Gratificacion";

--Abreviatura Trabajo
SELECT JOB_ID
    , INSTR(JOB_ID, '_',1,1) "Posicion Guion Bajo"
    , SUBSTR(JOB_ID,INSTR(JOB_ID, '_',1,1)+1,3) "Letras de la abreviatura"
    , INITCAP(SUBSTR(JOB_ID,INSTR(JOB_ID, '_',1,1)+1,3)) "Abreviatura"
FROM JOBS;

--Ejercicios adicionales sobre funciones
https://sritsense.weebly.com/uploads/5/7/2/7/57272303/chapter_2.pdf
https://www.tutorialesprogramacionya.com/oracleya/simulador/simulador.php?inicio=0&cod=180&punto=22

--Ejercicios Oracle
SELECT * FROM empleados;
SELECT nombre, FLOOR(sueldo) "Sueldo mal"
    , CEIL(sueldo) "Sueldo bien"
FROM empleados;

SELECT nombre "Nombre"
    , sueldo "Sueldo Tal Cual"
    ,ROUND(sueldo,0) "Redondeado"
    ,TRUNC(sueldo) "Truncado"
FROM empleados;

SELECT POWER(2,5) FROM DUAL;
SELECT MOD(1234,5) FROM DUAL;
SELECT SQRT(81) FROM DUAL;