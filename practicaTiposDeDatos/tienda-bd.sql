-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-09-2022 a las 04:14:59
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `domicilio` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `limite_cred` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `telefono`, `domicilio`, `ciudad`, `limite_cred`) VALUES
(1, 'Daniel G', '5556901745', 'False Street 52 2 A', 'San Francisco', '3000.00'),
(2, 'Anne Wright', '5557410345', 'Wall-e Avenue 34', 'USA', '19.60'),
(3, 'Gerudo Valley', '5552323129', 'Oaks Avenue nº22', 'USA', '22.10'),
(4, 'Juan Perez', '5552323129', 'San juan nº22', 'Rosario', '234.85'),
(5, 'David Serrano', '675598001', 'Azores 321', 'Funes', '11.50'),
(6, 'Jose Tacaño', '655983045', 'Fuentes 6252', 'Rosario', '11.20'),
(7, 'Antonio Lasas', '3491654014', 'Mitre 543', 'Funes', '8.15'),
(8, 'Akane Tendo', '5559123321', 'Null Street nº69', 'USA', '696.60');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gamas`
--

CREATE TABLE `gamas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gamas`
--

INSERT INTO `gamas` (`id`, `nombre`) VALUES
(10, 'Plantas para jardin decorativas'),
(20, 'Herramientas para todo tipo de acción'),
(30, 'Plantas aromáticas'),
(40, 'Árboles pequeños de producción frutal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficinas`
--

CREATE TABLE `oficinas` (
  `id` varchar(7) NOT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `domicilio` varchar(50) DEFAULT NULL,
  `telefono` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `oficinas`
--

INSERT INTO `oficinas` (`id`, `ciudad`, `domicilio`, `telefono`) VALUES
('BCN-FUN', 'Funes', '34111111', 'San Juan'),
('BCN-PER', 'Perez', '34122222', 'Pelegrin'),
('BCN-ROL', 'Roldan', '3412345667', 'San Mart'),
('BCN-ROS', 'Rosario', '341235242', 'Mitre 33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `estado` set('entregado','pendiente','rechazado') NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `vendedor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `fecha`, `estado`, `cliente_id`, `vendedor_id`) VALUES
(1, '2006-01-17', 'entregado', 2, 1),
(2, '2007-10-26', 'entregado', 2, 5),
(3, '2008-06-25', 'rechazado', 1, 3),
(4, '2009-01-26', 'pendiente', 3, 1),
(8, '2008-11-14', 'entregado', 3, 2),
(9, '2008-12-27', 'entregado', 4, 1),
(10, '2009-01-15', 'pendiente', 4, 2),
(11, '2009-01-20', 'pendiente', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_productos`
--

CREATE TABLE `pedidos_productos` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `cant` int(11) DEFAULT NULL,
  `precio` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `codigo_prod` varchar(10) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `dimensiones` varchar(50) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `gama_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo_prod`, `nombre`, `dimensiones`, `stock`, `gama_id`) VALUES
(1, '11679', 'Sierra de Poda 400MM', '0,258', NULL, 20),
(2, '21636', 'Pala', '0,156', NULL, 20),
(3, '22225', 'Rastrillo de Jardín', '1,064', NULL, 20),
(4, 'AR-001', 'Ajedrea', '15-20', NULL, 40),
(5, 'AR-002', 'Lavándula Dentata', '15,20', NULL, 30),
(6, 'AR-008', 'Thymus Citriodra (Tomillo limón)', '1,064', NULL, 30),
(7, 'FR-100', 'Nectarina', '8/10', NULL, 40),
(8, 'FR-16', 'Calamondin Copa EXTRA Con FRUTA', '100-120', NULL, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

CREATE TABLE `vendedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `telefono` varchar(8) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `domicilio` varchar(50) DEFAULT NULL,
  `jefe_id` int(11) DEFAULT NULL,
  `oficina_id` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vendedores`
--

INSERT INTO `vendedores` (`id`, `nombre`, `telefono`, `ciudad`, `domicilio`, `jefe_id`, `oficina_id`) VALUES
(1, 'Marcos Perez', '3413897', 'Rosario', 'San Juan 514', NULL, 'BCN-ROS'),
(2, 'Juan Andes', '34135342', 'Rosario', 'San Martin 1514', 1, 'BCN-ROS'),
(3, 'Mariana Papalao', '34122334', 'Rosario', 'Entre Rios 222', 1, 'BCN-ROS'),
(4, 'Daniel Dartes', '34122332', 'Funes', 'San Juan 111', 1, 'BCN-FUN'),
(5, 'Mariana Paris', '34144444', 'Funes', 'Entre Rios 1222', 3, 'BCN-FUN'),
(6, 'Daniel Mariani', '34122332', 'Roldan', 'San Juan 11', 3, 'BCN-ROL'),
(7, 'Juana Juarez', '34122332', 'Roldan', 'Sarmiento  2211', 3, 'BCN-ROL');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gamas`
--
ALTER TABLE `gamas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oficinas`
--
ALTER TABLE `oficinas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `vendedor_id` (`vendedor_id`);

--
-- Indices de la tabla `pedidos_productos`
--
ALTER TABLE `pedidos_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gama_id` (`gama_id`);

--
-- Indices de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jefe_id` (`jefe_id`),
  ADD KEY `oficina_id` (`oficina_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `gamas`
--
ALTER TABLE `gamas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pedidos_productos`
--
ALTER TABLE `pedidos_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores` (`id`);

--
-- Filtros para la tabla `pedidos_productos`
--
ALTER TABLE `pedidos_productos`
  ADD CONSTRAINT `pedidos_productos_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `pedidos_productos_ibfk_2` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`gama_id`) REFERENCES `gamas` (`id`);

--
-- Filtros para la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD CONSTRAINT `vendedores_ibfk_1` FOREIGN KEY (`jefe_id`) REFERENCES `vendedores` (`id`),
  ADD CONSTRAINT `vendedores_ibfk_2` FOREIGN KEY (`oficina_id`) REFERENCES `oficinas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
