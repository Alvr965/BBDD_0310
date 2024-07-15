create table empleados (
    id number(3,0) PRIMARY KEY,
    nombre VARCHAR2(128) NOT NULL,
    salario number(7,2) NOT NULL);
)

INSERT INTO empleados VALUES
(1,'Javier',0);

commit;

UPDATE empleados SET salario = salario + 1000 where id=1;

commit;

SELECT * FROM empleados where id=1 for UPDATE;