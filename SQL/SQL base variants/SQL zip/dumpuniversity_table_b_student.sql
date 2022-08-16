
-- --------------------------------------------------------

--
-- Структура таблицы `b_student`
--

CREATE TABLE `b_student` (
  `id` int(10) UNSIGNED NOT NULL,
  `special` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
