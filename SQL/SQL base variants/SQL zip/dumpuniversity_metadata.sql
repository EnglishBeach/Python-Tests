
--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `a_faculty`
--
ALTER TABLE `a_faculty`
  ADD PRIMARY KEY (`short_name`),
  ADD UNIQUE KEY `ak_full_name` (`full_name`);

--
-- Индексы таблицы `a_kafedra`
--
ALTER TABLE `a_kafedra`
  ADD PRIMARY KEY (`short_name`),
  ADD UNIQUE KEY `ak_kefedra` (`full_name`),
  ADD KEY `fk_kafedra_faculty` (`faculty`);

--
-- Индексы таблицы `b_discipline`
--
ALTER TABLE `b_discipline`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `b_special`
--
ALTER TABLE `b_special`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ak_special` (`name`),
  ADD KEY `fk_spceial_kafedra` (`kafedra`);

--
-- Индексы таблицы `b_student`
--
ALTER TABLE `b_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_student_special` (`special`);

--
-- Индексы таблицы `c_engeener`
--
ALTER TABLE `c_engeener`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `c_king`
--
ALTER TABLE `c_king`
  ADD PRIMARY KEY (`worker_id`);

--
-- Индексы таблицы `c_teacher`
--
ALTER TABLE `c_teacher`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `c_worker`
--
ALTER TABLE `c_worker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_worker_kafedra` (`kafedra`),
  ADD KEY `ck_worker_boss` (`boss_id`);

--
-- Индексы таблицы `d_exam`
--
ALTER TABLE `d_exam`
  ADD PRIMARY KEY (`discipline_id`,`student_id`,`teacher_id`,`date`),
  ADD KEY `fk_exam_student` (`student_id`),
  ADD KEY `fk_exam_teacher` (`teacher_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `b_discipline`
--
ALTER TABLE `b_discipline`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `c_worker`
--
ALTER TABLE `c_worker`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `a_kafedra`
--
ALTER TABLE `a_kafedra`
  ADD CONSTRAINT `fk_faculty` FOREIGN KEY (`faculty`) REFERENCES `a_faculty` (`short_name`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `b_special`
--
ALTER TABLE `b_special`
  ADD CONSTRAINT `fk_spceial_kafedra` FOREIGN KEY (`kafedra`) REFERENCES `a_kafedra` (`short_name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `b_student`
--
ALTER TABLE `b_student`
  ADD CONSTRAINT `fk_student_special` FOREIGN KEY (`special`) REFERENCES `b_special` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `c_engeener`
--
ALTER TABLE `c_engeener`
  ADD CONSTRAINT `fk_engeener_worker` FOREIGN KEY (`id`) REFERENCES `c_worker` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `c_king`
--
ALTER TABLE `c_king`
  ADD CONSTRAINT `fk_king_worker` FOREIGN KEY (`worker_id`) REFERENCES `c_worker` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `c_teacher`
--
ALTER TABLE `c_teacher`
  ADD CONSTRAINT `fk_teahcer_worker` FOREIGN KEY (`id`) REFERENCES `c_worker` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `c_worker`
--
ALTER TABLE `c_worker`
  ADD CONSTRAINT `ck_worker_boss` FOREIGN KEY (`boss_id`) REFERENCES `c_worker` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_worker_kafedra` FOREIGN KEY (`kafedra`) REFERENCES `a_kafedra` (`short_name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `d_exam`
--
ALTER TABLE `d_exam`
  ADD CONSTRAINT `fk_exam_discipline` FOREIGN KEY (`discipline_id`) REFERENCES `b_discipline` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_exam_student` FOREIGN KEY (`student_id`) REFERENCES `b_student` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_exam_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `c_teacher` (`id`) ON UPDATE CASCADE;
