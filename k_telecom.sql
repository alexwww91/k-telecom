-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 25 2022 г., 01:02
-- Версия сервера: 10.5.11-MariaDB
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `k_telecom`
--

-- --------------------------------------------------------

--
-- Структура таблицы `objects`
--

CREATE TABLE `objects` (
  `id` int(16) NOT NULL,
  `type_id` int(16) NOT NULL,
  `serial` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `objects`
--

INSERT INTO `objects` (`id`, `type_id`, `serial`) VALUES
(1, 1, 'test'),
(2, 1, 'test2'),
(3, 3, '1A2ZS2-2HG'),
(4, 3, '1A2ZS2-2HR'),
(5, 3, '1A2ZS2-2HJ'),
(6, 3, '1A2ZS2-2HA'),
(7, 3, '1A2ZS2-2HT');

-- --------------------------------------------------------

--
-- Структура таблицы `object_typ`
--

CREATE TABLE `object_typ` (
  `id` int(16) NOT NULL,
  `name` text CHARACTER SET utf8 NOT NULL,
  `mask` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `object_typ`
--

INSERT INTO `object_typ` (`id`, `name`, `mask`) VALUES
(1, 'TP-Link TL-WR74', 'XXAAAAAXAA'),
(2, 'D-Link DIR-300', 'NXXAAXZXaa'),
(3, 'D-Link DIR-300 S', 'NXXAAXZXXX');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `objects`
--
ALTER TABLE `objects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Индексы таблицы `object_typ`
--
ALTER TABLE `object_typ`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `objects`
--
ALTER TABLE `objects`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `object_typ`
--
ALTER TABLE `object_typ`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `objects`
--
ALTER TABLE `objects`
  ADD CONSTRAINT `objects_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `object_typ` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
