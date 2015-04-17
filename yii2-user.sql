-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Час створення: Квт 16 2015 р., 19:57
-- Версія сервера: 5.6.21
-- Версія PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База даних: `yii2-user`
--

-- --------------------------------------------------------

--
-- Структура таблиці `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1429203086),
('m140209_132017_init', 1429203117),
('m140403_174025_create_account_table', 1429203119),
('m140504_113157_update_tables', 1429203124),
('m140504_130429_create_token_table', 1429203125),
('m140830_171933_fix_ip_field', 1429203126),
('m140830_172703_change_account_table_name', 1429203126),
('m141222_110026_update_ip_field', 1429203127);

-- --------------------------------------------------------

--
-- Структура таблиці `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `public_email` varchar(255) DEFAULT NULL,
  `gravatar_email` varchar(255) DEFAULT NULL,
  `gravatar_id` varchar(32) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bio` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`) VALUES
(1, 'Мосійчук Віталій Сергійович', 'mosvits@gmail.com', 'mosvits@gmail.com', 'd88a17728d707c5da24646af93ff9bfc', 'Kiev, Ukraine', 'http://radap.kpi.ua', 'к.т.н., доцент;  Працює в КПІ з 2007 року.\r\nВеде лекційні курси «Цифрові пристрої», «Мікроконтролерне  керування електронної апаратури», «WEB-дизайн», «Схемотехніка  електронних апаратів».\r\nГалузь наукових інтересів: біомедичні пристрої та системи,  завадостійкість сенсорів медичного призначення.'),
(2, 'Гусєва Олена Володимирівна', 'guseva@tor.kpi.ua', 'guseva@tor.kpi.ua', 'b79bf982c343a6d96042671e58a6d162', 'Kiev, Ukraine', 'http://tor.kpi.ua', 'День народження 14 квітня');

-- --------------------------------------------------------

--
-- Структура таблиці `social_account`
--

CREATE TABLE IF NOT EXISTS `social_account` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `token`
--

CREATE TABLE IF NOT EXISTS `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`) VALUES
(1, 'mosvits', 'mosvits@gmail.com', '$2y$10$XiGSD9rQ040e3/T5CFhP5O67vDmJu72nXdnb8O/yrYV2fncyLNtX6', '8VmfqIg7Xm-G3TRyUylC3ENxGLUQAuN4', 1429203932, NULL, NULL, '::1', 1429203312, 1429203932, 0),
(2, 'guseva', 'guseva@tor.kpi.ua', '$2y$10$Z/iyF14/FxHNmxD.H6rId.VVLdLe7GtI6inu/eMVmZMwnhRr9UKu.', 'arGfzvIOYO6k54tCRCN3z8S3C85x6lAH', 1429206250, NULL, NULL, '::1', 1429206250, 1429206250, 0);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `migration`
--
ALTER TABLE `migration`
 ADD PRIMARY KEY (`version`);

--
-- Індекси таблиці `profile`
--
ALTER TABLE `profile`
 ADD PRIMARY KEY (`user_id`);

--
-- Індекси таблиці `social_account`
--
ALTER TABLE `social_account`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `account_unique` (`provider`,`client_id`), ADD KEY `fk_user_account` (`user_id`);

--
-- Індекси таблиці `token`
--
ALTER TABLE `token`
 ADD UNIQUE KEY `token_unique` (`user_id`,`code`,`type`);

--
-- Індекси таблиці `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_unique_username` (`username`), ADD UNIQUE KEY `user_unique_email` (`email`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `social_account`
--
ALTER TABLE `social_account`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблиці `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `profile`
--
ALTER TABLE `profile`
ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `social_account`
--
ALTER TABLE `social_account`
ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `token`
--
ALTER TABLE `token`
ADD CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
