
-- --------------------------------------------------------

--
-- Структура таблицы `c_teacher`
--

CREATE TABLE `c_teacher` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
