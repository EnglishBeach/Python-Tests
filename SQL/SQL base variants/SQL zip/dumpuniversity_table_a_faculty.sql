
-- --------------------------------------------------------

--
-- Структура таблицы `a_faculty`
--

CREATE TABLE `a_faculty` (
  `short_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `a_faculty`
--

INSERT INTO `a_faculty` (`short_name`, `full_name`) VALUES
('ИТММ', 'Информационные технилигии мат моделирование'),
('ФФ', 'Филологический факультет'),
('ХФ', 'Химический фаультет');
