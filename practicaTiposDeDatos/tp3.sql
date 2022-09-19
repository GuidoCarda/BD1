CREATE DATABASE unisef

USE unisef

CREATE TABLE tipo_cuotas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  tipo VARCHAR(10),
  valor TINYINT
)

CREATE TABLE ciudades (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(30)
)

CREATE TABLE profesiones (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(30)
)

CREATE TABLE sedes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  domicilio VARCHAR(30),
  director VARCHAR(30),
  ciudad_id INT,
  FOREIGN KEY (ciudad_id) REFERENCES ciudades(id)
)

CREATE TABLE voluntarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(30),
  dni INT(8),
  tipo ENUM ('sanitario','administrativo'),
  disponibilidad BOOLEAN,
  cant_trabajos INT,
  profesion_id INT,
  sede_id INT,
  FOREIGN KEY (sede_id) references sedes(id),
  FOREIGN KEY (profesion_id) references profesiones(id) 
)

CREATE TABLE socios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(30),
  dni INT(8),
  cta_banco VARCHAR(20),
  fecha_pago DATE,
  tipo_cuota_id INT,
  sede_id INT,
  FOREIGN KEY (tipo_cuota_id) REFERENCES tipo_cuotas(id),
  FOREIGN KEY (sede_id) REFERENCES sedes(id)
)

CREATE TABLE envios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  destino VARCHAR(30),
  fecha_salida DATE,
  tipo_ayuda ENUM('material','humanitaria'),
  tipo_material SET('alimentos', 'medicamentos'),
  cant_toneladas INT UNSIGNED,
  cant_medicamentos INT UNSIGNED
)

CREATE TABLE envios_sedes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  envio_id INT,
  sede_id INT,
  FOREIGN KEY (envio_id) REFERENCES envios(id),
  FOREIGN KEY (sede_id) REFERENCES sedes(id)
)

CREATE TABLE envios_voluntarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  envio_id INT,
  voluntario_id INT,
  FOREIGN KEY (envio_id) REFERENCES envios(id),
  FOREIGN KEY (voluntario_id) REFERENCES voluntarios(id)
)

INSERT INTO tipo_cuotas (tipo, valor) VALUES 
  ("minima",10),
  ("media",20),
  ("maxima",30); 


INSERT INTO ciudades (nombre) VALUES 
  ("rio de janeiro"),
  ("buenos aires"),
  ("la paz");


INSERT INTO profesiones (nombre) VALUES 
  ("medico"),
  ("ats"),
  ("psicologo"),
  ("nutrisionista");


INSERT INTO sedes (domicilio, director,ciudad_id) VALUES 
  ('La paz 338', 'pedro rodriguez', 2),
  ('Beka Cintra 333', 'Marcos Evangelista de Moraes', 1),
  ('Abel Iturralde 1000', 'Evo morales', 3);

INSERT INTO voluntarios (
  nombre,
  dni,
  tipo, 
  disponibilidad,
  cant_trabajos,
  profesion_id,
  sede_id
  ) VALUES 
  ('Juan perez', 33423423, 1, true, 9, 1, 2),
  ('Roberto Carkis', 32423423, 1, false, 3, 2, 2),
  ('Diego Almeria', 31423423, 1, true, 3, 1, 2),

INSERT INTO voluntarios (
  nombre,
  dni,
  tipo, 
  sede_id
  ) VALUES 
  ('Roberto Carlos', 34512323, 2, 3),
  ('Lula da silva', 54512323, 2, 2),
  ('Pedro Ramirez', 33312323, 2, 1)

 
INSERT INTO socios (nombre,dni,cta_banco,fecha_pago,tipo_cuota_id,sede_id) VALUES
  ("Juan", 33222111, "1324-1231-4534", "2022-01-21", 1,3),
  ("Joaquin", 42321534, "3213-4564-4534", "2022-01-03", 1,2),
  ("Mateo", 33645511, "1324-2423-4534", "2022-03-29", 1,1),
  ("Celeste", 33245352, "2222-1232-4534", "2022-05-02", 1,2)


--Insertar envios materiales de alimentos
INSERT INTO envios (destino, fecha_salida, tipo_ayuda, tipo_material, cant_medicamentos)
 VALUES 
  ('Haiti', "2020-02-23", 1,1,20),
  ('Honduras', "2022-05-30", 1,1,2),
  ('El chaco', "2021-01-10", 1,1,15)

-- Insertar envios materiales de medicamentos
INSERT INTO envios (destino, fecha_salida, tipo_ayuda, tipo_material, cant_medicamentos)
 VALUES 
  ('La paz', "2020-02-23", 1,2,500),
  ('Chile', "2022-05-30", 1,2,1500),
  ('Rio de janeiro', "2021-01-10", 1,2,2000)

-- Insertar envios materiales de medicamentos
INSERT INTO envios (destino, fecha_salida, tipo_ayuda)
 VALUES 
  ('La paz', "2020-02-23", 2),
  ('Chile', "2022-05-30", 2),
  ('Rio de janeiro', "2021-01-10", 2)
  

-- Insertar envios-sedes
INSERT INTO envios_sedes (envio_id, sede_id) 
  VALUES 
  (1,1),
  (1,2),
  (3,3),
  (4,3),
  (5,1)

-- Insertar envios_voluntarios
INSERT INTO envios_voluntarios (envio_id,voluntario_id)
  VALUES 
  (7,1),
  (7,4),
  (7,3),
  (8,2),
  (9,2),
  (9,4),
  (8,3),
  (8,6)

-- e - Agregarle a la tabla ciudad un campo que se llame pais
ALTER TABLE ciudades ADD pais VARCHAR(30)

-- f - Completar todos los registros con Argentina
UPDATE ciudades SET pais = "Argentina"

-- g - Cambiar la cantidad de caracteres que podés guardar en el nombre del socio, de forma tal que permita ingresar 5 caracteres más

ALTER TABLE socios MODIFY nombre VARCHAR(35)

-- h - Aumentar las cuotas en 2 euros

UPDATE tipo_cuotas SET valor = valor + 2

-- i - Cambiar el nombre de la columna  “nombre” de los socios por “NombreSocio”
ALTER TABLE socios CHANGE nombre NombreSocio VARCHAR(35)

-- j - Crear una nueva tabla llamada Pais con un id y un nombre.

CREATE TABLE paises (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(30)
)

-- k - Cargar Argentina, Colombia y Chile

INSERT INTO paises (nombre) VALUES ("Argentina","Colombia","Chile")

-- m - Modificar el campo pais de la tabla ciudad y vincularlo con el id de Pais de la tabla pais

-- Creo la primary key
ALTER TABLE ciudades CHANGE pais pais_id INT;
ALTER TABLE ciudades ADD FOREIGN KEY (pais_id) REFERENCES paises(id);

-- Modifico los valores
UPDATE ciudades SET pais_id = 1
