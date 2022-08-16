-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 28 2022 г., 22:52
-- Версия сервера: 10.5.11-MariaDB
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `university`
--

-- --------------------------------------------------------

--
-- Структура таблицы `discipline`
--

CREATE TABLE `discipline` (
  `id` int(10) UNSIGNED NOT NULL,
  `volume` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `discipline`
--

INSERT INTO `discipline` (`id`, `volume`) VALUES
(1, 1),
(2, 2),
(3, 5),
(4, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `engeener`
--

CREATE TABLE `engeener` (
  `id` int(10) UNSIGNED NOT NULL,
  `profession` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exam`
--

CREATE TABLE `exam` (
  `discipline_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL,
  `date` time NOT NULL,
  `auditory` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mark` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `faculty`
--

CREATE TABLE `faculty` (
  `short_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `faculty`
--

INSERT INTO `faculty` (`short_name`, `full_name`) VALUES
('ИТММ', 'Информационные технилигии мат моделирование'),
('ФФ', 'Филологический факультет'),
('ХФ', 'Химический фаультет');

-- --------------------------------------------------------

--
-- Структура таблицы `kafedra`
--

CREATE TABLE `kafedra` (
  `short_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faculty` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `kafedra`
--

INSERT INTO `kafedra` (`short_name`, `faculty`, `full_name`) VALUES
('Аналитика', 'ХФ', 'Аналитической химии'),
('Матан', 'ИТММ', 'Основной математики'),
('Нефть', 'ХФ', 'Химии нефти'),
('Ограника', 'ХФ', 'Органической химии'),
('Роботы', 'ИТММ', 'Робототехники и проектирования'),
('Сказки', 'ФФ', 'Русской литературы 18 века'),
('Физхимия', 'ХФ', 'Физической химии');

-- --------------------------------------------------------

--
-- Структура таблицы `king`
--

CREATE TABLE `king` (
  `worker_id` int(10) UNSIGNED NOT NULL,
  `experience` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `special`
--

CREATE TABLE `special` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kafedra` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `id` int(10) UNSIGNED NOT NULL,
  `special` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `teacher`
--

CREATE TABLE `teacher` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `worker`
--

CREATE TABLE `worker` (
  `id` int(10) UNSIGNED NOT NULL,
  `second_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` int(10) UNSIGNED NOT NULL,
  `boss_id` int(10) UNSIGNED DEFAULT NULL,
  `kafedra` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `worker`
--

INSERT INTO `worker` (`id`, `second_name`, `salary`, `boss_id`, `kafedra`) VALUES
(1, 'Пахан', 20000, NULL, 'Физхимия'),
(2, 'Роберт', 1000, 1, 'Нефть');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `discipline`
--
ALTER TABLE `discipline`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `engeener`
--
ALTER TABLE `engeener`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`discipline_id`,`student_id`,`teacher_id`,`date`),
  ADD KEY `fk_exam_student` (`student_id`),
  ADD KEY `fk_exam_teacher` (`teacher_id`);

--
-- Индексы таблицы `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`short_name`),
  ADD UNIQUE KEY `ak_full_name` (`full_name`);

--
-- Индексы таблицы `kafedra`
--
ALTER TABLE `kafedra`
  ADD PRIMARY KEY (`short_name`),
  ADD UNIQUE KEY `ak_kefedra` (`full_name`),
  ADD KEY `fk_kafedra_faculty` (`faculty`);

--
-- Индексы таблицы `king`
--
ALTER TABLE `king`
  ADD PRIMARY KEY (`worker_id`);

--
-- Индексы таблицы `special`
--
ALTER TABLE `special`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ak_special` (`full_name`),
  ADD KEY `fk_spceial_kafedra` (`kafedra`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_student_special` (`special`);

--
-- Индексы таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_worker_kafedra` (`kafedra`),
  ADD KEY `ck_worker_boss` (`boss_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `discipline`
--
ALTER TABLE `discipline`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `worker`
--
ALTER TABLE `worker`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `engeener`
--
ALTER TABLE `engeener`
  ADD CONSTRAINT `fk_engeener_worker` FOREIGN KEY (`id`) REFERENCES `worker` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `fk_exam_discipline` FOREIGN KEY (`discipline_id`) REFERENCES `discipline` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_exam_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_exam_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `kafedra`
--
ALTER TABLE `kafedra`
  ADD CONSTRAINT `fk_faculty` FOREIGN KEY (`faculty`) REFERENCES `faculty` (`short_name`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `king`
--
ALTER TABLE `king`
  ADD CONSTRAINT `fk_king_worker` FOREIGN KEY (`worker_id`) REFERENCES `worker` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `special`
--
ALTER TABLE `special`
  ADD CONSTRAINT `fk_spceial_kafedra` FOREIGN KEY (`kafedra`) REFERENCES `kafedra` (`short_name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_special` FOREIGN KEY (`special`) REFERENCES `special` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `fk_teahcer_worker` FOREIGN KEY (`id`) REFERENCES `worker` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `worker`
--
ALTER TABLE `worker`
  ADD CONSTRAINT `ck_worker_boss` FOREIGN KEY (`boss_id`) REFERENCES `worker` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_worker_kafedra` FOREIGN KEY (`kafedra`) REFERENCES `kafedra` (`short_name`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
