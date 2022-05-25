-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-05-2022 a las 22:19:47
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pets`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pets`
--

CREATE TABLE `pets` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pets`
--

INSERT INTO `pets` (`id`, `id_category`, `name`, `status`, `updated_at`, `created_at`, `deleted_at`) VALUES
(12, 1, 'Zeus', 'available', '2022-05-25 19:46:04', '2022-05-25 04:10:20', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pet_categories`
--

CREATE TABLE `pet_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pet_categories`
--

INSERT INTO `pet_categories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Perro', '2022-05-24 21:49:48', '2022-05-24 21:49:48', '2022-05-24 21:49:48'),
(2, 'Gato', '2022-05-24 21:49:48', '2022-05-24 21:49:48', '2022-05-24 21:49:48'),
(3, 'Hamster', '2022-05-24 21:49:59', '2022-05-24 21:49:59', '2022-05-24 21:49:59'),
(4, 'Conejo', '2022-05-24 21:49:59', '2022-05-24 21:49:59', '2022-05-24 21:49:59'),
(5, 'Loro', '2022-05-24 21:50:21', '2022-05-24 21:50:21', '2022-05-24 21:50:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pet_photos`
--

CREATE TABLE `pet_photos` (
  `id` int(11) NOT NULL,
  `id_pet` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pet_photos`
--

INSERT INTO `pet_photos` (`id`, `id_pet`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 9, '65aaa3e465219287a5e86a6616c92c25.jpg', '2022-05-25 04:05:29', '2022-05-25 04:05:29', NULL),
(2, 9, '83a038c4513be437ee2aa29fa3dac307.jpg', '2022-05-25 04:05:29', '2022-05-25 04:05:29', NULL),
(3, 10, 'db67b2139996f5ffe12b66a7c3ca5119.jpg', '2022-05-25 04:07:25', '2022-05-25 04:07:25', NULL),
(4, 10, 'd9369f7e07370c8eb18e36b752b09abb.jpg', '2022-05-25 04:07:25', '2022-05-25 04:07:25', NULL),
(5, 11, '7e669d76b815e46eb95677b199583f99.jpg', '2022-05-25 04:08:24', '2022-05-25 04:08:24', NULL),
(6, 11, '397734f54b012e0356865470114e7d26.jpg', '2022-05-25 04:08:24', '2022-05-25 04:08:24', NULL),
(11, 12, '3249df3c640e7b9a7b8e37a466bf6063.jpg', '2022-05-25 19:12:59', '2022-05-25 19:12:59', NULL),
(12, 12, 'd0f2588d0a19c09d97d28fe80ff4efa0.jpg', '2022-05-25 19:12:59', '2022-05-25 19:12:59', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pet_tags`
--

CREATE TABLE `pet_tags` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pet_tags`
--

INSERT INTO `pet_tags` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Peludo', '2022-05-24 21:51:20', '2022-05-24 21:51:20', '2022-05-24 21:51:20'),
(2, 'Sin Pelo', '2022-05-24 21:51:20', '2022-05-24 21:51:20', '2022-05-24 21:51:20'),
(3, 'Patas Largas', '2022-05-24 21:51:29', '2022-05-24 21:51:29', '2022-05-24 21:51:29'),
(4, 'Patas Cortas', '2022-05-24 21:51:29', '2022-05-24 21:51:29', '2022-05-24 21:51:29'),
(5, 'Operado', '2022-05-24 21:51:40', '2022-05-24 21:51:40', '2022-05-24 21:51:40'),
(6, 'Sin Operaciones', '2022-05-24 21:51:40', '2022-05-24 21:51:40', '2022-05-24 21:51:40'),
(7, 'Orejas Largas', '2022-05-24 21:51:50', '2022-05-24 21:51:50', '2022-05-24 21:51:50'),
(8, 'Orejas Cortas', '2022-05-24 21:51:50', '2022-05-24 21:51:50', '2022-05-24 21:51:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pet_tags_asigned`
--

CREATE TABLE `pet_tags_asigned` (
  `id` int(11) NOT NULL,
  `id_pet` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pet_tags_asigned`
--

INSERT INTO `pet_tags_asigned` (`id`, `id_pet`, `id_tag`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2022-05-25 03:50:24', '2022-05-25 03:50:24', NULL),
(2, 1, 3, '2022-05-25 03:50:24', '2022-05-25 03:50:24', NULL),
(3, 1, 5, '2022-05-25 03:50:24', '2022-05-25 03:50:24', NULL),
(4, 1, 7, '2022-05-25 03:50:24', '2022-05-25 03:50:24', NULL),
(5, 9, 1, '2022-05-25 04:05:29', '2022-05-25 04:05:29', NULL),
(6, 9, 3, '2022-05-25 04:05:29', '2022-05-25 04:05:29', NULL),
(7, 9, 5, '2022-05-25 04:05:29', '2022-05-25 04:05:29', NULL),
(8, 9, 7, '2022-05-25 04:05:29', '2022-05-25 04:05:29', NULL),
(9, 10, 1, '2022-05-25 04:07:25', '2022-05-25 04:07:25', NULL),
(10, 10, 3, '2022-05-25 04:07:25', '2022-05-25 04:07:25', NULL),
(11, 10, 5, '2022-05-25 04:07:25', '2022-05-25 04:07:25', NULL),
(12, 10, 7, '2022-05-25 04:07:25', '2022-05-25 04:07:25', NULL),
(13, 11, 1, '2022-05-25 04:08:24', '2022-05-25 04:08:24', NULL),
(14, 11, 3, '2022-05-25 04:08:24', '2022-05-25 04:08:24', NULL),
(15, 11, 5, '2022-05-25 04:08:24', '2022-05-25 04:08:24', NULL),
(16, 11, 7, '2022-05-25 04:08:24', '2022-05-25 04:08:24', NULL),
(57, 12, 1, '2022-05-25 19:12:59', '2022-05-25 19:12:59', NULL),
(58, 12, 2, '2022-05-25 19:12:59', '2022-05-25 19:12:59', NULL),
(59, 12, 3, '2022-05-25 19:12:59', '2022-05-25 19:12:59', NULL),
(60, 12, 4, '2022-05-25 19:12:59', '2022-05-25 19:12:59', NULL),
(61, 12, 5, '2022-05-25 19:12:59', '2022-05-25 19:12:59', NULL),
(62, 12, 6, '2022-05-25 19:12:59', '2022-05-25 19:12:59', NULL),
(63, 12, 7, '2022-05-25 19:12:59', '2022-05-25 19:12:59', NULL),
(64, 12, 8, '2022-05-25 19:12:59', '2022-05-25 19:12:59', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pet_categories`
--
ALTER TABLE `pet_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pet_photos`
--
ALTER TABLE `pet_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pet_tags`
--
ALTER TABLE `pet_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pet_tags_asigned`
--
ALTER TABLE `pet_tags_asigned`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pet_categories`
--
ALTER TABLE `pet_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pet_photos`
--
ALTER TABLE `pet_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pet_tags`
--
ALTER TABLE `pet_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pet_tags_asigned`
--
ALTER TABLE `pet_tags_asigned`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
