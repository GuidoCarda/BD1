CREATE DATABASE estacionamiento

CREATE TABLE vehiculos(
  id INT AUTO_INCREMENT PRIMARY KEY,
  patente VARCHAR(6),
  tipo ENUM("auto","moto"),
  hora_llegada TIME,
  hora_salida TIME,
  dia DATE,
  precio DECIMAL(9,2) UNSIGNED
)
