
-- --------------------------------------------------------

--
-- Структура таблицы `b_discipline`
--

CREATE TABLE `b_discipline` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `volume` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `b_discipline`
--

INSERT INTO `b_discipline` (`id`, `name`, `volume`) VALUES
(1, 'Физра', 1),
(2, 'Русский', 2),
(3, 'Химия', 5),
(4, 'Матан', 10);
