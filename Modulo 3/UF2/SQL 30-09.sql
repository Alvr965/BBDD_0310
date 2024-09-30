https://www.w3schools.com/sql/sql_syntax.asp -- Estamos haciendo un nuevo repaso con esta pagina, que, hemos llegado hasta SQL Aliases
https://drive.google.com/file/d/1ZLWcy3UX47eYsiB71US__FeGXup9jbBf/view#page=88 
-- Presentacion de la que Roberto esta sacando toda la informacion, atension
DDL La mas importante es la sentencia de SELECT, que incluso puede llegar a tener su propio apartado llamado DQL Data Query Language

--Codigo de Edicion SQLPLUS Pg 291
--Codigo de Edicion del Buffer Pg 297
    --En el buffer se guarda la ultima sentencia de SQL que se ha ejecutado y lo guarda en un fichero llamado adief.buf o algo asi
    --Pero en general en cuanto usas edit, se te abre el contenido del buffer y cambias lo que quieras

--DISTINCT - Sentencias con misma salida
SELECT COUNT (DISTINCT COUNTRY FROM CUSTOMERS)
SELECT COUNT(*) FROM (SELECT DISTINCT COUNTRY FROM CUSTOMERS)

--BETWEEN - Sentencias con misma salida
SELECT * FROM PRODUCTS
WHERE PRICE BETWEEN 10 AND 20;
SELECT * FROM PRODUCTS
WHERE PRICE >= 10 AND PRICE<=20;

--ORDER BY 
No afecta al orden de las columnas, solo a la forma de visualizarlo
Es la unica clausula en el que se puede utilizar el alias. Recuerda, si pones 1,2,3, ordenara segun la primera columna, la segunda o la tercera que hayas indicado en SELECT. Pero si pones el nombre de la columna, lo haras segun ese nombre, este o no en la clausula SELECT

--El archivo de configuracion de SQLPLUS se denomina glogin.sql. Una vez encontrado, añades debajo de todo lo que ponga SET PAGESIZE 1000 y SET LINESIZE 1000
--Si quieres el chcp 1252, eso lo tienes que meter en windows porque estas modificando los caracteres de este sistema operativo

------------------------------FUNCIONES----------------------------------------

-- Capitulo 7 SQL LANGUGAGE REFERENCE
    --Funciones de fila unica
    --Muchas funciones, pero que muchas
        -- Numeric Functions
        -- Character Functions Returning Character Values
        -- Character Functions Returning Number Values
        -- Character Set Functions
        -- Collation Functions
        -- Datetime Functions
        -- General Comparison Functions
        -- Conversion Functions
        -- Large Object Functions
        -- Collection Functions
        -- Hierarchical Functions
        -- Oracle Machine Learning for SQL Functions
        -- XML Functions
        -- JSON Functions
        -- Encoding and Decoding Functions
        -- NULL-Related Functions
        -- Environment and Identifier Functions

Numeric Functions\
ROUND
-- Cuidado que si utilizas el 5, tomara el valor siguiente en vez de mirar el siguiente numero como una persona normal. 
--Por lo menos, esto pasa cuando utilizas el negativo
SELECT 156.563 "Numero", ROUND(156.563,&i) "Redondeado" FROM DUAL; --0
--Dara lugar a 157 porque cogera el 563, vera que hay un 5 y por tanto, se pasa la siguiente numero para formar el entero 157
SELECT 156.563 "Numero", ROUND(156.563,&i) "Redondeado" FROM DUAL; -- 1
-- Dara lugar a 156.6 porque cogera el 63 y al ser 6, hara que las decimas pasen al siguiente numero, dejando 156.6
SELECT 156.563 "Numero", ROUND(156.563,&i) "Redondeado" FROM DUAL; -- -1
-- Dara lugar a 156,56 porque cogera el 3 y al ser menor que 5, las centesimas se mantendran en el mismo valor, dejando 156.56
SELECT 156.563 "Numero", ROUND(156.563,&i) "Redondeado" FROM DUAL; -- -2
-- Dara lugar a 200 porque cogera las decenas, en este caso 56 y como es un valor igual o superior a 5, 
--hara que las centenas pasen al siguiente valor, siendo este 200

TRUNC
--Si el valor posterior a la coma es 0, solo toma la parte entera.
-- Si es superior, toma esa cantidad de valores decimales, PERO NUNCA Redondeado
-- Si es inferior a 0, convierte al numero en un decimal con la cantidad de valor especificada de numeros decimales. 
-- Es decir, has puesto el numero de Ceros que añades entre la coma y el valor considerado

CEIL - Lo lleva directamente al entero siguiente
FLOOR - Se queda solo con la parte entera, cortando todos los decimales

SELECT ROUND(1.9876543,3)
    , TRUNC(1.9876543,-3)
    , CEIL(1.9876543)
    , FLOOR(1.9876543)
FROM DUAL;

REMAINDER
-- Busca el multiplo mas proximo del segundo parametro con respecto al primer parametro
-- Si el valor es 0, significa que el resto vale 0 y por tanto, el segundo parametro es multiplo del segundo
-- Si es positivo, es que el multiplo mas cercano es menor que el primer parametro
-- Si es negativo, es que el multiplo mas cercano es mayor que el primer parametro
-- Esta funcion sirve para comprobar si te compensa comprar o vender tus acciones. Las acciones se mueven en lotes y por tanto, tienes qeu dilucidar si compras hasta alcanzar el siguiente lote o vendes dependiendo de cuanto te queda o cuanto te sobra del lote correspondiente

MOD
-- Es similar a REMAINDER, pero este divide el primer paramero por el segundo y devuelve el resto de esa division
-- Es el modulo de la division

SELECT DEPARTMENT_ID "ID. Departamento"
    ,SUM(SALARY*(1+NVL(COMMISSION_PCT,0))) "Salario Total"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1;
-- Si queremos saber si en multiplos de 500, se aproximan o no
SELECT DEPARTMENT_ID "ID. Departamento"
    , SUM(SALARY*(1+NVL(COMMISSION_PCT,0))) "Salario Total"
    , REMAINDER(SUM(SALARY*(1+NVL(COMMISSION_PCT,0))),500) "Exceso/Defecto"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1;

Mas Funciones Numericas

ABS - Valor Absoluto (Valor sin signo)
EXP - Exponencial neperiana
LN - Logaritmo de base neperiana
Lna=b - Logaritmo neperiano en el que e^b=a
LOG - Logaritmo al que indicar la base con la que estas trabajando
POWER - Exponencial de cualquier base
SIGN - Signo
SQRT - Raiz Cuadrada (SQuare RooT)
ACOS,ASIN,ATAN,COS,SIN,TAN - Funciones Trigonometricas (No, no me gustan)
--Diferencias entre usar having, where y los dos a la vez

SELECT DEPARTMENT_ID, SUM(SALARY)
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'P%'
GROUP BY DEPARTMENT_ID
ORDER BY 1;

SELECT DEPARTMENT_ID, SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING SUM(SALARY)>10000 AND DEPARTMENT_ID IN (30,40,50)
ORDER BY 1;

SELECT DEPARTMENT_ID, SUM(SALARY)
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'P%'
GROUP BY DEPARTMENT_ID
HAVING SUM(SALARY)>10000 AND DEPARTMENT_ID IN (30,40,50)
ORDER BY 1;

FUNCIONES DE DEVOLUCION DE CADENAS DE caracteres
CONCAT -- Sentencias que dan la misma salida

SELECT CONCAT(FIRST_NAME,CONCAT(' ',LAST_NAME)) "Empleado"
FROM EMPLOYEES
ORDER BY "Empleado";

SELECT FIRST_NAME||' '||LAST_NAME "Empleado"
FROM EMPLOYEES
ORDER BY "Empleado";

LOWER
Formatea la cadena para dejarla todo en minuscula
UPPER
Formatea la cadena para dejarla todo en mayuscula
INITCAP
Formatea la cadena para dejarla todo en minuscula pero con la Inicial en Mayuscula

RTRIM
--Elimina un conjunto de caracteres especificados en la funcion por la derecha. No te coge conjuntos enteros. 
--En cuanto encuentre un caracter que no se encuentre ahi, detiene la operacion
SELECT FIRST_NAME
    , RTRIM(FIRST_NAME,'s')
    , RTRIM('Asssasas%as', '%as')
FROM EMPLOYEES;


TRIM
--Elimina un caracter por la izda (LEADING), por la dcha (TRAILING) o por ambos extremos (BOTH). 
SELECT TRIM (TRAILING 'H' FROM 'HO-OH')
FROM DUAL
UNION
SELECT TRIM (LEADING 'H' FROM 'HO-OH')
FROM DUAL
UNION
SELECT TRIM (BOTH 'H' FROM 'HO-OH')
FROM DUAL
UNION ALL
SELECT LTRIM(RTRIM('HO-OH','H'),'H')
FROM DUAL;

--Ejercicio de Alineacion
SELECT TRIM (TRAILING 'D' FROM 'DABALE ARROZ A LA ZORRA EL ABAD')
FROM DUAL
UNION
SELECT ' '||TRIM (LEADING 'D' FROM 'DABALE ARROZ A LA ZORRA EL ABAD')
FROM DUAL
UNION
SELECT CONCAT (' ', TRIM (BOTH 'D' FROM 'DABALE ARROZ A LA ZORRA EL ABAD'))
FROM DUAL
UNION ALL
SELECT LPAD(LTRIM(RTRIM('DABALE ARROZ A LA ZORRA EL ABAD','D'),'D')
      ,LENGTH(LTRIM(RTRIM('DABALE ARROZ A LA ZORRA EL ABAD','D'),'D'))+1,' ')
FROM DUAL;

CHR()
--Devuele el caracter correspondiente al numero indicado en lenguaje ASCII

CHR(12) - Salto de Carro en Codigo ASCII
CHR(9) - Tabulacion en Codigo ASCII

REPLACE
SELECT REPLACE('So Wahaht','ah','e')
FROM DUAL;
SELECT REPLACE('So What','ah','e')
FROM DUAL;
SELECT REPLACE('So Waht','ah','e')
FROM DUAL;
-- Replace te modifica si solo si el conjunto que estas especificando aparece en la cadena y te cambia el conjunto entero
SELECT TRANSLATE ('So Waiat','ai','e')
FROM DUAL;
SELECT TRANSLATE ('So What','ai','e')
FROM DUAL;
SELECT TRANSLATE ('So Waat','ai','e')
FROM DUAL;
SELECT TRANSLATE ('So Wait','ai','e')
FROM DUAL;
-- Translate te lo modifica caracter a caracter, por lo que si aparece uno de los integrante, lo modificara. 
-- Si aparece otra de los caracteres de la subcadena de forma adyaceente, pues cambiara ambos caracteres por la indicada en la funcion
-- La h se considera complemento asi que se dropea, ten cuidado

TRANSLATE

SELECT first_name "Nombre",
RPAD(TRANSLATE(first_name,'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
                         ,'ijklmnopqrstuvwxyzabcdefghIJKLMNOPQRSTUVWXYZABCDEFGH')
    ,12) "Nombre cifrado",
RPAD(TRANSLATE(TRANSLATE(first_name,'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
                         ,'ijklmnopqrstuvwxyzabcdefghIJKLMNOPQRSTUVWXYZABCDEFGH')
              ,'ijklmnopqrstuvwxyzabcdefghIJKLMNOPQRSTUVWXYZABCDEFGH'
              ,'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
    ,12) "Nombre descifrado"
FROM employees;
-- Aqui se hacen dos transformaciones porque primero hay que cambiar el formato de consola al del archivo codificado
-- Junto con la base de datos de los nombres
-- Despues se devuelve a convertir los lenguaje codificados en lenguaje natural 
-- invirtiendo el orden de las cadenas y anidando la anterior sentencia en esta nueva
-- La principal diferencia con REPLACE es que TRANSLATE cambia cada caracter de la cadena byte por byte

SUBSTRING
SELECT 'HOLA MUNDO'
    , SUBSTR('HOLA MUNDO',3)
    , SUBSTR('HOLA MUNDO',-3)
    , SUBSTR('HOLA MUNDO', 3,2) 
-- El segundo valor es que coja el numero de caracteres que quieres que tenga la nueva subcadena
-- Si no lo pones, te coge hasta el final de la cadena
    , SUBSTR('HOLA MUNDO', -3,1)
FROM DUAL;

ASCII - Te dice el numero que le corresponde en codigo ASCII a ese caracter
SELECT ASCII(CHR(10)) -- Esto es una tonteria en la que cogemos el valor 10, 
--la pasamos a ASCII, que es tecnicamente un salto de linea y despues lo pasamos de nuevo a ASCII, dando el resultado 10
FROM DUAL;

INSTR
--Dentro de una cadena, buscame una subcadena determinada 
--y si existe un conjunto de subcadenas repetido, especificas que numero de ocurrencia determinada quieres
SELECT 'AAAAAAAAAAAAAAA'
    ,INSTR('AAAAAAAAAAAAAAA','A')
--La primera ocurrencia del caracter A en la cadena es el primer caracter, por lo que es 1
    ,INSTR('AAAAAAAAAAAAAAA','A',5)
-- Saltas hasta el quinto valor desde el primero y empiezas a contar las ocurrencias, como el valor en el que estas es una de ellas, eliges el quinto
    ,INSTR('AAAAAAAAAAAAAAA','A',5,3)
-- Saltas hasta el quinto valor y cuentas tres desde donde estas, por lo que cuentas el propio 5 donde estas por lo que seria 4+3, seria el 7
    ,INSTR('AAAAAAAAAAAAAAA','A',-5)
-- Empiezas desde el final y saltas hasta el quinto valor, el valor que estas es el 16-5, es decir el numero 11
    ,INSTR('AAAAAAAAAAAAAAA','A',-5,3)
-- Empiezas desde el final y saltas hasta el quinto valor, el valor en el que estas es el 11.
-- Desde ahi, cuentas incluyendo en el que estas y avanzas tres en el sentido por el que has saltado, por lo que sera 12-3, estas en el 9 
FROM DUAL;