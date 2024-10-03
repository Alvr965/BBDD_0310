SELECT CONSTRAINT_NAME "Clave Primaria"
    , CONSTRAINT_TYPE "Tipo Restriccion"
    ,  COLUMN_NAME "Columna"
FROM USER_CONSTRAINTS
    INNER JOIN USER_CONS_COLUMNS USING (CONSTRAINT_NAME)
WHERE USER_CONSTRAINTS.TABLE_NAME='REGIONS'
    AND CONSTRAINT_TYPE='P';

CREATE TABLE empleados (
   ID                 NUMBER(6) CONSTRAINT emp_id_pk PRIMARY KEY,
   Nombre             VARCHAR2(20),
   Apellido           VARCHAR2(20) CONSTRAINT emp_apellido_nn NOT NULL,
   Email              VARCHAR2(25) CONSTRAINT emp_correo_nn NOT NULL,
   Telefono           VARCHAR2(20),
   Fecha_Contratacion DATE CONSTRAINT emp_fechacontratacion_nn NOT NULL,
   Salario            NUMBER(8,2) CONSTRAINT emp_salario_min CHECK (Salario > 0),
   Pct_Comision       NUMBER(2,2),
   Salario_Total      NUMBER GENERATED ALWAYS AS
                           (COALESCE(Salario * (1 + Pct_Comision), Salario, 0)) VIRTUAL,
   Id_Trabajo         VARCHAR2(10) CONSTRAINT emp_id_trabajo_nn NOT NULL,
   Id_Manager         NUMBER(6),
   Id_Dpto            NUMBER(6),
   CONSTRAINT emp_correo_uk UNIQUE (Email),
   CONSTRAINT emp_dpto_fk FOREIGN KEY (Id_Dpto) REFERENCES DEPARTMENTS,
   CONSTRAINT emp_id_trabajo_fk FOREIGN KEY (Id_Trabajo) REFERENCES JOBS,
   CONSTRAINT emp_jefe_fk FOREIGN KEY (Id_Manager) REFERENCES DEPARTMENTS
);

ALTER TABLE empleados
    DROP CONSTRAINT emp_id_trabajo_fk
;

ALTER TABLE empleados
ADD CONSTRAINT emp_id_trabajo_fk
FOREIGN KEY (Id_Trabajo) REFERENCES JOBS
ON DELETE CASCADE;

DELETE JOBS WHERE JOB_ID='Gral';

SELECT * FROM empleados; -- Hemos eliminado el empleado que tenia Gral como JOB_ID

ALTER TABLE empleados
DROP CONSTRAINT emp_jefe_fk;

ALTER TABLE empleados
ADD CONSTRAINT emp_jefe_fk
FOREIGN KEY (Id_Manager)
REFERENCES empleados(ID)
ON DELETE CASCADE;

INSERT INTO JOBS VALUES('Gral','Cpt Gral',NULL,NULL);

INSERT INTO empleados (ID, Nombre, Apellido, Email, Fecha_Contratacion, Id_Trabajo, Id_Manager)
VALUES (999, 'Jose', 'Castaño', 'sugus@gmail.com', TO_DATE('12-DEC-24', 'DD-MON-YY'), 'Gral', NULL);

INSERT INTO empleados (ID, Nombre, Apellido, Email, Fecha_Contratacion, Id_Trabajo, Id_Manager)
VALUES (563, 'Alvaro', 'Lopez', 'alh7696@gmail.com', TO_DATE('07-JUN-21', 'DD-MON-YY'), 'Gral', 999);

DELETE empleados where ID='999';

SELECT * FROM empleados;--Si eliminamos al jefe cuando emp_jefe_fk tiene delete on cascade, lo que hacemos es eliminar todo empleado que lo tenga como jefe y por tanto, hemos eliminado ambas lineas