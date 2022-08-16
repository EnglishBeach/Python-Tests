
-- --------------------------------------------------------

--
-- Структура таблицы `d_exam`
--

CREATE TABLE `d_exam` (
  `discipline_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL,
  `date` time NOT NULL,
  `auditory` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mark` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
