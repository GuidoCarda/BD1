CREATE DATABASE jdmventas

CREATE TABLE gamas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30)
)

CREATE TABLE compras (
    id INT PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(30)
)

CREATE TABLE oficinas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(7),
    telefono INT(8),
    ciudad VARCHAR(30),
    domicilio VARCHAR(30)
)

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    telefono INT(10),
    ciudad VARCHAR(30),
    limite_cred DECIMAL(5,2)
)

CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    telefono INT(10),
    domicilio VARCHAR(30),
    ciudad VARCHAR(30),
    codigo_of VARCHAR(7),
    jefe_id INT,
    -- oficina_id INT,
    FOREIGN KEY (jefe_id) REFERENCES empleados(id),
    -- FOREIGN KEY (oficina_id) REFERENCES oficinas(id)
    FOREIGN KEY (codigo_of) REFERENCES oficinas(codigo)
)

CREATE TABLE productos ()