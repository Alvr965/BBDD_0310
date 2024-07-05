DROP DATABASE IF EXISTS ifct0310;
CREATE DATABASE ifct0310;
USE ifct0310;
CREATE TABLE MODULO (CODIGO VARCHAR (10) PRIMARY KEY
					,TITULO VARCHAR (100) NOT NULL);
CREATE TABLE UF (CODIGO VARCHAR (10) PRIMARY KEY
				,TITULO VARCHAR (100) NOT NULL
				,MODULO VARCHAR (10) NOT NULL
				,FOREIGN KEY (MODULO) REFERENCES MODULO (CODIGO));
INSERT INTO MODULO VALUES ('MF0224_3', 'ADMINISTRACION DE SGBDs');
INSERT INFO UF	   VALUES ('UF1468','ALMACENAMIENTO DE LA INFORMACION E INTRODUCCION A LOS SGBDs','MF0224_3'),
						  ('UF1469','SGBD E INSTALACION','MF0224_3'),
						  ('UF1470','ADMINISTRACION Y MONITORIZACION DE LOS SGBDs','MF0224_3');