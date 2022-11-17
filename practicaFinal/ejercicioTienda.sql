CREATE DATABASE tienda2;


CREATE TABLE gamas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50)
)

CREATE TABLE productos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  codigo_prod VARCHAR(10),
  nombre VARCHAR(50),
  dimensiones VARCHAR(50),
  stock INT,
  precio DECIMAL(9,2),
  gama_id INT,
  FOREIGN KEY (gama_id) REFERENCES gamas(id)
)

CREATE TABLE oficinas (
  id VARCHAR(7) PRIMARY KEY,
  ciudad VARCHAR(50), 
  domicilio VARCHAR(50),
  telefono VARCHAR(8)
)

CREATE TABLE vendedores (
  id INT PRIMARY KEY,
  nombre VARCHAR(50),
  telefono VARCHAR(8),
  ciudad VARCHAR(50),
  domicilio VARCHAR(50),
  jefe_id INT,
  oficina_id VARCHAR(7),
  FOREIGN KEY (jefe_id) REFERENCES vendedores(id),
  FOREIGN KEY (oficina_id) REFERENCES oficinas(id)
)

CREATE TABLE clientes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  telefono VARCHAR(10),
  domicilio VARCHAR(50),
  ciudad VARCHAR(50),
  limite_cred DECIMAL(9,2)
)

CREATE TABLE pedidos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  fecha DATE,
  estado set('entregado','pendiente','rechazado') NOT NULL,
  cliente_id INT,
  vendedor_id INT,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (vendedor_id) REFERENCES vendedores(id)
)

CREATE TABLE pedidos_productos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  producto_id INT,
  pedido_id INT,
  cant INT,
  precio_total decimal(9,2),
  FOREIGN KEY (producto_id) REFERENCES productos(id),
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
)

-- 1.Devuelve un listado con el código de oficina y la ciudad de la misma. 

SELECT id as codigo_oficina, ciudad FROM oficinas 

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de Rosario. 

SELECT ciudad, telefono FROM oficinas WHERE ciudad = "Rosario"
SELECT ciudad, telefono FROM oficinas WHERE ciudad like '%rosario%'

-- 3. Devuelve un listado con el nombre y telefono de los empleados cuyo jefe tiene un código de jefe igual a 1. 

SELECT nombre, telefono FROM vendedores WHERE jefe_id = 1

-- 4. Devuelve un listado con el nombre de los todos los clientes rosarinos.

SELECT nombre FROM clientes WHERE ciudad like '%Rosario%'

-- 5. Devuelve un listado con el nombre de los todos los clientes cuyo límite de crédito esta entre 10 y 300.

SELECT nombre FROM clientes WHERE limite_cred >= 10 AND limite_cred <=300

-- 6. Mostrar los pedidos hechos en el  2008. 

SELECT * FROM pedidos WHERE fecha like '%2008%'

-- 7. Devuelve un listado con el código de pedido, nombre del cliente y fecha del pedido.

SELECT pedidos.id as cod_pedido, clientes.nombre as cliente, pedidos.fecha 
FROM pedidos, clientes 
WHERE (pedidos.cliente_id == clientes.id)

-- 8. Devuelve un listado con el código de pedido, nombre del cliente, nombre del empleado  y fecha del pedido de los pedidos pendientes

SELECT pedidos.id, clientes.nombre, vendedores.nombre, pedidos.fecha
FROM pedidos, clientes, vendedores
WHERE (pedidos.estado like '%pendiente%' AND pedidos.cliente_id = clientes.id AND pedidos.vendedor_id = vendedores.id)

-- 9. Calcula el número de clientes que tiene la empresa. 

SELECT COUNT(id) as cantidad_clientes FROM clientes 

-- 10 Mostrar el nombre del cliente que tiene menor límite de crédito y el que tiene mayo límite de crédito

SELECT nombre, limite_cred 
FROM clientes
WHERE limite_cred = (SELECT MIN(limite_cred) FROM clientes)
UNION ALL
SELECT nombre, limite_cred 
FROM clientes 
WHERE limite_cred = (SELECT MAX(limite_cred) FROM clientes)

-- 13 -Cargar  los mails de los empleados, se armarán automáticamente de la siguiente manera, nombreDelEMpleado@empresa.com.ar  

ALTER TABLE vendedores ADD email VARCHAR(50);
UPDATE vendedores SET email = CONCAT(nombre, "@empresa.com.ar")

-- 14 - Subir todos los limites de credito de los clientes en un 5 %
UPDATE clientes SET limite_cred = limite_cred + (limite_cred * 5) / 100
UPDATE clientes SET limite_cred = limite_cred + limite_cred * 0.05

-- 15 -Mostrar los id de pedidos y fechas de aquellos pedidos realizados entre el 2008 y el 2010
SELECT id, fecha FROM pedidos WHERE YEAR(fecha) >= '2008' AND YEAR(fecha) <= '2010'

-- 16 - Mostrar los id y nombres de los empleados cuyo nombre comienza con m.
SELECT id, nombre FROM vendedores WHERE nombre like 'm%'

-- 17 - Mostrar los id y nombres de los empleados cuyo nombres sean Daniel  Dartes y Mariana Juarez(Usar IN)
SELECT id, nombres FROM vendedores  WHERE nombre IN ('Daniel Dartes','Mariana Juarez')

-- 18 - Mostrar los nombres de los empleados que son de alguna oficina de la ciudad de Rosario.
SELECT nombre FROM vendedores WHERE ciudad like '%Ros%'


------------------ AIUDA JOACO ------------------
-- 19  - Mostrar los nombres de los empleados de la empresa, junto al nombre de sus jefes.
SELECT v.nombre, v.jefe_id as nombre_jefe, v.ciudad 
FROM vendedores v 
INNER JOIN vendedores ON v.jefe_id = vendedores.nombre
------------------ AIUDA JOACO ------------------

-- 20 -Mostrar los nombres de los empleados de la empresa, junto al nombre de sus jefes, pero solo los que son de la ciudad de Rosario o de Funes



------------------ AIUDA JOACO ------------------
-- 21- Mostrar los nombres de los empleados de la empresa, junto al nombre de sus jefes, pero solo los que son de la ciudad de Rosario o de Funes y cuyo jefe sea "Marcos Perez"

SELECT v.nombre, v.jefe_id as nombre_jefe, v.ciudad 
FROM vendedores v 
INNER JOIN vendedores ON v.jefe_id = vendedores.nombre
WHERE (v.ciudad like '%ros%') OR (v.ciudad like '%fun%') 

/*
-- El problema aca es q me tira este error 
------------------------------------------------------------------------
 Warning: #1292 Equivocado truncado DOUBLE valor: 'Marcos Perez'
------------------------------------------------------------------------
Por lo q vi es porque cuando hago esto : ...ON v.jefe_id = vendedores.nombre
SQL toma q no puede igualar un INT a un VARCHAR

si pongo ON v.jefe_id = vendedores.id
Si lo ejecuta perono me interesa porque yo no quiero mostrar el nro de id,
quiero el nombre

------------------ AIUDA JOACO ------------------
*/

-- Dictados

-- 1 - Mostrar los nombres precio y stock de productos ordenados en forma descendente por precio 

-- 2 - Ídem ejercicio anterior pero mostrando además el nombre de la gama de c/producto

-- 3 - Aumentar el precio de los productos un 10%

-- 4- Mostrar el ID del pedido , fecha, estado, nombre del empleado que lo hizo y el nombre del cliente 

-- 5 - Ídem anterior pero solamente los de mes actual 

-- 6 - Modificar el estado de todos los pedidos que realizo el cliente Daniel G a rechazado 

-- 7 - Subir el límite de compra un 15% de aquellos clientes que son de rosario 
