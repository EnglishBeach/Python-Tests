
-- --------------------------------------------------------

--
-- Структура таблицы `c_worker`
--

CREATE TABLE `c_worker` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` int(10) UNSIGNED NOT NULL,
  `boss_id` int(10) UNSIGNED DEFAULT NULL,
  `kafedra` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `c_worker`
--

INSERT INTO `c_worker` (`id`, `name`, `salary`, `boss_id`, `kafedra`) VALUES
(1, 'Пахан', 20000, NULL, 'Физхимия'),
(2, 'Роберт', 1000, 1, 'Нефть');
