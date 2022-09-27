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
  FOREIGN KEY (producto_id) REFERENCES productos(id),
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
)

INSERT INTO producto (codigo_prod, nombre,gama_id,dimensiones,precio) VALUES ('11679','Sierra de Poda 400MM',20,'0,258',1500.15),('21636','Pala',20,'0,156',125.50),('22225','Rastrillo de Jardín',20,'1,064',590), ('AR-001','Ajedrea',40,'15-20',530.50), ('AR-002','Lavándula Dentata',30,'15,20',550), ('AR-008','Thymus Citriodra (Tomillo limón)',30,'1,064', 890.50), ('FR-100','Nectarina',40,'8/10',1000.60), ('FR-16','Calamondin Copa EXTRA Con FRUTA',40,'100-120',990)