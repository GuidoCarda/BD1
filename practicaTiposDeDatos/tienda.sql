CREATE DATABASE tienda;


CREATE TABLE gamas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50)
)

CREATE TABLE productos (
  id INT PRIMARY KEY AUTO_INCREMENT,
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
  id INT PRIMARY KEY AUTO_INCREMENT,
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
  FOREIGN KEY (producto_id) REFERENCES productos(id),
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
)