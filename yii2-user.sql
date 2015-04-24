-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Час створення: Квт 24 2015 р., 06:54
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
-- Структура таблиці `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1429624117),
('guide', '4', 1429624635),
('manager', '2', 1429624169),
('student', '3', 1429624557);

-- --------------------------------------------------------

--
-- Структура таблиці `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/site/index', 2, NULL, NULL, NULL, 1429626978, 1429626978),
('/user/admin/index', 2, NULL, NULL, NULL, 1429626795, 1429626795),
('admin', 1, 'Адміністратор сайту, який має доступ до всіх налаштувань', NULL, NULL, 1429623893, 1429623893),
('guest', 1, 'Гість, неавторизований користувач сайту', NULL, NULL, 1429624081, 1429624081),
('guide', 1, 'Керівник практики від факультету та кафедри ', NULL, NULL, 1429623994, 1429623994),
('main-admin', 2, 'Доступ до основного меню адміністратора', NULL, NULL, 1429622919, 1429626412),
('manager', 1, 'Організатор практики на кафедрі', NULL, NULL, 1429623945, 1429623945),
('student', 1, 'Студент, що направляється на практику', NULL, NULL, 1429624040, 1429624040),
('user-admin', 2, 'GRUD до БД користувачів', NULL, NULL, 1429622863, 1429622863);

-- --------------------------------------------------------

--
-- Структура таблиці `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'main-admin'),
('admin', 'user-admin');

-- --------------------------------------------------------

--
-- Структура таблиці `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(128) NOT NULL,
  `tel` varchar(128) NOT NULL,
  `address` varchar(256) NOT NULL,
  `full_director` varchar(200) NOT NULL,
  `director` varchar(128) NOT NULL,
  `site` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `description_preview` varchar(250) NOT NULL,
  `image` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Компанії - бази практики ' AUTO_INCREMENT=9 ;

--
-- Дамп даних таблиці `company`
--

INSERT INTO `company` (`id`, `fullname`, `tel`, `address`, `full_director`, `director`, `site`, `description`, `description_preview`, `image`) VALUES
(1, 'НДІ "Квант"', '+38044-287-40-56', '03150, м. Київ, вул. Димитрова, 5', 'директора Положенцева В.В.', 'В.В. Положенцев', 'http://www.kmar.kiev.ua/members/dp-nd-kvant.html', 'ДП «НДІ «Квант» - це підприємство , колектив якого вніс значний внесок в оснащення радіоелектронними системами Військово-Морського Флоту СРСР: підводних човнів , бойових надводних кораблів , морської авіації.\r\n\r\nСьогодні ДП « НДІ« Квант »- це одне з провідних підприємств Державного концерну« Укроборонпром ». Крім військового морського приладобудування, за останні роки наше підприємство досягло значних успіхів також в області розробки і виготовлення радіоелектронних систем для бронетехніки і мобільних зенітно -ракетних комплексів.\r\n\r\nЯкщо аналізувати носії , на яких розміщені вироби ДП « НДІ« Квант » , то можна зробити висновок , що наші фахівці підпорядкували собі всі три стихії. Крім значного внеску в розвиток Збройних сил України , наш колектив може пишатися також своїм внеском у міжнародне військово -технічне співробітництво . ДП « НДІ« Квант »успішно виконав і виконує контракти з країнами Європи , Азії , Америки та Африки.\r\n\r\nСьогодні підприємство володіє необхідним кадровим , інтелектуальним і виробничим потенціалом , що сприяє підвищенню конкурентоспроможності нашої продукції і створення науково - технічного доробку на перспективу.', 'Підприємство військового морського приладобудування, за останні роки наше підприємство досягло значних успіхів також в області розробки і виготовлення радіоелектронних систем для бронетехніки і мобільних зенітно -ракетних комплексів.', '/static/images/img5537f4c45.png'),
(2, 'ТОВ «Лінк Експрес»', '+380674616690   ', 'м. Київ, вул. Польова, 21', 'директора Петрушевського Ю.В.', 'Ю.В. Петрушевський ', 'http://www.le.net.ua/', 'ТОВ "ЛiнкЕкспрес" створено в 1999 р. спецiалiстами в галузi Супутникових Телекомунiкацiйних систем та Комп''ютерних мереж.\r\n\r\nКомпанiя ставить перед собою задачi експрес-проектування та будiвництва ефективних систем супутникового зв''язку, а також глобальних комп''ютерних мереж, якi дозволяють вирiшувати проблеми передачi i накопичення iнформацiї в умовах вiдсутностi або незадовiльної якостi наземних каналiв.\r\n\r\nЗ 2005 року ТОВ "ЛінкЕкспрес" має статус першого Національного виробника сертифікованої Земної супутникової станції LE VSAT.\r\n\r\nЗ 2009 року ТОВ "ЛінкЕкспрес" виконує розробки та впровадження Спеціалізованих станцій технічного контролю ССТК для ДП УДЦР.', 'Ми пропонуємо оригiнальнi економiчнi рiшення для систем Корпоративного зв''язку, Супутникового Iнтернета, цифрових лiнiй зв''язку Точка з Точкою, Супутникових мереж Теле- та Радiо- мовлення, мобільних та переносних систем технічного контролю типу ССТК', '/static/images/img553712345.png'),
(3, 'Київська державна телерадіокомпанія', '050 45 18 778 - Кубюк Юрій Володимирович', 'м. Київ, вул. Хрещатик, 26', 'директора Савенко О.М.', 'О.М. Савенко  ', 'http://www.kdrtrk.inet.ua/', 'Київська державна розпочала своє мовлення 12 грудня 1995 року. Ця дата і є нашим Днем народження. Сьогодні нас транслює супутник KA AzerSpace-1. Всі кабельні оператори столичного регіону та мережа наземних станцій.\r\n\r\nНаша аудиторія – це Україна, Східна Європа та Близький Схід. Сьогодні регіональне  телебачення  та радіо по популярності на четвертому місці у населення після так званої великої трійки центральних каналів.', 'КТРК - регіональне  телебачення та радіо м. Києва. За популярністю на четвертому місці у населення після так званої великої трійки центральних каналів.', '/static/images/img5537ef34d.jpg'),
(4, 'ПАТ "Київський завод "РАДАР"', '044 528-13-47', 'Киев, вул.Предславинская, 35', 'заст. директора  Павлюка Юрія Федоровича', 'Ю.Ф. Павлюк', 'http://radar.net.ua', 'ПАО “Киевский завод “Радар” - одно из передовых предприятий Украины, специализирующееся на производстве современного радиоэлектронного и радиолокационного оборудования для самолетов и вертолетов. Высокая репутация «Радара» - это результат многолетней успешной работы коллектива и надежность выпускаемых изделий.\r\n\r\n Завод был создан в 1930 году и стал одним из первых заводов авиационного приборостроения в Украине. Завод известен, как производитель первых в СССР самолетных радиолокаторов ПСБН, радиолокационных головок самонаведения для авиационных ракет класса «воздух - воздух», а также сложных и особо сложных радиолокационных комплексов для самолетов и вертолетов, выпускаемых авиационными предприятиями Харькова, Киева, Казани, Ульяновска, Новосибирска, Ташкента, Кумертау и других городов.\r\n\r\n Завод приглашает к сотрудничеству разработчиков, потенциальных инвесторов и другие организации в создании совместных предприятий по внедрению в производство и серийному изготовлению сложной наукоемкой продукции приборостроения для авиации и других отраслей промышленности, товаров промышленного и бытового назначения. Завод располагает производственными мощностями, позволяющими выполнять заказы сторонних организаций (механическое, инструментальное, монтажно-сборочное производство, изготовление печатных плат). ', 'Специализируется на производстве современного радиоэлектронного и радиолокационного оборудования для самолетов и вертолетов. Производитель самолетных радиолокаторов ПСБН, радиолокационных головок самонаведения для авиационных ракет класса «воздух — в', '/static/images/img5537ef34e.jpg'),
(5, 'ПАТ "Квазар"', '044 200-93-31 - Ірина Михайлівна - відділ кадрів', 'м.Київ, вул. Північно-Сирецька 3', 'Алла Миколаївна', 'Алла Миколаївна', 'http://www.kvazar.com', 'Компания Квазар - ведущий производитель солнечных модулей на Украине. Активно наращивает своё участие в реализации проектов строительства солнечных станций на Украине по новым требованиям.', 'Компания Квазар - ведущий производитель солнечных модулей на Украине. Активно наращивает своё участие в реализации проектов строительства солнечных станций на Украине по новым требованиям. ', '/static/images/img553712346.png'),
(6, 'ПрАТ "Холдингова компанія "Укрспецтехніка"', '044 257-99-24 ', '03680, м. Київ, вул. Трутенко, 2', 'виконавчий директор Ляшенко Іван Сергійович', 'І. С. Ляшенко', 'http://www.ust.com.ua/', 'Открытое акционерное общество "Холдинговая компания "Укрспецтехника" действует на рынке телекоммуникаций и электронных технологий с 1989 года. Опыт специалистов, творческая удача и талант позволили завоевать одну из самых ведущих позиций в Украине в области разработки, создания и поставки широкого спектра сложной радиоэлектронной и другой техники военного и специального назначения.\r\n\r\nХолдинговая компания объединяет ряд предприятий, среди которых:\r\n\r\n    "Укрспецтехника"\r\n    "Укрспецтехника - система"\r\n    "Укрспецтехника - комплекс"\r\n    "Информцентр"\r\n    "Спецмеханика"\r\n    "МТ-Альфа". \r\n\r\nОсновными направлениями деятельности холдинга и его предприятий является разработка, проектирование, изготовление, поставка, монтаж и обслуживание специальной электроники, высокотехнологичного и наукоемкого вооружения, средств телекоммуникаций.', 'Основными направлениями деятельности холдинга и его предприятий является разработка, проектирование, изготовление, поставка, монтаж и обслуживание специальной электроники, высокотехнологичного и наукоемкого вооружения, средств телекоммуникаций.', '/static/images/img5537ef34c.jpg'),
(7, 'ТОВ "НВП "Квант-Ефір" ', '044 531-42-20  Миронова Тетяна Вікторовна  - відділ кадрів', 'м. Київ, вул. Деревообробна 5', 'директора Омелянюка Х.Х.', 'Х.Х. Омелянюк', 'http://www.kvantefir.com', '<p>Компанія &laquo;<strong>Квант-Ефір</strong>&raquo; є одним із лідерів серед виробників передавального аналогового обладнання та цифрового обладнання стандартів <strong>DVB-T/T2</strong> на ринку країн центральної і східної Європи. <em>За 20 років</em> діяльності замовниками &laquo;Квант-Ефіру&raquo; стали найбільші загальнонаціональні телерадіокомпанії, оператори супутникового зв&rsquo;язку та телекомунікаційних наземних телемереж України, Білорусії, Молдови, Грузії, Таджикистану, Киргизстану, Азербайджану та інших країн &quot;</p>\r\n\r\n<p>&laquo;Квант-Ефір&raquo; гарантує високу якість та надійність виробів, а спеціалізовані в кількох технічних напрямках власні підрозділи сервісного центру забезпечують 24-х годинну підтримку замовників. &laquo;Квант-Ефір&raquo; забезпечує як поставку окремих зразків техніки, так і комплексну розробку реалізації проектів багатоканальних цифрових ефірних телемереж стандартів <strong>DVB-T/T2</strong> з поставкою &laquo;під ключ&raquo;.</p>\r\n\r\n<p>Девіз компанії &ndash; &laquo;Якість передусім &ndash; жодних компромісів за рахунок якості!&raquo; &ndash; був введений ще 20 років тому, і з того часу компанія жорстко дотримується його, не беручи до уваги витрати часу і коштів.</p>\r\n\r\n<p>Для &laquo;Квант-Ефіра&raquo; якісним є те, що сьогодні &ndash; найкраще!</p>\r\n\r\n<p><a href="http://kvantefir.com/assets/files/pdfdownloads/Presentation_2014-ukr.pdf">Про компанію Квант-Ефір та її розробки.</a></p>\r\n', 'Компанія &laquo;<strong>Квант-Ефір</strong>&raquo; є одним із лідерів серед виробників передавального аналогового обладнання та цифрового обладнання стандартів <strong>DVB-T/T2</strong> на ринку країн центральної і східної Європи.', '/static/images/img5537f4c31.png'),
(8, 'Казенне підприємство спеціального приладобудування "АРСЕНАЛ"', '044 281 38 83 - Сербін Руслан Володимирович – нач. отдела труда', 'м. Київ, вул. Московська 8', 'Директор – головний конструктор Лихоліт Микола Іванович', 'М. І. Лихоліт ', 'http://arsenalcdb.com.ua/', '<p><br />\r\nКП СПБ &quot;Арсенал&quot; розробляє оптичні й оптико-електронні прилади і системи для аерокосмічних комплексів, різних систем озброєння, для вимірювальних і аналітичних цілей у промисловості, в сільському господарстві, медицині, фототехніці.</p>\r\n\r\n<p>КП СПБ &quot;Арсенал&quot; розробляє оптичні й оптико-електронні прилади і системи для аерокосмічних комплексів, різних систем озброєння, для вимірювальних і аналітичних цілей у промисловості, в сільському господарстві, медицині, фототехніці.</p>\r\n\r\n<p><em><strong>Телефон:</strong>+38(044) 253-00-62, +38(044) 254-53-39</em></p>\r\n\r\n<p><em><strong>Факс:</strong>+38(044) 253-00-62</em></p>\r\n\r\n<p><em><strong>E-mail:</strong><a href="mailto:">info@arsenalcdb.com.ua </a></em></p>\r\n', 'КП СПБ &quot;Арсенал&quot; розробляє оптичні й оптико-електронні прилади і системи для аерокосмічних комплексів, різних систем озброєння, для вимірювальних і аналітичних цілей у промисловості, в сільському господарстві, медицині, фототехніці', '/static/images/img553809930.jpg');

-- --------------------------------------------------------

--
-- Структура таблиці `company_keywords`
--

CREATE TABLE IF NOT EXISTS `company_keywords` (
  `id_company` int(10) unsigned NOT NULL,
  `id_keywords` int(10) unsigned NOT NULL,
  UNIQUE KEY `id_company` (`id_company`,`id_keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Привязка ключових слів до компаній';

--
-- Дамп даних таблиці `company_keywords`
--

INSERT INTO `company_keywords` (`id_company`, `id_keywords`) VALUES
(1, 1),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6);

-- --------------------------------------------------------

--
-- Структура таблиці `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL,
  `reg_num` varchar(32) NOT NULL,
  `reg_date` date NOT NULL,
  `file` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `documents`
--

INSERT INTO `documents` (`id`, `type`, `reg_num`, `reg_date`, `file`, `status`) VALUES
(1, 1, '38/2100', '2015-04-06', '', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `documents_type`
--

CREATE TABLE IF NOT EXISTS `documents_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп даних таблиці `documents_type`
--

INSERT INTO `documents_type` (`id`, `type`) VALUES
(6, 'Гарантійний лист'),
(7, 'Договір про співпрацю'),
(3, 'Звіт керівників проходження практики'),
(2, 'Звіт про проходження практики студента'),
(5, 'Наказ по університету'),
(4, 'Програма практики'),
(1, 'Угода на проведення практики студентів ');

-- --------------------------------------------------------

--
-- Структура таблиці `keywords`
--

CREATE TABLE IF NOT EXISTS `keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Ключові слова' AUTO_INCREMENT=7 ;

--
-- Дамп даних таблиці `keywords`
--

INSERT INTO `keywords` (`id`, `keyword`) VALUES
(1, 'НВЧ пристрої'),
(2, 'Передавачі'),
(3, 'монтажна робота '),
(4, 'автомобільна бортова мережа'),
(5, 'силові пристрої '),
(6, 'супутниковий зв''язок');

-- --------------------------------------------------------

--
-- Структура таблиці `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп даних таблиці `menu`
--

INSERT INTO `menu` (`id`, `name`, `parent`, `route`, `order`, `data`) VALUES
(1, 'main', NULL, '/site/index', 2, NULL),
(2, 'admin', 1, '/user/admin/index', 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
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
('m140602_111327_create_menu_table', 1429622571),
('m140830_171933_fix_ip_field', 1429203126),
('m140830_172703_change_account_table_name', 1429203126),
('m141222_110026_update_ip_field', 1429203127);

-- --------------------------------------------------------

--
-- Структура таблиці `praxis_doc`
--

CREATE TABLE IF NOT EXISTS `praxis_doc` (
  `praxis_id` int(10) unsigned NOT NULL,
  `document_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `praxis_id` (`praxis_id`,`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `praxis_event`
--

CREATE TABLE IF NOT EXISTS `praxis_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `guide_id` int(11) DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `praxis_type` int(10) unsigned DEFAULT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`,`praxis_type`,`year`),
  KEY `company_id` (`company_id`),
  KEY `praxis_type` (`praxis_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп даних таблиці `praxis_event`
--

INSERT INTO `praxis_event` (`id`, `student_id`, `guide_id`, `company_id`, `praxis_type`, `year`) VALUES
(1, 1, 4, 1, 1, 2015),
(3, 3, 4, 2, 4, 2016),
(5, 3, 0, 1, 1, 2015),
(6, 3, NULL, 1, 2, 2014);

-- --------------------------------------------------------

--
-- Структура таблиці `praxis_type`
--

CREATE TABLE IF NOT EXISTS `praxis_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп даних таблиці `praxis_type`
--

INSERT INTO `praxis_type` (`id`, `name`) VALUES
(1, 'Виробнича практика 3 курс'),
(2, 'Переддипломна практика 4 курс'),
(3, 'Переддипломна практика 6 курс'),
(4, 'Науково-дослідницька практика 6 курс');

-- --------------------------------------------------------

--
-- Структура таблиці `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mob` varchar(100) NOT NULL,
  `public_email` varchar(255) DEFAULT NULL,
  `gravatar_email` varchar(255) DEFAULT NULL,
  `gravatar_id` varchar(32) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bio` text,
  PRIMARY KEY (`user_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `mob`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`) VALUES
(1, 'Мосійчук Віталій Сергійович', '+380677647875', 'mosvits@gmail.com', 'mosvits@gmail.com', 'd88a17728d707c5da24646af93ff9bfc', 'Kiev, Ukraine', 'http://radap.kpi.ua', 'к.т.н., доцент;  Працює в КПІ з 2007 року.\r\nВеде лекційні курси «Цифрові пристрої», «Мікроконтролерне  керування електронної апаратури», «WEB-дизайн», «Схемотехніка  електронних апаратів».\r\nГалузь наукових інтересів: біомедичні пристрої та системи,  завадостійкість сенсорів медичного призначення.'),
(2, 'Гусєва Олена Володимирівна', '+380667039731', 'guseva@tor.kpi.ua', 'guseva@tor.kpi.ua', 'b79bf982c343a6d96042671e58a6d162', 'Kiev, Ukraine', 'http://tor.kpi.ua', 'День народження 14 квітня'),
(3, 'Пастухова Вікторія Володимирівна', '', '', 'pastuhova@ukr.net', '9d70e3826bb92d1a03b715089fe32799', '', '', ''),
(4, 'Гайдаєнко Євген Віталійович', '+380663802895', '', 'gaydaenko@ros.kpi.ua', '716739d85490b858af16ad6711fec236', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблиці `request`
--

CREATE TABLE IF NOT EXISTS `request` (
  `company_id` int(10) unsigned NOT NULL,
  `speciality_id` int(10) unsigned NOT NULL,
  `count` tinyint(3) unsigned NOT NULL,
  `document_id` int(10) unsigned NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`company_id`,`speciality_id`,`year`),
  KEY `speciality_id` (`speciality_id`),
  KEY `document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `request`
--

INSERT INTO `request` (`company_id`, `speciality_id`, `count`, `document_id`, `year`) VALUES
(1, 1, 4, 1, 2015),
(1, 21, 4, 1, 2015);

-- --------------------------------------------------------

--
-- Структура таблиці `social_account`
--

CREATE TABLE IF NOT EXISTS `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  KEY `fk_user_account` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `speciality`
--

CREATE TABLE IF NOT EXISTS `speciality` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Дамп даних таблиці `speciality`
--

INSERT INTO `speciality` (`id`, `code`, `name`) VALUES
(1, '6.050901', 'Радіотехніка'),
(2, '6.050902', 'Радіоелектронні апарати'),
(5, '7.050901', 'Радіотехніка'),
(6, '7.050902', 'Радіоелектронні апарати'),
(7, '8.050901', 'Радіотехіка'),
(8, '8.050902', 'Радіоелектронні апарати'),
(9, '7.05090102', 'Апаратура радіозв’язку, радіомовлення і телебачення'),
(10, '8.05090102', 'Апаратура радіозв’язку, радіомовлення і телебачення'),
(11, '7.05090101', 'Радіотехніка'),
(12, '8.05090101', 'Радіотехніка'),
(13, '7.05090103', 'Радіоелектронні пристрої, системи та комплекси'),
(14, '8.05090103', 'Радіоелектронні пристрої, системи та комплекси'),
(15, '7.05090201', 'Радіоелектронні апарати та засоби'),
(16, '8.05090201', 'Радіоелектронні апарати та засоби'),
(17, '7.05090203', 'Інтелектуальні технології мікросистемної радіоелектронної техніки'),
(18, '8.05090203', 'Інтелектуальні технології мікросистемної радіоелектронної техніки'),
(19, '7.05090204', 'Біотехнічні та медичні апарати і системи'),
(20, '8.05090204', 'Біотехнічні та медичні апарати і системи'),
(21, '4.050901', 'Радіотехніка'),
(22, '4.050902', 'Радіоелектронні апарати');

-- --------------------------------------------------------

--
-- Структура таблиці `speciality_child`
--

CREATE TABLE IF NOT EXISTS `speciality_child` (
  `parent` int(10) unsigned NOT NULL,
  `child` int(10) unsigned NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `speciality_child`
--

INSERT INTO `speciality_child` (`parent`, `child`) VALUES
(5, 9),
(7, 10),
(5, 11),
(7, 12),
(5, 13),
(7, 14),
(6, 15),
(8, 16),
(6, 17),
(8, 18),
(6, 19),
(8, 20);

-- --------------------------------------------------------

--
-- Структура таблиці `token`
--

CREATE TABLE IF NOT EXISTS `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`),
  UNIQUE KEY `user_unique_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп даних таблиці `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`) VALUES
(1, 'mosvits', 'mosvits@gmail.com', '$2y$10$XiGSD9rQ040e3/T5CFhP5O67vDmJu72nXdnb8O/yrYV2fncyLNtX6', '8VmfqIg7Xm-G3TRyUylC3ENxGLUQAuN4', 1429203932, NULL, NULL, '::1', 1429203312, 1429203932, 0),
(2, 'guseva', 'guseva@tor.kpi.ua', '$2y$10$Z/iyF14/FxHNmxD.H6rId.VVLdLe7GtI6inu/eMVmZMwnhRr9UKu.', 'arGfzvIOYO6k54tCRCN3z8S3C85x6lAH', 1429206250, NULL, NULL, '::1', 1429206250, 1429206250, 0),
(3, 'pastuhova', 'pastuhova@ukr.net', '$2y$10$4FxAF4D3tx1BywAXMwDVveSWOTkyPhcr79PNK1m.yzPDC8kmZuZgO', 'SC9i3khXAleq0GlDr1BG4Nk32otPwE3y', 1429624497, NULL, NULL, '::1', 1429624497, 1429624497, 0),
(4, 'gaydaenko', 'gaydaenko@ros.kpi.ua', '$2y$10$pP4nRi4mltBT9moNBvmB9uAUslck5yMREfJQptBCyOCJb3Yqd76pu', 'woeiNRJMb3PTSnsIZ7e1G9jDlNvOJiQi', 1429624595, NULL, NULL, '::1', 1429624595, 1429624595, 0);

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `praxis_event`
--
ALTER TABLE `praxis_event`
  ADD CONSTRAINT `praxis_event_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `praxis_event_ibfk_2` FOREIGN KEY (`praxis_type`) REFERENCES `praxis_type` (`id`),
  ADD CONSTRAINT `praxis_event_ibfk_4` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`id`),
  ADD CONSTRAINT `request_ibfk_3` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `social_account`
--
ALTER TABLE `social_account`
  ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `speciality_child`
--
ALTER TABLE `speciality_child`
  ADD CONSTRAINT `speciality_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `speciality` (`id`),
  ADD CONSTRAINT `speciality_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `speciality` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
