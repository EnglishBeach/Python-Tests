
-- --------------------------------------------------------

--
-- Структура таблицы `a_kafedra`
--

CREATE TABLE `a_kafedra` (
  `short_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faculty` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `a_kafedra`
--

INSERT INTO `a_kafedra` (`short_name`, `faculty`, `full_name`) VALUES
('Аналитика', 'ХФ', 'Аналитической химии'),
('Матан', 'ИТММ', 'Основной математики'),
('Нефть', 'ХФ', 'Химии нефти'),
('Ограника', 'ХФ', 'Органической химии'),
('Роботы', 'ИТММ', 'Робототехники и проектирования'),
('Сказки', 'ФФ', 'Русской литературы 18 века'),
('Физхимия', 'ХФ', 'Физической химии');
