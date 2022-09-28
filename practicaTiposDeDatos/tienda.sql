CREATE DATABASE tienda;


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

INSERT INTO producto (codigo_prod, nombre,gama_id,dimensiones,precio) VALUES ('11679','Sierra de Poda 400MM',20,'0,258',1500.15),('21636','Pala',20,'0,156',125.50),('22225','Rastrillo de Jardín',20,'1,064',590), ('AR-001','Ajedrea',40,'15-20',530.50), ('AR-002','Lavándula Dentata',30,'15,20',550), ('AR-008','Thymus Citriodra (Tomillo limón)',30,'1,064', 890.50), ('FR-100','Nectarina',40,'8/10',1000.60), ('FR-16','Calamondin Copa EXTRA Con FRUTA',40,'100-120',990)

INSERT INTO pedidos_productos  VALUES (1,1, 10, 5,70.3,1), (2,3, 10, 3,70.3,2), (3,3,10,40,43.50,3),(4,1, 8, 5,76.3,1),(5,2, 8, 5,70.3,2), (6,1, 3, 5,70.3,1), (7,7, 3, 5,78.3,2), (8,6, 3, 5,70.3,3),(9,6, 1, 5,170.3,1),(10,1, 1, 5,90.3,2);



-- 1.Devuelve un listado con el código de oficina y la ciudad de la misma. 

SELECT id AS codigo, ciudad from oficinas 

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de Rosario. 

SELECT ciudad, telefono from oficinas WHERE ciudad = 'Rosario'
SELECT ciudad, telefono from oficinas WHERE ciudad like '%rosario%'

-- 3. Devuelve un listado con el nombre y telefono de los empleados cuyo jefe tiene un código de jefe igual a 1. 

SELECT nombre, telefono FROM vendedores WHERE jefe_id = 1

-- 4. Devuelve un listado con el nombre de los todos los clientes rosarinos.
SELECT nombre FROM clientes WHERE ciudad like '%Ros%'


-- 5. Devuelve un listado con el nombre de los todos los clientes cuyo límite de crédito esta entre 10 y 300.

SELECT nombre FROM clientes WHERE (limite_cred > 10 AND limite_cred < 300)

-- 6. Mostrar los pedidos hechos en el  2008. 
SELECT * FROM pedidos WHERE fecha like '%2008%'

-- 7. Devuelve un listado con el código de pedido, nombre del cliente y fecha del pedido.
SELECT p.id AS codigoPedido, cl.nombre,p.fecha AS fechaPedido 
FROM pedidos p

INNER JOIN clientes cl 
ON p.cliente_id = cl.id 

-- 8. Devuelve un listado con el código de pedido, nombre del cliente, nombre del empleado  y fecha del pedido de los pedidos pendientes

SELECT pedidos.id AS codigoPedido, clientes.nombre, vendedores.nombre, fecha FROM pedidos 

INNER JOIN clientes cl 
ON pedidos.cliente_id = cliente.id 



-- Dictados

-- 1 - Mostrar los nombres precio y stock de productos ordenados en forma descendente por precio 

SELECT nombre, precio, stock FROM productos ORDER BY precio DESC

-- 2 - Ídem ejercicio anterior pero mostrando además el nombre de la gama de c/producto

SELECT productos.nombre, productos.precio, productos.stock, gamas.nombre as gama
from productos, gamas 

WHERE productos.gama_id = gamas.id

ORDER BY precio DESC 

-- 3 - Aumentar el precio de los productos un 10%

UPDATE productos SET precio = precio + (precio * 0.1)

-- 4- Mostrar el ID del pedido , fecha, estado, nombre del empleado que lo hizo y el nombre del cliente 

SELECT p.id, p.fecha, p.estado as estado_pedido, v.nombre as vendedor, cl.nombre as cliente 

FROM pedidos p, vendedores v, clientes cl 

WHERE (p.vendedor_id = v.id AND p.cliente_id = cl.id)

-- 5 - Ídem anterior pero solamente los de mes actual 

SELECT p.id, p.fecha, p.estado, v.nombre as vendedor, cl.nombre as cliente 
FROM pedidos p, vendedores v, clientes cl 
WHERE (p.vendedor_id = v.id AND p.cliente_id = cl.id AND month(p.fecha) = '01')


-- 6 - Modificar el estado de todos los pedidos que realizo el cliente Daniel G a rechazado 

UPDATE TABLE pedidos SET estado = 'rechazado' where id = 1

-- 7 - Subir el límite de compra un 15% de aquellos clientes que son de rosario 

UPDATE clientes SET limite_cred = limite_cred + (limite_cred*0.15)