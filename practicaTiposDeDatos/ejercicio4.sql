-- Una playa de estacionamiento guarda cada día los datos de los vehículos que ingresan a la
-- playa en una tabla llamada "vehiculos".
-- Los campos son, patente, que es una cadena que tiene siempre 6 caracteres; tipo, que es
-- auto o moto, hora de llegada, donde solamente se guarda la hora; hora de salida, el dia;
-- precio (valor con decimales positivo que puede llegar hasta 999999.99 aprox.).

-- Crea la tabla con sus tipos de datos: 

CREATE TABLE vehiculos (
  `patente` VARCHAR(6) NOT NULL,
  `tipo` VARCHAR(4),
  `hora_llegada` TIME,
  `hora_salida` TIME,
  `dia` DATE,
  `precio` DECIMAL(8,2),
  PRIMARY KEY(patente)
)

-- Cambia el nombre del campo dia a diaLLegada

ALTER TABLE vehiculos CHANGE dia diaLLegada DATE

-- Agrega un campo llamado dueño que guarde el apellido del dueño del auto

ALTER TABLE vehiculos ADD dueño VARCHAR(22)

-- Sumale 10 caracteres más al campo dueño

ALTER TABLE vehiculos MODIFY dueño VARCHAR(32)

-- Ingresar algunos registros

-- ('ACD123','auto','8:30','11:30','2019-01-05',200.50);
-- ('BGF234','moto','8:35',11:00','2019-01-05',70.50);
-- ('KIU467','auto','9:40',10:30','2019-01-05',1200.00);

INSERT INTO vehiculos VALUES ('ACD123','auto','8:30','11:30','2019-01-05',200.50, 'Cardarelli');
INSERT INTO vehiculos VALUES ('BGF234','moto','8:35','11:00','2019-01-05',70.50, 'Vesco Aparicio');
INSERT INTO vehiculos VALUES ('KIU467','auto','9:40','10:30','2019-01-05',1200.00, 'Salguero');

-- Actualizar la hora de salida del vehiculo con patente "ACD123" a las 12:30hs

UPDATE vehiculos SET hora_salida = '12:30' WHERE patente = 'ACD123'   

-- Actualizar el dia y el precio del vehiculo con patente "BGF234" al dia '2020/10/05' y precio 150.45

UPDATE vehiculos SET diaLLegada = "2020/10/05" WHERE patente = "BGF234"
UPDATE vehiculos SET precio = 150.45  WHERE patente = "BGF234"


UPDATE vehiculos SET diaLLegada = "2020/10/05", precio = 150.45 WHERE patente = "BGF234"

-- insertar patente,tipo,hora_llegada, dueño (en ese orden) 
-- y cargarle los siguientes valores s 'LIO987','auto','10','pepe'. 

-- Cómo se cargó la hora de llegada? 

-- Solucionarlo para que quede cargado a las 10 hs.


INSERT INTO vehiculos (patente, tipo, hora_llegada, dueño) VALUES ('LIO987','auto','10','pepe')

-- Como formateo la fecha para que al ingresar 10 por ejemplo se guarde en horas en  lugar de segundos. 
-- Actualmente si inserto 10 como hora_llegada, SQL lo almacena como segundos: 00:00:10.


-- Insertar patente, tipo, hora_llegada,dueño (en ese orden) y cargarle los siguientes
-- valores ('GTR987','auto','1010',null). Cómo se cargó la hora de llegada?
-- Solucionarlo para que quede cargado a las 10:10 hs

INSERT INTO vehiculos (patente, tipo, hora_llegada, dueño) VALUES ('GTR987','auto','1010',null)