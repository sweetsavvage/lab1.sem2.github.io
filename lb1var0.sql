-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 16 2020 г., 20:28
-- Версия сервера: 10.4.10-MariaDB
-- Версия PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `itehlibrary`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `ID_Authors` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`ID_Authors`, `name`) VALUES
(1, 'Steven King'),
(2, 'Lev Tolstoy'),
(3, 'Taras Shevchenko'),
(4, 'William Shakespeare '),
(5, 'Lesya Ukrainka'),
(6, 'Mikhail Dostoyevskii');

-- --------------------------------------------------------

--
-- Структура таблицы `book_authors`
--

CREATE TABLE `book_authors` (
  `FID_Book` int(11) NOT NULL,
  `FID_Authors` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `book_authors`
--

INSERT INTO `book_authors` (`FID_Book`, `FID_Authors`) VALUES
(1, 2),
(6, 4),
(10, 1),
(12, 3),
(16, 2),
(22, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `literature`
--

CREATE TABLE `literature` (
  `ID_Book` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `publish_year` year(4) DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `ISBN` varchar(25) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `literate` enum('Book','Journal','Newspaper') DEFAULT NULL,
  `FID_Resourse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `literature`
--

INSERT INTO `literature` (`ID_Book`, `name`, `publish_date`, `publish_year`, `publisher`, `quantity`, `ISBN`, `number`, `literate`, `FID_Resourse`) VALUES
(1, 'War and Peace', '2009-03-20', 1968, 'Vivat', 688, '0199232768', 0, 'Book', 1),
(2, 'National Geagraphy', '2020-01-01', 2017, NULL, NULL, NULL, 22, 'Journal', 2),
(3, 'Pravda', '2020-03-06', NULL, NULL, NULL, NULL, NULL, 'Newspaper', 3),
(4, 'Sobitiye', '2020-03-20', NULL, NULL, NULL, NULL, NULL, 'Newspaper', 3),
(5, 'Vpered', '2020-01-01', NULL, NULL, NULL, NULL, NULL, 'Newspaper', 3),
(6, 'Idiot', NULL, 2001, 'Svit Knigi', 311, '0199254326', NULL, 'Book', 1),
(8, 'Sadovnik', '2020-01-20', 2011, NULL, NULL, NULL, 50, 'Journal', 2),
(9, 'Hudozhnik', '2020-03-20', 2009, NULL, NULL, NULL, 12, 'Journal', 2),
(10, 'Ono', NULL, 2018, 'Vivat', 255, '0456232768', NULL, 'Book', 1),
(12, 'Zapovit', NULL, 1999, 'EKSMO', 110, '0564747838', NULL, 'Book', 1),
(16, 'Anna Karenina', '2003-11-02', 2003, 'Chas Maystriv', 305, '045678578', NULL, 'Book', 1),
(22, 'Lisova pisnya', '2008-10-20', 2008, 'Fabula', 23, '0199236538', NULL, 'Book', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `resourse`
--

CREATE TABLE `resourse` (
  `ID_Resourse` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `resourse`
--

INSERT INTO `resourse` (`ID_Resourse`, `title`) VALUES
(1, 'Book'),
(2, 'Journal'),
(3, 'Newspaper');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`ID_Authors`);

--
-- Индексы таблицы `book_authors`
--
ALTER TABLE `book_authors`
  ADD PRIMARY KEY (`FID_Book`,`FID_Authors`),
  ADD KEY `FID_Authors` (`FID_Authors`);

--
-- Индексы таблицы `literature`
--
ALTER TABLE `literature`
  ADD PRIMARY KEY (`ID_Book`),
  ADD KEY `literature_resourse` (`FID_Resourse`);

--
-- Индексы таблицы `resourse`
--
ALTER TABLE `resourse`
  ADD PRIMARY KEY (`ID_Resourse`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `book_authors`
--
ALTER TABLE `book_authors`
  ADD CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`FID_Book`) REFERENCES `literature` (`ID_Book`),
  ADD CONSTRAINT `book_authors_ibfk_2` FOREIGN KEY (`FID_Authors`) REFERENCES `authors` (`ID_Authors`);

--
-- Ограничения внешнего ключа таблицы `literature`
--
ALTER TABLE `literature`
  ADD CONSTRAINT `literature_resourse` FOREIGN KEY (`FID_Resourse`) REFERENCES `resourse` (`ID_Resourse`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
