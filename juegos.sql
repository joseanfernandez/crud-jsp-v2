-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 06-05-2018 a las 19:09:55
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `juegos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ADMIN`
--

CREATE TABLE `ADMIN` (
  `CODADM` int(10) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `PASSW` varchar(100) NOT NULL,
  `FECHALT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ADMIN`
--

INSERT INTO `ADMIN` (`CODADM`, `EMAIL`, `PASSW`, `FECHALT`) VALUES
(1, 'admin@ljdma.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2018-05-06 16:51:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AMIGO`
--

CREATE TABLE `AMIGO` (
  `CODAMI` int(10) NOT NULL,
  `USER` varchar(30) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `PASSW` varchar(100) NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `APE` varchar(50) NOT NULL,
  `FECHALT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `AMIGO`
--

INSERT INTO `AMIGO` (`CODAMI`, `USER`, `EMAIL`, `PASSW`, `NOM`, `APE`, `FECHALT`) VALUES
(1, 'Dani', 'daniel@gmail.com', '12dea96fec20593566ab75692c9949596833adc9', 'Daniel', 'Cubo', '2018-05-06 16:30:12'),
(2, 'Rubi', 'silvia@gmail.com', '12dea96fec20593566ab75692c9949596833adc9', 'Silvia', 'Majiro', '2018-05-06 16:30:12'),
(3, 'Jess', 'jessica@gmail.com', '12dea96fec20593566ab75692c9949596833adc9', 'Jessica', 'Romero ', '2018-05-06 16:30:12'),
(4, 'Corta', 'alvaro@gmail.com', '12dea96fec20593566ab75692c9949596833adc9', 'Álvaro', 'Cortacero Pérez', '2018-05-06 16:30:12'),
(5, 'Josean', 'josean@gmail.com', '12dea96fec20593566ab75692c9949596833adc9', 'Jose Antonio', 'Fernández García', '2018-05-06 16:45:50'),
(12, 'Adelita', 'adela@gmail.com', '12dea96fec20593566ab75692c9949596833adc9', 'Adela', 'Pacheco', '2018-05-06 16:30:12'),
(35, 'Laura', 'laura@gmail.com', '12dea96fec20593566ab75692c9949596833adc9', 'Laura', 'Martinez', '2018-05-06 16:30:12'),
(39, 'Amador', 'amador@gmail.com', '12dea96fec20593566ab75692c9949596833adc9', 'Carlos', 'Rivas', '2018-05-06 16:30:12'),
(40, 'Manu', 'manu@gmail.com', '12dea96fec20593566ab75692c9949596833adc9', 'Manuel', 'Fernández García', '2018-05-06 16:30:12'),
(45, 'aaa', 'a@a.com', '12dea96fec20593566ab75692c9949596833adc9', 'aaaa', 'aaaa', '2018-05-06 16:41:11'),
(46, 'bbb', 'b@b.com', '12dea96fec20593566ab75692c9949596833adc9', 'bbb', 'bbb', '2018-05-06 16:52:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CATEGORIA`
--

CREATE TABLE `CATEGORIA` (
  `CODCAT` int(10) NOT NULL,
  `NOMCAT` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CATEGORIA`
--

INSERT INTO `CATEGORIA` (`CODCAT`, `NOMCAT`) VALUES
(3, 'Cartas'),
(1, 'Dados'),
(2, 'Fichas'),
(4, 'Tablero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `JUEGO`
--

CREATE TABLE `JUEGO` (
  `CODJUE` int(10) NOT NULL,
  `NOMJUE` varchar(50) NOT NULL,
  `CODCAT` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `JUEGO`
--

INSERT INTO `JUEGO` (`CODJUE`, `NOMJUE`, `CODCAT`) VALUES
(1, 'Parchís', 1),
(2, 'Backgammon', 1),
(3, 'Dominó', 2),
(4, 'Mahjong', 2),
(6, 'Póker', 3),
(7, 'Uno', 3),
(8, 'Time\'s Up', 3),
(9, 'Carcassonne', 4),
(10, 'Aventureros al tren', 4),
(11, 'Zombies', 4),
(12, 'Cluedo', 4),
(13, 'Risk', 4),
(14, 'Monopoly', 4),
(16, 'Spoilers', 3),
(18, 'Sushi-Go', 3),
(21, 'Dixit', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TIENEN`
--

CREATE TABLE `TIENEN` (
  `CODAMI` int(10) NOT NULL,
  `CODJUE` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TIENEN`
--

INSERT INTO `TIENEN` (`CODAMI`, `CODJUE`) VALUES
(1, 2),
(1, 6),
(1, 8),
(1, 12),
(1, 14),
(2, 2),
(2, 4),
(2, 10),
(3, 2),
(3, 3),
(3, 6),
(3, 7),
(3, 11),
(3, 12),
(3, 13),
(4, 1),
(4, 7),
(4, 10),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 6),
(5, 8),
(5, 9),
(5, 10),
(5, 12),
(5, 14),
(5, 16),
(5, 21),
(40, 3),
(40, 10),
(40, 21);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ADMIN`
--
ALTER TABLE `ADMIN`
  ADD PRIMARY KEY (`CODADM`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`);

--
-- Indices de la tabla `AMIGO`
--
ALTER TABLE `AMIGO`
  ADD PRIMARY KEY (`CODAMI`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD UNIQUE KEY `USER` (`USER`);

--
-- Indices de la tabla `CATEGORIA`
--
ALTER TABLE `CATEGORIA`
  ADD PRIMARY KEY (`CODCAT`),
  ADD UNIQUE KEY `NOMCAT` (`NOMCAT`);

--
-- Indices de la tabla `JUEGO`
--
ALTER TABLE `JUEGO`
  ADD PRIMARY KEY (`CODJUE`),
  ADD UNIQUE KEY `NOMJUE` (`NOMJUE`),
  ADD KEY `FK_DEL` (`CODCAT`);

--
-- Indices de la tabla `TIENEN`
--
ALTER TABLE `TIENEN`
  ADD PRIMARY KEY (`CODAMI`,`CODJUE`),
  ADD KEY `FK_JUE` (`CODJUE`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ADMIN`
--
ALTER TABLE `ADMIN`
  MODIFY `CODADM` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `AMIGO`
--
ALTER TABLE `AMIGO`
  MODIFY `CODAMI` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `CATEGORIA`
--
ALTER TABLE `CATEGORIA`
  MODIFY `CODCAT` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `JUEGO`
--
ALTER TABLE `JUEGO`
  MODIFY `CODJUE` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `JUEGO`
--
ALTER TABLE `JUEGO`
  ADD CONSTRAINT `FK_DEL` FOREIGN KEY (`CODCAT`) REFERENCES `CATEGORIA` (`CODCAT`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `TIENEN`
--
ALTER TABLE `TIENEN`
  ADD CONSTRAINT `FK_AMI` FOREIGN KEY (`CODAMI`) REFERENCES `AMIGO` (`CODAMI`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_JUE` FOREIGN KEY (`CODJUE`) REFERENCES `JUEGO` (`CODJUE`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
