CREATE TABLE articulos (
	art_num INT PRIMARY KEY,
	art_nom VARCHAR2(50) NOT NULL,
	art_peso INT,
	art_pv NUMERIC (6,2));

CREATE TABLE clientes (
    clt_num INT PRIMARY KEY,
    clt_nom VARCHAR2(40) NOT NULL,
    clt_pob CHAR(25)
);

CREATE TABLE ventas(
    vnt_num INT PRIMARY KEY,
    vnt_art INT NOT NULL,
    vnt_clt INT NOT NULL,
    vnt_cant INT NOT NULL,
    vnt_fecha DATE
);

INSERT INTO articulos VALUES (1, 'Impresora', 4250, 45);
INSERT INTO articulos VALUES (2, 'Pantalla LED 17', 3850, 120.56);
INSERT INTO articulos VALUES (3, 'Teclado', 920, 9.75);
INSERT INTO articulos VALUES (4, 'Raton', 185, 12);

INSERT INTO clientes VALUES (1, 'Blanco Andrades, Ana', 'Madrid');
INSERT INTO clientes VALUES (2, 'Castell Perea, Vicente', 'Barcelona');
INSERT INTO clientes VALUES (3, 'Rey Santiago, Silvia', 'Sevilla');

INSERT INTO ventas VALUES (1, 1, 2, 1, to_date('21/05/2014', 'DD/MM/YYYY'));
INSERT INTO ventas VALUES (2, 2, 2, 1, to_date('21-05-2014', 'DD/MM/YYYY'));
INSERT INTO ventas VALUES (3, 4, 1, 1, to_date('22-05-2014', 'DD/MM/YYYY'));
INSERT INTO ventas VALUES (4, 3, 1, 2, to_date('22-05-2014', 'DD/MM/YYYY'));
INSERT INTO ventas VALUES (5, 3, 3, 3, to_date('23-05-2014', 'DD/MM/YYYY'));

CREATE VIEW vistaventas1 AS (
	SELECT clt_nom, art_nom, vnt_cant, art_pv, vnt_fecha
	FROM articulos, clientes, ventas
	WHERE art_num=vnt_art AND clt_num=vnt_clt
	);
	
SELECT * FROM vistaventas1;
DROP VIEW vistaventas1;