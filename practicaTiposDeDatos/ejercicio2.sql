CREATE TABLE `pedidos` (
  `nro_pedido` SMALLINT CHECK(nro_pedido > 0 AND nro_pedido <= 200),
  `nombre` VARCHAR(8),
  `tipo` VARCHAR(22),
  `precio` DECIMAL(5,2) UNSIGNED,
  `cantidad` SMALLINT CHECK(cantidad > 0 AND cantidad <= 200),
  `domicilio` VARCHAR(22),
  PRIMARY KEY (nro_pedido)
)