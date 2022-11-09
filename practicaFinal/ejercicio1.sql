CREATE DATABASE biblioteca

CREATE TABLE libros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(50) NOT NULL,
  autor VARCHAR(50),
  editorial VARCHAR(50),
  precio DECIMAL(5,2) UNSIGNED,
  cantidad INT UNSIGNED CHECK(cantidad between 0 and 999) 
)

INSERT INTO libros (titulo, autor, editorial, precio, cantidad) VALUES 
("los juegos del hambre", "pepito", "pepito prods", 111111, -10);