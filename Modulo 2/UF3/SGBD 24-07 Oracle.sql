set SERVEROUTPUT OFF
DECLARE
    mensaje VARCHAR(10) := 'hola mundo';
BEGIN
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/
set SERVEROUTPUT ON

---------------------VERSION DEL PROFESOR------------------------------------
CREATE OR REPLACE PROCEDURE calculadora(num1 NUMBER, num2 NUMBER, operador CHAR)
IS
    operacion VARCHAR2(40) := TO_CHAR(num1) || operador || TO_CHAR(num2);
    mensaje VARCHAR2(128) := '';
BEGIN
    IF operador = '+' THEN
        mensaje := 'La suma entre ' || TO_CHAR(num1) || ' y ' || TO_CHAR(num2) || ' es ' || TO_CHAR(num1 + num2);
    ELSIF operador = '-' THEN
        mensaje := 'La resta entre ' || TO_CHAR(num1) || ' y ' || TO_CHAR(num2) || ' es ' || TO_CHAR(num1 - num2);
    ELSIF operador = '*' THEN
        mensaje := 'La multiplicacion entre ' || TO_CHAR(num1) || ' y ' || TO_CHAR(num2) || ' es ' || TO_CHAR(num1 * num2);
    ELSIF operador = '/' THEN
        IF num2 = 0 THEN
            mensaje := 'El divisor no puede ser 0';
        ELSE
            mensaje := 'La division entre ' || TO_CHAR(num1) || ' y ' || TO_CHAR(num2) || ' es ' || TO_CHAR(num1 / num2);
        END IF;
    ELSE
        mensaje := 'Operador no valido';
    END IF;

    DBMS_OUTPUT.PUT_LINE(mensaje);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
SET


------APLICACION DE GESTION DE EXCEPCIONES Y CONDICIONALES EN LA CREACION DE CALCULADORA MEDIANTE EXCEPCIONES PERSONALIZADAS-----------------------------
CREATE OR REPLACE PROCEDURE calculadora(num1 NUMBER, num2 NUMBER, operador CHAR)
IS
    -- Definir excepciones personalizadas
    e_negativo EXCEPTION;
    e_division_cero EXCEPTION;
BEGIN
    IF operador = '+' THEN
        DBMS_OUTPUT.PUT_LINE('La suma entre ' || TO_CHAR(num1) || ' y ' || TO_CHAR(num2) || ' es ' || TO_CHAR(num1 + num2));
    ELSIF operador = '-' THEN
        IF num1 < num2 THEN
            RAISE e_negativo;
        ELSE
            DBMS_OUTPUT.PUT_LINE('La resta entre ' || TO_CHAR(num1) || ' y ' || TO_CHAR(num2) || ' es ' || TO_CHAR(num1 - num2));
        END IF;
    ELSIF operador = '*' THEN
        DBMS_OUTPUT.PUT_LINE('La multiplicación entre ' || TO_CHAR(num1) || ' y ' || TO_CHAR(num2) || ' es ' || TO_CHAR(num1 * num2));
    ELSIF operador = '/' THEN
        IF num2 = 0 THEN
            RAISE e_division_cero;
        ELSE
            DBMS_OUTPUT.PUT_LINE('La división entre ' || TO_CHAR(num1) || ' y ' || TO_CHAR(num2) || ' es ' || TO_CHAR(num1 / num2));
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Escribe otro operador anda');
    END IF;
EXCEPTION
    WHEN e_negativo THEN
        DBMS_OUTPUT.PUT_LINE('No estamos trabajando con esa clase de numeros');
    WHEN e_division_cero THEN
        DBMS_OUTPUT.PUT_LINE('No se puede dividir entre 0 tarugidad');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Upsie: ' || SQLERRM);
END calculadora;
/

EXECUTE calculadora (23, 8,'-');

-------------SECUENCIA ITERATIVA EN UN BLOQUE ANONIMO------
BEGIN
    FOR i in 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
    END;
/
-------------SECUENCIA ITERATIVA DEL REVES EN UN BLOQUE ANONIMO------
BEGIN
    FOR i in REVERSE 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
    END;
/

-------------------Bucle While-----------------------
DECLARE 
    i INTEGER :=1;
BEGIN
    While (i<=10)LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        i:=i+1;
    END LOOP;
    END;
/

-------------------Bucle LOOP-----------------------
DECLARE 
    i INTEGER :=1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        IF(i=10) THEN EXIT;
            END IF;
        i:=i+1;
    END LOOP;
    END;
/

DECLARE
    i INTEGER:= 10;
BEGIN  
    <<inicio>>
    DBMS_OUTPUT.PUT_LINE(i);
        i:=i-1;
        IF(i>=1) THEN GOTO inicio; END IF;
    END;
/
--------------------------cursor implicito----------------
DECLARE
    vnotas notas%ROWTYPE;
BEGIN
    SELECT * 
    INTO vnotas
    FROM notas
    WHERE DNI='DNI 1';
    DBMS_OUTPUT.PUT_LINE(La nota de '||vnotas.nombre||' es '||vnotas.nombre')
END;
/

-------------------cursor explicito---------------------------
DECLARE
    vnotas notas%ROWTYPE;
    CURSOR cNotas is SELECT * FROM notas WHERE DNI='DNI 1';
BEGIN
    OPEN cNotas
    FETCH cNotas INTO vnotas;
    WHERE DNI='DNI 1';
    DBMS_OUTPUT.PUT_LINE(La nota de '||vnotas.nombre||' es '||vnotas.nombre')
END;
/

-----------------------Cursor Explicito + Bucle For------------------
DECLARE
    vnotas notas%ROWTYPE;
    CURSOR cNotas is SELECT * FROM notas;
BEGIN
    OPEN cNotas;
    FETCH cNotas INTO vnotas;
    WHILE cNotas%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(La nota de '||vnotas.nombre||' es '||vnotas.nombre');
        FETCH cNotas INTO vnotas;
    END LOOP;
    CLOSE cNotas;
END;
/

-----------------------Tratamiento de Excepciones------------------
DECLARE
    MISTAKE EXCEPTION
    counter INTEGER:=1
    vnotas notas%ROWTYPE;
    CURSOR cNotas is SELECT * FROM notas;
BEGIN
    LOOP;
        IF (counter=5) THEN RAISE MISTAKE; END IF;
        DBMS_OUTPUT.PUT_LINE('El contador es = '||counter)
        OPEN cNotas;
        FETCH cNotas INTO vnotas;
        WHILE cNotas%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(La nota de '||vnotas.nombre||' es '||vnotas.nombre');
            FETCH cNotas INTO vnotas;
        END LOOP;
        CLOSE cNotas;
    END LOOP;
    EXCEPTION
        WHEN MISTAKE THEN DBMS_OUTPUT.PUT_LINE('Error provocado por el usuario');
END;
/
------------------------------EJEMPLO---------------------------
SET SERVEROUTPUT ON
DECLARE 
    num_articulo NUMBER(6);
    cod NUMBER(6);
    nombre CHAR(25);
BEGIN
    num_articulo:= 1;
    SELECT art_num, art_nom INTO cod,nombre
        FROM VARO.ARTICULOS
        WHERE ART_NUM=num_articulo;
    DBMS_OUTPUT.PUT_LINE(cod||' '||nombre);
END;
/

------------------NOTACVIONES POSICIONAL VS NOMINAL
CREATE OR REPLACE PROCEDURE parametros (p1 IN INTEGER,
                                        p2 OUT INTEGER,
                                        p3 IN OUT INTEGER)
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Datos Recibidos');
    DBMS_OUTPUT.PUT_LINE('P1 = '||p1);
    DBMS_OUTPUT.PUT_LINE('P2 = '||p2);
    DBMS_OUTPUT.PUT_LINE('P3 = '||p3);
    p2:= p1;
    p3:=2*p2;
END;
/

DECLARE
    p1 INTEGER :=1;
    p2 INTEGER :=2;
    p3 INTEGER :=3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Datos Inicializados');
    DBMS_OUTPUT.PUT_LINE('P1 = '||p1);
    DBMS_OUTPUT.PUT_LINE('P2 = '||p2);
    DBMS_OUTPUT.PUT_LINE('P3 = '||p3);
    parametros(p1,p2,p3);
    DBMS_OUTPUT.PUT_LINE('Datos Procesados');
    DBMS_OUTPUT.PUT_LINE('P1 = '||p1);
    DBMS_OUTPUT.PUT_LINE('P2 = '||p2);
    DBMS_OUTPUT.PUT_LINE('P3 = '||p3);
END;
/

------------------NOTACVIONES POSICIONAL VS NOMINAL
DECLARE
    p1 INTEGER :=1;
    p2 INTEGER :=2;
    p3 INTEGER :=3;
    PROCEDURE parameteres (p1 IN INTEGER,
                           p2 OUT INTEGER,
                           p3 IN OUT INTEGER)
    AS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Datos Recibidos');
        DBMS_OUTPUT.PUT_LINE('P1 = '||p1);
        DBMS_OUTPUT.PUT_LINE('P2 = '||p2);
        DBMS_OUTPUT.PUT_LINE('P3 = '||p3);
        p2:= p1;
        p3:=p3**p3;
    END;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Datos Inicializados');
    DBMS_OUTPUT.PUT_LINE('P1 = '||p1);
    DBMS_OUTPUT.PUT_LINE('P2 = '||p2);
    DBMS_OUTPUT.PUT_LINE('P3 = '||p3);
    parameteres(p1,p2,p3);
    DBMS_OUTPUT.PUT_LINE('Datos Procesados');
    DBMS_OUTPUT.PUT_LINE('P1 = '||p1);
    DBMS_OUTPUT.PUT_LINE('P2 = '||p2);
    DBMS_OUTPUT.PUT_LINE('P3 = '||p3);
END;
/