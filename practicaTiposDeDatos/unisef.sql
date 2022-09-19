-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2022 a las 16:51:54
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
-- Base de datos: `unisef`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id`, `nombre`, `pais_id`) VALUES
(1, 'rio de janeiro', 1),
(2, 'buenos aires', 1),
(3, 'la paz', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `id` int(11) NOT NULL,
  `destino` varchar(30) DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `tipo_ayuda` enum('material','humanitaria') DEFAULT NULL,
  `tipo_material` set('alimentos','medicamentos') DEFAULT NULL,
  `cant_toneladas` int(10) UNSIGNED DEFAULT NULL,
  `cant_medicamentos` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`id`, `destino`, `fecha_salida`, `tipo_ayuda`, `tipo_material`, `cant_toneladas`, `cant_medicamentos`) VALUES
(1, 'Haiti', '2020-02-23', 'material', 'alimentos', 20, NULL),
(2, 'Honduras', '2022-05-30', 'material', 'alimentos', 2, NULL),
(3, 'El chaco', '2021-01-10', 'material', 'alimentos', 15, NULL),
(4, 'La paz', '2020-02-23', 'material', 'medicamentos', NULL, 500),
(5, 'Chile', '2022-05-30', 'material', 'medicamentos', NULL, 1500),
(6, 'Rio de janeiro', '2021-01-10', 'material', 'medicamentos', NULL, 2000),
(7, 'La paz', '2020-02-23', 'humanitaria', NULL, NULL, NULL),
(8, 'Chile', '2022-05-30', 'humanitaria', NULL, NULL, NULL),
(9, 'Rio de janeiro', '2021-01-10', 'humanitaria', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios_sedes`
--

CREATE TABLE `envios_sedes` (
  `id` int(11) NOT NULL,
  `envio_id` int(11) DEFAULT NULL,
  `sede_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `envios_sedes`
--

INSERT INTO `envios_sedes` (`id`, `envio_id`, `sede_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 3, 3),
(4, 4, 3),
(5, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios_voluntarios`
--

CREATE TABLE `envios_voluntarios` (
  `id` int(11) NOT NULL,
  `envio_id` int(11) DEFAULT NULL,
  `voluntario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `envios_voluntarios`
--

INSERT INTO `envios_voluntarios` (`id`, `envio_id`, `voluntario_id`) VALUES
(1, 7, 1),
(2, 7, 4),
(3, 7, 3),
(4, 8, 2),
(5, 9, 2),
(6, 9, 4),
(7, 8, 3),
(8, 8, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id`, `nombre`) VALUES
(1, 'Argentina'),
(2, 'Colombia'),
(3, 'Chile');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesiones`
--

CREATE TABLE `profesiones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `profesiones`
--

INSERT INTO `profesiones` (`id`, `nombre`) VALUES
(1, 'medico'),
(2, 'ats'),
(3, 'psicologo'),
(4, 'nutrisionista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id` int(11) NOT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `director` varchar(30) DEFAULT NULL,
  `ciudad_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`id`, `domicilio`, `director`, `ciudad_id`) VALUES
(1, 'La paz 338', 'pedro rodriguez', 2),
(2, 'Beka Cintra 333', 'Marcos Evangelista de Moraes', 1),
(3, 'Abel Iturralde 1000', 'Evo morales', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `id` int(11) NOT NULL,
  `NombreSocio` varchar(35) DEFAULT NULL,
  `dni` int(8) DEFAULT NULL,
  `cta_banco` varchar(20) DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `tipo_cuota_id` int(11) DEFAULT NULL,
  `sede_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`id`, `NombreSocio`, `dni`, `cta_banco`, `fecha_pago`, `tipo_cuota_id`, `sede_id`) VALUES
(1, 'Juan', 33222111, '1324-1231-4534', '2022-01-21', 1, 3),
(2, 'Joaquin', 42321534, '3213-4564-4534', '2022-01-03', 1, 2),
(3, 'Mateo', 33645511, '1324-2423-4534', '2022-03-29', 1, 1),
(4, 'Celeste', 33245352, '2222-1232-4534', '2022-05-02', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cuotas`
--

CREATE TABLE `tipo_cuotas` (
  `id` int(11) NOT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `valor` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_cuotas`
--

INSERT INTO `tipo_cuotas` (`id`, `tipo`, `valor`) VALUES
(1, 'minima', 12),
(2, 'media', 22),
(3, 'maxima', 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voluntarios`
--

CREATE TABLE `voluntarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `dni` int(8) DEFAULT NULL,
  `tipo` enum('sanitario','administrativo') DEFAULT NULL,
  `disponibilidad` tinyint(1) DEFAULT NULL,
  `cant_trabajos` int(11) DEFAULT NULL,
  `profesion_id` int(11) DEFAULT NULL,
  `sede_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `voluntarios`
--

INSERT INTO `voluntarios` (`id`, `nombre`, `dni`, `tipo`, `disponibilidad`, `cant_trabajos`, `profesion_id`, `sede_id`) VALUES
(1, 'Juan perez', 33423423, 'sanitario', 1, 9, 1, 2),
(2, 'Roberto Carlos', 34512323, 'administrativo', NULL, NULL, NULL, 3),
(3, 'Lula da silva', 54512323, 'administrativo', NULL, NULL, NULL, 2),
(4, 'Pedro Ramirez', 33312323, 'administrativo', NULL, NULL, NULL, 1),
(5, 'Roberto Carkis', 32423423, 'sanitario', 0, 3, 2, 2),
(6, 'Diego Almeria', 31423423, 'sanitario', 1, 3, 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `envios_sedes`
--
ALTER TABLE `envios_sedes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `envio_id` (`envio_id`),
  ADD KEY `sede_id` (`sede_id`);

--
-- Indices de la tabla `envios_voluntarios`
--
ALTER TABLE `envios_voluntarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `envio_id` (`envio_id`),
  ADD KEY `voluntario_id` (`voluntario_id`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesiones`
--
ALTER TABLE `profesiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ciudad_id` (`ciudad_id`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_cuota_id` (`tipo_cuota_id`),
  ADD KEY `sede_id` (`sede_id`);

--
-- Indices de la tabla `tipo_cuotas`
--
ALTER TABLE `tipo_cuotas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `voluntarios`
--
ALTER TABLE `voluntarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sede_id` (`sede_id`),
  ADD KEY `profesion_id` (`profesion_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `envios`
--
ALTER TABLE `envios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `envios_sedes`
--
ALTER TABLE `envios_sedes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `envios_voluntarios`
--
ALTER TABLE `envios_voluntarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `profesiones`
--
ALTER TABLE `profesiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_cuotas`
--
ALTER TABLE `tipo_cuotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `voluntarios`
--
ALTER TABLE `voluntarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `envios_sedes`
--
ALTER TABLE `envios_sedes`
  ADD CONSTRAINT `envios_sedes_ibfk_1` FOREIGN KEY (`envio_id`) REFERENCES `envios` (`id`),
  ADD CONSTRAINT `envios_sedes_ibfk_2` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`);

--
-- Filtros para la tabla `envios_voluntarios`
--
ALTER TABLE `envios_voluntarios`
  ADD CONSTRAINT `envios_voluntarios_ibfk_1` FOREIGN KEY (`envio_id`) REFERENCES `envios` (`id`),
  ADD CONSTRAINT `envios_voluntarios_ibfk_2` FOREIGN KEY (`voluntario_id`) REFERENCES `voluntarios` (`id`);

--
-- Filtros para la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD CONSTRAINT `sedes_ibfk_1` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`id`);

--
-- Filtros para la tabla `socios`
--
ALTER TABLE `socios`
  ADD CONSTRAINT `socios_ibfk_1` FOREIGN KEY (`tipo_cuota_id`) REFERENCES `tipo_cuotas` (`id`),
  ADD CONSTRAINT `socios_ibfk_2` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`);

--
-- Filtros para la tabla `voluntarios`
--
ALTER TABLE `voluntarios`
  ADD CONSTRAINT `voluntarios_ibfk_1` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`),
  ADD CONSTRAINT `voluntarios_ibfk_2` FOREIGN KEY (`profesion_id`) REFERENCES `profesiones` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
