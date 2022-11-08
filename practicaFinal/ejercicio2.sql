CREATE DATABASE rotiseria 

CREATE TABLE pedidos ( 
  id INT PRIMARY KEY CHECK (id > 0 and id < 200),
  nombre ENUM("pizza", "empanada"),
  tipo VARCHAR(30),
  precio DECIMAL(5,2) UNSIGNED,
  cantidad INT CHECK(cantidad > 0 and cantidad < 200),
  domicilio VARCHAR(50)
)

-- Between is inclusive, begin and end values are included
-- For example in this case, if I used between inside the check conditional it would be wrong because It included 0 and 200

INSERT INTO pedidos VALUEs (1, 1, "muzzarella", 600.25, 2, "gutierrez 33")