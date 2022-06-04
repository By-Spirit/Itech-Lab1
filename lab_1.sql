-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 05 2022 г., 00:04
-- Версия сервера: 10.1.48-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lab_1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `game`
--

CREATE TABLE `game` (
  `ID_Game` int(3) NOT NULL,
  `date` date NOT NULL,
  `place` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FID_Team1` int(3) NOT NULL,
  `FID_Team2` int(3) NOT NULL,
  `score` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `game`
--

INSERT INTO `game` (`ID_Game`, `date`, `place`, `FID_Team1`, `FID_Team2`, `score`) VALUES
(1, '2022-06-09', 'Palace sporta', 1, 2, '1:1');

-- --------------------------------------------------------

--
-- Структура таблицы `player`
--

CREATE TABLE `player` (
  `ID_Player` int(3) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FID_Team` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `player`
--

INSERT INTO `player` (`ID_Player`, `name`, `FID_Team`) VALUES
(1, 'Richard', 1),
(2, 'Liam', 10),
(3, 'Noah', 2),
(4, 'Oliver', 11),
(5, 'Elijah', 3),
(6, 'James', 14),
(7, 'William', 7),
(8, 'Benjamin', 4),
(9, 'Lucas', 12),
(10, 'Henry', 5),
(11, 'Theodore', 6),
(12, 'James', 8),
(13, 'Robert', 9),
(14, 'John', 13),
(15, 'Michael', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `team`
--

CREATE TABLE `team` (
  `ID_TEAM` int(3) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `league` int(3) NOT NULL,
  `coach` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `team`
--

INSERT INTO `team` (`ID_TEAM`, `name`, `league`, `coach`) VALUES
(1, 'Vilnius ', 1, 'Roberto'),
(2, 'Barcelona', 1, 'Samelo'),
(3, 'Chelsea', 2, 'Tuchel'),
(4, 'Liverpool', 2, 'Klopp '),
(5, 'Manchester United', 1, 'Erik ten Hag'),
(6, 'Milan', 1, 'Pioli'),
(7, 'Juventus', 1, 'Allegri'),
(8, 'Real Madrid', 1, 'Ancelotti'),
(9, 'Shakhtar', 2, 'Roberto De Zerbi'),
(10, 'Ajax', 2, 'Boris'),
(11, 'Bayern', 3, 'Nagelsmann'),
(12, 'Manchester City', 3, 'Guardiola'),
(13, 'Tottenham', 3, 'Conte'),
(14, 'Dynamo Kiev ', 3, 'Lucescu');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`ID_Game`),
  ADD KEY `FID_Team1` (`FID_Team1`),
  ADD KEY `FID_Team2` (`FID_Team2`);

--
-- Индексы таблицы `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`ID_Player`),
  ADD KEY `FID_Team` (`FID_Team`);

--
-- Индексы таблицы `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`ID_TEAM`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `game`
--
ALTER TABLE `game`
  MODIFY `ID_Game` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `player`
--
ALTER TABLE `player`
  MODIFY `ID_Player` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `team`
--
ALTER TABLE `team`
  MODIFY `ID_TEAM` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`FID_Team1`) REFERENCES `team` (`ID_TEAM`),
  ADD CONSTRAINT `game_ibfk_2` FOREIGN KEY (`FID_Team2`) REFERENCES `team` (`ID_TEAM`);

--
-- Ограничения внешнего ключа таблицы `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`FID_Team`) REFERENCES `team` (`ID_TEAM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
