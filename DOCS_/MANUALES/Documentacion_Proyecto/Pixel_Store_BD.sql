-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-04-2025 a las 01:58:10
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `quantumleap`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('872fc795410e');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `usuario_id`, `total`) VALUES
(1, 1, 150000),
(2, 2, 0),
(3, 3, 0),
(4, 6, 0),
(5, 7, 123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'Accion'),
(3, 'Aventura'),
(2, 'Terror');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_carrito`
--

CREATE TABLE `detalle_carrito` (
  `carrito_id` int(11) NOT NULL,
  `juego_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_con_descuento` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `factura_id` int(11) NOT NULL,
  `juego_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`factura_id`, `juego_id`, `cantidad`) VALUES
(56, 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `divisas`
--

CREATE TABLE `divisas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `simbolo` varchar(10) NOT NULL,
  `tipo_cambio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `divisas`
--

INSERT INTO `divisas` (`id`, `nombre`, `simbolo`, `tipo_cambio`) VALUES
(1, 'Dólar estadounidense', '$', 1),
(2, 'Euro', '€', 1.1),
(3, 'Libra esterlina', '£', 1.25),
(4, 'Yen japonés', '¥', 0.0076),
(5, 'Peso colombiano', 'COP', 0.0003);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `monto_subtotal` float NOT NULL,
  `impuestos` float NOT NULL,
  `total` float NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  `divisa_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `fecha`, `monto_subtotal`, `impuestos`, `total`, `metodo_pago`, `divisa_id`, `usuario_id`) VALUES
(56, '2025-04-21 07:45:40', 150000, 28500, 178500, 'Nequi', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego`
--

CREATE TABLE `juego` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `precio` float NOT NULL,
  `stock` int(11) NOT NULL,
  `condicion` varchar(50) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `imagen_url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `juego`
--

INSERT INTO `juego` (`id`, `titulo`, `descripcion`, `precio`, `stock`, `condicion`, `categoria_id`, `imagen_url`) VALUES
(7, 'la fokin granja', 'asdfghjk', 150000, 11, 'nuevo', 1, 'https://res.cloudinary.com/dtdxmx8ly/image/upload/v1745221516/ras_nyvexu.jpg'),
(8, 'que paso brother', 'Lagranja brother', 12.542, 123, 'nuevo', 1, 'https://res.cloudinary.com/dtdxmx8ly/image/upload/v1745221771/mini_hgwudp_bfabn6.jpg'),
(9, 'la fokin granja', 'la granja', 125, 12, 'nuevo', 3, 'https://res.cloudinary.com/dtdxmx8ly/image/upload/v1745439130/maxresdefault_e9dla3.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos_promociones`
--

CREATE TABLE `juegos_promociones` (
  `juego_id` int(11) NOT NULL,
  `promocion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `accion` varchar(200) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `detalles` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion`
--

CREATE TABLE `promocion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_descuento` enum('Porcentaje','Monto_Fijo') NOT NULL,
  `valor_descuento` float NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `es_global` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resena`
--

CREATE TABLE `resena` (
  `id` int(11) NOT NULL,
  `juego_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `fecha` datetime NOT NULL,
  `puntuacion` int(11) NOT NULL,
  `editada` tinyint(1) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `resena`
--

INSERT INTO `resena` (`id`, `juego_id`, `usuario_id`, `comentario`, `fecha`, `puntuacion`, `editada`, `fecha_edicion`) VALUES
(9, 8, 1, 'dfghjhfghjk', '2025-04-23 16:31:27', 4, 0, NULL),
(10, 8, 3, 'rtuijgfhjkl', '2025-04-23 16:31:41', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena_hash` varchar(255) NOT NULL,
  `rol` enum('ADMIN','USUARIO','VENDEDOR') NOT NULL,
  `fecha_registro` date NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `reset_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `email`, `contrasena_hash`, `rol`, `fecha_registro`, `direccion`, `telefono`, `reset_token`) VALUES
(1, 'Diego_el_perron', 'Elperron', 'diegoelperron@gmail.com', 'pbkdf2:sha256:260000$KsCAzLxtsbTFJ7jN$e7245a4adc427818307cc38e1b15712151b5ad7e3ba27c140eaa512a8f27e860', 'ADMIN', '2025-04-09', 'Dirección del Superadmin', '1234567890', NULL),
(2, 'David_21', 'Gansta_Life', 'davinci21@gmail.com', 'pbkdf2:sha256:260000$35FyM8Hq57nJNl2D$448368de30a634a3e522ec6bf6c3b6488866bc6e44a2fbbf88c97d2e30be4200', 'ADMIN', '2025-04-09', 'Dirección del Superadmin002', '3008353399', NULL),
(3, 'Diego', 'Guerra', 'dguerragomez4@gmail.com', 'pbkdf2:sha256:260000$dd8F4Mnv8eps64W8$8d445c760eea32813e7b018521d03278b589cc1a640d401be2b5a1d81bb14d8f', 'USUARIO', '2025-04-09', 'Cl. 56f Sur #94A-20, Bogotá', '3219527790', NULL),
(4, 'Negro Hpta', 'dfsf', 'gambaangel155@gmail.com', 'pbkdf2:sha256:260000$NGvFnFt3bKIlb0Vu$2b53dae75a4abdb0e44679fa6e14e65edc922becf0bf67b5af852994a814f4a5', 'USUARIO', '2025-04-10', 'Cl. 56f Sur #94A-20, Bogotá', '1234567890', NULL),
(5, 'Sebastian', 'Dagg', 'seca4071@gmail.com', 'pbkdf2:sha256:260000$XkqdFGw2yNOVF2CZ$34b6e255a7ae739cbbc56c8115ea51c9f0f0b3d7243cd4ab78002e71cc45c5b7', 'USUARIO', '2025-04-16', 'Cl. 56f Sur #94A-20, Bogotá', '1234567899', '2qz3qLMzV9pZnP4A60iA5ihBVnWSy94wVHngDYa2DJs'),
(6, 'DiegoFF', 'Guerra', 'elpajas646@gmail.com', 'pbkdf2:sha256:260000$ATXOCY0TzsQyTXDy$f886b6a3c326c86e5c065503c199c1e17e6160fcbb03f5da22cecb74ce4237df', 'USUARIO', '2025-04-20', 'Cl. 56f Sur #94A-20, Bogotá', '3219527790', NULL),
(7, 'Burro Pixel', 'Gumball', 'diego1069432917@gmail.com', 'pbkdf2:sha256:260000$XD59Rz4wZysskscy$5930c3d335c32c7e4ca1af17c0e8b5e2ed234deae768021083477cb7693057e9', 'VENDEDOR', '2025-04-21', 'Cl. 56f Sur #94A-20, Bogotá', '3219527790', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  ADD PRIMARY KEY (`carrito_id`,`juego_id`),
  ADD KEY `juego_id` (`juego_id`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`factura_id`,`juego_id`),
  ADD KEY `juego_id` (`juego_id`);

--
-- Indices de la tabla `divisas`
--
ALTER TABLE `divisas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `divisa_id` (`divisa_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `juegos_promociones`
--
ALTER TABLE `juegos_promociones`
  ADD PRIMARY KEY (`juego_id`,`promocion_id`),
  ADD KEY `promocion_id` (`promocion_id`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `promocion`
--
ALTER TABLE `promocion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `resena`
--
ALTER TABLE `resena`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `juego_id` (`juego_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `divisas`
--
ALTER TABLE `divisas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `promocion`
--
ALTER TABLE `promocion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `resena`
--
ALTER TABLE `resena`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  ADD CONSTRAINT `detalle_carrito_ibfk_1` FOREIGN KEY (`carrito_id`) REFERENCES `carrito` (`id`),
  ADD CONSTRAINT `detalle_carrito_ibfk_2` FOREIGN KEY (`juego_id`) REFERENCES `juego` (`id`);

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id`),
  ADD CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`juego_id`) REFERENCES `juego` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`divisa_id`) REFERENCES `divisas` (`id`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `juego`
--
ALTER TABLE `juego`
  ADD CONSTRAINT `juego_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`);

--
-- Filtros para la tabla `juegos_promociones`
--
ALTER TABLE `juegos_promociones`
  ADD CONSTRAINT `juegos_promociones_ibfk_1` FOREIGN KEY (`juego_id`) REFERENCES `juego` (`id`),
  ADD CONSTRAINT `juegos_promociones_ibfk_2` FOREIGN KEY (`promocion_id`) REFERENCES `promocion` (`id`);

--
-- Filtros para la tabla `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `resena`
--
ALTER TABLE `resena`
  ADD CONSTRAINT `resena_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resena_ibfk_2` FOREIGN KEY (`juego_id`) REFERENCES `juego` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
