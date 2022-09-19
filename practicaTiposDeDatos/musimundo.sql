-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3307
-- Tiempo de generación: 06-09-2022 a las 18:52:37
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `musimundo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aparatos`
--

CREATE TABLE IF NOT EXISTS `aparatos` (
`id` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `id_marca` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `aparatos`
--

INSERT INTO `aparatos` (`id`, `descripcion`, `nombre`, `id_marca`) VALUES
(1, 'Televidor flaco', 'Televisor 4k', NULL),
(2, 'Televidor gordo', 'Televisor 1080p', NULL),
(3, 'Microondas viejo', 'Se cae', NULL),
(4, 'Microondas nuevo', 'como nuevo?', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aparatos_componentes`
--

CREATE TABLE IF NOT EXISTS `aparatos_componentes` (
`ID` int(11) NOT NULL,
  `ID_aparato` int(11) DEFAULT NULL,
  `ID_componente` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aparatos_tipos`
--

CREATE TABLE IF NOT EXISTS `aparatos_tipos` (
`ID` int(11) NOT NULL,
  `ID_aparato` int(11) DEFAULT NULL,
  `ID_tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componentes`
--

CREATE TABLE IF NOT EXISTS `componentes` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` decimal(9,2) DEFAULT NULL,
  `especificaciones` varchar(50) DEFAULT NULL,
  `ID_fabricante` int(11) DEFAULT NULL,
  `stock` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `componentes`
--

INSERT INTO `componentes` (`id`, `nombre`, `precio`, `especificaciones`, `ID_fabricante`, `stock`) VALUES
(1, 'pantalla', '30.00', '25 pulgadas', 1, 15),
(2, 'puerta', '500.00', 'metalico', 2, 15),
(3, 'procesador', '1000.00', 'anda flama', 3, 15),
(4, 'plastico', '200.00', 'plasticoso', 2, 15),
(5, 'cables', '1000.00', 'cobre', 1, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabricantes`
--

CREATE TABLE IF NOT EXISTS `fabricantes` (
`id` int(11) NOT NULL,
  `domicilio` varchar(50) DEFAULT NULL,
  `nombre_fab` varchar(50) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `fabricantes`
--

INSERT INTO `fabricantes` (`id`, `domicilio`, `nombre_fab`) VALUES
(1, 'catamarca 333', 'juan lopez'),
(2, 'catamarca 444', 'Pedro lopez'),
(3, 'catamarca 555', 'Roberto funes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE IF NOT EXISTS `marca` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_electrodomesticos`
--

CREATE TABLE IF NOT EXISTS `tipos_electrodomesticos` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `caracteristicas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tipos_electrodomesticos`
--

INSERT INTO `tipos_electrodomesticos` (`id`, `nombre`, `caracteristicas`) VALUES
(1, 'televisor', 'economico y calidad'),
(2, 'microondas', 'calienta piola');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aparatos`
--
ALTER TABLE `aparatos`
 ADD PRIMARY KEY (`id`), ADD KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `aparatos_componentes`
--
ALTER TABLE `aparatos_componentes`
 ADD PRIMARY KEY (`ID`), ADD KEY `ID_aparato` (`ID_aparato`), ADD KEY `ID_componente` (`ID_componente`);

--
-- Indices de la tabla `aparatos_tipos`
--
ALTER TABLE `aparatos_tipos`
 ADD PRIMARY KEY (`ID`), ADD KEY `ID_aparato` (`ID_aparato`), ADD KEY `ID_tipo` (`ID_tipo`);

--
-- Indices de la tabla `componentes`
--
ALTER TABLE `componentes`
 ADD PRIMARY KEY (`id`), ADD KEY `ID_fabricante` (`ID_fabricante`);

--
-- Indices de la tabla `fabricantes`
--
ALTER TABLE `fabricantes`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_electrodomesticos`
--
ALTER TABLE `tipos_electrodomesticos`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aparatos`
--
ALTER TABLE `aparatos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `aparatos_componentes`
--
ALTER TABLE `aparatos_componentes`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aparatos_tipos`
--
ALTER TABLE `aparatos_tipos`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `componentes`
--
ALTER TABLE `componentes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `fabricantes`
--
ALTER TABLE `fabricantes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipos_electrodomesticos`
--
ALTER TABLE `tipos_electrodomesticos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aparatos`
--
ALTER TABLE `aparatos`
ADD CONSTRAINT `aparatos_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id`);

--
-- Filtros para la tabla `aparatos_componentes`
--
ALTER TABLE `aparatos_componentes`
ADD CONSTRAINT `aparatos_componentes_ibfk_1` FOREIGN KEY (`ID_aparato`) REFERENCES `aparatos` (`id`),
ADD CONSTRAINT `aparatos_componentes_ibfk_2` FOREIGN KEY (`ID_componente`) REFERENCES `componentes` (`id`);

--
-- Filtros para la tabla `aparatos_tipos`
--
ALTER TABLE `aparatos_tipos`
ADD CONSTRAINT `aparatos_tipos_ibfk_1` FOREIGN KEY (`ID_aparato`) REFERENCES `aparatos` (`id`),
ADD CONSTRAINT `aparatos_tipos_ibfk_2` FOREIGN KEY (`ID_tipo`) REFERENCES `tipos_electrodomesticos` (`id`);

--
-- Filtros para la tabla `componentes`
--
ALTER TABLE `componentes`
ADD CONSTRAINT `componentes_ibfk_1` FOREIGN KEY (`ID_fabricante`) REFERENCES `fabricantes` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
