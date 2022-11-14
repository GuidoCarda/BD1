CREATE DATABASE tienda2 

CREATE TABLE gamas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50)
)

CREATE TABLE productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  dimensiones VARCHAR(50),
  stock INT UNSIGNED,
  precio DECIMAL(5,2),
  gama_id INT,
  FOREIGN KEY (gama_id) REFERENCES gamas(id)
)

CREATE TABLE oficinas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  ciudad VARCHAR(50),
  domicilio VARCHAR(50),
  telefono INT(8)
)

CREATE TABLE empleados (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  telefono INT(8),
  domicilio VARCHAR(50),
  ciudad VARCHAR(50),
  oficina_id INT,
  jefe_id INT,
  FOREIGN KEY (oficina_id) REFERENCES oficinas(id),
  FOREIGN KEY (jefe_id) REFERENCES empleados(id)
)

CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  telefono INT(8),
  domicilio VARCHAR(50),
  ciudad VARCHAR(50),
  lim_credito int(50)
)

CREATE TABLE pedidos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  fecha DATE,
  estado ENUM('Pendiente','Entregado','Rechazado'),
  cliente_id INT,
  empleado_id INT,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (empleado_id) REFERENCES empleados(id)
)

CREATE TABLE productos_pedidos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  producto_id INT,
  pedido_id INT,
  FOREIGN KEY (producto_id) REFERENCES productos(id),
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
)