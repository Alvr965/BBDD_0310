CREATE DATABASE empresa;
USE empresa;

create table empleados (
    id decimal(3,0) PRIMARY KEY,
    nombre VARCHAR(128) NOT NULL,
    salario decimal(7,2) NOT NULL;
)