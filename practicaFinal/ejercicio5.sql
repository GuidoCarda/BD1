CREATE DATABASE universidad

CREATE TABLE carreras(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(40),
)

CREATE TABLE cursos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  creditos INT,
  id_carrera INT,
  FOREIGN KEY (id_carrera) REFERENCES carreras(id)
)

CREATE TABLE alumnos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  sexo ENUM("M","F"),
  fecha_nacimiento DATE,
  id_carrera INT,
  FOREIGN KEY (id_carrera) REFERENCES carreras(id)
)

CREATE TABLE matriculas(
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_alumno INT,
  id_curso INT,
  fecha DATE,
  FOREIGN KEY (id_alumno) REFERENCES alumnos(id),
  FOREIGN KEY (id_curso) REFERENCES cursos(id)
) 


INSERT INTO carreras (nombre) 
VALUES ('RRHH'), ('DS')

INSERT INTO alumnos (nombre, fecha_nacimiento, sexo, id_carrera) 
VALUES ("Juan", "1990-01-01", 1, 1),
       ("Lucas", "1998-01-03", 1, 1),
       ("Maria", "1999-12-13", 2, 1),
       ("Malena", "1997-12-22", 2, 2),
       ("Juan", " 1999-11-01", 1, 2),
       ("Mariana", "2000-11-03", 2, 2)

INSERT INTO cursos (nombre, creditos, id_carrera)
VALUES ("Ingles", 100,1),
       ("Ing de soft", 150,2),
       ("Programacion", 120,2)

-- Olvide el campo fecha en la tabla matriculas por lo tanto lo agrego
ALTER TABLE matriculas ADD fecha DATE

INSERT INTO matriculas (id_alumno, id_curso, fecha)
VALUES (1,1,"2021-10-03"),
       (1,2,"2021-10-03"),
       (1,3,"2021-10-03"),
       (3,1,"2021-11-03"),
       (4,2,"2021-10-03"),
       (4,3,"2021-11-03"),
       (5,1,"2021-12-03"),
       (5,3,"2021-12-03"),
       (6,1,"2021-10-03"),
       (6,2,"2021-10-03"),

-- 3 - Agregar una columna a la tabla alumnos llamada email.
ALTER TABLE alumnos ADD email VARCHAR(50)

-- 4 - Cargar los correos como nombre@gmail.com
UPDATE alumnos SET email = CONCAT(nombre, "@gmail.com") WHERE *

-- 5- Subir el crédito de todos los cursos en 20 puntos.
UPDATE cursos SET creditos = creditos + 20

-- 6- Cambiar el nombre del curso de “Inglés” a “Inglés Técnico”.
UPDATE cursos SET nombre = "Ingles Técnico" WHERE nombre = "Ingles"

-- 7 - Crear una nueva tabla llamada docente. Crearle los campos ID (autonumerico),NOMBRE, FECHANAC, ESPECIALIDAD.

CREATE TABLE docentes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  fecha_nacimiento DATE,
  especialidad ENUM("Matematica", "Ingenieria")
)

-- 8 - Cargar la tabla con estos dos docentes.

-- IDDOCENTE | NOMBRE   | FECHANAC    | ESPECIALIDAD  |
-------------|----------|-------------|---------------|
-- 1         | DANIELA  | 01/01/1995  | MATEMÁTICA    |
-- 2         | PED RO   | 10/10/1994  | INGENIERÍA    |

INSERT INTO docentes (nombre, fecha_nacimiento, especialidad) 
VALUES ("DANIELA",1995-01-01,"Matematica"),
       ("PE DRO",1994-10-10,"Ingenieria")

-- 9-Como relacionarías la tabla docente con curso, sabiendo que Daniela es profe del curso
-- de ingles, y Pedro de los otros dos cursos. Realizar todas las actividades necesarias para
-- que esta relación quede plasmada en la BD.

ALTER TABLE cursos ADD id_docente INT
ALTER TABLE cursos ADD FOREIGN KEY (id_docente) REFERENCES docentes(id)
UPDATE cursos SET id_docente = 1 WHERE nombre = "Ingles Técnico"
UPDATE cursos SET id_docente = 2 WHERE nombre != "Ingles Técnico"

-- 10 - Agregar un registro en la tabla alumnos con los siguientes datos: nombre Mateo, fecha
-- de nacimiento 20/02/2001, sexo masculino, carrera Desarrollo de Software, email
-- mateo@gmail.com.

INSERT INTO alumnos (nombre,fecha_nacimiento,sexo, id_carrera, email) 
VALUES ("Mateo", "2001-20-02", 1, 2, "mateo@gmail.com")

INSERT INTO matriculas (id_alumno, id_curso, fecha)
VALUES (8,2,GETDATE()),
       (8,3,GETDATE())