CREATE DATABASE meteorologia

CREATE TABLE estadisticas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  ciudad VARCHAR(50),
  pais VARCHAR(50),
  temp_max TINYINT CHECK(temp_max between -20 and 40),
  temp_min TINYINT CHECK(temp_min between -20 and 40),
  precip_media SMALLINT CHECK(precip_media between 0 and 2000)
)

INSERT INTO estadisticas (ciudad, pais, temp_max, temp_min, precip_media) 
VALUES ("Bs As", "Argentina", 30, 8, 1200),
       ("Canberra", "Australlia", 30, 8, 620),
       ("Brasilia", "Brasil", 30, 8, 1500),
       ("Madrid", "España", 30, 8, 850),


-- V2

CREATE TABLE estadisticas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_ciudad INT,
  temp_max TINYINT CHECK(temp_max between -20 and 40),
  temp_min TINYINT CHECK(temp_max between -20 and 40),
  precip_media SMALLINT CHECK(precip_media between 0 and 2000),
  FOREIGN KEY (id_ciudad) REFERENCES ciudades(id)
)

CREATE TABLE ciudades (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  id_pais INT,
  FOREIGN KEY (id_pais) REFERENCES paises(id)
)

CREATE TABLE paises (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50)
)