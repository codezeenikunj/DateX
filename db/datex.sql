-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 12, 2024 at 06:05 AM
-- Server version: 10.6.12-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reva_datex`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_notification`
--

CREATE TABLE `admin_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_notification`
--

INSERT INTO `admin_notification` (`id`, `title`, `message`, `created_at`, `updated_at`) VALUES
(2, 'title2', 'Subscribe to the Premium plan and enjoy\r\nunlimited features and have more fun.222', '2021-12-02 06:50:39', '2023-08-07 06:45:52'),
(3, 'title3', 'Subscribe to the Premium plan and enjoy\r\nunlimited features and have more fun.333', '2021-12-02 06:50:39', '2021-12-02 06:50:39'),
(11, 'Limited Offer !!! Hurry Upp', 'Subscribe to the Premium plan and enjoy unlimited features and have more with only $ 10', '2023-06-15 09:47:56', '2023-07-07 08:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`user_id`, `user_name`, `user_password`, `user_type`) VALUES
(1, 'admin', 'admin123', 1),
(3, 'tester', 'tester@123', 0);

-- --------------------------------------------------------

--
-- Table structure for table `admob`
--

CREATE TABLE `admob` (
  `id` int(11) NOT NULL,
  `banner_id` varchar(255) NOT NULL,
  `interstitial_id` varchar(255) NOT NULL,
  `native_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admob`
--

INSERT INTO `admob` (`id`, `banner_id`, `interstitial_id`, `native_id`) VALUES
(1, 'Andro', 'Andro', 'Andro'),
(2, 'ios', 'ios', 'ios');

-- --------------------------------------------------------

--
-- Table structure for table `appdata`
--

CREATE TABLE `appdata` (
  `id` int(11) NOT NULL,
  `currency` varchar(11) DEFAULT NULL,
  `min_threshold` int(55) DEFAULT NULL,
  `coin_rate` varchar(55) NOT NULL DEFAULT '0',
  `min_user_live` int(55) DEFAULT NULL,
  `max_minute_live` int(10) DEFAULT NULL,
  `message_price` int(11) NOT NULL DEFAULT 3,
  `reverse_swipe_price` int(11) NOT NULL DEFAULT 3,
  `live_watching_price` int(11) NOT NULL DEFAULT 10,
  `admob_int_ios` varchar(255) DEFAULT NULL,
  `admob_banner_ios` varchar(255) DEFAULT NULL,
  `admob_int` varchar(255) DEFAULT NULL,
  `admob_banner` varchar(255) DEFAULT NULL,
  `per_day_swipe_limit` int(11) DEFAULT NULL,
  `referral_diamond` int(11) NOT NULL DEFAULT 0,
  `first_friend` int(11) NOT NULL,
  `previus_swipe_diamond` int(11) DEFAULT NULL,
  `super_like_diamond` int(11) DEFAULT NULL,
  `per_like_diamond` double(11,2) NOT NULL,
  `purchase_like_diamond` int(11) NOT NULL,
  `first_message_diamond` int(11) DEFAULT NULL,
  `video_call_diamond` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appdata`
--

INSERT INTO `appdata` (`id`, `currency`, `min_threshold`, `coin_rate`, `min_user_live`, `max_minute_live`, `message_price`, `reverse_swipe_price`, `live_watching_price`, `admob_int_ios`, `admob_banner_ios`, `admob_int`, `admob_banner`, `per_day_swipe_limit`, `referral_diamond`, `first_friend`, `previus_swipe_diamond`, `super_like_diamond`, `per_like_diamond`, `purchase_like_diamond`, `first_message_diamond`, `video_call_diamond`) VALUES
(1, '$', 5000, '0.006', 55, 50, 5, 6, 10, NULL, NULL, NULL, NULL, 15, 300, 3, 25, 20, 2.00, 100, 25, 50);

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `question_id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 1, 'Capricorn', NULL, NULL, NULL),
(4, 1, 'Aquarius', NULL, NULL, NULL),
(5, 1, 'Pisces', NULL, NULL, NULL),
(6, 1, 'Aries', NULL, NULL, NULL),
(7, 1, 'Taurus', NULL, NULL, NULL),
(8, 1, 'Gemini', NULL, NULL, NULL),
(9, 1, 'Cancer', NULL, NULL, NULL),
(10, 1, 'Leo', NULL, NULL, NULL),
(11, 1, 'Virgo', NULL, NULL, NULL),
(12, 1, 'Libra', NULL, NULL, NULL),
(13, 1, 'Scorpio', NULL, NULL, NULL),
(14, 1, 'Sagittarius', NULL, NULL, NULL),
(15, 2, 'Bachelors', NULL, NULL, NULL),
(16, 2, 'In College', NULL, NULL, NULL),
(17, 2, 'PhD', NULL, NULL, NULL),
(18, 2, 'High school', NULL, NULL, NULL),
(19, 2, 'Masters', NULL, NULL, NULL),
(20, 2, 'Trade school', NULL, NULL, NULL),
(21, 2, 'In grad school', NULL, NULL, NULL),
(22, 3, 'I already have children', NULL, NULL, '2023-11-23 11:43:47'),
(23, 3, 'Not sure yet', NULL, NULL, NULL),
(24, 3, 'I don’t want children', NULL, NULL, NULL),
(25, 3, 'I have children and want more', NULL, NULL, NULL),
(26, 3, 'I have children and don’t want more', NULL, NULL, NULL),
(27, 13, 'Classic - Bon ton', NULL, NULL, NULL),
(28, 13, 'Casual', NULL, NULL, NULL),
(29, 13, 'Sporty', NULL, NULL, NULL),
(30, 13, 'Trendy', NULL, NULL, NULL),
(31, 13, 'Street Style', NULL, NULL, NULL),
(32, 13, 'Punk Rock', NULL, NULL, NULL),
(33, 13, 'Androgynous', NULL, NULL, NULL),
(34, 13, 'Vintage', NULL, NULL, NULL),
(43, 14, 'I stay whatsApp all day', NULL, NULL, NULL),
(44, 14, 'Phone', NULL, NULL, NULL),
(45, 14, 'SMS', NULL, NULL, '2023-11-23 11:59:45'),
(46, 14, 'Video call', NULL, NULL, '2023-11-23 12:02:33'),
(47, 14, 'I’m slow to answer', NULL, NULL, '2023-11-23 12:02:49'),
(48, 14, 'Voice message', NULL, NULL, '2023-11-23 12:04:10'),
(49, 14, 'Better in person', NULL, NULL, NULL),
(50, 15, 'Thoughtful gestures', NULL, NULL, NULL),
(51, 15, 'Body contact', NULL, NULL, '2023-11-23 12:12:03'),
(52, 15, 'Compliments', NULL, NULL, '2023-11-23 12:12:11'),
(53, 15, 'Time together', NULL, NULL, '2023-11-23 12:12:19'),
(54, 15, 'Presents', NULL, NULL, '2023-11-23 12:12:29'),
(55, 4, 'Dog', NULL, NULL, NULL),
(56, 4, 'Cat', NULL, NULL, NULL),
(57, 4, 'Reptile', NULL, NULL, NULL),
(58, 4, 'Bird', NULL, NULL, NULL),
(59, 4, 'Don’t have but love', NULL, NULL, NULL),
(60, 4, 'Allergic to pets', NULL, NULL, NULL),
(61, 4, 'Rabbit', NULL, NULL, NULL),
(62, 4, 'Amphibian', NULL, NULL, NULL),
(63, 4, 'I love puppies', NULL, NULL, '2023-12-14 04:33:01'),
(64, 4, 'I love all animals', NULL, NULL, '2023-12-14 04:31:26'),
(65, 4, 'I would like to have one', NULL, NULL, '2023-12-14 04:32:46'),
(66, 4, 'Turtle', NULL, NULL, NULL),
(67, 6, 'Not for me', NULL, NULL, NULL),
(68, 6, 'With meals', NULL, NULL, '2023-11-23 12:25:24'),
(69, 6, 'On special occasions', NULL, NULL, NULL),
(70, 6, 'Sober', NULL, NULL, NULL),
(71, 6, 'Sociality on weekends', NULL, NULL, NULL),
(72, 6, 'Most nights', NULL, NULL, NULL),
(75, 5, 'Social smoker', NULL, NULL, NULL),
(76, 5, 'Non-smoker', NULL, NULL, NULL),
(77, 5, 'Trying to quit', NULL, NULL, NULL),
(78, 5, 'Smoker', NULL, NULL, '2023-11-23 12:34:30'),
(79, 5, 'Smoker when drinking', NULL, NULL, NULL),
(80, 16, 'Everyday', NULL, NULL, NULL),
(81, 16, 'Often', NULL, NULL, NULL),
(82, 16, 'Never', NULL, NULL, NULL),
(83, 16, 'Sometimes', NULL, NULL, NULL),
(84, 17, 'Vegan', NULL, NULL, NULL),
(85, 17, 'Vegetarian', NULL, NULL, NULL),
(86, 17, 'Kosher', NULL, NULL, NULL),
(87, 17, 'Pescatarian', NULL, NULL, NULL),
(88, 17, 'Halal', NULL, NULL, NULL),
(89, 17, 'Other', NULL, NULL, NULL),
(90, 17, 'Omnivore', NULL, NULL, NULL),
(91, 17, 'Carnivore', NULL, NULL, NULL),
(92, 18, 'Influencer status', NULL, NULL, NULL),
(93, 18, 'Off the grid', NULL, NULL, NULL),
(94, 18, 'Socially active', NULL, NULL, NULL),
(95, 18, 'Passive scroller', NULL, NULL, NULL),
(96, 19, 'Yes, I like it', NULL, NULL, NULL),
(97, 19, 'I don\'t like it, but I have to do it', NULL, NULL, NULL),
(98, 19, 'I always eat out', NULL, NULL, NULL),
(99, 19, 'Take away', NULL, NULL, NULL),
(102, 3, 'I want children', NULL, '2023-11-23 11:29:27', '2023-11-23 11:29:27'),
(104, 5, 'Electronic cigarette', NULL, '2023-11-23 12:34:43', '2023-11-23 12:34:43'),
(105, 19, 'I don\'t know how to cook', NULL, '2023-11-24 04:12:40', '2023-11-24 04:12:40'),
(106, 19, 'Masterchef', NULL, '2023-11-24 04:12:49', '2023-11-24 04:12:49');

-- --------------------------------------------------------

--
-- Table structure for table `attributes_translations`
--

CREATE TABLE `attributes_translations` (
  `lang_code` varchar(191) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes_translations`
--

INSERT INTO `attributes_translations` (`lang_code`, `attribute_id`, `name`) VALUES
('it', 3, 'Capricorno'),
('it', 4, 'Acquario'),
('it', 5, 'Pesci'),
('it', 6, 'Ariete'),
('it', 7, 'Toro'),
('it', 8, 'Gemelli'),
('it', 9, 'Cancro'),
('it', 10, 'Leone'),
('it', 11, 'Vergine'),
('it', 12, 'Bilancia'),
('it', 13, 'Scorpione'),
('it', 14, 'Sagittario'),
('it', 15, 'Laurea'),
('it', 16, 'Collegio'),
('it', 17, 'Dottorato'),
('it', 18, 'Diploma'),
('it', 19, 'Master'),
('it', 20, 'Specializzazione'),
('it', 21, 'Scuola dell’obbligo'),
('it', 22, 'Ho gia\' dei figli'),
('it', 23, 'Non ho ancora deciso'),
('it', 24, 'Non voglio figli'),
('it', 25, 'Ho gia’ figli e ne vorrei altri'),
('it', 26, 'Ho figli e non ne voglio altri'),
('it', 27, 'Classico - Bon ton'),
('it', 28, 'Casual'),
('it', 29, 'Sporty'),
('it', 30, 'Trendy'),
('it', 31, 'Street Style'),
('it', 32, 'Punk Rock'),
('it', 33, 'Androgino'),
('it', 34, 'Vintage'),
('it', 43, 'WhatsApp tutto il giorno'),
('it', 44, 'Telefono'),
('it', 45, 'SMS'),
('it', 46, 'Videochiamate'),
('it', 47, 'Sono lento a rispondere'),
('it', 48, 'Messaggi vocali'),
('it', 49, 'Meglio di persona'),
('it', 50, 'Gesti premurosi'),
('it', 51, 'Contatto fisico'),
('it', 52, 'Complimenti'),
('it', 53, 'Tempo insieme'),
('it', 54, 'Regali'),
('it', 55, 'Cane'),
('it', 56, 'Gatto'),
('it', 57, 'Rettile'),
('it', 58, 'Uccelli'),
('it', 59, 'Amo tutti gli animali'),
('it', 60, 'Allergico agli animali'),
('it', 61, 'Coniglio'),
('it', 62, 'Anfibio'),
('it', 63, 'Adoro i cuccioli'),
('it', 64, 'Vorrei averne uno'),
('it', 65, 'Non ho animali, ma li adoro'),
('it', 66, 'Tartaruga'),
('it', 67, 'Durante i pasti'),
('it', 68, 'Spesso'),
('it', 69, 'In occasioni speciali'),
('it', 70, 'In compagnia'),
('it', 71, 'Sono Astemio'),
('it', 72, 'Quasi tutte le sere'),
('it', 75, 'Fumo in compagnia'),
('it', 76, 'Non fumatore'),
('it', 77, 'Sto cercando di smettere'),
('it', 78, 'Fumo'),
('it', 79, 'Fumo quando bevo'),
('it', 80, 'Ogni giorno'),
('it', 81, 'Spesso'),
('it', 82, 'Mai'),
('it', 83, 'Qualche volta'),
('it', 84, 'Vegana'),
('it', 85, 'Vegetariana'),
('it', 86, 'Kosher'),
('it', 87, 'Pescetariana'),
('it', 88, 'Halal'),
('it', 89, 'Altro'),
('it', 90, 'Onnivora'),
('it', 91, 'Carnivora'),
('it', 92, 'Da influencer'),
('it', 93, 'Fuori dai social'),
('it', 94, 'Abbastanza  attivo'),
('it', 95, 'Guardo senza interagire'),
('it', 96, 'Si, mi piace'),
('it', 97, 'Non mi piace, ma devo farlo'),
('it', 98, 'Mangio sempre fuori'),
('it', 99, 'Take away'),
('fr', 3, 'Capricorne'),
('fr', 4, 'Verseau'),
('fr', 5, 'Poissons'),
('fr', 6, 'Bélier'),
('fr', 7, 'Taureau'),
('fr', 8, 'Gémeaux'),
('fr', 9, 'Cancer'),
('fr', 10, 'Leo'),
('fr', 11, 'Vierge'),
('fr', 12, 'Balance'),
('fr', 13, 'Scorpion'),
('fr', 14, 'Sagittaire'),
('fr', 15, 'Les bacheliers'),
('fr', 16, 'Au collège'),
('fr', 17, 'Doctorat'),
('fr', 18, 'Lycée'),
('fr', 19, 'Maîtrise'),
('fr', 20, 'Une école de commerce'),
('fr', 21, 'À l\'école supérieure'),
('fr', 22, 'je veux des enfants\r\nPas encore sûr'),
('fr', 23, 'Pas encore sûr'),
('fr', 24, 'je ne veux pas d\'enfants'),
('fr', 25, 'J\'ai des enfants et j\'en veux plus'),
('fr', 26, 'J\'ai des enfants et je n\'en veux pas plus'),
('fr', 27, 'Classique - Bon ton'),
('fr', 28, 'Occasionnel'),
('fr', 29, 'Sportif'),
('fr', 30, 'Branché'),
('fr', 31, 'Style de rue'),
('fr', 32, 'Punk rock'),
('fr', 33, 'Androgyne'),
('fr', 34, 'Ancien'),
('fr', 43, 'Je reste sur WhatsApp toute la journée'),
('fr', 44, 'Téléphone'),
('fr', 45, 'Rédacteur de grande envergure'),
('fr', 46, 'Chat vidéo'),
('fr', 47, 'Je mets du temps à répondre sur WhatsApp'),
('fr', 48, 'Mauvais rédacteur'),
('fr', 49, 'Mieux en personne'),
('fr', 50, 'Des gestes réfléchis'),
('fr', 51, 'Touche'),
('fr', 52, 'Compliments'),
('fr', 53, 'Du temps ensemble'),
('fr', 54, 'Cadeaux'),
('fr', 55, 'Chien'),
('fr', 56, 'Chat'),
('fr', 57, 'Reptiles'),
('fr', 58, 'Oiseau'),
('fr', 59, 'Je n\'ai que l\'amour'),
('fr', 60, 'Allergique aux animaux'),
('fr', 61, 'Lapin'),
('fr', 62, 'Amphibie'),
('fr', 63, 'Animaux gratuits'),
('fr', 64, 'Tous les animaux'),
('fr', 65, 'Je veux un animal de compagnie'),
('fr', 66, 'Tortue'),
('fr', 67, 'Pas pour moi'),
('fr', 68, 'Sobre et curieux'),
('fr', 69, 'Lors d\'occasions spéciales'),
('fr', 70, 'Sobre'),
('fr', 71, 'Socialiser le week-end'),
('fr', 72, 'La plupart des nuits'),
('fr', 75, 'Fumeur social'),
('fr', 76, 'Non fumeur'),
('fr', 77, 'Essayer de quitter'),
('fr', 78, 'Lors d\'occasions spéciales'),
('fr', 79, 'Fumeur en buvant'),
('fr', 80, 'Tous les jours'),
('fr', 81, 'Souvent'),
('fr', 82, 'Jamais'),
('fr', 83, 'Parfois'),
('fr', 84, 'Végétalien'),
('fr', 85, 'Végétarien'),
('fr', 86, 'Kascher'),
('fr', 87, 'Pescatarien'),
('fr', 88, 'Halal'),
('fr', 89, 'Autre'),
('fr', 90, 'omnivore'),
('fr', 91, 'Carnivore'),
('fr', 92, 'Statut d\'influenceur'),
('fr', 93, 'Hors de la grille'),
('fr', 94, 'Socialement actif'),
('fr', 95, 'Défileurs passifs'),
('fr', 96, 'Oui j\'aime ça'),
('fr', 97, 'Je n\'aime pas ça, mais je dois le faire'),
('fr', 98, 'Je mange toujours dehors'),
('fr', 99, 'Emporter'),
('de', 3, 'Capricorn'),
('de', 4, 'Aquarius'),
('de', 5, 'Pisces'),
('de', 6, 'Aries'),
('de', 7, 'Taurus'),
('de', 8, 'Gemini'),
('de', 9, 'Cancer'),
('de', 10, 'Leo'),
('de', 11, 'Virgo'),
('de', 12, 'Libra'),
('de', 13, 'Scorpio'),
('de', 14, 'Sagittarius'),
('de', 15, 'Bachelors'),
('de', 16, 'In College'),
('de', 17, 'PhD'),
('de', 18, 'High school'),
('de', 19, 'Masters'),
('de', 20, 'Trade school'),
('de', 21, 'In grad school'),
('de', 22, 'I want children\r\nNot sure yet'),
('de', 23, 'Not sure yet'),
('de', 24, 'I don’t want children'),
('de', 25, 'I have children and want more'),
('de', 26, 'I have children and don’t want more'),
('de', 27, 'Classic - Bon ton'),
('de', 28, 'Casual'),
('de', 29, 'Sporty'),
('de', 30, 'Trendy'),
('de', 31, 'Street Style'),
('de', 32, 'Punk Rock'),
('de', 33, 'Androgynous'),
('de', 34, 'Vintage'),
('de', 43, 'I stay whatsApp all day'),
('de', 44, 'Phone'),
('de', 45, 'Big time texter'),
('de', 46, 'Video chatter'),
('de', 47, 'I’m slow to answer on whatsApp'),
('de', 48, 'Bad texter'),
('de', 49, 'Better in person'),
('de', 50, 'Thoughtful gestures'),
('de', 51, 'Touch'),
('de', 52, 'Compliments'),
('de', 53, 'Time together'),
('de', 54, 'Presents'),
('de', 55, 'Dog'),
('de', 56, 'Cat'),
('de', 57, 'Reptile'),
('de', 58, 'Bird'),
('de', 59, 'Don’t have but love'),
('de', 60, 'Allergic to pets'),
('de', 61, 'Rabbit'),
('de', 62, 'Amphibian'),
('de', 63, 'Pet free'),
('de', 64, 'All the pets'),
('de', 65, 'Want a pet'),
('de', 66, 'Turtle'),
('de', 67, 'Not for me'),
('de', 68, 'Sober curious'),
('de', 69, 'On special occasions'),
('de', 70, 'Sober'),
('de', 71, 'Sociality on weekends'),
('de', 72, 'Most nights'),
('de', 75, 'Social smoker'),
('de', 76, 'Non-smoker'),
('de', 77, 'Trying to quit'),
('de', 78, 'On special occasions'),
('de', 79, 'Smoker when drinking'),
('de', 80, 'Everyday'),
('de', 81, 'Often'),
('de', 82, 'Never'),
('de', 83, 'Sometimes'),
('de', 84, 'Vegan'),
('de', 85, 'Vegetarian'),
('de', 86, 'Kosher'),
('de', 87, 'Pescatarian'),
('de', 88, 'Halal'),
('de', 89, 'Other'),
('de', 90, 'Omnivore'),
('de', 91, 'Carnivore'),
('de', 92, 'Influencer status'),
('de', 93, 'Off the grid'),
('de', 94, 'Socially active'),
('de', 95, 'Passive scroller'),
('de', 96, 'Yes, I like it'),
('de', 97, 'I don\'t like it, but I have to do it'),
('de', 98, 'I always eat out'),
('de', 99, 'Take away'),
('es', 3, 'Capricornio'),
('es', 4, 'Acuario'),
('es', 5, 'Piscis'),
('es', 6, 'Aries'),
('es', 7, 'Tauro'),
('es', 8, 'Geminis'),
('es', 9, 'Cáncer'),
('es', 10, 'León'),
('es', 11, 'Virgo'),
('es', 12, 'Libra'),
('es', 13, 'Escorpión'),
('es', 14, 'Sagitario'),
('es', 15, 'Licenciaturas'),
('es', 16, 'En la Universidad'),
('es', 17, 'Doctor'),
('es', 18, 'Escuela secundaria'),
('es', 19, 'Maestros'),
('es', 20, 'escuela de oficios'),
('es', 21, 'en la escuela de posgrado'),
('es', 22, 'Quiero hijos\r\nNo estoy seguro todavía'),
('es', 23, 'No estoy seguro todavía'),
('es', 24, 'no quiero hijos'),
('es', 25, 'tengo hijos y quiero mas'),
('es', 26, 'tengo hijos y no quiero mas'),
('es', 27, 'Clásico - Buen tono'),
('es', 28, 'Casual'),
('es', 29, 'Deportivo'),
('es', 30, 'De moda'),
('es', 31, 'estilo callejero'),
('es', 32, 'Punk rock'),
('es', 33, 'Andrógino'),
('es', 34, 'Antiguo'),
('es', 43, 'Me quedo en WhatsApp todo el día.'),
('es', 44, 'Teléfono'),
('es', 45, 'Redactor de gran tiempo'),
('es', 46, 'Charla de vídeo'),
('es', 47, 'Tardo en responder por whatsapp'),
('es', 48, 'Mal redactor'),
('es', 49, 'Mejor en persona'),
('es', 50, 'gestos pensativos'),
('es', 51, 'Tocar'),
('es', 52, 'Felicitaciones'),
('es', 53, 'Tiempo juntos'),
('es', 54, 'regalos'),
('es', 55, 'Perro'),
('es', 56, 'Gato'),
('es', 57, 'reptiles'),
('es', 58, 'Pájaro'),
('es', 59, 'no tengo mas que amor'),
('es', 60, 'Alérgico a las mascotas'),
('es', 61, 'Conejo'),
('es', 62, 'Anfibio'),
('es', 63, 'Libre de mascotas'),
('es', 64, 'todas las mascotas'),
('es', 65, 'quiero una mascota'),
('es', 66, 'Tortuga'),
('es', 67, 'No para mí'),
('es', 68, 'sobrio curioso'),
('es', 69, 'En ocasiones especiales'),
('es', 70, 'Sobrio'),
('es', 71, 'Socializar los fines de semana'),
('es', 72, 'La mayoría de las noches'),
('es', 75, 'Fumador social'),
('es', 76, 'No fumador'),
('es', 77, 'Tratando de abandonar'),
('es', 78, 'En ocasiones especiales'),
('es', 79, 'Fumador al beber'),
('es', 80, 'Cada día'),
('es', 81, 'A menudo'),
('es', 82, 'Nunca'),
('es', 83, 'A veces'),
('es', 84, 'Vegano'),
('es', 85, 'Vegetariano'),
('es', 86, 'Comestible según la ley judía'),
('es', 87, 'pescatariano'),
('es', 88, 'halal'),
('es', 89, 'Otro'),
('es', 90, 'omnívoro'),
('es', 91, 'Carnívoro'),
('es', 92, 'Estado de influencia'),
('es', 93, 'Fuera de la red'),
('es', 94, 'socialmente activo'),
('es', 95, 'Desplazadores pasivos'),
('es', 96, 'Sí me gusta'),
('es', 97, 'No me gusta pero tengo que hacerlo.'),
('es', 98, 'siempre como fuera'),
('es', 99, 'Llevar'),
('it', 101, 'testq11aa'),
('it', 102, 'Voglio dei figli'),
('it', 103, 'Adoro i cuccioli'),
('it', 104, 'Sigaretta Elettronica'),
('en', 83, 'Sometimes'),
('it', 105, 'Non so cucinare'),
('it', 106, 'Masterchef');

-- --------------------------------------------------------

--
-- Table structure for table `block_users`
--

CREATE TABLE `block_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `block_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `block_users`
--

INSERT INTO `block_users` (`id`, `user_id`, `block_by`, `created_at`, `updated_at`) VALUES
(3, 8, 1, '2023-12-12 06:38:14', '2023-12-12 06:38:14'),
(4, 49, 41, '2023-12-13 05:29:16', '2023-12-13 05:29:16'),
(5, 8, 41, '2023-12-13 05:34:18', '2023-12-13 05:34:18'),
(7, 7, 41, '2023-12-13 05:37:15', '2023-12-13 05:37:15'),
(8, 1, 63, '2024-01-01 13:59:22', '2024-01-01 13:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `diamond_packs`
--

CREATE TABLE `diamond_packs` (
  `title` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  `id` int(55) NOT NULL,
  `amount` int(55) NOT NULL,
  `price` int(55) NOT NULL,
  `limited` tinyint(1) NOT NULL DEFAULT 0,
  `android_product_id` varchar(255) NOT NULL,
  `ios_product_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diamond_packs`
--

INSERT INTO `diamond_packs` (`title`, `image`, `id`, `amount`, `price`, `limited`, `android_product_id`, `ios_product_id`, `created_at`, `updated_at`) VALUES
('Basic Pack', 'uploads/1688538339.png', 1, 500, 10, 1, 'android code', 'com.retrytech.orange.1month', NULL, NULL),
('Standard Pack', 'uploads/1688538374.png', 3, 1000, 18, 0, 'android.test.purchased', 'orange500', NULL, NULL),
('Premium Pack', 'uploads/1688538401.png', 4, 100, 1, 0, 'belive_diamond_89', 'ios id', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gifts`
--

CREATE TABLE `gifts` (
  `id` int(55) NOT NULL,
  `coin_price` int(55) DEFAULT NULL,
  `image` varchar(555) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `user_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'uploads/661699435221.jpg', NULL, NULL),
(2, 1, 'uploads/701699435221.jpg', NULL, NULL),
(3, 1, 'uploads/311699435221.jpg', NULL, NULL),
(4, 2, 'uploads/791699436543.jpg', NULL, NULL),
(5, 2, 'uploads/771699436543.jpg', NULL, NULL),
(6, 2, 'uploads/821699436543.jpg', NULL, NULL),
(7, 3, 'uploads/891699436855.jpg', NULL, NULL),
(8, 3, 'uploads/361699436855.jpg', NULL, NULL),
(10, 4, 'uploads/211699437217.jpg', NULL, NULL),
(11, 4, 'uploads/741699437217.jpg', NULL, NULL),
(12, 5, 'uploads/211699437670.jpg', NULL, NULL),
(13, 5, 'uploads/111699437670.jpg', NULL, NULL),
(14, 5, 'uploads/551699437670.jpg', NULL, NULL),
(15, 6, 'uploads/261699438069.jpg', NULL, NULL),
(16, 6, 'uploads/571699438069.jpg', NULL, NULL),
(17, 6, 'uploads/791699438069.jpg', NULL, NULL),
(18, 7, 'uploads/191699438519.jpg', NULL, NULL),
(19, 7, 'uploads/711699438519.jpg', NULL, NULL),
(20, 7, 'uploads/931699438519.jpg', NULL, NULL),
(21, 8, 'uploads/671699438817.jpg', NULL, NULL),
(22, 8, 'uploads/101699438817.jpg', NULL, NULL),
(23, 8, 'uploads/401699438817.jpg', NULL, NULL),
(24, 9, 'uploads/551699439211.jpg', NULL, NULL),
(25, 9, 'uploads/141699439211.jpg', NULL, NULL),
(26, 9, 'uploads/291699439211.jpg', NULL, NULL),
(27, 10, 'uploads/361699439510.jpg', NULL, NULL),
(28, 10, 'uploads/241699439510.jpg', NULL, NULL),
(29, 10, 'uploads/571699439510.jpg', NULL, NULL),
(30, 10, 'uploads/181699440075.jpg', NULL, NULL),
(31, 11, 'uploads/391699520590.jpg', NULL, NULL),
(32, 11, 'uploads/651699520590.jpg', NULL, NULL),
(33, 11, 'uploads/691699520590.jpg', NULL, NULL),
(34, 12, 'uploads/951699529316.jpg', NULL, NULL),
(35, 12, 'uploads/751699529316.jpg', NULL, NULL),
(36, 12, 'uploads/471699529399.jpg', NULL, NULL),
(37, 12, 'uploads/801699529433.jpg', NULL, NULL),
(38, 13, 'uploads/971699530839.jpg', NULL, NULL),
(39, 13, 'uploads/661699530839.jpg', NULL, NULL),
(40, 14, 'uploads/581699589929.jpg', NULL, NULL),
(41, 14, 'uploads/761699589929.jpg', NULL, NULL),
(42, 14, 'uploads/461699589929.jpg', NULL, NULL),
(43, 14, 'uploads/591699589929.jpg', NULL, NULL),
(44, 15, 'uploads/881699590229.jpg', NULL, NULL),
(45, 15, 'uploads/561699590229.jpg', NULL, NULL),
(46, 16, 'uploads/761699590700.jpg', NULL, NULL),
(47, 16, 'uploads/771699590700.jpg', NULL, NULL),
(48, 17, 'uploads/491699590796.jpg', NULL, NULL),
(49, 17, 'uploads/621699590796.jpg', NULL, NULL),
(50, 18, 'uploads/431699593771.jpg', NULL, NULL),
(51, 18, 'uploads/801699593771.jpg', NULL, NULL),
(52, 19, 'uploads/301699596452.jpg', NULL, NULL),
(53, 19, 'uploads/651699596452.jpg', NULL, NULL),
(54, 20, 'uploads/921699605891.jpg', NULL, NULL),
(55, 20, 'uploads/941699605891.jpg', NULL, NULL),
(56, 21, 'uploads/801699874179.jpg', NULL, NULL),
(57, 21, 'uploads/201699874179.jpg', NULL, NULL),
(58, 22, 'uploads/981699987038.jpg', NULL, NULL),
(59, 23, 'uploads/861700673674.jpg', NULL, NULL),
(60, 23, 'uploads/451700673674.jpg', NULL, NULL),
(61, 25, 'uploads/761700824325.jpg', NULL, NULL),
(62, 25, 'uploads/891700824325.jpg', NULL, NULL),
(63, 26, 'uploads/321701161520.jpg', NULL, NULL),
(64, 26, 'uploads/841701161520.jpg', NULL, NULL),
(65, 27, 'uploads/571701161995.jpg', NULL, NULL),
(66, 27, 'uploads/411701161995.jpg', NULL, NULL),
(69, 29, 'uploads/131701173168.jpg', NULL, NULL),
(70, 29, 'uploads/131701173168.jpg', NULL, NULL),
(72, 30, 'uploads/851701431431.jpg', NULL, NULL),
(73, 30, 'uploads/331701431431.jpg', NULL, NULL),
(74, 31, 'uploads/831701432376.jpg', NULL, NULL),
(75, 31, 'uploads/611701432376.jpg', NULL, NULL),
(76, 32, 'uploads/451701433890.jpg', NULL, NULL),
(77, 32, 'uploads/361701433890.jpg', NULL, NULL),
(78, 33, 'uploads/791701679626.jpg', NULL, NULL),
(79, 33, 'uploads/171701679626.jpg', NULL, NULL),
(80, 35, 'uploads/371701765107.jpg', NULL, NULL),
(81, 35, 'uploads/291701765107.jpg', NULL, NULL),
(82, 36, 'uploads/631701765700.jpg', NULL, NULL),
(83, 36, 'uploads/151701765700.jpg', NULL, NULL),
(85, 37, 'uploads/311701858910.jpg', NULL, NULL),
(86, 37, 'uploads/591701858910.jpg', NULL, NULL),
(87, 38, 'uploads/521701946210.jpg', NULL, NULL),
(88, 38, 'uploads/711701946210.jpg', NULL, NULL),
(90, 28, 'uploads/661701950566.jpg', NULL, NULL),
(95, 40, 'uploads/771702026519.jpg', NULL, NULL),
(96, 40, 'uploads/461702026541.jpg', NULL, NULL),
(97, 40, 'uploads/451702026560.jpg', NULL, NULL),
(98, 40, 'uploads/151702026572.jpg', NULL, NULL),
(99, 40, 'uploads/261702026574.jpg', NULL, NULL),
(100, 40, 'uploads/131702026580.jpg', NULL, NULL),
(101, 40, 'uploads/691702026591.jpg', NULL, NULL),
(102, 40, 'uploads/861702026596.jpg', NULL, NULL),
(103, 40, 'uploads/201702026602.jpg', NULL, NULL),
(104, 41, 'uploads/781702028008.jpg', NULL, NULL),
(105, 41, 'uploads/941702028008.jpg', NULL, NULL),
(107, 41, 'uploads/211702028066.jpg', NULL, NULL),
(108, 42, 'uploads/641702215596.jpg', NULL, NULL),
(109, 42, 'uploads/421702215596.jpg', NULL, NULL),
(110, 43, 'uploads/871702218417.jpg', NULL, NULL),
(111, 43, 'uploads/201702218417.jpg', NULL, NULL),
(112, 44, 'uploads/181702219676.jpg', NULL, NULL),
(113, 44, 'uploads/751702219676.jpg', NULL, NULL),
(114, 45, 'uploads/311702220048.jpg', NULL, NULL),
(115, 45, 'uploads/971702220048.jpg', NULL, NULL),
(116, 46, 'uploads/261702220288.jpg', NULL, NULL),
(117, 46, 'uploads/801702220288.jpg', NULL, NULL),
(118, 47, 'uploads/511702220495.jpg', NULL, NULL),
(119, 47, 'uploads/321702220495.jpg', NULL, NULL),
(120, 48, 'uploads/161702220949.jpg', NULL, NULL),
(121, 48, 'uploads/841702220949.jpg', NULL, NULL),
(122, 49, 'uploads/591702221229.jpg', NULL, NULL),
(123, 49, 'uploads/361702221229.jpg', NULL, NULL),
(124, 50, 'uploads/171702282959.jpg', NULL, NULL),
(125, 50, 'uploads/581702282959.jpg', NULL, NULL),
(128, 28, 'uploads/601702290353.jpg', NULL, NULL),
(129, 52, 'uploads/411702536615.jpg', NULL, NULL),
(130, 52, 'uploads/481702536615.jpg', NULL, NULL),
(131, 53, 'uploads/951702537867.jpg', NULL, NULL),
(132, 53, 'uploads/491702537867.jpg', NULL, NULL),
(136, 55, 'uploads/971702884477.jpg', NULL, NULL),
(139, 56, 'uploads/651702982525.jpg', NULL, NULL),
(140, 56, 'uploads/871702982525.jpg', NULL, NULL),
(143, 58, 'uploads/991703048364.png', NULL, NULL),
(160, 39, 'uploads/981703055482.jpg', NULL, NULL),
(168, 39, 'uploads/471703060501.jpg', NULL, NULL),
(169, 39, 'uploads/571703061033.jpg', NULL, NULL),
(170, 39, 'uploads/421703061051.jpg', NULL, NULL),
(171, 39, 'uploads/491703061055.jpg', NULL, NULL),
(185, 59, 'uploads/921703156379.jpg', NULL, NULL),
(186, 60, 'uploads/571703240735.jpg', NULL, NULL),
(187, 60, 'uploads/311703240735.jpg', NULL, NULL),
(188, 61, 'uploads/531703371701.jpg', NULL, NULL),
(189, 61, 'uploads/731703371701.jpg', NULL, NULL),
(190, 62, 'uploads/601703423277.jpg', NULL, NULL),
(191, 62, 'uploads/271703423277.jpg', NULL, NULL),
(192, 63, 'uploads/611703675062.jpg', NULL, NULL),
(194, 54, 'uploads/461703763796.jpg', NULL, NULL),
(195, 54, 'uploads/511703763805.jpg', NULL, NULL),
(196, 66, 'uploads/401704092177.png', NULL, NULL),
(197, 66, 'uploads/661704092177.png', NULL, NULL),
(198, 67, 'uploads/311704363139.jpg', NULL, NULL),
(199, 67, 'uploads/921704363139.jpg', NULL, NULL),
(200, 68, 'uploads/621704365466.jpg', NULL, NULL),
(201, 68, 'uploads/451704365466.jpg', NULL, NULL),
(202, 69, 'uploads/671704365849.jpg', NULL, NULL),
(203, 69, 'uploads/181704365849.jpg', NULL, NULL),
(204, 70, 'uploads/481704431395.jpg', NULL, NULL),
(205, 70, 'uploads/951704431395.jpg', NULL, NULL),
(206, 71, 'uploads/801704455394.jpg', NULL, NULL),
(207, 71, 'uploads/631704455394.jpg', NULL, NULL),
(208, 72, 'uploads/181704778786.jpg', NULL, NULL),
(209, 72, 'uploads/541704778786.jpg', NULL, NULL),
(210, 73, 'uploads/151704779022.jpg', NULL, NULL),
(211, 73, 'uploads/611704779022.jpg', NULL, NULL),
(212, 74, 'uploads/371704956975.jpg', NULL, NULL),
(213, 74, 'uploads/161704956975.jpg', NULL, NULL),
(214, 75, 'uploads/321704967611.jpg', NULL, NULL),
(215, 75, 'uploads/511704967611.jpg', NULL, NULL),
(216, 76, 'uploads/741704968137.jpg', NULL, NULL),
(217, 76, 'uploads/951704968137.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `interests`
--

INSERT INTO `interests` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Sea', 'uploads/interest/1686909467.png', NULL, NULL),
(2, 'Nightclub', 'uploads/interest/1686909628.png', NULL, NULL),
(3, 'Startups', 'uploads/interest/1686909774.png', NULL, NULL),
(4, 'Snowboarding', 'uploads/interest/1686909818.png', NULL, NULL),
(5, 'Food tours', 'uploads/interest/1686909832.png', NULL, NULL),
(6, 'Ski', 'uploads/interest/1686909859.png', NULL, NULL),
(7, 'Moto GP', 'uploads/interest/1686910002.png', NULL, NULL),
(8, 'Formula 1', 'uploads/interest/1686910016.png', NULL, NULL),
(9, 'Photography', 'uploads/interest/1686910060.png', NULL, NULL),
(10, 'Festival', 'uploads/interest/1686910078.png', NULL, NULL),
(11, 'Light', 'uploads/interest/1686910101.png', NULL, NULL),
(12, 'Cucina orientale', 'uploads/interest/1686910221.png', NULL, NULL),
(13, 'Sport', 'uploads/interest/1686910238.png', NULL, NULL),
(14, 'Sauna and spa', 'uploads/interest/1686910265.png', NULL, NULL),
(15, 'Vela', 'uploads/interest/1686910277.png', NULL, NULL),
(16, 'Shopping', 'uploads/interest/1686910289.png', NULL, NULL),
(17, 'Sport cars', 'uploads/interest/1698321130.png', NULL, NULL),
(18, 'Self care', 'uploads/interest/1698321130.png', NULL, NULL),
(19, 'Grew up in the 90s', 'uploads/interest/1698321130.png', NULL, NULL),
(20, 'Boxing', 'uploads/interest/1698321130.png', NULL, NULL),
(21, 'Yoga', 'uploads/interest/1698321130.png', NULL, NULL),
(22, 'Meditation', 'uploads/interest/1698321130.png', NULL, NULL),
(23, 'Electronic music', 'uploads/interest/1698321130.png', NULL, NULL),
(24, 'Table games', 'uploads/interest/1698321130.png', NULL, NULL),
(25, 'Draw', 'uploads/interest/1698321130.png', NULL, NULL),
(26, 'Manga', 'uploads/interest/1698321130.png', NULL, NULL),
(27, 'Writing', 'uploads/interest/1698321130.png', NULL, NULL),
(28, 'Ramen', 'uploads/interest/1698321130.png', NULL, NULL),
(29, 'Make up', 'uploads/interest/1698321130.png', NULL, NULL),
(30, 'Martial arts', 'uploads/interest/1698321130.png', NULL, NULL),
(31, 'Marvel', 'uploads/interest/1698321130.png', NULL, NULL),
(32, 'Vegan cuisine', 'uploads/interest/1698321130.png', NULL, NULL),
(33, 'Volleyball', 'uploads/interest/1698321130.png', NULL, NULL),
(34, 'Vinyasa', 'uploads/interest/1698321130.png', NULL, NULL),
(35, 'Ballet', 'uploads/interest/1698321130.png', NULL, NULL),
(36, 'Playing in a band', 'uploads/interest/1698321130.png', NULL, NULL),
(37, 'Art gallery', 'uploads/interest/1698321130.png', NULL, NULL),
(38, 'Sing', 'uploads/interest/1698321130.png', NULL, NULL),
(39, 'Meme', 'uploads/interest/1698321130.png', NULL, NULL),
(40, 'Motorcycling', 'uploads/interest/1698321130.png', NULL, NULL),
(41, 'Skating', 'uploads/interest/1698321130.png', NULL, NULL),
(42, 'Mountain bike', 'uploads/interest/1698321130.png', NULL, NULL),
(43, 'Trekking', 'uploads/interest/1698321130.png', NULL, NULL),
(44, 'Mountain', 'uploads/interest/1698321130.png', NULL, NULL),
(45, 'Archery', 'uploads/interest/1698321130.png', NULL, NULL),
(46, 'Fishing', 'uploads/interest/1698321130.png', NULL, NULL),
(47, 'Active life', 'uploads/interest/1698321130.png', NULL, NULL),
(48, 'Concerts', 'uploads/interest/1698321130.png', NULL, NULL),
(49, 'Fashion', 'uploads/interest/1698321130.png', NULL, NULL),
(50, 'Camping', 'uploads/interest/1698321130.png', NULL, NULL),
(51, 'Cooked', 'uploads/interest/1698321130.png', NULL, NULL),
(52, 'Rock Music', 'uploads/interest/1698321130.png', NULL, NULL),
(53, 'Cosplay', 'uploads/interest/1698321130.png', NULL, NULL),
(54, 'Bike races', 'uploads/interest/1698321130.png', NULL, NULL),
(56, 'BBQ', 'uploads/interest/1698321130.png', NULL, NULL),
(57, 'Content Creation', 'uploads/interest/1698321130.png', NULL, NULL),
(58, 'Tattoos', 'uploads/interest/1698321130.png', NULL, NULL),
(59, 'Padel', 'uploads/interest/1698321130.png', NULL, NULL),
(60, 'Songwriter/Songwriter', 'uploads/interest/1698321130.png', NULL, NULL),
(61, 'Painting', 'uploads/interest/1698321130.png', NULL, NULL),
(62, 'TV series marathon', 'uploads/interest/1698321130.png', NULL, NULL),
(64, 'Surf', 'uploads/interest/1698321130.png', NULL, NULL),
(65, 'Entrepreneurship', 'uploads/interest/1698321130.png', NULL, NULL),
(66, 'Astrology', 'uploads/interest/1698321130.png', NULL, NULL),
(67, 'Art', 'uploads/interest/1698321130.png', NULL, NULL),
(68, 'Gardening', 'uploads/interest/1698321130.png', NULL, NULL),
(69, 'Dance', 'uploads/interest/1698321130.png', NULL, NULL),
(70, 'Kitchen', 'uploads/interest/1698321130.png', NULL, NULL),
(71, 'Soccer', 'uploads/interest/1698321130.png', NULL, NULL),
(72, 'Museum', 'uploads/interest/1698321130.png', NULL, NULL),
(73, 'Politics', 'uploads/interest/1698321130.png', NULL, NULL),
(74, 'Real estate market', 'uploads/interest/1698321130.png', NULL, NULL),
(75, 'Homemade beers', 'uploads/interest/1698321130.png', NULL, NULL),
(76, 'Play drums', 'uploads/interest/1698321130.png', NULL, NULL),
(77, 'Homemade beers', 'uploads/interest/1698321130.png', NULL, NULL),
(78, 'Bar', 'uploads/interest/1698321130.png', NULL, NULL),
(79, 'Volunteering', 'uploads/interest/1698321130.png', NULL, NULL),
(80, 'You', 'uploads/interest/1698321130.png', NULL, NULL),
(81, 'Food and wine', 'uploads/interest/1698321130.png', NULL, NULL),
(82, 'Environmentalism', 'uploads/interest/1698321130.png', NULL, NULL),
(83, 'Playing the bass', 'uploads/interest/1698321130.png', NULL, NULL),
(84, 'Gaming', 'uploads/interest/1698321130.png', NULL, NULL),
(85, 'Gymnastics', 'uploads/interest/1698321130.png', NULL, NULL),
(86, 'Equal rights', 'uploads/interest/1698321130.png', NULL, NULL),
(87, 'Rights of people with disabilities', 'uploads/interest/1698321130.png', NULL, NULL),
(88, 'Aperitif', 'uploads/interest/1698321130.png', NULL, NULL),
(89, 'Cultural exchanges', 'uploads/interest/1698321130.png', NULL, NULL),
(90, 'Environmentalism', 'uploads/interest/1698321130.png', NULL, NULL),
(91, '5-a-side football', 'uploads/interest/1698321130.png', NULL, NULL),
(92, 'Financial exchanges', 'uploads/interest/1698321130.png', NULL, NULL),
(93, 'Film Festivals', 'uploads/interest/1698321130.png', NULL, NULL),
(94, 'Equitation', 'uploads/interest/1698321130.png', NULL, NULL),
(95, 'Guitar', 'uploads/interest/1698321130.png', NULL, NULL),
(96, 'Musica funk', 'uploads/interest/1698321130.png', NULL, NULL),
(97, 'Climbing', 'uploads/interest/1698321130.png', NULL, NULL),
(98, 'Cycling', 'uploads/interest/1698321130.png', NULL, NULL),
(99, 'Nature', 'uploads/interest/1698321130.png', NULL, NULL),
(100, 'Picnic', 'uploads/interest/1698321130.png', NULL, NULL),
(101, 'Do-it-yourself', 'uploads/interest/1698321130.png', NULL, NULL),
(102, 'Music', 'uploads/interest/1698321130.png', NULL, NULL),
(103, 'Comedy', 'uploads/interest/1698321130.png', NULL, NULL),
(104, 'Netflix', 'uploads/interest/1698321130.png', NULL, NULL),
(105, 'Actions', 'uploads/interest/1698321130.png', NULL, NULL),
(106, 'Swim', 'uploads/interest/1698321130.png', NULL, NULL),
(107, 'Triathlon', 'uploads/interest/1698321130.png', NULL, NULL),
(108, 'Physical activity', 'uploads/interest/1698321130.png', NULL, NULL),
(109, 'Artistic gymnastics', 'uploads/interest/1698321130.png', NULL, NULL),
(110, 'Black Lives Matter', 'uploads/interest/1698321130.png', NULL, NULL),
(111, 'Playing the bass', 'uploads/interest/1698321130.png', NULL, NULL),
(112, 'Gymnastics', 'uploads/interest/1698321130.png', NULL, NULL),
(113, 'Bodycombat', 'uploads/interest/1698321130.png', NULL, NULL),
(114, 'Evenings at the bar', 'uploads/interest/1698321130.png', NULL, NULL),
(115, 'Basketball', 'uploads/interest/1698321130.png', NULL, NULL),
(116, 'Travel', 'uploads/interest/1698321130.png', NULL, NULL),
(117, 'Sushi', 'uploads/interest/1698321130.png', NULL, NULL),
(118, 'Sneakers', 'uploads/interest/1698321130.png', NULL, NULL),
(119, 'Social media', 'uploads/interest/1698321130.png', NULL, NULL),
(120, 'Gym', 'uploads/interest/1698321130.png', NULL, NULL),
(121, 'Skincare', 'uploads/interest/1698321130.png', NULL, NULL),
(122, 'Movie', 'uploads/interest/1698321130.png', NULL, NULL),
(123, 'Race', 'uploads/interest/1698321130.png', NULL, NULL),
(124, 'Home workout', 'uploads/interest/1698321130.png', NULL, NULL),
(125, 'Skateboard', 'uploads/interest/1698321130.png', NULL, NULL),
(126, 'Cabaret', 'uploads/interest/1698321130.png', NULL, NULL),
(127, 'Coffee', 'uploads/interest/1698321130.png', NULL, NULL),
(128, 'Sing', 'uploads/interest/1698321130.png', NULL, NULL),
(129, 'Poetry', 'uploads/interest/1698321130.png', NULL, NULL),
(130, 'Freediving', 'uploads/interest/1698321130.png', NULL, NULL),
(131, 'Jiu-jitsu', 'uploads/interest/1698321130.png', NULL, NULL),
(132, 'Fortnite', 'uploads/interest/1698321130.png', NULL, NULL),
(133, 'Karaoke', 'uploads/interest/1698321130.png', NULL, NULL),
(134, 'Climate change', 'uploads/interest/1698321130.png', NULL, NULL),
(135, 'Feminism', 'uploads/interest/1698321130.png', NULL, NULL),
(136, 'Second hand clothes', 'uploads/interest/1698321130.png', NULL, NULL),
(137, 'Reggaeton', 'uploads/interest/1698321130.png', NULL, NULL),
(138, 'Travel by car', 'uploads/interest/1698321130.png', NULL, NULL),
(139, 'Pilates', 'uploads/interest/1698321130.png', NULL, NULL),
(140, 'Country music', 'uploads/interest/1698321130.png', NULL, NULL),
(141, 'Investments', 'uploads/interest/1698321130.png', NULL, NULL),
(142, 'Ice-cream', 'uploads/interest/1698321130.png', NULL, NULL),
(143, 'Exhibitions', 'uploads/interest/1698321130.png', NULL, NULL),
(144, 'Car racing', 'uploads/interest/1698321130.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `interests_translations`
--

CREATE TABLE `interests_translations` (
  `lang_code` varchar(191) NOT NULL,
  `interest_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `interests_translations`
--

INSERT INTO `interests_translations` (`lang_code`, `interest_id`, `title`) VALUES
('it', 2, 'Discoteca'),
('it', 3, 'Startup'),
('it', 4, 'MotoGp'),
('it', 5, 'Formula 1'),
('it', 6, 'Tour enogastronomici'),
('it', 7, 'Snowboard'),
('it', 8, 'Sciare'),
('it', 9, 'Cucina orientale'),
('it', 10, 'Fotografia'),
('it', 11, 'Вохе'),
('it', 12, 'Padel'),
('it', 13, 'Festival'),
('it', 14, 'Calcio'),
('it', 15, 'Sauna e centro benessere'),
('it', 16, 'Vela'),
('it', 17, 'Shopping'),
('it', 18, 'Auto sportive'),
('it', 19, 'Manga'),
('it', 20, 'Automedicazione'),
('it', 21, 'Yoga'),
('it', 22, 'Meditazione'),
('it', 23, 'Cresciuto negli anni \'90'),
('it', 24, 'Disegno'),
('it', 25, 'Musica elettronica'),
('it', 26, 'Influencer'),
('it', 27, 'Trucco'),
('it', 28, 'Giochi da tavolo'),
('it', 29, 'Cucina vegana'),
('it', 30, 'Scrivere'),
('it', 31, 'Cantare'),
('it', 32, 'Arti marziali'),
('it', 33, 'Marvel'),
('it', 34, 'Pallavolo'),
('it', 35, 'Vinyasa'),
('it', 36, 'Balletto'),
('it', 37, 'Suonare in una band'),
('it', 38, 'Galleria d\'arte'),
('it', 39, 'Meme'),
('it', 40, 'Motociclismo'),
('it', 41, 'Mountain bike'),
('it', 42, 'Trekking'),
('it', 43, 'Pattinaggio'),
('it', 44, 'Montagna'),
('it', 45, 'Tiro con l\'arco'),
('it', 46, 'Pesca'),
('it', 47, 'Vita attiva'),
('it', 48, 'Concerti'),
('it', 49, 'Moda'),
('it', 50, 'Campeggio'),
('it', 51, 'Cucinare'),
('it', 52, 'Musica Rock'),
('it', 53, 'Cosplay'),
('it', 54, 'Gare ciclistiche'),
('it', 55, 'Playstation'),
('it', 56, 'Content Creator'),
('it', 57, 'Tatuaggi'),
('it', 58, 'Cantautore/trice'),
('it', 59, 'Maratona di serie televisive'),
('it', 60, 'Musica Trap'),
('it', 62, 'Imprenditoria'),
('it', 63, 'Astrologia'),
('it', 64, 'Arte'),
('it', 65, 'Giardinaggio'),
('it', 66, 'Danza'),
('it', 67, 'Cucina'),
('it', 68, 'Gaming'),
('it', 69, 'Museo'),
('it', 70, 'Politica'),
('it', 71, 'Mercato immobiliare'),
('it', 72, 'Blogger'),
('it', 73, 'Suonare la batteria'),
('it', 74, 'Birre fatte in casa'),
('it', 75, 'Volontariato'),
('it', 76, 'Ambientalismo'),
('it', 77, 'Pizza'),
('it', 78, 'Cibo e vino'),
('it', 79, 'Suonare il basso'),
('it', 80, 'Gioco'),
('it', 81, 'Ginnastica'),
('it', 82, 'Pari diritti'),
('it', 83, 'Diritti delle persone con disabilità'),
('it', 84, 'Scambi culturali'),
('it', 85, 'Orologi di Lusso'),
('it', 86, 'Calcio a 5'),
('it', 87, 'Scambi finanziari'),
('it', 88, 'Festival cinematografici'),
('it', 89, 'Musica funk'),
('it', 90, 'Equitazione'),
('it', 91, 'Arrampicata'),
('it', 92, 'Ciclismo'),
('it', 93, 'Natura'),
('it', 94, 'Picnic'),
('it', 95, 'Fai da Te'),
('it', 96, 'Musica'),
('it', 97, 'Commedia'),
('it', 98, 'Azioni'),
('it', 99, 'Nuotare'),
('it', 100, 'Attività fisica'),
('it', 101, 'Aperitivo'),
('it', 102, 'Ginnastica'),
('it', 103, 'Serate al bar'),
('it', 104, 'Netflix'),
('it', 105, 'Triathlon'),
('it', 106, 'Ginnastica artistica'),
('it', 107, 'Suonare il basso'),
('it', 108, 'Combattimento corpo a corpo'),
('it', 109, 'Pallacanestro'),
('it', 110, 'Viaggiare'),
('it', 111, 'Scarpe da ginnastica'),
('it', 112, 'Palestra'),
('it', 113, 'Cura della pelle'),
('it', 114, 'Film'),
('it', 115, 'Leggere Libri'),
('it', 116, 'Allenamento a casa'),
('it', 117, 'Cabaret'),
('it', 118, 'Caffè'),
('it', 119, 'Cantare'),
('it', 120, 'Poesia'),
('it', 121, 'Apnea'),
('it', 122, 'Jiu-jitsu'),
('it', 123, 'Fortnite'),
('it', 124, 'Karaoke'),
('it', 125, 'Femminismo'),
('it', 126, 'Abbigliamento Vintage'),
('it', 127, 'Reggaeton'),
('it', 128, 'Viaggiare in macchina'),
('it', 129, 'Sushi'),
('it', 130, 'Musica country'),
('it', 131, 'Investimenti'),
('it', 132, 'Corse automobilistiche'),
('it', 133, 'Barbecue'),
('it', 134, 'Pilates'),
('it', 135, 'Sport'),
('it', 136, 'Skateboard'),
('it', 137, 'Gelato'),
('it', 138, 'Mostre'),
('it', 139, 'Social Media'),
('it', 140, 'Cambiamento climatico'),
('it', 141, 'Surf'),
('it', 142, 'Ramen'),
('it', 143, 'Diritti LGBT'),
('it', 144, 'Chitarra'),
('it', 145, 'Salta'),
('it', 146, 'Fatto'),
('it', 1, 'Mare'),
('it', 61, 'Pittura'),
('en', 144, 'Car racing');

-- --------------------------------------------------------

--
-- Table structure for table `know_languages`
--

CREATE TABLE `know_languages` (
  `id` int(11) NOT NULL,
  `language_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `know_languages`
--

INSERT INTO `know_languages` (`id`, `language_name`, `created_at`, `updated_at`) VALUES
(2, 'English', '2023-11-27 01:13:11', '2023-11-27 07:15:19'),
(3, 'Italian', '2023-11-27 07:14:42', '2023-11-27 07:14:42'),
(4, 'French', '2023-11-27 07:14:50', '2023-11-27 07:14:50'),
(5, 'German', '2023-11-27 07:14:55', '2023-11-27 07:14:55'),
(6, 'Spanish', '2023-11-27 07:15:01', '2023-11-27 07:15:01'),
(7, 'Bulgarian', '2023-11-27 10:07:31', '2023-11-27 10:07:31'),
(8, 'Portuguese', '2023-11-27 10:07:47', '2023-11-27 10:07:47'),
(10, 'Dutch', '2023-11-27 10:08:16', '2023-11-27 10:08:16'),
(11, 'Polish', '2023-11-27 10:08:25', '2023-11-27 10:08:25'),
(12, 'Russian', '2023-11-27 10:08:32', '2023-11-27 10:08:32'),
(13, 'Norwegian', '2023-11-27 10:08:39', '2023-11-27 10:08:39'),
(14, 'Finnish', '2023-11-27 10:08:47', '2023-11-27 10:08:47'),
(15, 'Swedish', '2023-11-27 10:08:54', '2023-11-27 10:08:54'),
(16, 'Romanian', '2023-11-27 10:09:02', '2023-11-27 10:09:02'),
(17, 'Croatian', '2023-11-27 10:09:08', '2023-11-27 10:09:08'),
(18, 'Ukrainian', '2023-11-27 10:09:16', '2023-11-27 10:09:16'),
(19, 'Danish', '2023-11-27 10:09:23', '2023-11-27 10:09:23'),
(20, 'Hungarian', '2023-11-27 10:09:30', '2023-11-27 10:09:30'),
(21, 'Estonian', '2023-12-05 04:28:54', '2023-12-05 04:28:54');

-- --------------------------------------------------------

--
-- Table structure for table `know_languages_translations`
--

CREATE TABLE `know_languages_translations` (
  `language_id` int(11) NOT NULL,
  `language_name` varchar(255) NOT NULL,
  `lang_code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `know_languages_translations`
--

INSERT INTO `know_languages_translations` (`language_id`, `language_name`, `lang_code`) VALUES
(2, 'English2', 'fr'),
(2, 'Inglese', 'it'),
(2, 'English3', 'de'),
(2, 'English4', 'es'),
(4, 'Francese', 'it'),
(6, 'Spagnolo', 'it'),
(5, 'Tedesco', 'it'),
(7, 'Bulgaro', 'it'),
(8, 'Portoghese', 'it'),
(3, 'Italiano', 'it'),
(10, 'Olandese', 'it'),
(11, 'Polacco', 'it'),
(12, 'Russo', 'it'),
(13, 'Norvegese', 'it'),
(14, 'Finlandese', 'it'),
(15, 'Svedese', 'it'),
(16, 'Romeno', 'it'),
(17, 'Croato', 'it'),
(18, 'Ucraino', 'it'),
(19, 'Danese', 'it'),
(20, 'Ungherese', 'it'),
(21, 'Estone', 'it');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language_name` varchar(255) NOT NULL,
  `language_file` text DEFAULT NULL,
  `short_code` varchar(20) NOT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `is_default`, `language_name`, `language_file`, `short_code`, `rtl`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'English', 'en.json', 'en', 0, NULL, '2023-10-18 03:08:51', '2023-12-04 09:41:34'),
(2, 0, 'Italian', 'it.json', 'it', 0, NULL, NULL, '2023-12-04 09:41:29'),
(3, 0, 'French', 'fr.json', 'fr', 0, NULL, NULL, '2023-12-04 09:41:34'),
(4, 0, 'German', 'de.json', 'de', 0, NULL, NULL, '2023-11-29 12:07:17'),
(5, 0, 'Spanish', 'es.json', 'es', 0, NULL, NULL, '2023-11-29 12:07:48');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `rateable_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `like_type` enum('1','2','3') NOT NULL DEFAULT '1',
  `value` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `rateable_id`, `user_id`, `like_type`, `value`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 25, 28, '1', 1, NULL, '2023-12-18 06:05:19', '2023-12-18 06:05:19'),
(2, 1, 28, '1', 1, NULL, '2023-12-18 06:05:39', '2023-12-18 06:05:39'),
(3, 32, 28, '3', 1, NULL, '2023-12-18 06:09:45', '2023-12-18 06:09:45'),
(4, 20, 28, '3', 1, NULL, '2023-12-18 06:11:03', '2023-12-18 06:11:03'),
(5, 33, 28, '3', 1, NULL, '2023-12-18 06:11:06', '2023-12-18 06:11:06'),
(6, 21, 28, '1', 1, NULL, '2023-12-18 06:12:03', '2023-12-18 06:12:03'),
(7, 15, 28, '3', 1, NULL, '2023-12-18 06:12:31', '2023-12-18 06:12:31'),
(8, 36, 28, '3', 1, NULL, '2023-12-18 06:13:27', '2023-12-18 06:13:27'),
(9, 4, 28, '3', 1, NULL, '2023-12-18 06:14:04', '2023-12-18 06:14:04'),
(10, 25, 28, '3', 1, NULL, '2023-12-18 06:30:56', '2023-12-18 06:30:56'),
(11, 1, 28, '3', 1, NULL, '2023-12-18 06:31:09', '2023-12-18 06:31:09'),
(12, 32, 28, '1', 1, NULL, '2023-12-18 06:31:47', '2023-12-18 06:31:47'),
(13, 21, 28, '3', 1, NULL, '2023-12-18 06:34:05', '2023-12-18 06:34:05'),
(14, 15, 28, '1', 1, NULL, '2023-12-18 06:34:11', '2023-12-18 06:34:11'),
(15, 36, 28, '1', 1, NULL, '2023-12-18 06:36:19', '2023-12-18 06:36:19'),
(16, 4, 28, '1', 1, NULL, '2023-12-18 06:36:34', '2023-12-18 06:36:34'),
(17, 37, 1, '3', 1, NULL, '2023-12-19 05:23:20', '2023-12-19 05:23:20'),
(18, 11, 1, '3', 1, NULL, '2023-12-19 05:23:21', '2023-12-19 05:23:21'),
(19, 9, 1, '3', 1, NULL, '2023-12-19 05:23:24', '2023-12-19 05:23:24'),
(20, 38, 1, '3', 1, NULL, '2023-12-19 05:23:28', '2023-12-19 05:23:28'),
(21, 41, 1, '2', 1, NULL, '2023-12-19 10:18:29', '2023-12-19 10:18:29'),
(22, 40, 1, '2', 1, NULL, '2023-12-19 10:18:40', '2023-12-19 10:18:40'),
(23, 10, 1, '2', 1, NULL, '2023-12-19 10:18:47', '2023-12-19 10:18:47'),
(24, 54, 1, '2', 1, NULL, '2023-12-19 10:38:53', '2023-12-19 10:38:53'),
(25, 50, 56, '1', 1, NULL, '2023-12-19 12:18:21', '2023-12-19 12:18:21'),
(26, 3, 56, '1', 1, NULL, '2023-12-19 12:18:22', '2023-12-19 12:18:22'),
(27, 45, 56, '1', 1, NULL, '2023-12-19 12:18:28', '2023-12-19 12:18:28'),
(28, 2, 56, '1', 1, NULL, '2023-12-19 12:18:30', '2023-12-19 12:18:30'),
(29, 47, 56, '3', 1, NULL, '2023-12-19 12:18:30', '2023-12-19 12:18:30'),
(30, 42, 56, '3', 1, NULL, '2023-12-19 12:18:31', '2023-12-19 12:18:31'),
(31, 52, 56, '1', 1, NULL, '2023-12-19 12:18:32', '2023-12-19 12:18:32'),
(32, 5, 56, '1', 1, NULL, '2023-12-19 12:18:35', '2023-12-19 12:18:35'),
(33, 50, 56, '3', 1, NULL, '2023-12-19 12:18:37', '2023-12-19 12:18:37'),
(34, 2, 56, '3', 1, NULL, '2023-12-19 12:18:40', '2023-12-19 12:18:40'),
(35, 47, 56, '1', 1, NULL, '2023-12-19 12:18:44', '2023-12-19 12:18:44'),
(36, 44, 56, '3', 1, NULL, '2023-12-20 04:54:56', '2023-12-20 04:54:56'),
(37, 44, 56, '1', 1, NULL, '2023-12-20 04:55:04', '2023-12-20 04:55:04'),
(38, 8, 57, '3', 1, NULL, '2023-12-20 04:56:49', '2023-12-20 04:56:49'),
(39, 43, 57, '1', 1, NULL, '2023-12-20 06:00:37', '2023-12-20 06:00:37'),
(40, 28, 20, '3', 1, NULL, '2023-12-20 17:00:29', '2023-12-20 17:00:29'),
(41, 55, 20, '3', 1, NULL, '2023-12-20 18:04:33', '2023-12-20 18:04:33'),
(42, 39, 20, '3', 1, NULL, '2023-12-20 18:04:33', '2023-12-20 18:04:33'),
(43, 53, 59, '3', 1, NULL, '2023-12-21 10:59:45', '2023-12-21 10:59:45'),
(44, 49, 59, '3', 1, NULL, '2023-12-21 10:59:49', '2023-12-21 10:59:49'),
(45, 48, 59, '3', 1, NULL, '2023-12-21 10:59:51', '2023-12-21 10:59:51'),
(46, 6, 59, '3', 1, NULL, '2023-12-21 10:59:53', '2023-12-21 10:59:53'),
(47, 56, 59, '3', 1, NULL, '2023-12-21 11:00:00', '2023-12-21 11:00:00'),
(48, 7, 59, '3', 1, NULL, '2023-12-21 11:00:02', '2023-12-21 11:00:02'),
(49, 22, 55, '3', 1, NULL, '2023-12-22 08:44:28', '2023-12-22 08:44:28'),
(50, 26, 55, '3', 1, NULL, '2023-12-22 08:44:28', '2023-12-22 08:44:28'),
(51, 18, 55, '3', 1, NULL, '2023-12-22 08:44:31', '2023-12-22 08:44:31'),
(52, 27, 55, '3', 1, NULL, '2023-12-22 08:44:32', '2023-12-22 08:44:32'),
(53, 17, 55, '3', 1, NULL, '2023-12-22 08:44:35', '2023-12-22 08:44:35'),
(54, 19, 55, '3', 1, NULL, '2023-12-22 08:44:39', '2023-12-22 08:44:39'),
(55, 12, 55, '3', 1, NULL, '2023-12-22 08:44:40', '2023-12-22 08:44:40'),
(56, 16, 55, '3', 1, NULL, '2023-12-22 08:44:51', '2023-12-22 08:44:51'),
(57, 35, 55, '3', 1, NULL, '2023-12-22 08:44:53', '2023-12-22 08:44:53'),
(58, 59, 61, '1', 1, NULL, '2023-12-23 22:53:21', '2023-12-23 22:53:21'),
(59, 46, 61, '1', 1, NULL, '2023-12-23 22:53:26', '2023-12-23 22:53:26'),
(60, 13, 61, '1', 1, NULL, '2023-12-23 22:53:30', '2023-12-23 22:53:30'),
(61, 30, 61, '1', 1, NULL, '2023-12-23 22:53:32', '2023-12-23 22:53:32'),
(62, 31, 62, '1', 1, NULL, '2023-12-24 13:12:34', '2023-12-24 13:12:34'),
(63, 61, 62, '1', 1, NULL, '2023-12-24 13:12:39', '2023-12-24 13:12:39'),
(64, 29, 62, '1', 1, NULL, '2023-12-24 13:12:44', '2023-12-24 13:12:44'),
(65, 14, 62, '1', 1, NULL, '2023-12-24 13:12:47', '2023-12-24 13:12:47'),
(66, 23, 62, '1', 1, NULL, '2023-12-24 13:12:48', '2023-12-24 13:12:48'),
(67, 60, 62, '1', 1, NULL, '2023-12-24 13:12:50', '2023-12-24 13:12:50'),
(68, 60, 62, '2', 1, NULL, '2023-12-24 13:15:24', '2023-12-24 13:15:24'),
(69, 31, 62, '2', 1, NULL, '2023-12-24 13:15:25', '2023-12-24 13:15:25'),
(70, 61, 62, '2', 1, NULL, '2023-12-24 13:15:26', '2023-12-24 13:15:26');

-- --------------------------------------------------------

--
-- Table structure for table `live_application`
--

CREATE TABLE `live_application` (
  `id` int(55) NOT NULL,
  `user_id` int(11) NOT NULL,
  `about_you` varchar(500) DEFAULT NULL,
  `languages` varchar(255) DEFAULT NULL,
  `intro_video` varchar(255) DEFAULT NULL,
  `social_links` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_history`
--

CREATE TABLE `live_history` (
  `id` int(55) NOT NULL,
  `user_id` int(55) DEFAULT NULL,
  `started_at` varchar(255) DEFAULT NULL,
  `streamed_for` varchar(255) DEFAULT NULL,
  `amount_collected` int(55) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `live_history`
--

INSERT INTO `live_history` (`id`, `user_id`, `started_at`, `streamed_for`, `amount_collected`, `created_at`, `updated_at`) VALUES
(1, 18, '4:18 PM', '24 sec', 0, '2023-06-26 10:49:02', '2023-06-26 10:49:02'),
(2, 18, '4:19 PM', '44 sec', 0, '2023-06-26 10:49:57', '2023-06-26 10:49:57'),
(3, 18, '4:20 PM', '01 mins 09 sec', 0, '2023-06-26 10:51:17', '2023-06-26 10:51:17');

-- --------------------------------------------------------

--
-- Table structure for table `lookings`
--

CREATE TABLE `lookings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lookings`
--

INSERT INTO `lookings` (`id`, `name`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Long term Partner', 'images/long.png', '2023-10-24 11:52:08', '2023-10-23 18:30:00'),
(2, 'A serious story and then who knows?', 'images/serious.png', '2023-10-24 11:52:22', '2023-10-23 18:30:00'),
(3, 'Occasional Attendance... A Flirt !', 'images/occasional.png', '0000-00-00 00:00:00', '2023-10-23 18:30:00'),
(4, 'Pure Fun !', 'images/fun.png', '2023-10-24 11:52:45', '2023-10-23 18:30:00'),
(5, 'New Friends', 'images/friends.png', '2023-10-24 11:52:53', '2023-10-23 18:30:00'),
(6, 'Still figuring it out', 'images/figuring.png', '2023-10-24 11:53:00', '2023-10-23 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `lookings_translations`
--

CREATE TABLE `lookings_translations` (
  `lang_code` varchar(191) NOT NULL,
  `looking_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lookings_translations`
--

INSERT INTO `lookings_translations` (`lang_code`, `looking_id`, `name`) VALUES
('es', 1, 'A largo plazo\r\npareja'),
('es', 2, 'una historia seria\r\ny luego quien\r\n¿Sabe?'),
('es', 3, 'Ocasional\r\nAsistencia...\r\n¡Un piropo!'),
('es', 4, '¡Pura diversión!'),
('es', 5, 'Nuevos amigos'),
('es', 6, 'Todavía pensando\r\nfuera'),
('fr', 1, 'Une grande place\r\npareja'),
('fr', 2, 'une série historique\r\net lui quien\r\nC\'est Sabé ?'),
('fr', 3, 'Occasionnel\r\nAssistant...\r\n¡Un piropo!'),
('fr', 4, '¡Pura diversion !'),
('fr', 5, 'Nouveaux amis'),
('fr', 6, 'Todavia pense\r\npour un'),
('it', 1, 'Relazione\\nStabile'),
('it', 2, 'Una Storia seria\\nPoi chissa’...'),
('it', 3, 'Frequentazione\\nOccasionale\\nUn Flirt....!'),
('it', 4, 'Puro\\nDivertimento'),
('it', 5, 'Nuove\\namicizie!'),
('it', 6, 'Sto ancora\\ncercando di\\ncapirlo'),
('de', 1, 'A largo plazo\r\npareja'),
('de', 2, 'una historia seria\r\ny luego quien\r\n¿Sabe?'),
('de', 3, 'Ocasional\r\nAsistencia...\r\n¡Un piropo!'),
('de', 4, '¡Pura diversión!'),
('de', 5, 'Nuevos amigos'),
('de', 6, 'Todavía pensando\r\nfuera');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2023_08_16_091923_create_admin_notification_table', 0),
(2, '2023_08_16_091923_create_admin_user_table', 0),
(3, '2023_08_16_091923_create_admob_table', 0),
(4, '2023_08_16_091923_create_appdata_table', 0),
(5, '2023_08_16_091923_create_diamond_packs_table', 0),
(6, '2023_08_16_091923_create_gifts_table', 0),
(7, '2023_08_16_091923_create_images_table', 0),
(8, '2023_08_16_091923_create_interests_table', 0),
(9, '2023_08_16_091923_create_likes_table', 0),
(10, '2023_08_16_091923_create_live_application_table', 0),
(11, '2023_08_16_091923_create_live_history_table', 0),
(12, '2023_08_16_091923_create_package_table', 0),
(13, '2023_08_16_091923_create_pages_table', 0),
(14, '2023_08_16_091923_create_redeem_requests_table', 0),
(15, '2023_08_16_091923_create_report_table', 0),
(16, '2023_08_16_091923_create_swipe_counts_table', 0),
(17, '2023_08_16_091923_create_user_notification_table', 0),
(18, '2023_08_16_091923_create_users_table', 0),
(19, '2023_08_16_091923_create_verification_request_table', 0),
(20, '2023_08_16_091926_add_foreign_keys_to_live_application_table', 0),
(21, '2023_08_16_091926_add_foreign_keys_to_live_history_table', 0),
(22, '2023_08_16_091926_add_foreign_keys_to_redeem_requests_table', 0),
(23, '2023_08_16_091926_add_foreign_keys_to_report_table', 0),
(24, '2023_08_16_091926_add_foreign_keys_to_user_notification_table', 0),
(25, '2023_08_16_091944_create_admin_notification_table', 0),
(26, '2023_08_16_091944_create_admin_user_table', 0),
(27, '2023_08_16_091944_create_admob_table', 0),
(28, '2023_08_16_091944_create_appdata_table', 0),
(29, '2023_08_16_091944_create_diamond_packs_table', 0),
(30, '2023_08_16_091944_create_gifts_table', 0),
(31, '2023_08_16_091944_create_images_table', 0),
(32, '2023_08_16_091944_create_interests_table', 0),
(33, '2023_08_16_091944_create_likes_table', 0),
(34, '2023_08_16_091944_create_live_application_table', 0),
(35, '2023_08_16_091944_create_live_history_table', 0),
(36, '2023_08_16_091944_create_package_table', 0),
(37, '2023_08_16_091944_create_pages_table', 0),
(38, '2023_08_16_091944_create_redeem_requests_table', 0),
(39, '2023_08_16_091944_create_report_table', 0),
(40, '2023_08_16_091944_create_swipe_counts_table', 0),
(41, '2023_08_16_091944_create_user_notification_table', 0),
(42, '2023_08_16_091944_create_users_table', 0),
(43, '2023_08_16_091944_create_verification_request_table', 0),
(44, '2023_08_16_091947_add_foreign_keys_to_live_application_table', 0),
(45, '2023_08_16_091947_add_foreign_keys_to_live_history_table', 0),
(46, '2023_08_16_091947_add_foreign_keys_to_redeem_requests_table', 0),
(47, '2023_08_16_091947_add_foreign_keys_to_report_table', 0),
(48, '2023_08_16_091947_add_foreign_keys_to_user_notification_table', 0),
(54, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(58, '2014_10_12_100000_create_password_resets_table', 2),
(69, '2016_06_01_000001_create_oauth_auth_codes_table', 3),
(70, '2016_06_01_000002_create_oauth_access_tokens_table', 3),
(71, '2016_06_01_000003_create_oauth_refresh_tokens_table', 3),
(72, '2016_06_01_000004_create_oauth_clients_table', 3),
(73, '2016_06_01_000005_create_oauth_personal_access_clients_table', 3),
(74, '2018_06_07_000001_create_plans_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('010fa639ff9d81a67d862ea4fcf6e09ae6727fda676e6d7ccf151678d97001ddb4e72ec635b971a2', 111, 2, NULL, '[\"*\"]', 0, '2023-11-08 05:28:39', '2023-11-08 05:28:39', '2024-11-08 05:28:39'),
('01caacee5ad8cb9648f796c400f89df8f128039cf56fe84b8fc21d44fe0f443b19e5755873d4dbe1', 28, 2, NULL, '[\"*\"]', 0, '2023-11-29 05:49:09', '2023-11-29 05:49:09', '2024-11-29 05:49:09'),
('01fd182e2f94e7c46f7d6bfd832f38c78f8f603fa01d2c00502e3cb489dfe9bd7579e0fd36ed8308', 71, 2, NULL, '[\"*\"]', 0, '2024-01-05 18:49:54', '2024-01-05 18:49:54', '2025-01-05 11:49:54'),
('02123f531b19e58c21ab2cfd1f0be513c28f3548415890966ce69095f88ce82392bd79dddde4dc71', 28, 2, NULL, '[\"*\"]', 0, '2023-12-07 07:01:31', '2023-12-07 07:01:31', '2024-12-07 07:01:31'),
('0229ce4105f9f77697495d63e5e82e9849982c9d81c1faa4fbed7561b7c7482b7eca2a55582be418', 113, 2, NULL, '[\"*\"]', 0, '2023-11-08 06:02:27', '2023-11-08 06:02:27', '2024-11-08 06:02:27'),
('0246d85d82e9de2ad92494cc43447d53827d02e7193a11c3c6e8fffd0a472682005e1650c6685d38', 2, 2, NULL, '[\"*\"]', 0, '2023-11-02 06:59:08', '2023-11-02 06:59:08', '2024-11-02 06:59:08'),
('028b16f2be420ce77c1fbfd9292658105440bc558c8e78f623e402eb146ada2746348006fd44d731', 1, 2, NULL, '[\"*\"]', 0, '2023-12-07 07:23:58', '2023-12-07 07:23:58', '2024-12-07 07:23:58'),
('02e73d66de2b1a37d1379e79e044b0ddd819f4d3b3aadb9150bbe63a2f79842740627c669fcb2588', 28, 2, NULL, '[\"*\"]', 0, '2023-11-30 05:10:03', '2023-11-30 05:10:03', '2024-11-30 05:10:03'),
('038a4359a9509f18cebc7dce9791725a37cae9c4d2576cff415b2aa6a7b4c1e2f17ed29be2e391d8', 1, 2, NULL, '[\"*\"]', 0, '2023-12-21 10:23:02', '2023-12-21 10:23:02', '2024-12-21 10:23:02'),
('05d64b27fddca912c2323bfbd643c10c47f43ea5969b468826d4d28af883819a53e774fc8783871e', 74, 2, NULL, '[\"*\"]', 0, '2024-01-11 14:09:36', '2024-01-11 14:09:36', '2025-01-11 07:09:36'),
('07a2c6a7450a1b12b47e891702d8ceab467c45a6ec3f98ed65a73ba2f53212049ffdee13571a734d', 28, 2, NULL, '[\"*\"]', 0, '2023-12-07 08:49:53', '2023-12-07 08:49:53', '2024-12-07 08:49:53'),
('07c8b2e08c8d5e5bf6c28b6f0b4fb02bb88652e557185a8134d7f8492cd03b9b3a72f60b43b357a1', 108, 2, NULL, '[\"*\"]', 0, '2023-11-07 11:19:54', '2023-11-07 11:19:54', '2024-11-07 11:19:54'),
('07f21241f68c2d78b65efbf8e9d2e224f2d69253a755d8d3c803db44ad37663432a0bedb95d16c27', 54, 2, NULL, '[\"*\"]', 0, '2023-12-21 10:52:09', '2023-12-21 10:52:09', '2024-12-21 10:52:09'),
('084d6cd4d827e3e1f1524fb7df02565e384be68b690aab502a7b4b9f98fb4194e1bc1f6b50d54f9e', 80, 2, NULL, '[\"*\"]', 0, '2023-10-30 06:02:24', '2023-10-30 06:02:24', '2024-10-30 06:02:24'),
('08b7bb5df0e65b62036ffb4c870cde31b8bdd19d3d9ab175c899f1f74301501f0b466b7ee6d93e5e', 28, 2, NULL, '[\"*\"]', 0, '2023-12-21 12:03:13', '2023-12-21 12:03:13', '2024-12-21 12:03:13'),
('098481ebfdccc80daa79ef28ac8305b2e56c2307bdbbbee8ddb1e4aaaddf2d0e5112506e8dab5ca1', 42, 2, NULL, '[\"*\"]', 0, '2023-10-19 17:42:44', '2023-10-19 17:42:44', '2024-10-19 17:42:44'),
('0b04273a2463c344a65f074647a91cc2f06c2b9b50b0c6a90c68ebd0b5040b5d4cc04d4fb59247bf', 28, 2, NULL, '[\"*\"]', 0, '2023-11-28 11:11:30', '2023-11-28 11:11:30', '2024-11-28 11:11:30'),
('0be7ea930bd5bde28e06484de98c200100d0313ba8b30a83f76e9d8a2648c8ef417ee55b5b7b5f29', 52, 2, NULL, '[\"*\"]', 0, '2024-01-04 17:55:34', '2024-01-04 17:55:34', '2025-01-04 10:55:34'),
('0c7b83e85c7cfb05fed82fc259d549be215341d5a0799cb0dc899e4a3edb328faf4e2d48d082a974', 11, 2, NULL, '[\"*\"]', 0, '2023-11-09 09:03:10', '2023-11-09 09:03:10', '2024-11-09 09:03:10'),
('0cd726316cb3554317b44ae6073a81e067e240acabc5fb950c81220e2b2ee04656ad42473a07390a', 3, 2, NULL, '[\"*\"]', 0, '2023-10-24 13:00:47', '2023-10-24 13:00:47', '2024-10-24 13:00:47'),
('0d7ba9dca731a59b46a085434a42a04d86c80a1b69601fbe6d5312c57cccce20ba45075e1ace22b9', 47, 2, NULL, '[\"*\"]', 0, '2023-11-08 06:18:39', '2023-11-08 06:18:39', '2024-11-08 06:18:39'),
('0e2b2a206256f19efdbc61119779454bb149cc4623eb4c09d29901a764e7267443b8a86d2291abaf', 63, 2, NULL, '[\"*\"]', 0, '2024-01-03 15:57:40', '2024-01-03 15:57:40', '2025-01-03 08:57:40'),
('1245d1eb752e93a74b9219af7d2921c0074d5e6be1d62ea065103058f53a65e8a91c9753eae07165', 87, 2, NULL, '[\"*\"]', 0, '2023-11-02 12:36:03', '2023-11-02 12:36:03', '2024-11-02 12:36:03'),
('124cdf2ed8524b3bd983e432885d263d14c114c67dd9be295ea80f6fcd38feab4e62ef511516e701', 28, 2, NULL, '[\"*\"]', 0, '2023-12-07 07:15:32', '2023-12-07 07:15:32', '2024-12-07 07:15:32'),
('1305e2b5fa587e9906825bfd3ed8fbbef9d21135927af55ed12344f1b7297eb9441f96ef63c33386', 99, 2, NULL, '[\"*\"]', 0, '2023-11-07 05:26:35', '2023-11-07 05:26:35', '2024-11-07 05:26:35'),
('130f76001d87ed61fe1bdb34705ed08bf97d2998b740531581c715702f166d08a68bc9199ea8e2e4', 41, 2, NULL, '[\"*\"]', 0, '2023-12-11 09:29:45', '2023-12-11 09:29:45', '2024-12-11 09:29:45'),
('13abd78fce3f405a751a2785e1559b04a844110f488cf30655eb80a186cbac79526244672be12b8f', 2, 2, NULL, '[\"*\"]', 0, '2023-11-02 06:28:12', '2023-11-02 06:28:12', '2024-11-02 06:28:12'),
('15ac83bfd0f20285b53e53460fc4b66f1eadc62d68f7c3774710498ef181fdfceb2731c33cd68c14', 1, 2, NULL, '[\"*\"]', 0, '2023-12-08 07:14:40', '2023-12-08 07:14:40', '2024-12-08 07:14:40'),
('1872a3ec26ce42f8430e36297a99eb3e47d515b8107ec1ab9caa1e83883b08f3d18e586444e94e40', 38, 2, NULL, '[\"*\"]', 0, '2023-12-07 12:33:35', '2023-12-07 12:33:35', '2024-12-07 12:33:35'),
('18be6a81307f8fd4ff4c4ba13a9fe934f2adf8cae540d47f4ef39fb3909a3325be39ff6b023b6981', 16, 2, NULL, '[\"*\"]', 0, '2023-11-10 04:31:40', '2023-11-10 04:31:40', '2024-11-10 04:31:40'),
('19baffef0d7472eb916153ede7fdbb23ec95e73f139464a7cd81bebc5e3b45b6b19c13d37e2fca47', 37, 2, NULL, '[\"*\"]', 0, '2023-12-06 10:35:10', '2023-12-06 10:35:10', '2024-12-06 10:35:10'),
('1bb41afa2dc73c231fa0a6b3340afbd2bfbda47b5f649a5f78c301398bc34db38e32034c20157c87', 55, 2, NULL, '[\"*\"]', 0, '2023-12-27 16:34:48', '2023-12-27 16:34:48', '2024-12-27 09:34:48'),
('1bf90d84bf59d3517141a9882177b5eb309a32d7e720a41296132a906a2ae9d8b0c49da6ac3175c6', 28, 2, NULL, '[\"*\"]', 0, '2023-11-30 04:15:52', '2023-11-30 04:15:52', '2024-11-30 04:15:52'),
('1c90a8dbd42abbaffcbf58bc541a4d01a90a7b8bcdfd8a290ea7b616f543b4b2fac524f77b2eb34c', 1, 2, NULL, '[\"*\"]', 0, '2023-12-18 11:04:05', '2023-12-18 11:04:05', '2024-12-18 11:04:05'),
('1d0b1e21df82a12c89b9f22beb44116a15782efcb57d5904a46126556d5b97f94ddafce88ec9ed05', 28, 2, NULL, '[\"*\"]', 0, '2023-12-07 09:50:44', '2023-12-07 09:50:44', '2024-12-07 09:50:44'),
('1e338c3e1343f8b80e14ecfccdb86d5840e2f6fa0e4b96f98a2b84603b271f39934766f65ef8626b', 47, 2, NULL, '[\"*\"]', 0, '2023-10-30 03:57:44', '2023-10-30 03:57:44', '2024-10-30 03:57:44'),
('1e8022f9b7867c5f9a25847df1fe6d502768ba3abfdd5adbc93db8a8927c85b5e8cb625468909fdd', 28, 2, NULL, '[\"*\"]', 0, '2023-12-14 10:22:43', '2023-12-14 10:22:43', '2024-12-14 10:22:43'),
('1edcef2a65b217b9ce9a36c8fd5006b3e41c6def9ceefd79ef0cf42377cd7deb8da0446ea6446e12', 28, 2, NULL, '[\"*\"]', 0, '2023-12-19 05:43:42', '2023-12-19 05:43:42', '2024-12-19 05:43:42'),
('1ffdcf374f599bd488cbfe30419c7ce0002b84e0b263d07c36d86dd62488d7c815ee8a226e99ddb3', 55, 2, NULL, '[\"*\"]', 0, '2023-12-27 14:31:08', '2023-12-27 14:31:08', '2024-12-27 07:31:08'),
('2127b7f903a503cd6c414cf218f9e0500b5d9f7bfd840a1ba2c1db6d9a99ac300698f32d6ca4455a', 2, 2, NULL, '[\"*\"]', 0, '2023-11-08 09:42:24', '2023-11-08 09:42:24', '2024-11-08 09:42:24'),
('220600e2c2566f9d98a0ee152265322d4dfd0f0596df88a715641b764b935e7d40284fc15a0ffcca', 1, 2, NULL, '[\"*\"]', 0, '2023-12-06 07:18:09', '2023-12-06 07:18:09', '2024-12-06 07:18:09'),
('2240cd2d6ff244240ccbd73eb6617080cf2feb16bca464b41b65594aa50217262ffc7c6d4f1ba510', 55, 2, NULL, '[\"*\"]', 0, '2023-12-27 18:01:23', '2023-12-27 18:01:23', '2024-12-27 11:01:23'),
('22ef264492a6394b401b5e8ac45507d22b3709a23d79ba377886356980f3090207829b56b56fa116', 28, 2, NULL, '[\"*\"]', 0, '2023-12-01 07:19:17', '2023-12-01 07:19:17', '2024-12-01 07:19:17'),
('2303f1cddbfbaa4eba000a3924a177d22c2244236688adccea55627a9af272d5dcd0616e879ac8f3', 28, 2, NULL, '[\"*\"]', 0, '2023-12-04 06:25:53', '2023-12-04 06:25:53', '2024-12-04 06:25:53'),
('240085f8236ed6ea7277dc0293dfd98e195a2634bc76544229b579e7a038d3b95442708a799492ee', 28, 2, NULL, '[\"*\"]', 0, '2023-12-01 04:12:42', '2023-12-01 04:12:42', '2024-12-01 04:12:42'),
('25588572ce7ceffac301a6462d20cc7947106f81389d808e8ceaa6d213156f558a0021a57f749e77', 2, 2, NULL, '[\"*\"]', 0, '2023-11-01 12:42:56', '2023-11-01 12:42:56', '2024-11-01 12:42:56'),
('26c2e07fd06c5b42141d337e3c0d8647d21552e9a0a5308545fda9d3cd477d6e50246a31ad2a17cf', 42, 2, NULL, '[\"*\"]', 0, '2023-12-10 13:39:56', '2023-12-10 13:39:56', '2024-12-10 13:39:56'),
('281d1e7257306f2642a28fb0eda9411714085dd712372ef80ea255a65abc835dfa3b49d49ce28a41', 63, 2, NULL, '[\"*\"]', 0, '2023-12-28 18:16:43', '2023-12-28 18:16:43', '2024-12-28 11:16:43'),
('288ea8acb9221d4661807499b9cf59181af5883f1f0446ed6dedaba0bbbf8d66452a0fd144f44ec4', 28, 2, NULL, '[\"*\"]', 0, '2023-12-07 08:45:53', '2023-12-07 08:45:53', '2024-12-07 08:45:53'),
('29061d4dd8b2f88541a2b0075f428ca53041efbca33a3bc26769354eaddefed21434779c33de089c', 29, 2, NULL, '[\"*\"]', 0, '2024-01-04 13:02:02', '2024-01-04 13:02:02', '2025-01-04 06:02:02'),
('2956adc8d4b344d07c0d43d11b73e430177c72b48051ebd41f99e7e0a83eef6e5e51af44efeca7fb', 55, 2, NULL, '[\"*\"]', 0, '2023-12-22 04:37:27', '2023-12-22 04:37:27', '2024-12-22 04:37:27'),
('2a4d23f4e19632d5dbfd1c6193690bc10127c00ba0d4f894d826b9b418c931ea1ada5ef84610f62c', 55, 2, NULL, '[\"*\"]', 0, '2024-01-02 11:05:29', '2024-01-02 11:05:29', '2025-01-02 04:05:29'),
('2bc10cd248cc1e0abb4aadc089fe89efe58f550fd68d4aec24734be8410f33b73aefaf6b3ec2a504', 28, 2, NULL, '[\"*\"]', 0, '2023-12-06 11:42:06', '2023-12-06 11:42:06', '2024-12-06 11:42:06'),
('2c91182a74fa8d13a58fbfade15c1fdd8a96e23f5c7f2bc3482a5eab4213ccfd033860256c5793a1', 73, 2, NULL, '[\"*\"]', 0, '2024-01-09 12:43:42', '2024-01-09 12:43:42', '2025-01-09 05:43:42'),
('2cb25dff99303b384c76bff975afa398e367822e32c1d7f530f34385be12dde46f5433f040f6bbf5', 47, 2, NULL, '[\"*\"]', 0, '2023-11-06 11:48:50', '2023-11-06 11:48:50', '2024-11-06 11:48:50'),
('2d230e59cfa325792cf7ae39d08bb39d98afa01724787aa3f736e8a95cc80db7ce92744b42a2c0bf', 63, 2, NULL, '[\"*\"]', 0, '2023-12-27 18:04:22', '2023-12-27 18:04:22', '2024-12-27 11:04:22'),
('2d2b364364d03bc8a9592ca1d91a3116a88c3f2b2660e75a071da45a494e91d739cd9bb628531361', 112, 2, NULL, '[\"*\"]', 0, '2023-11-08 05:33:30', '2023-11-08 05:33:30', '2024-11-08 05:33:30'),
('2d37bbba95983c3e684e3795c454c002509280e851b890b5e7dc35cb50dac0821753a99094ca4699', 28, 2, NULL, '[\"*\"]', 0, '2023-12-08 10:34:36', '2023-12-08 10:34:36', '2024-12-08 10:34:36'),
('2d845171362aef55fdb14432c2ffd5972ee49c4bcfbd99d6039d80692cf98ee391434b2f84462026', 55, 2, NULL, '[\"*\"]', 0, '2023-12-21 09:06:53', '2023-12-21 09:06:53', '2024-12-21 09:06:53'),
('2d9214ab084acfef0bfa9ad59cb198503fa8707048c6a9f37c976f7c0909700a0776ae8c7af995c8', 41, 2, NULL, '[\"*\"]', 0, '2023-12-14 06:44:10', '2023-12-14 06:44:10', '2024-12-14 06:44:10'),
('2e79408fb3df75d9c93c163089f072d8292d103c888e2d5fb17e92d7fc4f8b72a4f8b49fa6aed4c6', 60, 2, NULL, '[\"*\"]', 0, '2023-12-22 10:25:36', '2023-12-22 10:25:36', '2024-12-22 10:25:36'),
('30041fe8c1c79bdc369ecd6b2a3af0e3d9b14472ab54e3fa16484566030dbddddcbaef428e714804', 29, 2, NULL, '[\"*\"]', 0, '2023-12-14 11:46:33', '2023-12-14 11:46:33', '2024-12-14 11:46:33'),
('3064fb85ad6c0a4be9c2ee3ee59fc050166e3fb114a49cfa3bc23fbc097fb1437b32e0ccb106b291', 1, 2, NULL, '[\"*\"]', 0, '2023-12-13 04:38:47', '2023-12-13 04:38:47', '2024-12-13 04:38:47'),
('316ea7b266f7aeedcf469b93dda901b0f336e77c3feb1bb1a0c46ddae401ef05c473ba4525faad32', 1, 2, NULL, '[\"*\"]', 0, '2023-12-18 10:43:06', '2023-12-18 10:43:06', '2024-12-18 10:43:06'),
('318cb09f42c4d129c3d9efe0f14e5028e481ea471323908d6e715d8e1c90152f39a16c716b2640b1', 1, 2, NULL, '[\"*\"]', 0, '2023-12-22 07:26:25', '2023-12-22 07:26:25', '2024-12-22 07:26:25'),
('31f6ba30f635ded824d24aaf97313de73385dd26554f43c97f71355c1546c9eb1428f9c2b822a1ce', 28, 2, NULL, '[\"*\"]', 0, '2023-12-11 06:51:05', '2023-12-11 06:51:05', '2024-12-11 06:51:05'),
('32e5a241f780a1555fb0dff7615f3b21863966ff9e21d6b2bc74c090d56bcc57916d230a1a4904ff', 39, 2, NULL, '[\"*\"]', 0, '2023-12-08 05:14:32', '2023-12-08 05:14:32', '2024-12-08 05:14:32'),
('34810c363e93783c6278f39ac31839bab84f4757c28390b1bf02674d0636c3874690b86321881cc2', 40, 2, NULL, '[\"*\"]', 0, '2023-12-12 07:10:10', '2023-12-12 07:10:10', '2024-12-12 07:10:10'),
('34de5c000120762f355c18f05589c536c10854046c6d7044b9b18ff8105c52ea94f5f16d3cbebc53', 63, 2, NULL, '[\"*\"]', 0, '2024-01-04 11:13:06', '2024-01-04 11:13:06', '2025-01-04 04:13:06'),
('36a8bb2995b879986d6b50ae1b5a04f204af7f6a0ea50f04741f9c618901f05fd96c1202ad14dc38', 18, 2, NULL, '[\"*\"]', 0, '2023-11-10 05:22:52', '2023-11-10 05:22:52', '2024-11-10 05:22:52'),
('37069f735b1c2e7d46e59b8231d0644787750d859601059bc988b3933d1ac455fb130289dfea2283', 84, 2, NULL, '[\"*\"]', 0, '2023-11-01 04:14:48', '2023-11-01 04:14:48', '2024-11-01 04:14:48'),
('38c71e77e5446c6773781a63b04247fbf4197ba49302bd0ee59105750cc29f240a3b543ee738ee7d', 28, 2, NULL, '[\"*\"]', 0, '2023-12-12 07:09:38', '2023-12-12 07:09:38', '2024-12-12 07:09:38'),
('39a8b913ca3d8866f1837943ef6d7b71efcb574686e60f47f992dbfe14fe23c1d08e336f9672fa43', 44, 2, NULL, '[\"*\"]', 0, '2023-10-23 05:15:51', '2023-10-23 05:15:51', '2024-10-23 05:15:51'),
('39e24356ae9ad9990065853dbe55c536542ec49aeabd5067c00686d5d38898738b8469eeb370457d', 55, 2, NULL, '[\"*\"]', 0, '2023-12-21 09:14:21', '2023-12-21 09:14:21', '2024-12-21 09:14:21'),
('3a4d0765291e3ce9ab782221a82795d539b5464c7a02bffc4bf2edbf3d65f33248f7d1e1a4ee24f0', 29, 2, NULL, '[\"*\"]', 0, '2023-12-14 11:18:23', '2023-12-14 11:18:23', '2024-12-14 11:18:23'),
('3db216e86fe752e387daebaecc8123ad80cde640bd03378c1376401140da586d8622b2ffe66ac4f2', 37, 2, NULL, '[\"*\"]', 0, '2023-12-18 07:20:58', '2023-12-18 07:20:58', '2024-12-18 07:20:58'),
('3fc58e54ff3bca421b52758fbf5fe980f9c73b164f34be1624e914d7f745415fee3e7d933f60f196', 1, 2, NULL, '[\"*\"]', 0, '2023-12-06 09:45:34', '2023-12-06 09:45:34', '2024-12-06 09:45:34'),
('3fc7574ec7dc571c6a71dded64723c9675b1e65ddac2c3e80acbb2593e5c9f078e05971dda08248a', 75, 2, NULL, '[\"*\"]', 0, '2024-01-11 10:06:52', '2024-01-11 10:06:52', '2025-01-11 10:06:52'),
('4105b16d7681243b47dd95e45a11cbb64f589e1ad93fdb20646ed512fde70e595743d9f0229aad94', 55, 2, NULL, '[\"*\"]', 0, '2023-12-22 05:25:51', '2023-12-22 05:25:51', '2024-12-22 05:25:51'),
('411df6b8613ff57e87e7dd26afd3aecc5fdacdf38deb8728090b365e28b11fae0fe7353ce032d2e6', 72, 2, NULL, '[\"*\"]', 0, '2024-01-09 12:39:46', '2024-01-09 12:39:46', '2025-01-09 05:39:46'),
('4175451ed111f779359d5cd5586d233e930812873d5d2d3f929e5660a1f73f756f797351629ab79b', 55, 2, NULL, '[\"*\"]', 0, '2023-12-28 14:16:59', '2023-12-28 14:16:59', '2024-12-28 07:16:59'),
('417590f6002302362d5e3233d8deb24e95d5dce12fb451a51c8f2b929fbbc9d1187f4621fd5108d6', 54, 2, NULL, '[\"*\"]', 0, '2023-12-20 10:32:28', '2023-12-20 10:32:28', '2024-12-20 10:32:28'),
('41db40a441abfb12943c9d58a523331ae36449db523e271ca713c98883e643dd0db2084b77312956', 3, 2, NULL, '[\"*\"]', 0, '2023-10-24 10:31:50', '2023-10-24 10:31:50', '2024-10-24 10:31:50'),
('41dd4eafa556c1e731bc81720887ca5f8365ff8ce169dd7825df9c0f34e7676157b6b0d5eaf45de4', 28, 2, NULL, '[\"*\"]', 0, '2023-12-04 06:15:07', '2023-12-04 06:15:07', '2024-12-04 06:15:07'),
('41f64ce9633bae3b90d862b72e57a2fb8addf7ac77a6028f2aa838de89b45fd11ca150e35885e2c4', 3, 2, NULL, '[\"*\"]', 0, '2023-10-20 10:24:51', '2023-10-20 10:24:51', '2024-10-20 10:24:51'),
('430a5f73bb3324dc60e7c44cd1508ae4601866d85c67ecc076384fcef4a708e1d53c65877f253d62', 40, 2, NULL, '[\"*\"]', 0, '2023-12-08 09:01:51', '2023-12-08 09:01:51', '2024-12-08 09:01:51'),
('433a315f9aa095ecc708cbb7b7d9d45aebb6d6d083034b11270fffa6399d2c6189d413443aaba4fc', 28, 2, NULL, '[\"*\"]', 0, '2023-12-04 06:19:27', '2023-12-04 06:19:27', '2024-12-04 06:19:27'),
('45203cc1104b5ad525ea41ea8da593ad3a0a25c1a59e8293cceea18317211a04140353bc6f67bdcd', 28, 2, NULL, '[\"*\"]', 0, '2023-12-26 18:25:17', '2023-12-26 18:25:17', '2024-12-26 11:25:17'),
('467c97747193d987121b869edce1e003d762c9bb4d99d7e51e6c1868ccf793cd68740fd4108c5f12', 28, 2, NULL, '[\"*\"]', 0, '2023-11-30 03:56:51', '2023-11-30 03:56:51', '2024-11-30 03:56:51'),
('48bf9c0325d28456ce7217a53a45d359a95c3ece94a43495b9d11ecafa2e9ad80f0373243e3c2c71', 7, 2, NULL, '[\"*\"]', 0, '2024-01-04 16:52:54', '2024-01-04 16:52:54', '2025-01-04 09:52:54'),
('48f97ea88319cba01232f7c1f89d7f084f6376dffdc7ab696174c0a7f99e28d204c633d067ebd1c3', 74, 2, NULL, '[\"*\"]', 0, '2023-11-03 11:42:12', '2023-11-03 11:42:12', '2024-11-03 11:42:12'),
('4966af976b1c8d4f5c2e9be8792aed6ddea8b046536e97a62e50b78cec39478d0f7d5e89e4927511', 63, 2, NULL, '[\"*\"]', 0, '2023-12-29 12:01:07', '2023-12-29 12:01:07', '2024-12-29 05:01:07'),
('497836cec1889926d97eb8b93c24e364419268fe82124d14553d1f34ee309533a5359b3c43c3763f', 114, 2, NULL, '[\"*\"]', 0, '2023-11-08 06:05:21', '2023-11-08 06:05:21', '2024-11-08 06:05:21'),
('49a28edf2fd89e636ce24b377500e376dd6bfa139f7ffd95aa858404bcc662cbae197922f27ffccd', 63, 2, NULL, '[\"*\"]', 0, '2023-10-27 11:18:59', '2023-10-27 11:18:59', '2024-10-27 11:18:59'),
('4aaa57126fb637a279af0b49c4ed472873769f2c8ae7ef919feb9864c17438dcc4606fd38a6ea823', 54, 2, NULL, '[\"*\"]', 0, '2023-10-25 08:24:12', '2023-10-25 08:24:12', '2024-10-25 08:24:12'),
('4aba914c1bdae75bdd73db293980e6b291fc66373ec97fd5afc515f6b255fb012b87a47e328957fa', 44, 2, NULL, '[\"*\"]', 0, '2023-10-27 11:50:55', '2023-10-27 11:50:55', '2024-10-27 11:50:55'),
('4c0207bf29fd28177fc1cbc89d05be2f63f4e9b7a33545f54abab36efe7a60182556806e22318481', 1, 2, NULL, '[\"*\"]', 0, '2023-12-13 05:48:13', '2023-12-13 05:48:13', '2024-12-13 05:48:13'),
('4c5f1194a98bb1deeda8f1cf488c550a03ee90e5d554bfca055bacb2c389276efae3cbdeb0d34d11', 54, 2, NULL, '[\"*\"]', 0, '2023-12-19 06:16:44', '2023-12-19 06:16:44', '2024-12-19 06:16:44'),
('4ce08974d7f1e416109d712dc742f9d390cf68f8bc322fed36115fffbeef807fff3af9ea93c8aebb', 52, 2, NULL, '[\"*\"]', 0, '2024-01-05 16:34:47', '2024-01-05 16:34:47', '2025-01-05 09:34:47'),
('4d1e8dfd2abf30d97611825347c4c4956b3655a75ba586dd47e397b5ca1f1c1bdfcf7c53c8ee9238', 54, 2, NULL, '[\"*\"]', 0, '2023-12-18 07:17:44', '2023-12-18 07:17:44', '2024-12-18 07:17:44'),
('4d56665c4b40145dc4b2ab2e63cb4c15129d08b4c69e1525895344688646cb315d9611dd4e9a3e7a', 45, 2, NULL, '[\"*\"]', 0, '2023-12-10 14:54:08', '2023-12-10 14:54:08', '2024-12-10 14:54:08'),
('4e025482e564b19f6fb452bf21705d83910691787944f0f99362c03c5a33e76c1166905f31fd42ea', 41, 2, NULL, '[\"*\"]', 0, '2023-12-12 07:13:19', '2023-12-12 07:13:19', '2024-12-12 07:13:19'),
('4f774323a3e8cb49bd8e60e54621be02f150f3fda0bd5638d684a9ce435a5c7c1db975f92dbe4003', 76, 2, NULL, '[\"*\"]', 0, '2024-01-11 10:15:38', '2024-01-11 10:15:38', '2025-01-11 10:15:38'),
('50c0098088311a0de370de3183df776f44da23caf409a34a596009eb237fc0dfeb3a7d5f451efb6f', 1, 2, NULL, '[\"*\"]', 0, '2023-12-08 07:19:29', '2023-12-08 07:19:29', '2024-12-08 07:19:29'),
('50ed292d5c8968e75dba939817db4f3308ec352fc04bd2e2180b629bf0178085326c16ac6c2a47e3', 1, 2, NULL, '[\"*\"]', 0, '2023-12-07 08:24:14', '2023-12-07 08:24:14', '2024-12-07 08:24:14'),
('5141c86f0d043a4621dbd5931325b1a9e97172bb1f3f70d3620688fdf7009a345d43553b12effb35', 47, 2, NULL, '[\"*\"]', 0, '2023-11-08 06:21:24', '2023-11-08 06:21:24', '2024-11-08 06:21:24'),
('524aaab50ccc047b11dfa8d4487cafcde499581d42f20215122d92d9fd934b9e1555e72c79674159', 10, 2, NULL, '[\"*\"]', 0, '2023-11-08 10:31:50', '2023-11-08 10:31:50', '2024-11-08 10:31:50'),
('54bf07654f9670a21dcc0fa25535cb14d58f2356483dcc4d2f74ec6dd1e3c83f358b83bee1dc77d7', 28, 2, NULL, '[\"*\"]', 0, '2023-11-29 12:12:36', '2023-11-29 12:12:36', '2024-11-29 12:12:36'),
('5528093de4a9ce12d34793708c0c7a43ef3143864905dec90b8d3cfe6070208deb0082dce7845eac', 12, 2, NULL, '[\"*\"]', 0, '2023-11-09 11:28:36', '2023-11-09 11:28:36', '2024-11-09 11:28:36'),
('556c941f751b09df65a27bc9f7e51150aac7c31549f4fd5e007fa87109d9fded280f03e04bfecbb5', 19, 2, NULL, '[\"*\"]', 0, '2023-11-10 06:07:32', '2023-11-10 06:07:32', '2024-11-10 06:07:32'),
('561a87b8bb36a051f8f70d2c15042a8e187e50d393be1cd551fdf114aad29ca322714662cc436af8', 82, 2, NULL, '[\"*\"]', 0, '2023-10-31 10:45:21', '2023-10-31 10:45:21', '2024-10-31 10:45:21'),
('58d45591dd8a948f08bf1e73cd5a67279704a3570ce6eff04ac28ecd91f63f34cdfe607efdec3e0d', 1, 2, NULL, '[\"*\"]', 0, '2023-12-06 07:31:39', '2023-12-06 07:31:39', '2024-12-06 07:31:39'),
('59e51e765d440106ea681d07803177eb612c9b76d2aef899e3f44b0d9c09b2ce2a53b6d319af9b35', 7, 2, NULL, '[\"*\"]', 0, '2023-11-08 10:15:19', '2023-11-08 10:15:19', '2024-11-08 10:15:19'),
('5afb0cbdc2c4abb04bdca4558b1978977416001179f2312d272bb0415e0f3d4491f5b08875b3a523', 55, 2, NULL, '[\"*\"]', 0, '2023-12-20 11:37:38', '2023-12-20 11:37:38', '2024-12-20 11:37:38'),
('5bcd996a55e002d59f11452c61772a038e48d8a66c2ad2073db2cf0aa8f94c6bc75156434455c06e', 54, 2, NULL, '[\"*\"]', 0, '2024-01-01 11:00:07', '2024-01-01 11:00:07', '2025-01-01 04:00:07'),
('5d28e63cb72b582357730162f4a58f3c6cf9365112a8df8afc2616dc4991dd293dad3ba575c09f6d', 28, 2, NULL, '[\"*\"]', 0, '2023-12-07 05:17:01', '2023-12-07 05:17:01', '2024-12-07 05:17:01'),
('5eda10cbf5959b25882a1fe663934c13f62d2e585f2c00ff660f791e8f6408d35e6f07e7eabdd57f', 28, 2, NULL, '[\"*\"]', 0, '2023-12-04 05:35:40', '2023-12-04 05:35:40', '2024-12-04 05:35:40'),
('5f7cf0a0a6653c99a06b5fab43789bf965b920a9fcd86830e1ef561f47b2061c557f6cb554d4a9d7', 98, 2, NULL, '[\"*\"]', 0, '2023-11-06 09:20:15', '2023-11-06 09:20:15', '2024-11-06 09:20:15'),
('61027835fe2806b04eb9fa8186bd5aed3203c8357384c4418d8eab62702383e32700af38f67c664d', 1, 2, NULL, '[\"*\"]', 0, '2023-12-19 11:38:21', '2023-12-19 11:38:21', '2024-12-19 11:38:21'),
('610a7ba322a37e47470e3e566d1398d58fe96de9d9c96f2037ae7332c7e76e5c6535b8f63c12d8e5', 29, 2, NULL, '[\"*\"]', 0, '2024-01-04 12:33:48', '2024-01-04 12:33:48', '2025-01-04 05:33:48'),
('63e1887c29d77586b053cc569b4c458e87fd1b5decda6418e01f5b10c03b529cef85249a8f063e98', 54, 2, NULL, '[\"*\"]', 0, '2023-12-19 05:58:29', '2023-12-19 05:58:29', '2024-12-19 05:58:29'),
('64761a65d4f27400d47989c02c9d16c440ad33d9aef5272ba74d60f59941b33b065c1b45116eafd1', 69, 2, NULL, '[\"*\"]', 0, '2024-01-04 17:57:30', '2024-01-04 17:57:30', '2025-01-04 10:57:30'),
('65df277d2348e6613903a1df2768dd3dd9645938ebaea9205fd56a50c60f963277cb70e0ba3738a4', 29, 2, NULL, '[\"*\"]', 0, '2023-12-15 05:14:03', '2023-12-15 05:14:03', '2024-12-15 05:14:03'),
('6693b4df43a43d263571e0a64fdde256b06d9548798f89c910e4a17a3d345a7b96e694403dadee07', 28, 2, NULL, '[\"*\"]', 0, '2023-12-01 05:11:16', '2023-12-01 05:11:16', '2024-12-01 05:11:16'),
('6781c0e754dcebf5514996ae798564fdad853f35e82cde3457c6c028302dc1b690f696158925fac9', 55, 2, NULL, '[\"*\"]', 0, '2023-12-18 07:27:57', '2023-12-18 07:27:57', '2024-12-18 07:27:57'),
('6a708878087de3967d320f484f3f4e1a36043929a9646ed20ec1ff99b18969a08b834a6a6de14d28', 1, 2, NULL, '[\"*\"]', 0, '2023-12-18 05:52:57', '2023-12-18 05:52:57', '2024-12-18 05:52:57'),
('6bc8e80d9cbfbe11751c868ca769dc97953f207771dd8e65cb3de0af2a0f8f9a3203125fd3cf250e', 24, 2, NULL, '[\"*\"]', 0, '2023-11-23 11:41:35', '2023-11-23 11:41:35', '2024-11-23 11:41:35'),
('6c578c073b00ddfdf87ba96bd2bf44366ec526f72be920462f787034353b4c15813c5bfeed715d71', 66, 2, NULL, '[\"*\"]', 0, '2024-01-01 13:56:17', '2024-01-01 13:56:17', '2025-01-01 06:56:17'),
('6c7e1571bf49223ec189535d137e504b013556af3f6c7d5f277dfa0ba665c317d7c5ce78caf07487', 28, 2, NULL, '[\"*\"]', 0, '2023-12-08 03:47:40', '2023-12-08 03:47:40', '2024-12-08 03:47:40'),
('6c820c7d1278c00df5d29932829735122996d680e26fec3013d7b05a9d7c4f6c310b417b5849fe99', 53, 2, NULL, '[\"*\"]', 0, '2023-12-14 07:11:08', '2023-12-14 07:11:08', '2024-12-14 07:11:08'),
('6e28d85f61e562d810446bec66b3ee25ce848f94b028f33c2f5b749eafdf3fbcfdb2ba8b67713031', 28, 2, NULL, '[\"*\"]', 0, '2023-11-30 11:06:03', '2023-11-30 11:06:03', '2024-11-30 11:06:03'),
('6f29cc2639c49769f54653cb706c3735496abd81d07e9c431e099b9874b93a10fabf20fb4f0c1247', 49, 2, NULL, '[\"*\"]', 0, '2023-10-25 04:14:29', '2023-10-25 04:14:29', '2024-10-25 04:14:29'),
('705e99cd4c4810d63fed309896272c398b3da22995bff67eae62c31ed52fd6bc75834873063e27b4', 1, 2, NULL, '[\"*\"]', 0, '2023-12-06 08:57:16', '2023-12-06 08:57:16', '2024-12-06 08:57:16'),
('71b4c03b25420d5a7ed42924f778d21698a74400435670a4aa94ad33e0876138856162c44c3e1843', 54, 2, NULL, '[\"*\"]', 0, '2023-12-20 05:22:50', '2023-12-20 05:22:50', '2024-12-20 05:22:50'),
('721c553b16707cf7bd0c9843d1b67ef0afda54b5c79e8e0d26594bc3a8017c944c4a58cfc7d56a7a', 1, 2, NULL, '[\"*\"]', 0, '2023-12-20 11:19:29', '2023-12-20 11:19:29', '2024-12-20 11:19:29'),
('734c7bf94223863a48d0f1e412ab78702d37254a92b453bc1639a65e7183d5c504a861bf0c9b93cf', 78, 2, NULL, '[\"*\"]', 0, '2023-10-30 05:08:12', '2023-10-30 05:08:12', '2024-10-30 05:08:12'),
('735484f02bfe519076d575e0566e5b5631a8a2a0bf8a36eb49159176e8ad20fa5681144351bcce31', 28, 2, NULL, '[\"*\"]', 0, '2023-12-06 10:54:26', '2023-12-06 10:54:26', '2024-12-06 10:54:26'),
('73e287f773b2112d7308b60b88adf9cdeb63a67085fca76f86373ff28bd803ff747032e040590a58', 70, 2, NULL, '[\"*\"]', 0, '2024-01-05 12:09:55', '2024-01-05 12:09:55', '2025-01-05 05:09:55'),
('755cf4b9ab6d563d5b21572570078f8ff0e110155bae8d972ee6a9177ca857a291d1b12172bfaf2a', 47, 2, NULL, '[\"*\"]', 0, '2023-11-06 04:13:07', '2023-11-06 04:13:07', '2024-11-06 04:13:07'),
('755e5e9184f565c988bb165d1ba94fe51971e73531b7a27257a4916ad5cbaa138c8a6916cbb8d77b', 56, 2, NULL, '[\"*\"]', 0, '2023-12-19 11:06:55', '2023-12-19 11:06:55', '2024-12-19 11:06:55'),
('75c5f89887b3b34d5c17d6a79ec86510a85f0c75ac820da7337e0f45049c7f8ff63c89ea51aeec4d', 56, 2, NULL, '[\"*\"]', 0, '2023-10-27 09:49:14', '2023-10-27 09:49:14', '2024-10-27 09:49:14'),
('768c7dc56bbcd2249bb5818c4f665d6c877713319c5dd5209c97cc87e9dcf3a5fc4f51f67e657e96', 47, 2, NULL, '[\"*\"]', 0, '2023-11-02 03:51:42', '2023-11-02 03:51:42', '2024-11-02 03:51:42'),
('77a4d7ca36a7a1bff70ab3c3ae88fe548408f342e93127633f578cc3fd4dbb4a5ef153b79022ac00', 72, 2, NULL, '[\"*\"]', 0, '2023-10-27 12:08:34', '2023-10-27 12:08:34', '2024-10-27 12:08:34'),
('77ddc7214760a60ba5a9f513f724810fd58838bafe3993baff17a5480f1a50428472b8396df7703e', 38, 2, NULL, '[\"*\"]', 0, '2023-12-07 10:50:11', '2023-12-07 10:50:11', '2024-12-07 10:50:11'),
('78449d2d28908ab2b0b63108442fa04deec4f5a9091bdc16e092ce126a4a3a3ef09b6beedbc23674', 28, 2, NULL, '[\"*\"]', 0, '2023-12-13 05:55:28', '2023-12-13 05:55:28', '2024-12-13 05:55:28'),
('7902005cf035bfd8d263c77cc3df665df0cdeb9c47a180152632d73438e58aa1eb54ecd43a79cb0f', 56, 2, NULL, '[\"*\"]', 0, '2023-12-25 06:43:44', '2023-12-25 06:43:44', '2024-12-25 06:43:44'),
('7928a649e005f652ad7c74fcaff11ce05c958e2a299fd59986f2bb86fd3c631f78ea51e1eb64dc44', 54, 2, NULL, '[\"*\"]', 0, '2023-12-19 04:42:36', '2023-12-19 04:42:36', '2024-12-19 04:42:36'),
('7991b8bdfcfaf92404e229e6321f3285eb28040b421e62a734ec92d1db04403ed577bb837653078c', 9, 2, NULL, '[\"*\"]', 0, '2023-11-08 12:41:50', '2023-11-08 12:41:50', '2024-11-08 12:41:50'),
('7b4c22f2bb092a5fe6aa4853c857b2dc8538705a443ea7796da93f4f6f6e08dea3b9f09eacca6ef2', 1, 2, NULL, '[\"*\"]', 0, '2023-12-06 10:28:59', '2023-12-06 10:28:59', '2024-12-06 10:28:59'),
('7c92e9aa91c6f852e03499e06f83521f202a788cdfc3de6666b034778c8c19b02812c1440b624f07', 8, 2, NULL, '[\"*\"]', 0, '2023-11-08 10:20:18', '2023-11-08 10:20:18', '2024-11-08 10:20:18'),
('7e50ba48ec24ff8f7f34ac6312ee307daef36c148593dc14bc9f973bb13bfa4dcf70bac1ce211c23', 28, 2, NULL, '[\"*\"]', 0, '2023-11-29 06:27:15', '2023-11-29 06:27:15', '2024-11-29 06:27:15'),
('7e9280bd76bc16af2bb83c6f0d3028b1f935f4ca38b3cf67a30206d4fd3ae787ac0ecd29f422e433', 48, 2, NULL, '[\"*\"]', 0, '2023-10-25 04:04:43', '2023-10-25 04:04:43', '2024-10-25 04:04:43'),
('7ec701f4cb4bf3e7340a8e4f49f4f60b32a2eccef3c695584af212d5e6ac01c15a6aefaa57aeea1a', 38, 2, NULL, '[\"*\"]', 0, '2024-01-01 12:23:24', '2024-01-01 12:23:24', '2025-01-01 05:23:24'),
('7f4536b7fdcb10f4b5e9e6e027163bf26bbce51583cd8e09190580e2e173c72b733e097f8f851c62', 52, 2, NULL, '[\"*\"]', 0, '2023-12-14 06:50:16', '2023-12-14 06:50:16', '2024-12-14 06:50:16'),
('7fb6f0e787238d25bf1c8f7674117792510848ba0fa643eafd296ed0b92761f14643850d70a19a29', 29, 2, NULL, '[\"*\"]', 0, '2024-01-09 11:49:22', '2024-01-09 11:49:22', '2025-01-09 04:49:22'),
('7fdcd01563ffb52460ce42b752373492ba2e5a5c0d09e1de5ff8a1a9ccf95fe3b47a60cef5192470', 28, 2, NULL, '[\"*\"]', 0, '2023-11-29 12:29:07', '2023-11-29 12:29:07', '2024-11-29 12:29:07'),
('8000ecb2e1355b5184f9ede03ead86379d099032fee6da1dded7a2f2424a46e8c897bbffbe72beb6', 28, 2, NULL, '[\"*\"]', 0, '2023-11-30 05:35:14', '2023-11-30 05:35:14', '2024-11-30 05:35:14'),
('810039a19001369792a805c41dadf667b4309ee6323f788b9b590e30f843f6e81b404485c36482b6', 23, 2, NULL, '[\"*\"]', 0, '2023-11-22 17:21:14', '2023-11-22 17:21:14', '2024-11-22 17:21:14'),
('814e97504b45936ceda188813ac8efcb3a8b63601fce56fd18c9e90dd72eb81dc6214ac36985bd15', 1, 2, NULL, '[\"*\"]', 0, '2023-12-13 12:04:28', '2023-12-13 12:04:28', '2024-12-13 12:04:28'),
('8213ec91f45cb69041a56443a293f3995f67945bbea82ce7e75a1731c6ebd057cc01cc820b74a823', 55, 2, NULL, '[\"*\"]', 0, '2023-12-21 09:34:59', '2023-12-21 09:34:59', '2024-12-21 09:34:59'),
('82cf2378afbd53e55629d5954579ecf8bcdf00fd1851294f727a618e41834b46e0c6aa338ec3f23e', 56, 2, NULL, '[\"*\"]', 0, '2023-12-22 05:19:51', '2023-12-22 05:19:51', '2024-12-22 05:19:51'),
('837e33a4711e5a7f47b2689d7dd6f9138d926656b13bfa626897192210d860bfa92af09d2a9a03c2', 80, 2, NULL, '[\"*\"]', 0, '2023-10-30 06:02:10', '2023-10-30 06:02:10', '2024-10-30 06:02:10'),
('837ea681862fcb7ed96b2077760975555a44252682d1fd5a57cfaf692b17b0adcb0c242efea502e0', 75, 2, NULL, '[\"*\"]', 0, '2023-10-27 13:19:28', '2023-10-27 13:19:28', '2024-10-27 13:19:28'),
('83d86c5638840d849a5d1208173a15340699e268815a8223b65afe4a53aec8cba18a919edaf05045', 3, 2, NULL, '[\"*\"]', 0, '2023-10-24 10:30:51', '2023-10-24 10:30:51', '2024-10-24 10:30:51'),
('83f20c098ba1aa35be60af0355609485d9a02619f04a43f7aef16906ef3590add059c5dfa0218624', 1, 2, NULL, '[\"*\"]', 0, '2023-12-08 09:21:30', '2023-12-08 09:21:30', '2024-12-08 09:21:30'),
('855f4b199aecf42a9dd35296ec7bf38f1b5f9d98f319d55e712861c99e6be55cb2d6fdf86eb06dd5', 28, 2, NULL, '[\"*\"]', 0, '2023-12-14 05:51:55', '2023-12-14 05:51:55', '2024-12-14 05:51:55'),
('85ddfffd18679a4a944ad8132277b168f8e5542c9aa88e93523ce7adbf7e5367ec02172cbcc24d89', 28, 2, NULL, '[\"*\"]', 0, '2023-12-18 07:06:03', '2023-12-18 07:06:03', '2024-12-18 07:06:03'),
('85dfa0f3e6bcc48123a0d08ae417efc3cabeca62583c341bb6c01c3f78aae7f36bedacf28506acaf', 55, 2, NULL, '[\"*\"]', 0, '2023-12-21 09:26:55', '2023-12-21 09:26:55', '2024-12-21 09:26:55'),
('8611607ce462b340f8f529e6e276c5851ba54b4467d13848f762814b35473f4cc17ab0cb5f897b92', 111, 2, NULL, '[\"*\"]', 0, '2023-11-08 07:15:01', '2023-11-08 07:15:01', '2024-11-08 07:15:01'),
('868d2cb360b4cc35faa6272b40b277afc81f1827aeccd88af01e898d4eb10aadd7d31d2de1cccf30', 93, 2, NULL, '[\"*\"]', 0, '2023-11-03 11:49:11', '2023-11-03 11:49:11', '2024-11-03 11:49:11'),
('86f73af2d17adf1ce43e42e7b34990ca7a6f2540dc2a49c2d02ad6fbf1392bafb24d8758cc1456fb', 62, 2, NULL, '[\"*\"]', 0, '2023-12-24 13:07:57', '2023-12-24 13:07:57', '2024-12-24 13:07:57'),
('86fd6bc1999bad3acb0decaf7de47d9538aa8ef386d037a103786ba9f4a9870a3e9aff0e8509c70a', 40, 2, NULL, '[\"*\"]', 0, '2023-12-11 09:48:53', '2023-12-11 09:48:53', '2024-12-11 09:48:53'),
('8790b52008b800c471321da793d6e713085808244f760914ea7f21f5bb5baace95186b86f272fa73', 81, 2, NULL, '[\"*\"]', 0, '2023-10-30 05:35:11', '2023-10-30 05:35:11', '2024-10-30 05:35:11'),
('884babcd17fe09a66ff02dbb0ba22c843357dadefbdba9a83b7a94f248dcd1e67635faf85dd07b4c', 38, 2, NULL, '[\"*\"]', 0, '2023-12-08 05:00:42', '2023-12-08 05:00:42', '2024-12-08 05:00:42'),
('8b56f8d9c8fa269895313a8bb9ff88560e91e082341174d7a2b1f2d56d1367e00e1ecebd500229d0', 69, 2, NULL, '[\"*\"]', 0, '2024-01-09 12:06:28', '2024-01-09 12:06:28', '2025-01-09 05:06:28'),
('8b9eeece8832012d67de73953e63f375b4cb2685bee02e65c235253971fb6ec755dbd290b6e624e3', 47, 2, NULL, '[\"*\"]', 0, '2023-11-07 08:36:04', '2023-11-07 08:36:04', '2024-11-07 08:36:04'),
('8e571d696dca8023583c3fd7ae7f54e727d4d665948e39e84f2a45148101dda034547fbbb8d94bef', 33, 2, NULL, '[\"*\"]', 0, '2023-12-04 08:47:07', '2023-12-04 08:47:07', '2024-12-04 08:47:07'),
('8f125ca13d75fb47db2e63b9f071cbcaf662873f734073cd4387b23de08fbcec33cfa8d05b62d541', 74, 2, NULL, '[\"*\"]', 0, '2023-11-02 12:33:53', '2023-11-02 12:33:53', '2024-11-02 12:33:53'),
('8f6e256aa2ffba300f999ac84ff7db45865d6d997d141a88b295191834086870f27df307c6eeee6a', 1, 2, NULL, '[\"*\"]', 0, '2023-12-07 11:24:48', '2023-12-07 11:24:48', '2024-12-07 11:24:48'),
('8fc8b6ffce603326d9da02eebba6e4a430cbbeed7bd815ba6f2613aa1b1c570d169ca7aff7d0d977', 46, 2, NULL, '[\"*\"]', 0, '2023-12-10 14:58:09', '2023-12-10 14:58:09', '2024-12-10 14:58:09'),
('90ab52324ecdff59e0ce98ee38af51acc2d1a2fec81eb0bea517ff75748bb6b5b59c7f3d3c4491ec', 3, 2, NULL, '[\"*\"]', 0, '2023-10-27 09:02:42', '2023-10-27 09:02:42', '2024-10-27 09:02:42'),
('913b730e25576726e3a71f6e60f913825fc10a1f29ae210079033f94f1206fda7baee48c250eb596', 3, 2, NULL, '[\"*\"]', 0, '2023-10-23 03:16:37', '2023-10-23 03:16:37', '2024-10-23 03:16:37'),
('9249b928564c358951c63546ad317ca4385f8cc7ea228a8644924977d341751cd7a30bea3f3777cb', 49, 2, NULL, '[\"*\"]', 0, '2023-12-10 15:13:49', '2023-12-10 15:13:49', '2024-12-10 15:13:49'),
('9261ed673c994edad6ca6509559eae3c90903fe30a2e9ff7bd9a66f5ae8788c06d2326fe335313f6', 55, 2, NULL, '[\"*\"]', 0, '2023-12-27 17:17:37', '2023-12-27 17:17:37', '2024-12-27 10:17:37'),
('928cfa829cdd9cdfd7a9496b29fb27a109f5f9821d1b6a63214efbddb945778020088903da210b6a', 1, 2, NULL, '[\"*\"]', 0, '2023-12-19 09:55:23', '2023-12-19 09:55:23', '2024-12-19 09:55:23'),
('92ecba6bbc2375c75345e81f81dfe1e0dbf7a9914963b1e8dc8fa6a2165c6cf232f8ade6ddd30dd2', 72, 2, NULL, '[\"*\"]', 0, '2024-01-09 12:41:35', '2024-01-09 12:41:35', '2025-01-09 05:41:35'),
('941bdcea8ccb21ed97edec125b90252b8bf5167e1e5f6b9322025e026142ea260566522064f050a5', 1, 2, NULL, '[\"*\"]', 0, '2023-12-21 12:08:06', '2023-12-21 12:08:06', '2024-12-21 12:08:06'),
('96485407fee44208a1bea93f8500805a3ae5db992f14b2e51e38e8ffd74dd013b3dcdd51306e5178', 29, 2, NULL, '[\"*\"]', 0, '2023-11-28 12:06:08', '2023-11-28 12:06:08', '2024-11-28 12:06:08'),
('964b7d296c03eefa61f02706f930b5d7073ebe0908db9784e34bfbeb0e0d96a2872090ffee2339e5', 28, 2, NULL, '[\"*\"]', 0, '2023-11-28 10:43:51', '2023-11-28 10:43:51', '2024-11-28 10:43:51'),
('97fc0292ab15e23d6797093a560e0b4d59e2d7148af77806ab7098434edec4ad9ed06c59b66237cf', 28, 2, NULL, '[\"*\"]', 0, '2023-12-22 09:03:31', '2023-12-22 09:03:31', '2024-12-22 09:03:31'),
('980984298421415944debdb2df5cdc0fbbb808015a0f6ed4fff15a453df796f2706b84a4b0750ed2', 9, 2, NULL, '[\"*\"]', 0, '2023-11-08 10:26:52', '2023-11-08 10:26:52', '2024-11-08 10:26:52'),
('98654eeab37b33f5d29c5500f443b032ececad549efefcd06f0b04d416944e113ddb9e9f9f6f64bc', 90, 2, NULL, '[\"*\"]', 0, '2023-11-02 12:54:17', '2023-11-02 12:54:17', '2024-11-02 12:54:17'),
('9903c6aa0cd6f2c10cee639ce96883a3540b24819cc277e4a2f6342935681d7266fc4d9887f5220c', 37, 2, NULL, '[\"*\"]', 0, '2023-12-06 10:40:17', '2023-12-06 10:40:17', '2024-12-06 10:40:17'),
('991c1a89a9c3346471d032e648345afccc9385d00982ef8233c7268f02362d8f99e12a547d2cc8ac', 28, 2, NULL, '[\"*\"]', 0, '2023-12-11 05:18:05', '2023-12-11 05:18:05', '2024-12-11 05:18:05'),
('9a89a2fe695a6c62420acd988c387d046a624a807f66dae00052704433e6e775f53443f7c6ac3ef0', 1, 2, NULL, '[\"*\"]', 0, '2023-12-19 11:22:13', '2023-12-19 11:22:13', '2024-12-19 11:22:13'),
('9b034a5ca58cc36de5f4008c675e75df16c8d7533c56fca90defe6a003bed7530b72b9997e6751da', 111, 2, NULL, '[\"*\"]', 0, '2023-11-08 05:38:00', '2023-11-08 05:38:00', '2024-11-08 05:38:00'),
('9b0d28929d382d3de1bb8f00f1c213899ff76d4c842ed6aeaf192c7afeb63fc8152be1a14fee8a84', 1, 2, NULL, '[\"*\"]', 0, '2023-12-19 04:05:42', '2023-12-19 04:05:42', '2024-12-19 04:05:42'),
('9b1d4fd2a3e89a46e355c59bb61725baf6f5052ccd3b8a6eb4dacb39ef03a95482c95f7dd68bb03c', 28, 2, NULL, '[\"*\"]', 0, '2023-12-06 10:27:38', '2023-12-06 10:27:38', '2024-12-06 10:27:38'),
('9d0c7f6b37f3eae6e5189b00f4732ef03df963be34c30f1e9f17b8128b1651345d9e2fc5abe289c8', 44, 2, NULL, '[\"*\"]', 0, '2023-12-10 14:47:57', '2023-12-10 14:47:57', '2024-12-10 14:47:57'),
('9e8c185c86492c7e8d8040cf02f129c86133113c7863af48532e8f56152902639ab2287581e66c11', 56, 2, NULL, '[\"*\"]', 0, '2023-12-20 04:53:08', '2023-12-20 04:53:08', '2024-12-20 04:53:08'),
('a0062d1d1d8fcd823ffb63c0c235218edc46b624eb843fe19f97f0857fc64d82c9fe1215b22ad085', 11, 2, NULL, '[\"*\"]', 0, '2023-12-08 04:52:43', '2023-12-08 04:52:43', '2024-12-08 04:52:43'),
('a01c5e2774b081c8efd813874a14ea3fbe15a40890b32bcec141314236a99cf49b36aedb1f874270', 9, 2, NULL, '[\"*\"]', 0, '2023-11-09 08:27:49', '2023-11-09 08:27:49', '2024-11-09 08:27:49'),
('a0b9a5bbd458218a3e52fd1ebf713b0de9ffee01eb000d1d348edc01c94ecd2ff6ff1420814f7531', 3, 2, NULL, '[\"*\"]', 0, '2023-11-08 09:47:35', '2023-11-08 09:47:35', '2024-11-08 09:47:35'),
('a149dac134057bd64e4221a424d2dc1faa288c6bd446840fcf956a2f953fb377115b6ca0f8d3ec82', 28, 2, NULL, '[\"*\"]', 0, '2023-12-01 05:59:55', '2023-12-01 05:59:55', '2024-12-01 05:59:55'),
('a27d3bc299647dfc7bb9fb1bb44987af2b448dbb15eea9d15ec90b2fd0c37d91eca9c4f8fe2ea2dc', 28, 2, NULL, '[\"*\"]', 0, '2023-11-29 09:14:48', '2023-11-29 09:14:48', '2024-11-29 09:14:48'),
('a28bd864f0e3b9992b1787ee8c622b1e1bc2a4a435304e716a9a604fdf71d3a97b1b626ab3c4e0e4', 28, 2, NULL, '[\"*\"]', 0, '2023-11-29 08:49:26', '2023-11-29 08:49:26', '2024-11-29 08:49:26'),
('a502f6e7ddd86956e4340d8cb89067b0baf94446819f766daeb4f30fd65914700ee3a5289bdbd96b', 55, 2, NULL, '[\"*\"]', 0, '2023-12-22 08:44:18', '2023-12-22 08:44:18', '2024-12-22 08:44:18'),
('a54d49249e7331090083485314cdb822528f524d51bc60893f833432bf6489df679b0ce4b3fa0c62', 28, 2, NULL, '[\"*\"]', 0, '2023-11-28 10:39:28', '2023-11-28 10:39:28', '2024-11-28 10:39:28'),
('a60b490dcc565368f128eeb6bd073e26c3c1d031681a135075c88d9e33d9aad7d68b0d47aac2b332', 28, 2, NULL, '[\"*\"]', 0, '2023-12-01 09:19:57', '2023-12-01 09:19:57', '2024-12-01 09:19:57'),
('a6fdb01f7027eb0491c7981efe68e8b3d38e9a976b86609adcb07b8213806c40793e627cfd5917ae', 1, 2, NULL, '[\"*\"]', 0, '2023-12-18 10:49:14', '2023-12-18 10:49:14', '2024-12-18 10:49:14'),
('a7214acec27d011c346c330643cd562b6392380f4497610ef42addececc4affd53a72e1d108a630a', 15, 2, NULL, '[\"*\"]', 0, '2023-11-10 04:23:49', '2023-11-10 04:23:49', '2024-11-10 04:23:49'),
('a752c3d79bc9a6002e8ceb8039f15d5cd606b1c7dac57b31e6e88b16a02149886e6b61e3ed6f7453', 1, 2, NULL, '[\"*\"]', 0, '2023-12-13 08:38:56', '2023-12-13 08:38:56', '2024-12-13 08:38:56'),
('a838c124325018bfed9a26982da8d2089ef87271e17ba89b871bf8bc93cbf41104c134c633303259', 74, 2, NULL, '[\"*\"]', 0, '2023-10-27 13:07:28', '2023-10-27 13:07:28', '2024-10-27 13:07:28'),
('a84cae9e6608878d907dcb5d7a1472c394ecb0b803bfa913833eb8d3f36d10cb45debb11fc87ce61', 61, 2, NULL, '[\"*\"]', 0, '2023-12-23 22:48:22', '2023-12-23 22:48:22', '2024-12-23 22:48:22'),
('ab139c91beb47247399955c83788b83e0a4803cd84854c94b0cdfe0277a2672409c5cc50a1560478', 54, 2, NULL, '[\"*\"]', 0, '2023-12-19 06:26:39', '2023-12-19 06:26:39', '2024-12-19 06:26:39'),
('ab9064f0d848546089c76af0efe4003114c3cb828ca51c48c66c9366f304f1e416812916fcfd05ad', 63, 2, NULL, '[\"*\"]', 0, '2024-01-04 22:19:59', '2024-01-04 22:19:59', '2025-01-04 15:19:59'),
('aba01a4032c17a931da0ef378b459e844fc67ab7e5c7fbbe56d05535916d8fc935adffe5a5959a03', 40, 2, NULL, '[\"*\"]', 0, '2023-12-13 05:55:03', '2023-12-13 05:55:03', '2024-12-13 05:55:03'),
('ac8f4ab557bdac6373c1cb4dca9f0221c3a12ae09a4225640ba42524f5c41ce88aa9db70c4196252', 67, 2, NULL, '[\"*\"]', 0, '2024-01-04 17:12:19', '2024-01-04 17:12:19', '2025-01-04 10:12:19'),
('ad1ee1bd1ac2ade411d8865d397632ee40ab41b9cb04322c5fceccbbb6a45722a132f734cad531a5', 97, 2, NULL, '[\"*\"]', 0, '2023-11-06 08:48:03', '2023-11-06 08:48:03', '2024-11-06 08:48:03'),
('ad47d6ae62497fc36bf98d8bde1e44606bc6e7fa4e49629ecf574d742b84ca396b6692bd2352cfb5', 2, 2, NULL, '[\"*\"]', 0, '2023-11-07 10:58:08', '2023-11-07 10:58:08', '2024-11-07 10:58:08'),
('aef321aee59cc7a4ba9936582a095632e7fc6977f09c11a56891517d2168e061c5907a58dc65097f', 52, 2, NULL, '[\"*\"]', 0, '2024-01-09 12:09:42', '2024-01-09 12:09:42', '2025-01-09 05:09:42'),
('af1a7b1df1c0daec9170b6be50963364ac1022fd70c54641f8bdc63696ef35156220c5dfbe054ac8', 25, 2, NULL, '[\"*\"]', 0, '2024-01-09 12:18:38', '2024-01-09 12:18:38', '2025-01-09 05:18:38'),
('af1c275f2293a474d6eafe90770ec00c40e0b79a22616ff106dc11afb5481ed0a084419fcb49f920', 45, 2, NULL, '[\"*\"]', 0, '2023-10-25 05:15:56', '2023-10-25 05:15:56', '2024-10-25 05:15:56'),
('afa30a34526c6119dfc8f6b4e23f9c05c28cba52cbb5a89d5ff5c0c4b28dfa2110f8c420f0760a98', 55, 2, NULL, '[\"*\"]', 0, '2023-12-21 09:48:02', '2023-12-21 09:48:02', '2024-12-21 09:48:02'),
('afb37dc7bbbafe3236519962d48dffc72e848f3f37ab151df07d730f22e23fa8c125cb5f839d8d43', 15, 2, NULL, '[\"*\"]', 0, '2023-11-20 07:10:41', '2023-11-20 07:10:41', '2024-11-20 07:10:41'),
('b1138217ba0035b88369035aab9f304de5ae50a3311860c74f9e944d7f883674ec7b1ce287df51d2', 28, 2, NULL, '[\"*\"]', 0, '2023-12-14 06:08:23', '2023-12-14 06:08:23', '2024-12-14 06:08:23'),
('b1da2ef11adf3a76d61f6f230974ebee028bf630950f0847b86ae20e4a92f17e2ea5c54197c75a00', 22, 2, NULL, '[\"*\"]', 0, '2023-12-10 12:44:10', '2023-12-10 12:44:10', '2024-12-10 12:44:10'),
('b25170095b28384264a87c5c1130d8e777dfab1ec35c4036bef7a84ac5215030c2a666a80af624e4', 28, 2, NULL, '[\"*\"]', 0, '2024-01-11 16:11:01', '2024-01-11 16:11:01', '2025-01-11 09:11:01'),
('b2b2d01e0840ca3460047afc6822fd4881637a93dee5b8261b839249a0cf79f421c7dcd8ec280048', 6, 2, NULL, '[\"*\"]', 0, '2023-11-08 10:07:49', '2023-11-08 10:07:49', '2024-11-08 10:07:49'),
('b4128031109a4e96f26e5394148fa29203303507d30d995defea5a1c41210582512381678893a2ee', 15, 2, NULL, '[\"*\"]', 0, '2023-11-10 06:52:09', '2023-11-10 06:52:09', '2024-11-10 06:52:09'),
('b6bc66c4314871f01354717f45516b802c2e67e99426c6fe1a0f97bdcb127a3d8c0a5aadaccbcb0e', 54, 2, NULL, '[\"*\"]', 0, '2023-12-20 10:02:09', '2023-12-20 10:02:09', '2024-12-20 10:02:09'),
('b6fcf3ff45bbd22cb48a1cde4dc7ef8b9b975e4977e388a8dd8a94eebad884dcbbe9d3ff941dfc48', 28, 2, NULL, '[\"*\"]', 0, '2023-12-27 16:23:52', '2023-12-27 16:23:52', '2024-12-27 09:23:52'),
('b75e8515cd0479a7af7388f27b441a9fb320dd372771d6474db03f3111571fb46d72436e485cab15', 43, 2, NULL, '[\"*\"]', 0, '2023-10-20 11:07:49', '2023-10-20 11:07:49', '2024-10-20 11:07:49'),
('b7dce381e698b0e6762273fda210047af4b7b935daa6d3c40a5ad6e9c6f8e62b25939a3d05bf861d', 1, 2, NULL, '[\"*\"]', 0, '2023-12-19 10:48:15', '2023-12-19 10:48:15', '2024-12-19 10:48:15'),
('b948c2382e7530635ecd29afe29ac824caa9f022a5550e9ca641b34d419d390402f0bb70f3e2285a', 2, 2, NULL, '[\"*\"]', 0, '2023-11-02 07:25:11', '2023-11-02 07:25:11', '2024-11-02 07:25:11'),
('ba07e5feb2799c4ca6b0823eb45f756b28404324e5df6df27900e4e7e4e80a8fc204170a8b712bce', 110, 2, NULL, '[\"*\"]', 0, '2023-11-07 11:24:39', '2023-11-07 11:24:39', '2024-11-07 11:24:39'),
('ba2226746e6ae078a4d6af9061c50a6467a5a569639d9f960382e1ae7d6acfe38a028a712e80468f', 70, 2, NULL, '[\"*\"]', 0, '2023-10-27 11:52:30', '2023-10-27 11:52:30', '2024-10-27 11:52:30'),
('bb810fd69210d402aa8f1b1ece3f43730c08e123343a4cbbbaf0f1e25998386535c585d28ae82dc6', 45, 2, NULL, '[\"*\"]', 0, '2023-10-23 08:31:31', '2023-10-23 08:31:31', '2024-10-23 08:31:31'),
('bbdd3ceec3dd4e4cb4555bb559a6d892f021bf6d4dc3f6b0d6733066fc05005bce49eadaf24bf11d', 28, 2, NULL, '[\"*\"]', 0, '2023-11-30 05:01:14', '2023-11-30 05:01:14', '2024-11-30 05:01:14'),
('bc191586f046f866d070253adaf1d025f82706b44e6d24b95008d6eee116531029a183471a1779de', 65, 2, NULL, '[\"*\"]', 0, '2024-01-01 13:41:58', '2024-01-01 13:41:58', '2025-01-01 06:41:58'),
('bd5e8934a48f8f82b202cceba5fc6815a420940c59de30be090647f816bee9ec6478284d3c6311d9', 55, 2, NULL, '[\"*\"]', 0, '2023-12-20 11:19:24', '2023-12-20 11:19:24', '2024-12-20 11:19:24'),
('bedc933a78feead8e4b96c9b911b8fc6732cd34e6a109c95105408788955ff5eb052d65b02f8af47', 1, 2, NULL, '[\"*\"]', 0, '2023-12-22 07:18:29', '2023-12-22 07:18:29', '2024-12-22 07:18:29'),
('bf018d58482eeca3eeac006cf6dd6905d3dedd7ab8833ea104e6e543c97f4486c49448cef00bd134', 47, 2, NULL, '[\"*\"]', 0, '2023-10-31 03:58:17', '2023-10-31 03:58:17', '2024-10-31 03:58:17'),
('c2a13d48283976e5ed84d5caa8143658c4329c7b15d5e1b12c7be24dd4d77b6f320b852e1712dfe0', 55, 2, NULL, '[\"*\"]', 0, '2023-12-27 16:21:09', '2023-12-27 16:21:09', '2024-12-27 09:21:09'),
('c358e71b8c40ad0008443d592e65efc8068052c4a9dfdd0e6178566559b7e697553fa48c8fbb3311', 28, 2, NULL, '[\"*\"]', 0, '2023-12-01 09:40:29', '2023-12-01 09:40:29', '2024-12-01 09:40:29'),
('c365c5b1a8d0928f1b75ae3dad5a2c2be15901a058ccb9540ae55ccae499d5291187d1e4c954c34c', 1, 2, NULL, '[\"*\"]', 0, '2023-12-22 06:23:21', '2023-12-22 06:23:21', '2024-12-22 06:23:21'),
('c3a6d6f4342f110f6f47e3551254361295310706f13812bbf4786bc377445917ac7129064ded08c1', 94, 2, NULL, '[\"*\"]', 0, '2023-11-03 11:53:45', '2023-11-03 11:53:45', '2024-11-03 11:53:45'),
('c434b0707dabdf7c27c107938acf94c84a2be63808604a42f2034ac796e0433a7af7652391806425', 33, 2, NULL, '[\"*\"]', 0, '2023-12-04 09:13:39', '2023-12-04 09:13:39', '2024-12-04 09:13:39'),
('c499a3a38de0d5983f916fd4dc069cb3ab5092df6571ac4062ed5ccd21dc6e4c96b866bb123b29d2', 28, 2, NULL, '[\"*\"]', 0, '2023-11-29 12:01:37', '2023-11-29 12:01:37', '2024-11-29 12:01:37'),
('c6a55e18b1a68af8d4a6e161008f9553028fdef5b87d73839c2b7aa4e635314f95728fb8edf5ce72', 55, 2, NULL, '[\"*\"]', 0, '2023-12-22 03:51:24', '2023-12-22 03:51:24', '2024-12-22 03:51:24'),
('c76ae01e61d9aecfcea09c5e0e2ad6ed151adef4eac639ab990ce8877d955664c92d50e62e76b2b4', 41, 2, NULL, '[\"*\"]', 0, '2023-12-08 09:33:28', '2023-12-08 09:33:28', '2024-12-08 09:33:28'),
('c8d0304c35806bfcb1d3f427c33dbfa8366c206eb8e744884854f0e99a0284619204ed460bd97bd7', 28, 2, NULL, '[\"*\"]', 0, '2023-11-30 09:45:15', '2023-11-30 09:45:15', '2024-11-30 09:45:15'),
('c8d5368bfdacc2bc6792c764de15c8902fa63b3d9748632552c0ba5682d99067781afdd93f041aa8', 89, 2, NULL, '[\"*\"]', 0, '2023-11-02 12:44:19', '2023-11-02 12:44:19', '2024-11-02 12:44:19'),
('c8ed463a2f7e15b08d3d0e7d9ea7c4a0e46c820c84f2432e21d574d299ccaaa0ea9286fd6e4f9a2f', 63, 2, NULL, '[\"*\"]', 0, '2024-01-01 11:50:07', '2024-01-01 11:50:07', '2025-01-01 04:50:07'),
('c983405ceea92472fe9438853920c33c238d6b8cce37dac8384e471e9fede987d1499a08d3a506e6', 25, 2, NULL, '[\"*\"]', 0, '2023-12-28 13:06:24', '2023-12-28 13:06:24', '2024-12-28 06:06:24'),
('cacbd92627abb33f4d110591fe0763f1fd71ebfa7cb5fd35f7d5d618eded174867b683b6a66b0568', 28, 2, NULL, '[\"*\"]', 0, '2023-12-07 10:00:15', '2023-12-07 10:00:15', '2024-12-07 10:00:15'),
('cb21d2ecdf150e24e69b587f8036b1859fe6422c7e840a8868cc43587ef93468efa5f5b899ebb2f0', 2, 2, NULL, '[\"*\"]', 0, '2023-11-09 08:31:36', '2023-11-09 08:31:36', '2024-11-09 08:31:36'),
('cbcd861f66dcee36b9cf94b00b782664bd351964f848362e810114cf5d45fb7a5b40aa6eb1eae448', 28, 2, NULL, '[\"*\"]', 0, '2023-12-04 06:04:29', '2023-12-04 06:04:29', '2024-12-04 06:04:29'),
('cc0aefdcd7d75f793088200f45491126e43a2ab30a7d4d55024cd329bd2fc7b43589c64f3e66e339', 53, 2, NULL, '[\"*\"]', 0, '2024-01-11 15:54:00', '2024-01-11 15:54:00', '2025-01-11 08:54:00'),
('cc5907589314ab536c212e409a0055ea3903e1e0ccd80aeb95123ccfa398a190e28aaf54ac5e35fb', 55, 2, NULL, '[\"*\"]', 0, '2024-01-01 15:21:10', '2024-01-01 15:21:10', '2025-01-01 08:21:10'),
('cddfc5a499e3f994428b5f3720c30bd8dea117d987bc46b1b81a0ef68330b10a40d8ecd161d346e4', 73, 2, NULL, '[\"*\"]', 0, '2023-10-27 12:52:17', '2023-10-27 12:52:17', '2024-10-27 12:52:17'),
('ce6cf5f6f2256c7a159ea8eabbdfc24e8229661c2a88ee480478845925dfccebf0cf50f2fe805770', 95, 2, NULL, '[\"*\"]', 0, '2023-11-03 12:39:51', '2023-11-03 12:39:51', '2024-11-03 12:39:51'),
('cec0a9e1e25db7dd199ef3bb7f38e5b786a71fe5f78b3dabd92d41cd60ff869b91ba05ea6c2fde30', 28, 2, NULL, '[\"*\"]', 0, '2023-12-04 08:53:20', '2023-12-04 08:53:20', '2024-12-04 08:53:20'),
('d1c15c819d7cdecd9e73e3fc9dd59aa816e2991a9c7480e0f0fc30a1a97e0c01cc361ea897a88693', 63, 2, NULL, '[\"*\"]', 0, '2023-12-28 15:47:00', '2023-12-28 15:47:00', '2024-12-28 08:47:00'),
('d2dd81be4c3d791a31efe30341200c9b1029865c6b9e83518ebb885f46b36dc05f822302257bb7eb', 115, 2, NULL, '[\"*\"]', 0, '2023-11-08 08:36:17', '2023-11-08 08:36:17', '2024-11-08 08:36:17'),
('d4bed237a2485d72681d4c817c8e851b9373a2d172261c364e35e0220e3590fa7dd9ddf8529672ad', 52, 2, NULL, '[\"*\"]', 0, '2023-10-25 05:35:13', '2023-10-25 05:35:13', '2024-10-25 05:35:13'),
('d67b12db55db12df442908110457f11227c0edc7c59aec06146468c4eb2a6b67b5c8c27a2c92d7e5', 28, 2, NULL, '[\"*\"]', 0, '2023-11-30 09:54:02', '2023-11-30 09:54:02', '2024-11-30 09:54:02'),
('d6a6b3a64090f562f7004d4fe0a786aad12c110e1ae551bb65f5f9440486b16c2d4e2c84a0dd3d3b', 80, 2, NULL, '[\"*\"]', 0, '2023-10-30 05:55:28', '2023-10-30 05:55:28', '2024-10-30 05:55:28'),
('d71f676e2c977abb72129b1649de417b90625d2f188ede5b625f7bf4c11f08512a785adf4ee34d72', 57, 2, NULL, '[\"*\"]', 0, '2023-12-19 11:15:14', '2023-12-19 11:15:14', '2024-12-19 11:15:14'),
('d78b49c4a75265942308870eaeedf873a9556b47f1dae57274bd5883c25d5ccbc7fe5bc655fc9027', 83, 2, NULL, '[\"*\"]', 0, '2023-11-01 04:07:49', '2023-11-01 04:07:49', '2024-11-01 04:07:49'),
('d82514725ca1186ae8cb45172c2cbe3663e0c07ec8f51611abc815a7ae6d5cc7d6e20aa5063afef2', 1, 2, NULL, '[\"*\"]', 0, '2023-12-19 12:04:47', '2023-12-19 12:04:47', '2024-12-19 12:04:47'),
('d9fa6916ebde7443cf8ff38832c8372135382204068c7eec6704945931685ebc63fe5b7e5c3fa406', 2, 2, NULL, '[\"*\"]', 0, '2023-11-01 06:04:53', '2023-11-01 06:04:53', '2024-11-01 11:34:53'),
('da9361637329681dad4266684c685a4d52f689314b77372b894c07be0479a86452220d1f255d1246', 37, 2, NULL, '[\"*\"]', 0, '2023-12-20 11:03:43', '2023-12-20 11:03:43', '2024-12-20 11:03:43'),
('daea3822fd9adb77af5d8d3fae4c1de4535a9911beb24b102f8c6d704973f39319918f0827043ed2', 37, 2, NULL, '[\"*\"]', 0, '2023-12-06 10:48:52', '2023-12-06 10:48:52', '2024-12-06 10:48:52'),
('db29990bdd209dfcf927dc35c4afc8b924628ea6dff452fd6bd94ddcd9a66711f34b9907075126cf', 73, 2, NULL, '[\"*\"]', 0, '2023-10-27 12:48:36', '2023-10-27 12:48:36', '2024-10-27 12:48:36'),
('db6bca93623e2d656582606f3065867f8304b49e737f69af9ae6de6d6ad8109c5cfce7454dac0edf', 55, 2, NULL, '[\"*\"]', 0, '2023-12-20 12:22:35', '2023-12-20 12:22:35', '2024-12-20 12:22:35'),
('db8838e8ef9fe1af554a5777d42d20020142fad3df78df5d73f3408198572cc42443e5e62fdabc2d', 1, 2, NULL, '[\"*\"]', 0, '2023-12-19 11:08:01', '2023-12-19 11:08:01', '2024-12-19 11:08:01');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('dc0ca58ff16895cae2479c1270c00bd586675538c2cc5976c53c8736399ce68e1e28facb4cd7ffe0', 28, 2, NULL, '[\"*\"]', 0, '2023-12-04 05:13:55', '2023-12-04 05:13:55', '2024-12-04 05:13:55'),
('dc0d3a60d5e7bb0713d3978a05f2435e27b18d8fb2464f971a40c135e47a2667ff20c84b53e1d9a8', 28, 2, NULL, '[\"*\"]', 0, '2023-12-07 07:21:34', '2023-12-07 07:21:34', '2024-12-07 07:21:34'),
('dcf27efd7b653f5c72f886605076efdd00a0dcdf8a3b71dd7c9500f3c397e42330a4953759ed021b', 28, 2, NULL, '[\"*\"]', 0, '2023-12-04 05:21:55', '2023-12-04 05:21:55', '2024-12-04 05:21:55'),
('dd650eaddca3c827199637ff7ec62f708c8d5c97a5bf1549d75e583a5858e2a4ca5c5c98afa83c3e', 28, 2, NULL, '[\"*\"]', 0, '2023-12-11 05:08:23', '2023-12-11 05:08:23', '2024-12-11 05:08:23'),
('dd69163a3516fe78013998781dfaffad0555423051dfb8f5ade3ab0d9b03a8e7e639b1b369e1f4d4', 64, 2, NULL, '[\"*\"]', 0, '2023-10-27 11:39:58', '2023-10-27 11:39:58', '2024-10-27 11:39:58'),
('ddbf2fc144031dff312461737ebeb9e6894b5ae87f93f2c75ffb65f513a2f3d37041bf80cebf1d7d', 76, 2, NULL, '[\"*\"]', 0, '2023-10-27 13:23:36', '2023-10-27 13:23:36', '2024-10-27 13:23:36'),
('dff22c4721c206a4ffe5866e29ac2b6c7a93afab0675d237bdc52cda5cd00048a00db530cffbfb8a', 14, 2, NULL, '[\"*\"]', 0, '2023-11-10 04:18:50', '2023-11-10 04:18:50', '2024-11-10 04:18:50'),
('dffde78a485eeb1b10522357332fc6eed52c0749bcba91afd1abc7d6d2fce363633ff3f5a51b893a', 47, 2, NULL, '[\"*\"]', 0, '2023-12-10 15:01:36', '2023-12-10 15:01:36', '2024-12-10 15:01:36'),
('e00570b131c6ff59ffdc0b1cc80b4008ea2f673342b9906ad453b1af5ab3fdaa32fac38605bf6356', 28, 2, NULL, '[\"*\"]', 0, '2023-12-18 06:04:20', '2023-12-18 06:04:20', '2024-12-18 06:04:20'),
('e143fd84b3d46686829a10de06fb32c384f6a97d7d88efb6d4819fbc543f4b8f76cc4c0d7e45fa53', 50, 2, NULL, '[\"*\"]', 0, '2023-12-11 10:31:26', '2023-12-11 10:31:26', '2024-12-11 10:31:26'),
('e2a9cfc5687c128dec64b5b03a5ca1762c95d90b16a1b36708b014747e1b79cc957eac657d01dd00', 85, 2, NULL, '[\"*\"]', 0, '2023-11-01 04:20:32', '2023-11-01 04:20:32', '2024-11-01 04:20:32'),
('e2d87bb7f587437bbaaf899feee76a5a3fafe088524a56952f2581914cff5928692541671772f028', 36, 2, NULL, '[\"*\"]', 0, '2023-12-05 08:41:41', '2023-12-05 08:41:41', '2024-12-05 08:41:41'),
('e2e88e1052bcac67786e66c33808fd5cdbfc034465bddf3fad33549fbeebbf3bfa9f5bee38ce9d23', 73, 2, NULL, '[\"*\"]', 0, '2023-10-27 12:50:38', '2023-10-27 12:50:38', '2024-10-27 12:50:38'),
('e2f7ab79210c4e7b01c5edb6a59d50d341d80b26dfe36b0a3a46244ddda4cd19df8de7c8779119fd', 109, 2, NULL, '[\"*\"]', 0, '2023-11-07 11:20:50', '2023-11-07 11:20:50', '2024-11-07 11:20:50'),
('e3e4fad2ec1dc2d22eed3fad9d4d9a4586e0cb627abbd51008552e58b0dc452c14ff04db84114d2d', 28, 2, NULL, '[\"*\"]', 0, '2023-12-11 04:11:41', '2023-12-11 04:11:41', '2024-12-11 04:11:41'),
('e414857729eae0a399d3d094a05fda620ff2165b79c4c7f452b815c1c192513c0e1f027d1d019d62', 1, 2, NULL, '[\"*\"]', 0, '2023-12-19 05:08:32', '2023-12-19 05:08:32', '2024-12-19 05:08:32'),
('e61db07cfba6d01a352efde20e051b9250b35793fb4099a6964cbfd5838f21df30db3d7500c89b17', 17, 2, NULL, '[\"*\"]', 0, '2023-11-10 04:33:16', '2023-11-10 04:33:16', '2024-11-10 04:33:16'),
('e6b9f9ae7a2ea713d52f548ceae8ba9af42c9d719baa17b4fd99541d88f64b54ea6274e5a146ffad', 43, 2, NULL, '[\"*\"]', 0, '2023-12-10 14:26:57', '2023-12-10 14:26:57', '2024-12-10 14:26:57'),
('e72e72c6f1f00ad39b51e06e21b8ccdddb53e4951f30d6e001e5be859d7bc4c3192884f5a926128f', 56, 2, NULL, '[\"*\"]', 0, '2023-12-19 10:42:06', '2023-12-19 10:42:06', '2024-12-19 10:42:06'),
('e774877968f518e8a8dbffedc592c77b6142a5be4d6ebe07d720663dbb09b253d5e8a239cdeeb105', 28, 2, NULL, '[\"*\"]', 0, '2023-12-11 10:05:37', '2023-12-11 10:05:37', '2024-12-11 10:05:37'),
('e7f0891e88b7f0dcff5df479a4a48bb55ed5392ebb2b738ba69f9eb929fb759810af428fc6acb398', 28, 2, NULL, '[\"*\"]', 0, '2023-12-04 05:26:04', '2023-12-04 05:26:04', '2024-12-04 05:26:04'),
('e996b714428c4031ec1cd9223aa9c6298e7957579befa64474dbb1722b8fe2e165288187c56c1978', 29, 2, NULL, '[\"*\"]', 0, '2024-01-03 13:48:44', '2024-01-03 13:48:44', '2025-01-03 06:48:44'),
('e9beec1b237d3b49c938001b0dde4e27e757f4693db0d089fc5aa05bdb3d0685d353bb0c10360fcd', 92, 2, NULL, '[\"*\"]', 0, '2023-11-03 11:46:53', '2023-11-03 11:46:53', '2024-11-03 11:46:53'),
('ea0871afa862748c74597d986769d286db938672d0c7a7fcda8e4842bf4014c9b81442274461ee9d', 28, 2, NULL, '[\"*\"]', 0, '2023-12-25 19:15:22', '2023-12-25 19:15:22', '2024-12-25 12:15:22'),
('eabdf714521acefb280f894e1c9bdc1354072bf655fab4c7843ae80f90ed2975f3d504ba6e7c3f24', 2, 2, NULL, '[\"*\"]', 0, '2023-11-01 06:05:10', '2023-11-01 06:05:10', '2024-11-01 11:35:10'),
('eb64cf3228b4687938dbf183219a35a012a7a0b26b9a0b904cb259bde1077a67c07f292f756a312a', 1, 2, NULL, '[\"*\"]', 0, '2023-12-19 06:11:03', '2023-12-19 06:11:03', '2024-12-19 06:11:03'),
('eb739cc938b2bc2d647ee8839e12ec6ace25bdb409dd7cb71e747bb7545b7776ff4f393ac5d799a6', 1, 2, NULL, '[\"*\"]', 0, '2023-12-22 04:21:38', '2023-12-22 04:21:38', '2024-12-22 04:21:38'),
('eba31703571d10742cb0ce57ec614408060d7b06063edb0de6ebeb599cf0e3734a7dc50611ed4943', 107, 2, NULL, '[\"*\"]', 0, '2023-11-07 11:18:19', '2023-11-07 11:18:19', '2024-11-07 11:18:19'),
('ec4ffff8fe4961a8ca70b47e62c3ffe2dabeeff4e09e223e96fd9306fbba135902c789dba201cc83', 28, 2, NULL, '[\"*\"]', 0, '2023-11-29 10:57:37', '2023-11-29 10:57:37', '2024-11-29 10:57:37'),
('ed6c538de17d262c3aeca2368c571eb9a08a0fe82c3921a1a20f05f6a0a81bf3b5882433899ecb20', 55, 2, NULL, '[\"*\"]', 0, '2023-12-20 12:15:55', '2023-12-20 12:15:55', '2024-12-20 12:15:55'),
('eda16f7735e67168c40e6e02713bdc6c72986a2835ff83152dd91531e8794ac191b48e3bba37f49c', 112, 2, NULL, '[\"*\"]', 0, '2023-11-08 06:26:01', '2023-11-08 06:26:01', '2024-11-08 06:26:01'),
('ee2aebae5bae53464ec793a779e635d1039ba59c41bc34f6f99c309ffa60bcaa70a3447a28f93b36', 1, 2, NULL, '[\"*\"]', 0, '2023-12-18 12:03:23', '2023-12-18 12:03:23', '2024-12-18 12:03:23'),
('ee88fbad05704ac23b722fbe2de70c95b70cf385b4e7989a3b6ad004548d1f1b785a4b3de4bf47bb', 51, 2, NULL, '[\"*\"]', 0, '2023-12-13 08:49:27', '2023-12-13 08:49:27', '2024-12-13 08:49:27'),
('eec30f1309a384a5c7369b3c167a61a4fbfb899a0bf851cf9c7e6473eb2326525e0aab35edb6ecd5', 79, 2, NULL, '[\"*\"]', 0, '2023-10-30 05:14:45', '2023-10-30 05:14:45', '2024-10-30 05:14:45'),
('efc1e55287275507b4c0ba4267c7e9fd12693f1db1ca2d7e05e4fea3681bec0f798414c37515e631', 64, 2, NULL, '[\"*\"]', 0, '2023-12-29 12:20:58', '2023-12-29 12:20:58', '2024-12-29 05:20:58'),
('f08c38f5335420420c3e57052a0c8039454327d093241b084b19c411cd26c551ee0aed2b5dfcc84e', 48, 2, NULL, '[\"*\"]', 0, '2023-12-10 15:09:09', '2023-12-10 15:09:09', '2024-12-10 15:09:09'),
('f109427cdcdd30e6707da2d1b4055fca7227f6953cea557ac1eb7bf2c111c10c0cf8c753906d2d0b', 80, 2, NULL, '[\"*\"]', 0, '2023-10-30 06:02:08', '2023-10-30 06:02:08', '2024-10-30 06:02:08'),
('f11e61317090d3e4663d69c069593b013e90568d9e39c67892664ff8523afee977f801092a1af1cb', 34, 2, NULL, '[\"*\"]', 0, '2023-12-04 16:42:51', '2023-12-04 16:42:51', '2024-12-04 16:42:51'),
('f1627d1d2a79432563f9b5cdb4958723725f77564800e2f6fedb031a7919a2b59a3d5455b4c9eebd', 41, 2, NULL, '[\"*\"]', 0, '2023-12-13 04:48:22', '2023-12-13 04:48:22', '2024-12-13 04:48:22'),
('f243f702db8dc1c85553cfb15a16c45657a1ccfd4ab314aa393491f7b0da72e7e7f8def97f364ad6', 68, 2, NULL, '[\"*\"]', 0, '2024-01-04 17:51:06', '2024-01-04 17:51:06', '2025-01-04 10:51:06'),
('f24e8cf6b16ae9a81dcf9df74962130fb611f8c5d796190d2664ea35fdd143ced6a1b91e25073f5b', 54, 2, NULL, '[\"*\"]', 0, '2024-01-01 15:49:31', '2024-01-01 15:49:31', '2025-01-01 08:49:31'),
('f2da4cf02b84a358a2fb17d3f124f38a696f00244d619f4d80b6adcde5ac69d6a62d79eb5d163210', 28, 2, NULL, '[\"*\"]', 0, '2023-12-08 05:01:23', '2023-12-08 05:01:23', '2024-12-08 05:01:23'),
('f61aa6da39814619ef3447ad019b33af800019b98ed8f4b9d86926a833e1a33fd8f7ee5962761f85', 76, 2, NULL, '[\"*\"]', 0, '2023-10-27 13:24:10', '2023-10-27 13:24:10', '2024-10-27 13:24:10'),
('f7184c39fa541cb0cd59533a8560fb96bd5abbc256dd475ef4a7bb9a97fba4c76967e901f9600129', 7, 2, NULL, '[\"*\"]', 0, '2023-11-09 08:42:01', '2023-11-09 08:42:01', '2024-11-09 08:42:01'),
('f734d088d0b379e6930963b8211def5cc220c374454934c775f4268fd22e0945bdb00ba701d53336', 28, 2, NULL, '[\"*\"]', 0, '2023-12-04 03:48:53', '2023-12-04 03:48:53', '2024-12-04 03:48:53'),
('f768212b62f8a970d04c6493e5eb41bed5bbc8c337fcdd4c693c99aba1db7957c8ff89d139a912e3', 111, 2, NULL, '[\"*\"]', 0, '2023-11-08 06:27:04', '2023-11-08 06:27:04', '2024-11-08 06:27:04'),
('f82c8352bc3d4a184c7262a8027a7e9693f8bfc73f790ceec501715fe63b0d587c9e45064a93fc81', 37, 2, NULL, '[\"*\"]', 0, '2023-12-06 11:16:16', '2023-12-06 11:16:16', '2024-12-06 11:16:16'),
('f8a710cf6cb4be69a8dbcb316cb2c024a0fd308c0a489971a100ef1ff380b4aa0fd36f77e5b9d6e3', 1, 2, NULL, '[\"*\"]', 0, '2023-12-19 08:59:05', '2023-12-19 08:59:05', '2024-12-19 08:59:05'),
('f8e177dd955f43b708c36bc3c93b8ead087f156c6b7cff494cb678803089246909991d9c12a06e8c', 5, 2, NULL, '[\"*\"]', 0, '2023-11-08 10:01:10', '2023-11-08 10:01:10', '2024-11-08 10:01:10'),
('f933b2e8dd4c2d48e09f52eb8b2be3f39d3f7a221b077097df81678e50a050724478ed42f83e35ce', 96, 2, NULL, '[\"*\"]', 0, '2023-11-03 12:50:03', '2023-11-03 12:50:03', '2024-11-03 12:50:03'),
('f94d531f996d1eaae0824305e16c93e93343cda3f87f0327aa545cac7e5b4397b24d72224826211f', 38, 2, NULL, '[\"*\"]', 0, '2023-12-07 10:56:41', '2023-12-07 10:56:41', '2024-12-07 10:56:41'),
('f9538d91b028e3650f0c80d9b15192898598dcf7272525f9f082525a04b953b02045201876e3eafd', 54, 2, NULL, '[\"*\"]', 0, '2023-12-28 18:42:09', '2023-12-28 18:42:09', '2024-12-28 11:42:09'),
('faf13dcfe876b9c2288884f064983ad4c5bafec047a397781d968d2d639fcbafb771b271f796cb03', 77, 2, NULL, '[\"*\"]', 0, '2023-10-30 05:05:12', '2023-10-30 05:05:12', '2024-10-30 05:05:12'),
('fc4c29a3631bd142441cdc9df3c5703e92b073c685cbd35d4979121b2b1f5dcd60bf4f4f3beb3436', 55, 2, NULL, '[\"*\"]', 0, '2023-12-22 09:14:37', '2023-12-22 09:14:37', '2024-12-22 09:14:37'),
('fcdc4ac9e67db77d036afcda39778cd64a13143442c4af27e9d7c05b692995ca0114cbbe412db083', 80, 2, NULL, '[\"*\"]', 0, '2023-10-30 05:19:33', '2023-10-30 05:19:33', '2024-10-30 05:19:33'),
('fe7318909488c16d10eeccdb06a7e12ff797482b66a714d2b35fd75964593b0d9250460d7c9b13a2', 86, 2, NULL, '[\"*\"]', 0, '2023-11-01 04:34:42', '2023-11-01 04:34:42', '2024-11-01 04:34:42'),
('fe8d76b6b460fe3ad1ad37984b608037f3906bf5008b9bc18fa07039e1b890878ad626bb39d0fc14', 62, 2, NULL, '[\"*\"]', 0, '2023-10-27 11:14:53', '2023-10-27 11:14:53', '2024-10-27 11:14:53'),
('febc22b3552107c6634de9f8f9d18c19c8a10bb034d8fdfb4cff95261836007f31ac2ff0ce0b5342', 28, 2, NULL, '[\"*\"]', 0, '2023-12-28 12:44:20', '2023-12-28 12:44:20', '2024-12-28 05:44:20'),
('fed18ebdb401802c26e1c328dd8ea0a720e4c3a989baa8e535b1ca83f1f6bdb947b9616792a9a609', 1, 2, NULL, '[\"*\"]', 0, '2023-12-19 10:38:45', '2023-12-19 10:38:45', '2024-12-19 10:38:45'),
('ffca010ee88def0274a72d9c314e1ef849da3b94d9fdc5ec241dbdd35a1e76b238892d407b3d48e9', 47, 2, NULL, '[\"*\"]', 0, '2023-10-31 06:33:44', '2023-10-31 06:33:44', '2024-10-31 06:33:44');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'vW6GhULfsHUDU7DGPYhkg3JMDL18c7Htrl4OOHkT', NULL, 'http://localhost', 1, 0, 0, '2023-08-25 04:41:43', '2023-08-25 04:41:43'),
(2, NULL, 'Laravel Password Grant Client', 'EnVasSUylDGrGY4ZcTX6MU4RIY6gNpuhe9SAqfJG', 'users', 'http://localhost', 0, 1, 0, '2023-08-25 04:41:43', '2023-08-25 04:41:43');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-08-25 04:41:43', '2023-08-25 04:41:43');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('003d3bb650e755fc11d26c85f7d698d95662aad9274b418c04cf6e9b1ede84e2ff6deb6b6dc0e8dc', '0a323daa0e4408b6025741a1972d24a414a4fe20fdaf6ca0e4416181e931a59d3050e0053121d59a', 0, '2024-12-13 09:22:05'),
('00b49349cf2c6a65b72ebb9e1fc1a22bb235fa700acc421b5c87dc618597e43a4035aa1212a5ae95', '030797552d8ede91109ce387cf9288e0efd44d6185795791c2d2440c8372a88ae2106247f6d24a84', 0, '2024-12-04 06:54:50'),
('015ee0811611eae7f7405750cba88015763c2a833cb7e4d133dc7f8150ac448fe3cf5aeb4dac5277', '7247e5121645ed1649c1d088c73d1bc9bd8efd613d881e8a7ef6c574b7502055fbc2bf3e2f37a807', 0, '2024-10-31 05:33:21'),
('03f1a27c642cf8f86e9c41a8531566bf66f3a85e3fa7e3aeaa3ea21b5a562c08e16f45610d77c057', 'ff4fcf081141150b5c2db2a86eccc0a6a289e6b881c9fb1fd5b43becc028f1d77950db80d55f5b85', 0, '2024-11-03 03:57:32'),
('0408ee1bcde0211f0a3e791045ac96033c76c0cee8c2c9f872b8c496d5fa1bce6c065bbc7320b512', '50880624e7ac3c88afa862cec37973759385bea7df00badf8bb08a1aea75de022ff433b624a44ac0', 0, '2024-10-30 05:18:39'),
('0664a7d0ef13ece99d52026a61ca03b2a895a4e8d9b76d3e45f99b2566ca7f0ce77d3e4c84bb4a19', '2d2b364364d03bc8a9592ca1d91a3116a88c3f2b2660e75a071da45a494e91d739cd9bb628531361', 0, '2024-11-08 05:33:30'),
('0716de4036fd83715458a80dff5de951611f2970d9abaade307f3bb5327307ff918dbb110eda5a37', '15ac83bfd0f20285b53e53460fc4b66f1eadc62d68f7c3774710498ef181fdfceb2731c33cd68c14', 0, '2024-12-08 07:14:40'),
('071c0c0e7c36cf06a272a52245e593eea0d238b76938961f04844716cab01549cb78367aa70ed1d2', '0f7936c06131af0316e268f87de5080c4289a114fc9a0592af5c2c1b2dc692d8c95671fe0125f94d', 0, '2024-11-24 11:12:06'),
('08b147b4e4525af304a6bbd7b3c0c0f5df6d94428c78997f7d80f120add35fddbe32094bb2c7b323', 'afa30a34526c6119dfc8f6b4e23f9c05c28cba52cbb5a89d5ff5c0c4b28dfa2110f8c420f0760a98', 0, '2024-12-21 09:48:02'),
('0938da8d9cfacf3d4c725797b99bedf855f3c276ac25f66632346d1d521f1bd77189732eca297acf', '77ddc7214760a60ba5a9f513f724810fd58838bafe3993baff17a5480f1a50428472b8396df7703e', 0, '2024-12-07 10:50:11'),
('09e270526261fb6df416ea7c9d049e786af0867a7b11410534bb0c4163e98a218f8fbc0da8bc4828', '433a315f9aa095ecc708cbb7b7d9d45aebb6d6d083034b11270fffa6399d2c6189d413443aaba4fc', 0, '2024-12-04 06:19:27'),
('0a44eacd77d0a9e3222f4a178c07ec1538c5f3da2ab6490736135bbd5c5daa3083cb54b0ab25dc88', '0cd726316cb3554317b44ae6073a81e067e240acabc5fb950c81220e2b2ee04656ad42473a07390a', 0, '2024-10-24 13:00:47'),
('0a7e13bbef98aa885611011863d5effafc658c1371127a0d62b4c7cf17bced640ad902227a02843e', '2e79408fb3df75d9c93c163089f072d8292d103c888e2d5fb17e92d7fc4f8b72a4f8b49fa6aed4c6', 0, '2024-12-22 10:25:36'),
('0a81783eda1405a3d8f3d90f541ffd0c6ac85dbe402c6cdcf6c0246c88d636aa0a6cdd79caaeba63', '37069f735b1c2e7d46e59b8231d0644787750d859601059bc988b3933d1ac455fb130289dfea2283', 0, '2024-11-01 04:14:48'),
('0c27833f0fbf2f5b290b71a8245e79492f678ba164a1e981b7edc7d2ff1d507b6d25dc724a9e4fbe', 'b170b2c808e77f12d47f8949af769029aefaf303fab729545e558027c1d4b9404a33faca604ac0cc', 0, '2024-12-12 11:41:47'),
('0c43d6c8fba08dfc54e4d53b0f08aae78afe316a75873ae86a819f2ed1875044f1188beaedfd0071', 'bedc933a78feead8e4b96c9b911b8fc6732cd34e6a109c95105408788955ff5eb052d65b02f8af47', 0, '2024-12-22 07:18:29'),
('0c87a319434ea4ea67d7e9b32e2e4523ce4f6ff0a0f7fcd29fb6758868764018dd4bd05f9912c6f3', '59e51e765d440106ea681d07803177eb612c9b76d2aef899e3f44b0d9c09b2ce2a53b6d319af9b35', 0, '2024-11-08 10:15:19'),
('0ccd662032e385934396ddd4079ff8af1f4a35ec12824110a0a42005f5db722c8df16a3c2ab15d9a', '2956adc8d4b344d07c0d43d11b73e430177c72b48051ebd41f99e7e0a83eef6e5e51af44efeca7fb', 0, '2024-12-22 04:37:27'),
('0d77ec2855a53b5a1e5ce12baa54b811478c39942215c8c653dc5bab1e8aeb021be6f88a9d4964fc', 'bbdd3ceec3dd4e4cb4555bb559a6d892f021bf6d4dc3f6b0d6733066fc05005bce49eadaf24bf11d', 0, '2024-11-30 05:01:14'),
('0eed37daca64a3d22eeeccf4ae27b5096e6079b13ccbf9f0d75a21dd24a603698c8555cbd8a1f3b0', '7f4536b7fdcb10f4b5e9e6e027163bf26bbce51583cd8e09190580e2e173c72b733e097f8f851c62', 0, '2024-12-14 06:50:16'),
('0f5fdaef484d4305b86ae4b89b39329c9c117e6689ed9fa05d1d29ba6d90a283298e342e2514cc16', '63e1887c29d77586b053cc569b4c458e87fd1b5decda6418e01f5b10c03b529cef85249a8f063e98', 0, '2024-12-19 05:58:29'),
('10a99a9b56b5caa40ea971c4ecf1c5fad151fab573743fd888d58daeee1afcb775e37e4e97d3d771', 'a7ca59414bb14255af1a1fe902df2b41ed92aeb344d5d54a69e994c3fac2ae04fe31515517f7a2f5', 0, '2024-11-08 09:20:21'),
('11722549aad0cd6d57dac10daeddbcbf741762cdba605433f6e6280d355d67d4651dcd1a3b64ae19', 'dd69163a3516fe78013998781dfaffad0555423051dfb8f5ade3ab0d9b03a8e7e639b1b369e1f4d4', 0, '2024-10-27 11:39:58'),
('11b32d8c0f342e6ca47943e622f8a9e49fdccb3311ae6c685aaca5305f09066c357711f59086dbbd', 'aba01a4032c17a931da0ef378b459e844fc67ab7e5c7fbbe56d05535916d8fc935adffe5a5959a03', 0, '2024-12-13 05:55:03'),
('11b893e93d831ad3cc1f3ec6d88b2967801cbfb323bb1256a5e6cad1b6f240503a0f2027fc1a0a5d', '98654eeab37b33f5d29c5500f443b032ececad549efefcd06f0b04d416944e113ddb9e9f9f6f64bc', 0, '2024-11-02 12:54:17'),
('12072c8b4acbcbe9a2e0f59270544d4d00ab2946bab1e7722a386ee39fdc4b48e4eeea49230781d0', 'db6bca93623e2d656582606f3065867f8304b49e737f69af9ae6de6d6ad8109c5cfce7454dac0edf', 0, '2024-12-20 12:22:35'),
('12827953b4fce49a4b2cb6da6145ec17bc0723f66bcf8f68314daf9d6b0baac34570f8318847d35a', '63211e10228451f20f39e28d1face2b86815023f168c445eb5c115cf14fad9bff2ecdefb21ff5d60', 0, '2024-12-08 05:38:43'),
('1285e694a0bbb1494ffca93e41de5b7fb5616cb4214f32f66f205874dec0e1cb1adadcd45f922328', '921cea1f0ba2dd875851c86c3b4381de4455449adeb4f32eaa9d64e0d5686c125689715d37a1fba7', 0, '2024-10-27 09:03:31'),
('13cd9646a069c35e2194eb817f4241e73d5fe648cdd5d5d142868d74c60504a744eef75fd4b23244', '43f7bff9b9f1996576aa50b5d5b6999ab79fec7eed41ad3c5d6f3d4ec8089a428f50ecafa5163d7a', 0, '2024-11-02 12:46:12'),
('158aff496bd7c63dacd8e5ba412277bb082484b46070ad575e06832d983857de685f082bfdb92c74', '9d2e8f7d3c81dbca143da28cec2183bced017099c24dbdf26fd8bf41f5c68e711bb5b710fac1f208', 0, '2024-10-30 05:13:15'),
('15e8abd5bb27f13fd48b84c1fff8cd28a912f1ad7e373a0af850195e8127f3b0c5b4dbfbbc1d90d1', 'a6fdb01f7027eb0491c7981efe68e8b3d38e9a976b86609adcb07b8213806c40793e627cfd5917ae', 0, '2024-12-18 10:49:14'),
('168a25e59b93df1bdba3ca32a28b7361a5116f20cc25ce26dba1f2c80e3e6c2361ba97079ec6d357', '3be8c60ef452a325d385d47ca94e92975510802d48f4e4baeac89422bb2030743507e8aa933e9fc4', 0, '2024-10-31 10:26:34'),
('17e6e4b6475b81f3abd9e8b8ea6fb1fbc1268d302062062480e308bf6cf36b82689f34089c7f468e', 'ce6cf5f6f2256c7a159ea8eabbdfc24e8229661c2a88ee480478845925dfccebf0cf50f2fe805770', 0, '2024-11-03 12:39:51'),
('17fba9510fd1c8068dad87bfeecdf4b742c83932b25788ccf3eb24e5633e02334a94a15caf8d0a7e', '31bb9a7e36bf7ab14262ad9b3fc1ffd9bee9763ef18a4a38c8a7b65448e0a2736f2ddfeba795f2a5', 0, '2024-12-04 09:11:20'),
('186c554cedc9543934084f7c396e83e3db16b9115f3a29bcfad32d2977ce37a4e22e8fb881757d08', 'db4b3c10211a748a831c2a5c14ec85ad34ec3b7c68ecffb13b2058207053e3ebb1de054cb615dc88', 0, '2024-12-04 07:19:24'),
('18d438b151807cf2518993e844decd9a3be8d7be153b0594951b2b08d2698bdb452736c4bc931b4e', 'e774877968f518e8a8dbffedc592c77b6142a5be4d6ebe07d720663dbb09b253d5e8a239cdeeb105', 0, '2024-12-11 10:05:37'),
('193dc2498ae838a4f9584fcd54d881813cd3da8884b1af18bb05e0721d4eeae4c47e594d04bd0520', 'eec30f1309a384a5c7369b3c167a61a4fbfb899a0bf851cf9c7e6473eb2326525e0aab35edb6ecd5', 0, '2024-10-30 05:14:45'),
('1968f2cdff6cdd29a5f564674674d128f46cc9add7b9b6ab862fff6a3f7be435a5f4998a6826aa5f', '9249b928564c358951c63546ad317ca4385f8cc7ea228a8644924977d341751cd7a30bea3f3777cb', 0, '2024-12-10 15:13:49'),
('1ad17440d5f712c2125d1f871bb2c7f911bb2534300cbe897b6bdfebcf67a1a7e135e6a5929f18c9', '8000ecb2e1355b5184f9ede03ead86379d099032fee6da1dded7a2f2424a46e8c897bbffbe72beb6', 0, '2024-11-30 05:35:14'),
('1ad6857d5bc70dd24bcadef85508e802e6674ee8aeaf9a1beb5ee97603ebe03da91d5c308c0f44be', '81931878f75f31a221e98eab8cec0c568ec9c45643d309a9b21c0e3f6e52efb392a357dd6c06ece3', 0, '2024-11-10 04:10:50'),
('1aeb9f69ad6324e09c9f2cbdd11d0a314de91b84890c19c72b4df06cb3d8bb2567aabd033af93694', '3aa320ae1dbbf6954f53e762c86a1e31c85ef10c8142431b6d6e128f3979c78d896fc6e9503339c0', 0, '2024-11-09 08:34:24'),
('1af66efbe2b8185fae9c3c135fb60fb22cb9deb91c6b774465896aef64601eea7f906c82e521dfe1', 'b7dce381e698b0e6762273fda210047af4b7b935daa6d3c40a5ad6e9c6f8e62b25939a3d05bf861d', 0, '2024-12-19 10:48:15'),
('1c9b763f74212020f716ea0058ff2952e69edf72a2f5ad6e821fe90eac070526b6fecddf13740a00', 'ad1ee1bd1ac2ade411d8865d397632ee40ab41b9cb04322c5fceccbbb6a45722a132f734cad531a5', 0, '2024-11-06 08:48:03'),
('1d065e796ec577d69e73321d56527111ef358b7878facd43feb007d10f37a3e87f2f56666b319734', '19baffef0d7472eb916153ede7fdbb23ec95e73f139464a7cd81bebc5e3b45b6b19c13d37e2fca47', 0, '2024-12-06 10:35:10'),
('1db3fe810011aa93ee502ba4517d009a7de5de13fc58192d380a6ced237811c9bb44d3dfad95e966', '7ec701f4cb4bf3e7340a8e4f49f4f60b32a2eccef3c695584af212d5e6ac01c15a6aefaa57aeea1a', 0, '2025-01-01 05:23:24'),
('1e1bf5fc4a11e07d12c0bbce359a4860dca92452cf753f787557acc0fa306c03cf41c67543580af4', '83d86c5638840d849a5d1208173a15340699e268815a8223b65afe4a53aec8cba18a919edaf05045', 0, '2024-10-24 10:30:51'),
('1f72fa06f25baa28855b7165f445fad223dc1c51b51656f345102f3a6cbd7cc694702d74def9f6f1', 'f6b4892fbce38955c902f768ffb0287b2d9d0b1942d74baf3b66af2d6ac6c2ab8f1604be821e59b8', 0, '2024-10-27 10:03:53'),
('208d5d65e948d025e6805f4c05e28df77036c4b649d0807cb156a77465a535b72434ef786037e050', '991c1a89a9c3346471d032e648345afccc9385d00982ef8233c7268f02362d8f99e12a547d2cc8ac', 0, '2024-12-11 05:18:05'),
('2157128023bbb1973052ccf5820139ec39eb1bb57a90d762af545bb4c1b8f2bafa39f741a77a3b62', '010fa639ff9d81a67d862ea4fcf6e09ae6727fda676e6d7ccf151678d97001ddb4e72ec635b971a2', 0, '2024-11-08 05:28:39'),
('215b5e7658fcc5a98367f038a9c0bba63110b3ae60252ca4e85821596fa2fc95401ff430654d82d8', 'a752c3d79bc9a6002e8ceb8039f15d5cd606b1c7dac57b31e6e88b16a02149886e6b61e3ed6f7453', 0, '2024-12-13 08:38:56'),
('219f5b810ae9d2d136bdb7925e043535d50865e8c75c5589856324d5695d543622173aa08426af71', '38c71e77e5446c6773781a63b04247fbf4197ba49302bd0ee59105750cc29f240a3b543ee738ee7d', 0, '2024-12-12 07:09:38'),
('22606c7ecd43790bb670a8007dbe4271d607c09c7094f28473ba3c5b870a82e2286ea6fec22f01a9', 'd9fa6916ebde7443cf8ff38832c8372135382204068c7eec6704945931685ebc63fe5b7e5c3fa406', 0, '2024-11-01 11:34:53'),
('22b5e9bbdbf820d153fc91048083a27a2095153c8b53f7c6bdb00d0bf1d416d5a89f7ff153e53f53', '9d6ad52376ae32e23b05057b9cb5d4635be65f660573336e40a1d0dfe06edf4549567080786ebce5', 0, '2024-12-05 06:03:28'),
('2304ab57004d5dc7a40f9cef25f990bf53bdac14980f997b8040338c7a7b2c6c1376bc9718b95fce', 'b32e270f2ecd3a8d373b69c48a6c3b6ee1d0517e86ca3dcc792a793605553660a9757a9a1e28f715', 0, '2024-10-31 10:31:22'),
('2381c5f0605639b8bd1e403ea1bcd8dbb1f92f06fbb17f4de0fb42dce47ed2a38a1b6456288119d6', '8213ec91f45cb69041a56443a293f3995f67945bbea82ce7e75a1731c6ebd057cc01cc820b74a823', 0, '2024-12-21 09:34:59'),
('244952be7c263d04f47749998c6292135789ee3a5487a8fea59b6c3adeff29df49e6d8de301a6500', 'd4bed237a2485d72681d4c817c8e851b9373a2d172261c364e35e0220e3590fa7dd9ddf8529672ad', 0, '2024-10-25 05:35:13'),
('249926b22945d66f21cdb953ba20392a72289675b9e619a71445e7ab68cea76ea0f30d5803e1926e', 'c8d0304c35806bfcb1d3f427c33dbfa8366c206eb8e744884854f0e99a0284619204ed460bd97bd7', 0, '2024-11-30 09:45:15'),
('24d4ca52bd9d40f10650f5a6ac40f7e7048a40627ef2ce650212f77959756c0a8215c543fcdaefd9', 'faf13dcfe876b9c2288884f064983ad4c5bafec047a397781d968d2d639fcbafb771b271f796cb03', 0, '2024-10-30 05:05:12'),
('24d75216a65eaf7d21551ba6945b52bb83047b4585a8e8aa0a82b88910ef3c18d28c3f810c8bfacf', '54bf07654f9670a21dcc0fa25535cb14d58f2356483dcc4d2f74ec6dd1e3c83f358b83bee1dc77d7', 0, '2024-11-29 12:12:36'),
('256a375a86907fb8d50f95f333f502e4cf1c46d04b206f305778e56f5f434c733e660386f1e3bbab', '1e8022f9b7867c5f9a25847df1fe6d502768ba3abfdd5adbc93db8a8927c85b5e8cb625468909fdd', 0, '2024-12-14 10:22:43'),
('26146ba6f3e92666f180eaefc6313fc12ee2b6b3ed524e810b07bf6ab98408f7ba2df998135193e8', 'bd2d93eec9751a49fe8c1024d17fb256de6d454ba40121e0b39c599ae17ce907455a6cc7d2381f94', 0, '2024-11-01 04:43:44'),
('2629a87398e1d0a949377588addaa3c0a6214c2e7937f0c3e0f52794f8a6af36bcd09de16fa4bec5', '8611607ce462b340f8f529e6e276c5851ba54b4467d13848f762814b35473f4cc17ab0cb5f897b92', 0, '2024-11-08 07:15:02'),
('26a837f8360c78af29c39a432194df7fe9df336ca217e1bc645bd5828bc524b180a12372bdf42c26', '39e24356ae9ad9990065853dbe55c536542ec49aeabd5067c00686d5d38898738b8469eeb370457d', 0, '2024-12-21 09:14:21'),
('270abaadeb805a1de0aa2e8679f7a82dae949f43dac6413e36151db5b97cc4f4e8ff8a08c62b8548', '75ee28b65cd3f9b1400952df3b4fbf6aadf6cbe3700a8127afd80c3a6aa11b2118293094c563177a', 0, '2024-10-27 10:51:55'),
('274a6f03cdc017cbaf2d68a65de18314069e2cdd87cd13fc29c383a221b1f794dbeb8d7920a7e72c', 'a149dac134057bd64e4221a424d2dc1faa288c6bd446840fcf956a2f953fb377115b6ca0f8d3ec82', 0, '2024-12-01 05:59:55'),
('27566dd1648a694f4c82839d4b50993912caa518170b081c2babdd80bc6e1f28c715526fdcdd169f', 'f94d531f996d1eaae0824305e16c93e93343cda3f87f0327aa545cac7e5b4397b24d72224826211f', 0, '2024-12-07 10:56:41'),
('287f2bec8594cb28de099814ffb62bb683fc15c4254832aae1785c63e211c482383e4978b38053df', 'a01c5e2774b081c8efd813874a14ea3fbe15a40890b32bcec141314236a99cf49b36aedb1f874270', 0, '2024-11-09 08:27:49'),
('28c060e0d825529a3edc2b0a3393c7ad328f4f9092f67d75fa2aec634a20b28ccc57a84a37c3cb7e', '8f125ca13d75fb47db2e63b9f071cbcaf662873f734073cd4387b23de08fbcec33cfa8d05b62d541', 0, '2024-11-02 12:33:53'),
('291837adaef313c685855aa0c373876db6a5aaf0d26c375e0c1fdb8aa4f736152eb725b27bb32496', '07f21241f68c2d78b65efbf8e9d2e224f2d69253a755d8d3c803db44ad37663432a0bedb95d16c27', 0, '2024-12-21 10:52:09'),
('2928d82163a02ec6585108f34b77c186aee21b08b0312d612c6b9d3aa7031c2f8fd869937aec92c3', '75c5f89887b3b34d5c17d6a79ec86510a85f0c75ac820da7337e0f45049c7f8ff63c89ea51aeec4d', 0, '2024-10-27 09:49:14'),
('2a19c1c01ec446d804d1d18bcb059fe587a91a9a12cad1e658ae6db5d5ebc712ae4c94508a67ce4b', 'a84cae9e6608878d907dcb5d7a1472c394ecb0b803bfa913833eb8d3f36d10cb45debb11fc87ce61', 0, '2024-12-23 22:48:22'),
('2a9171c4ad9740cc566ed4c986e44feceb3ce51ecd11ccfc73c7ce02167130ac9f924cdfb7d37552', 'bdc3b90728f1f0585fe1515e0c05865b379de7b42ca7053f29d0fa1090a3ed780f2305083729e26f', 0, '2024-11-24 05:19:38'),
('2ab1161103eea63f0d07ff30abcfd2e08977ca0831ed432b24f086fec6e382c5ba9b29b67111aa43', 'b75e8515cd0479a7af7388f27b441a9fb320dd372771d6474db03f3111571fb46d72436e485cab15', 0, '2024-10-20 11:07:49'),
('2ab52c67cc2e54373bf83c23ecee2983cd62f01345646f1480ced17c60d856c59c0dbfd2e06a5d91', '868d2cb360b4cc35faa6272b40b277afc81f1827aeccd88af01e898d4eb10aadd7d31d2de1cccf30', 0, '2024-11-03 11:49:11'),
('2b91346956bfcac74df8e917f4574d092e9488a7f06cf350c6b60ac2b4e079a357eae224335bb5ac', '01fd182e2f94e7c46f7d6bfd832f38c78f8f603fa01d2c00502e3cb489dfe9bd7579e0fd36ed8308', 0, '2025-01-05 11:49:54'),
('2bf0b57ef8b296ae93ff93d9fbbecded2b4678182dcba5552aee861dbb3a99da48429c477998f94c', '29061d4dd8b2f88541a2b0075f428ca53041efbca33a3bc26769354eaddefed21434779c33de089c', 0, '2025-01-04 06:02:02'),
('2c6203d1e8fd93364d54161f89469ed2d8b8eae41f8519783e494d88429f76e6757bab6e5805bfa7', 'ed6c538de17d262c3aeca2368c571eb9a08a0fe82c3921a1a20f05f6a0a81bf3b5882433899ecb20', 0, '2024-12-20 12:15:55'),
('2c7d9c1eb455e76dcbd027036fce921d483bdcdd88483e62ef70a0ed70b36f33e740165571c216d0', '7415a8a5f430b9efedb1a2f3ce209aa5e832d3a3dcdd077fc8bdc710a5d8953a9850b78286c94ec4', 0, '2024-11-03 08:18:00'),
('2c7e5c273064d999216e757d4f1428d16be9f4aa61bd87f91c557c20c5e0be49c5d5b62800af6bd0', 'dcf27efd7b653f5c72f886605076efdd00a0dcdf8a3b71dd7c9500f3c397e42330a4953759ed021b', 0, '2024-12-04 05:21:55'),
('2d135fa6f33dfddc9d348b9852b6a79df05929a1c6472f52eb5f4edd30ee349eca9ad6020b6dd8d3', '735484f02bfe519076d575e0566e5b5631a8a2a0bf8a36eb49159176e8ad20fa5681144351bcce31', 0, '2024-12-06 10:54:26'),
('2d49e7f7433f1b99c9cc542d4711fc01447708996de1ee164bbc15dc3851cb07494905695d959143', '1245d1eb752e93a74b9219af7d2921c0074d5e6be1d62ea065103058f53a65e8a91c9753eae07165', 0, '2024-11-02 12:36:03'),
('2defe7b1cd4741a6b0465aeafa37370da57c88ad9963b2bdadc26f6080bdb3c88eadca24f6f59ea4', '7991b8bdfcfaf92404e229e6321f3285eb28040b421e62a734ec92d1db04403ed577bb837653078c', 0, '2024-11-08 12:41:50'),
('2e19a904f586766d90f7f071ff8f492d57f76958a5ea1e877097f19d78e7733c890100f34dd886c8', '031cc43e1ae2fbf8653525baa17e5a0b56b776ade6bf050c975a8e7e1f61252d18e022516cb2f70f', 0, '2024-11-06 09:45:37'),
('2ee1359046bea1b4624b27e7a5a48e84400787f6621d364e6d5164c806c5c35926e270dd82d6b3e4', '1bf90d84bf59d3517141a9882177b5eb309a32d7e720a41296132a906a2ae9d8b0c49da6ac3175c6', 0, '2024-11-30 04:15:52'),
('2f33e575842b337d36e057d6431b22ae66cf1a25bdc082f6ef732c56554aab15501bc7d9a65b2c60', '48bf9c0325d28456ce7217a53a45d359a95c3ece94a43495b9d11ecafa2e9ad80f0373243e3c2c71', 0, '2025-01-04 09:52:54'),
('2fab35f51accc04c23a23e98600cb83119c694b258e58bf4e44f0fb2f9e9f632cf977a57e942a997', 'dff22c4721c206a4ffe5866e29ac2b6c7a93afab0675d237bdc52cda5cd00048a00db530cffbfb8a', 0, '2024-11-10 04:18:50'),
('308c9c47d0d88e4d8bafd3b015c0ec1ed5fb62e65f7d7783469a28bc50a7b5363a5b507e2ce8edbd', '5e90dd124d4dfaf46014f6e69c8ca9716ca091a60f0bf942ae58f889639a3783f2cc1bbcbf9e6ebf', 0, '2024-12-06 07:27:09'),
('30bebf1492ed30048f778af06c6746f1c189c9bbef26b80d9eb562800ea843c0fc8de7eaa74e59dc', '4ce08974d7f1e416109d712dc742f9d390cf68f8bc322fed36115fffbeef807fff3af9ea93c8aebb', 0, '2025-01-05 09:34:47'),
('313d568f73ba0fcc00361895cd92a79c3d141f512bf8cd33804eed96385e555df87f2d13144b9b76', 'fdc22527ecf8628638bb93e358c256149f28fd6121aeba2c5ddd821bece923400e8df6aa6b884e0c', 0, '2024-12-19 05:38:20'),
('3247eaefd957421a4c213180be7c43a33fca942157b3486526a148bc2f270217239658808ce67efc', '90ab52324ecdff59e0ce98ee38af51acc2d1a2fec81eb0bea517ff75748bb6b5b59c7f3d3c4491ec', 0, '2024-10-27 09:02:42'),
('349a79ca0f08509b8f2c267a0dbe355baf52a7b67f72b280b502f4c0b0196a108b0054aedbb005a2', 'f933b2e8dd4c2d48e09f52eb8b2be3f39d3f7a221b077097df81678e50a050724478ed42f83e35ce', 0, '2024-11-03 12:50:03'),
('38360071736a6a74422dcf377e980d681fa018bd25c1ac1d5bee96c4ab7efeb67cca1cc75c409515', '41dd4eafa556c1e731bc81720887ca5f8365ff8ce169dd7825df9c0f34e7676157b6b0d5eaf45de4', 0, '2024-12-04 06:15:07'),
('38a42a6c75100569dfcb4e35830815bbc6bfcfe4c4f412398e9607ba945116e2ec7d103b5ef9bd63', 'c6a55e18b1a68af8d4a6e161008f9553028fdef5b87d73839c2b7aa4e635314f95728fb8edf5ce72', 0, '2024-12-22 03:51:24'),
('39576d79a44cb8e428d92a66aabf8cd89f0a2863e57e7d2c6d0b833a044960b206356205f9685c3a', '2d37bbba95983c3e684e3795c454c002509280e851b890b5e7dc35cb50dac0821753a99094ca4699', 0, '2024-12-08 10:34:36'),
('39e2b9f74bd22623179dd101ac04ca6c64acded726339e623fccee641874baf2ef39e3a5dc2152fa', 'aec87f26ceeaf14dfdf865fde9cbc80a3820625faf84320fd6871746b2eb6cdda402cc6745a7ef23', 0, '2024-11-13 11:00:55'),
('39ee45d18b8e8a03384d5be94b259562e1208b9c69295b297aaa7482fe513502309adad8e8fa40f1', '9903c6aa0cd6f2c10cee639ce96883a3540b24819cc277e4a2f6342935681d7266fc4d9887f5220c', 0, '2024-12-06 10:40:17'),
('3a44b23799cdd2680755160433f1640c45f79ea1db95be51552a37fe82b0ae2de23bb253d7f4e7ed', '556c941f751b09df65a27bc9f7e51150aac7c31549f4fd5e007fa87109d9fded280f03e04bfecbb5', 0, '2024-11-10 06:07:32'),
('3b30002b2c358be6d79e5f1b17b459c884f3b40977c5ef4e5c6cc4d50ac4882a956810e6c191f750', '4f774323a3e8cb49bd8e60e54621be02f150f3fda0bd5638d684a9ce435a5c7c1db975f92dbe4003', 0, '2025-01-11 10:15:38'),
('3be1898a075fb81628a19d9678b7a0d16865425ccea7928c11c28b368c0c4b1c7a587fed4626b69e', '9f53b5114650f833a1c1b87713b567ff8ad5f83e1544d623d1ee52f0482b751c390accb67ee964b3', 0, '2024-11-05 14:28:46'),
('3c0f77d80cd9a9e54870e7a7a712b93ea6ba532f11f292e19dbdebe5e1b24b11da2243598e751263', 'ca534e010f3a4bfe442a556b9408fe348a2c20284f7b7990202ab4c151ba157e1be1b661f22be40b', 0, '2024-10-25 05:32:09'),
('3cc544830b03bc58aef31e99e5b8d09b3b11009a1c9f212faa9f7fa9ffa0ecba0a1063aac69d9c39', '7fb6f0e787238d25bf1c8f7674117792510848ba0fa643eafd296ed0b92761f14643850d70a19a29', 0, '2025-01-09 04:49:22'),
('3d199529201170e45895a9703301c29dfd6e6f5dabeff44026d7565ab0ef5764d2bc5aa4622f7c2b', '4aaa57126fb637a279af0b49c4ed472873769f2c8ae7ef919feb9864c17438dcc4606fd38a6ea823', 0, '2024-10-25 08:24:12'),
('3d8cda60556ed3c478bb307dcbfeeb8829e9cf4eb64a3b1355bca9406787bd2602f798f67f8d9e8c', '76a535ccd469eb3109db8278f87104675885eebf71f76936a8b81bcb0b770d2bf48e43f4401aeb4e', 0, '2024-10-27 10:42:24'),
('3d9e1006aa1627fbd8f2f2986938bd5c46274e000e63244b579c789dee91bb804cc3b313f86ed31e', 'c8d5368bfdacc2bc6792c764de15c8902fa63b3d9748632552c0ba5682d99067781afdd93f041aa8', 0, '2024-11-02 12:44:19'),
('3dab6cf03e5caad6eae1e9ec87f70fb69eaba116687595bde648e196f3dfe30b2dc99edc13ed0404', 'fe8d76b6b460fe3ad1ad37984b608037f3906bf5008b9bc18fa07039e1b890878ad626bb39d0fc14', 0, '2024-10-27 11:14:53'),
('3e332982a44e13339a165c3b57f0cd9274af6f398f23e249c18d45cc56ce6e294d0ddafe8126e6f9', 'cf1c398bbb7a35964f801cbb640302d3447c9cb7e972af0163f31024496b9e49fd9099e419dbad5e', 0, '2024-12-13 05:53:26'),
('3e5179f7eb817fd59eaf8b0229a8b6b0f7d59e4058aa5a2f917fa2e9fb3e8d949251da87b4f72707', '78449d2d28908ab2b0b63108442fa04deec4f5a9091bdc16e092ce126a4a3a3ef09b6beedbc23674', 0, '2024-12-13 05:55:28'),
('3edc20c5ef16e7f1bb6d05c316c1b67aec56bbc052a0d5b5bea84053536e52defaa4e538c2963ad9', 'abb9f0b7547183eae886d225456c9eb55eeb8f7cab82fdb512b6f957db818fff459cfe0a40dd6b77', 0, '2024-12-13 05:56:19'),
('3f3409b80db8d2f2baf9ac274462a6f2039147c4441818d18acd614a42dd0031a7b5e4ea33a320de', '6a5a2f052d4b7467d3af32b6dcd7649565dc6ce79bb3a77679a6b4ed325e98e892b6843ebe759ac5', 0, '2024-12-08 04:49:36'),
('3fb0f9f4457ddc46a04402de5e940754eea43d0818dfb9f1827536845fecc03e1bee15b80a03fa13', '41db40a441abfb12943c9d58a523331ae36449db523e271ca713c98883e643dd0db2084b77312956', 0, '2024-10-24 10:31:50'),
('41014daa12fd0715a64c296174a7f3e314413d279d5b38bf9c6fca06bd21eb51a76972a23e5f277a', 'f9538d91b028e3650f0c80d9b15192898598dcf7272525f9f082525a04b953b02045201876e3eafd', 0, '2024-12-28 11:42:09'),
('410191be72928fe9bbfe60e96597cdc1ee0aa6f8838d74a0b854a2183d85b53805365f9da169b0ed', '2240cd2d6ff244240ccbd73eb6617080cf2feb16bca464b41b65594aa50217262ffc7c6d4f1ba510', 0, '2024-12-27 11:01:23'),
('413a5cadd05d4015183d922130100627b931d63b6e0bb62d5540c599c8515e5271b26479bbd00189', 'dc0ca58ff16895cae2479c1270c00bd586675538c2cc5976c53c8736399ce68e1e28facb4cd7ffe0', 0, '2024-12-04 05:13:55'),
('4282c3d62cb9bfc047a7cac043cfaa6cee6cc644afff405a8a9751387ae9b7a1ee5e4ea39fb3d7da', 'cacbd92627abb33f4d110591fe0763f1fd71ebfa7cb5fd35f7d5d618eded174867b683b6a66b0568', 0, '2024-12-07 10:00:15'),
('43e66c9f436d7124aee02ea6fe28a7d9312d3e3ecc1739b2f36c4973f0246a7ccf60098e10b1a145', 'a7214acec27d011c346c330643cd562b6392380f4497610ef42addececc4affd53a72e1d108a630a', 0, '2024-11-10 04:23:49'),
('44d9218afd1ee7eba340af9de8d80d06e4badd79cc97a79dd5d1b6019eee125d5a312c96f84a1f3d', '1bb41afa2dc73c231fa0a6b3340afbd2bfbda47b5f649a5f78c301398bc34db38e32034c20157c87', 0, '2024-12-27 09:34:48'),
('46174b325f34a8a15b3a1b2b9fbf31b529027a266586c9e14b7bb8d2da8e4fdc502dcc0092a34333', '411df6b8613ff57e87e7dd26afd3aecc5fdacdf38deb8728090b365e28b11fae0fe7353ce032d2e6', 0, '2025-01-09 05:39:46'),
('463eb3a457dfafdabb9939bc91c911526cd584c8c039a0fd9d317f80e9fcf1c8db13e29eb53cd956', '6e28d85f61e562d810446bec66b3ee25ce848f94b028f33c2f5b749eafdf3fbcfdb2ba8b67713031', 0, '2024-11-30 11:06:03'),
('4682925ca37634e60189bf66cc73f243431ceef4f6f5fb88cd1c2001efc60086bbba8b48b55fb962', 'ee2aebae5bae53464ec793a779e635d1039ba59c41bc34f6f99c309ffa60bcaa70a3447a28f93b36', 0, '2024-12-18 12:03:23'),
('46b4ef446d1cdddca3548868c0d9bb3a334186288714a0e6125b29dcf5547fbbecc692eddad6de44', 'fe7318909488c16d10eeccdb06a7e12ff797482b66a714d2b35fd75964593b0d9250460d7c9b13a2', 0, '2024-11-01 04:34:42'),
('472d95f6a15014c2ee1ff71bf86be47c651e2ae71679d7220df3592478c50a394f8a6b79eb49f8a3', '45203cc1104b5ad525ea41ea8da593ad3a0a25c1a59e8293cceea18317211a04140353bc6f67bdcd', 0, '2024-12-26 11:25:17'),
('47a8359c7c511cd8faad318c5efbd2c7929788701d0e2ea48b67fc9ebfbc0900860de118a0fdda7b', '5afb0cbdc2c4abb04bdca4558b1978977416001179f2312d272bb0415e0f3d4491f5b08875b3a523', 0, '2024-12-20 11:37:38'),
('47c81b54406220f08c73837d5c3d53c74d29fe9e5e0d184cf01c35e0f6a256b37416551029a11757', '62bef1041dbd61fcb84a0cf218c2121d0bf39851fe9284a67f5cb981a19df8f15445833b79dda886', 0, '2024-11-08 03:45:31'),
('4808e22d57eb8ec8253b4c88824aa662221079968cc72358143b20c6355b7550bbe49cb453504baf', '6c7e1571bf49223ec189535d137e504b013556af3f6c7d5f277dfa0ba665c317d7c5ce78caf07487', 0, '2024-12-08 03:47:40'),
('494508b877bb7109263bee9696f830013f11d3f37335623c0f0e8e53872780590b0cf32963340ac2', '238533f4b499812681ab1607a1dae11e4810e74d65042d25758a1ffecae4298760cfd92fb7bd377c', 0, '2024-10-24 07:30:29'),
('497f9cf2cb9fd008d64a8cc964e630be9802b9577a340cf425015695e5ada3675cd81f804553058e', '837e33a4711e5a7f47b2689d7dd6f9138d926656b13bfa626897192210d860bfa92af09d2a9a03c2', 0, '2024-10-30 06:02:10'),
('49fcb4ccc6fd0e7a64c96c776a20754667592876fcbc6b12fff3736d3eca5488aaa1740521115261', '2303f1cddbfbaa4eba000a3924a177d22c2244236688adccea55627a9af272d5dcd0616e879ac8f3', 0, '2024-12-04 06:25:53'),
('4a01c1c02ed6be1c8db3555185b9a5be264c8682793f5604e9c3c92292bab7e506e51f80fbf86de0', 'a7ec99f213ce1fdc9fb59f89451bfdf8bff9080ca02ee1b261b09c6c254e48c3a160c421083ea3c3', 0, '2024-11-29 04:45:05'),
('4a16b42c38bddb82a90cd43af65c083fe37b1a980144ce596ca95bbb5f5390df5b0d8d27ff3f2cf3', 'af1c275f2293a474d6eafe90770ec00c40e0b79a22616ff106dc11afb5481ed0a084419fcb49f920', 0, '2024-10-25 05:15:56'),
('4aa5ffc1ef0557a95490808d623bbfc3a99cc04e0fd5e5ab3d579d0737c8f381f82ddd44276243d1', '3a4d0765291e3ce9ab782221a82795d539b5464c7a02bffc4bf2edbf3d65f33248f7d1e1a4ee24f0', 0, '2024-12-14 11:18:23'),
('4b06ef00fc4f6a5d80b383d7b34ae00d81fe6dcb6edbaf69fa6fc6f389ecc57fb1c347bd9fd3eeaa', 'b948c2382e7530635ecd29afe29ac824caa9f022a5550e9ca641b34d419d390402f0bb70f3e2285a', 0, '2024-11-02 07:25:11'),
('4b86ffc9d44853a0ea14065e00f488eaffb3d5fea7e4e9a26aede395447525b481127f974cd74ad4', '32e5a241f780a1555fb0dff7615f3b21863966ff9e21d6b2bc74c090d56bcc57916d230a1a4904ff', 0, '2024-12-08 05:14:32'),
('4bb8e2652f1cd5b9abcbde820acf4eefc423c298f4f65becd554fd524c24a7a1fb9a2a4977155b70', '734c7bf94223863a48d0f1e412ab78702d37254a92b453bc1639a65e7183d5c504a861bf0c9b93cf', 0, '2024-10-30 05:08:12'),
('4ca19e13ff948416604a3fff69cb4f0e01244e26bf5c9b54e6046eebf351311fcb785763f1ffe475', 'c434b0707dabdf7c27c107938acf94c84a2be63808604a42f2034ac796e0433a7af7652391806425', 0, '2024-12-04 09:13:39'),
('4d3061c425341f12fd874c50bf5126dfc475761fb2b8e4215464884987fa59b96f10c861c06d10c1', '2d230e59cfa325792cf7ae39d08bb39d98afa01724787aa3f736e8a95cc80db7ce92744b42a2c0bf', 0, '2024-12-27 11:04:22'),
('4e6040b52c8b98030af2487c7c01a7377d0690d8884e019da9f274191c4745aba88d71ee9ef4662c', 'dffde78a485eeb1b10522357332fc6eed52c0749bcba91afd1abc7d6d2fce363633ff3f5a51b893a', 0, '2024-12-10 15:01:36'),
('4fa0dee9103427740103bed36bbbf4c1b5df338eacdd52e69d0b471b6a2a13606b6e5bd5d8fb9858', '386ee6b6f24db5078098bb80d20a78f6cf127985d3ca445ed7da6adfc243be5821885528b740488a', 0, '2024-12-24 12:57:44'),
('4fea6c7ee3da65332e529bced20bb411a1342d485ab1adebbbee9c25f2e4ebd55d36b2226cfb99b0', '561a87b8bb36a051f8f70d2c15042a8e187e50d393be1cd551fdf114aad29ca322714662cc436af8', 0, '2024-10-31 10:45:21'),
('512697be8141453a1b9ab2b4886da727082f4f04fa18238a0da6261c1996fd0cce6c57baa9486707', '8b9eeece8832012d67de73953e63f375b4cb2685bee02e65c235253971fb6ec755dbd290b6e624e3', 0, '2024-11-07 08:36:04'),
('51357cfc1fc7840fd254a4ccb070fe54e675483c8dd099cf987a6ae2bb4a11ec838605b47ebf8839', 'f8a710cf6cb4be69a8dbcb316cb2c024a0fd308c0a489971a100ef1ff380b4aa0fd36f77e5b9d6e3', 0, '2024-12-19 08:59:05'),
('5161e206b4b57a618fc59403ae52a35f06383a979db2d04240af2d12a375f0c477a12f4068ae30f8', '241e0b019d303bceeb4a48f618eae11012e3024e2d3f732eec0fcca4cdda93b50f2b47c26cc17807', 0, '2024-12-11 08:22:39'),
('516bea171b320b3173418bb437638b959a0074dd2674fa8e4bed186cf53fc0ba52c189b96fd0772a', '69943745c1be60c7bf16a25ca15772a0757d0c3a5a0bef2ce84bb5b68917f4aa0d9007d70d7045a6', 0, '2024-11-27 07:14:02'),
('51bfc7d7a3b33f6cd5a8d16827331786f802ea9222525f8f2d9631a6a222df6398afe250897ce1f2', '1e338c3e1343f8b80e14ecfccdb86d5840e2f6fa0e4b96f98a2b84603b271f39934766f65ef8626b', 0, '2024-10-30 03:57:44'),
('51e64535968aa96a9e2559cce522e2614a699936bf4382954ca1090b377257b71de40df9288b5b0c', '6c323b20cf969f3fa23ee340ce8b0e483c2c5fbeac4d8ba5e564578a80fe9974ae40e8849b5ce8e9', 0, '2024-12-10 11:49:00'),
('522f069cd08ddee5818ff4e43a34fba2d8ce6270b959fd64641bc981b8d39627e1e6f3853eda213b', '41f64ce9633bae3b90d862b72e57a2fb8addf7ac77a6028f2aa838de89b45fd11ca150e35885e2c4', 0, '2024-10-20 10:24:51'),
('53d6b6c88a69a9cb60eae8cfafc6b855c0805bfe45108c4595bc5b6de502249bd9a307dc8d6b1893', '964b7d296c03eefa61f02706f930b5d7073ebe0908db9784e34bfbeb0e0d96a2872090ffee2339e5', 0, '2024-11-28 10:43:51'),
('5438db54f48c1bdb5499cd0a0c8b0463585080aea1e6a6851075b6dce002937948ebb60e2d12f329', '36a8bb2995b879986d6b50ae1b5a04f204af7f6a0ea50f04741f9c618901f05fd96c1202ad14dc38', 0, '2024-11-10 05:22:52'),
('545057303f8a038b06d1c22e89ae059c5a7163d99e8bb20ad7f7ed14a38b29e9896ebb216109b2ac', 'b5c79562cbd04e82e0da10074f23ecc0db8f4c4c82ff25786681d4204bba8170708a0bcb25063ae7', 0, '2024-12-20 16:59:49'),
('547444002229740953ab02c361f37c64cce3d8b32b2f7e41011a3bf5e0379ea6c27461c5f64dced9', '650c69da00839fa7ce08e8ebea5b80624aab34381ec66a88aec0a04e75c5734e73e2ceab06e345ca', 0, '2024-11-13 11:02:17'),
('549b7707ed7ca7a3f85bae9b32fec81ada3be7ab7f193361ca82bf7aed915f2449493bcef91ed015', 'd68abaa814e93517bddba0e528aff10d6b1a4cf31296f6cd98b6835e71ab8275387597085609ed7a', 0, '2024-11-29 05:26:58'),
('54ba8805b01ebe73715b7916b3b5c6b56151cef49ff721b2bf57c8eed4a298d16dc60a0bdc9f663e', '97261f848da37c56323da3d01606a0ef575941a4b9adeafdd7a90ec8d0a3554bcf1ad5a455590430', 0, '2024-11-30 09:49:38'),
('55007f5b61b99f26567b8160b3deab695da322b564b6f63baadb5266da40a3ff3a7aacb37bc22f37', 'e61db07cfba6d01a352efde20e051b9250b35793fb4099a6964cbfd5838f21df30db3d7500c89b17', 0, '2024-11-10 04:33:16'),
('5503aca1e62856a99291d08ee67366595a47635e4f32b0517d5b0c55ba825a4d2c39bb9f16d66ba9', '7625972eabfcbcae451547dc7dfb4a017cd39dc08743f7ab45ca21b6aea365f019ac6f3323c986b6', 0, '2024-11-23 06:49:13'),
('559bb1873af471939a7f97d74b589d4cf15d06cb6cfbe49bb489a9c6b863f7d8d0d4abc5bc008516', '721c553b16707cf7bd0c9843d1b67ef0afda54b5c79e8e0d26594bc3a8017c944c4a58cfc7d56a7a', 0, '2024-12-20 11:19:29'),
('55bde7d08ab51434d1aa759178e3f6d57d790220174c412caa203f6d19f6e3935c2a8b58a1cdfbb6', 'dc0d3a60d5e7bb0713d3978a05f2435e27b18d8fb2464f971a40c135e47a2667ff20c84b53e1d9a8', 0, '2024-12-07 07:21:34'),
('55daeb930685b6c4af978fe96cab1d6f29af1872d3bf24234e0982892603c2ada230058608ecd0ca', '34a92ac8d4d28371bbd8adf56dc1078cc3e6c041dd294cd540bcafed6dc8e0840ec9fa760d843a1a', 0, '2024-12-12 05:17:52'),
('5797e9fc53f88a150cee53dc40a4b3ac14ccf44b115270c7738ad6ff2bde1affb670deb28486d2e2', 'f768212b62f8a970d04c6493e5eb41bed5bbc8c337fcdd4c693c99aba1db7957c8ff89d139a912e3', 0, '2024-11-08 06:27:04'),
('579c7d8f0b0842030bdc57132a669e97f7bcfb6a3d61e5814f10c296a1d9467f56d1de73db834c20', 'e2a9cfc5687c128dec64b5b03a5ca1762c95d90b16a1b36708b014747e1b79cc957eac657d01dd00', 0, '2024-11-01 04:20:32'),
('58850191095c369749d093e14bada5943a9956a1697ed2d9238cdd4645814cab88ec6dd65e069b1b', '2888c4864c12383efb8a9835b2d5092eeae21fb2c5e33cff6995e3da72d8025484d7216b487ed6fd', 0, '2024-11-20 08:45:55'),
('58879a7617eb2da4ae55f709f85a961558c8db857b6d020a453eee854eb649a5e6bd0ae40f4fe3e5', 'b4bb4475beba1c3bd89f893610e55b475e1c1e86e954958047f697921dc16d04f1b4294afd54ae39', 0, '2024-12-05 03:47:00'),
('588c0af21148bec8c0f736ae3b60efc4e2f87414c55bf9b118237aa01c5753ba5a2d17cb9931247e', '0b04273a2463c344a65f074647a91cc2f06c2b9b50b0c6a90c68ebd0b5040b5d4cc04d4fb59247bf', 0, '2024-11-28 11:11:30'),
('58aff0a2317c7b9954cd6e1672f072ff751b022f74682fbc95c15e87db051f78962a015a4003963d', 'd71f676e2c977abb72129b1649de417b90625d2f188ede5b625f7bf4c11f08512a785adf4ee34d72', 0, '2024-12-19 11:15:14'),
('58dac16e2a915759d11d1445c743050d5993805dc57fef6d058aabab31fe566575131450186e93ec', '877b91e2f9c20bd4142eece856dec5b2f8202bd3a831932c9845050339620ce4767e54ed018e9ef1', 0, '2024-11-08 04:46:53'),
('59b7fb03973548461c45a2bcef1f89bd9617e8db47b1fb1414b8c2088e15b188019cc988883073cf', '0d7ba9dca731a59b46a085434a42a04d86c80a1b69601fbe6d5312c57cccce20ba45075e1ace22b9', 0, '2024-11-08 06:18:39'),
('59d7ba33944f5e562e01c30ca6ec1b3bc5d468cf44c84943b9210d46417f341ab0c54766b7e81487', 'bf8333677e6d9053b635a363150c7509395fb469fc11b2ee6279b18312e26610bf102621717b0c96', 0, '2024-10-25 05:19:39'),
('59e138e5184e4ff324dc69cbaccc10c7c0ebec78611096d890d9f24e9e57f5acef1f08896485836f', '25223f8a0c035185cd4e4709b742a61f5683c78635a4c87d3471b196a1d10d73584a2cc7547aa09f', 0, '2024-12-25 09:29:15'),
('5a01d45459af07e174927cb83e290ad3a9599ef8394b201e9ac4c23e7ca2add59f083fa95af64775', '0c7b83e85c7cfb05fed82fc259d549be215341d5a0799cb0dc899e4a3edb328faf4e2d48d082a974', 0, '2024-11-09 09:03:10'),
('5a0e28cbb4024e1f690b3c28fc93ec1150b4098bd8d2947711886403409cbf55e5a5957b45bcbfbb', '25588572ce7ceffac301a6462d20cc7947106f81389d808e8ceaa6d213156f558a0021a57f749e77', 0, '2024-11-01 12:42:56'),
('5ac37f97d72ed2d26d44a6f0bfba6f8349ea70995c0967959b35f06255eff56e429cb68159dc3db9', 'a1c484b42479367968892e005d4a9c5a29af505b3aec619fa5551c8c72ec01e3620f091008d556b6', 0, '2024-12-22 09:10:25'),
('5b3cbfef9a0e87441aa8995d9ea5483604aa7a7e584abdcfb5170c812177d508b61b68c2b0bf79ae', '4105b16d7681243b47dd95e45a11cbb64f589e1ad93fdb20646ed512fde70e595743d9f0229aad94', 0, '2024-12-22 05:25:51'),
('5be8ccee9d63d7f1d89e68218bb6aa592ab44819f2863545941fea3eea75aac1082a418adcd35666', '5d28e63cb72b582357730162f4a58f3c6cf9365112a8df8afc2616dc4991dd293dad3ba575c09f6d', 0, '2024-12-07 05:17:01'),
('5d4ff8a3631e4a4b4bc37d7233c9ec1b6eef4df845653fb82588c546692abc382c27f363369fccc3', '768c7dc56bbcd2249bb5818c4f665d6c877713319c5dd5209c97cc87e9dcf3a5fc4f51f67e657e96', 0, '2024-11-02 03:51:42'),
('5de25656014dbe74fbea1a02bff3a86c33c1a8af30ee92460a4e911a1ac91b683011cc5f9d593b96', 'cddfc5a499e3f994428b5f3720c30bd8dea117d987bc46b1b81a0ef68330b10a40d8ecd161d346e4', 0, '2024-10-27 12:52:17'),
('5e34e8c62261db664b297a816b8715c51d12d9e895f5d01f88e826e2bc52e909bffc233b04b806e3', 'b003ab85799cc1bfd7ad9ca4140df4fb8994af82d48b724641393dbe6b3b0008374348e24cc2b952', 0, '2024-12-06 07:29:29'),
('5f58e738f05c299431f42011c95fefc75835b5a856bd26be364753c70a5b1f9d99c501295b9e1eec', '1872a3ec26ce42f8430e36297a99eb3e47d515b8107ec1ab9caa1e83883b08f3d18e586444e94e40', 0, '2024-12-07 12:33:35'),
('60bf52c72f74e78d25db1b29ae4de428454337d1e7242e8c55f07407a2c8feb787ea97acca55dfe5', 'b6fcf3ff45bbd22cb48a1cde4dc7ef8b9b975e4977e388a8dd8a94eebad884dcbbe9d3ff941dfc48', 0, '2024-12-27 09:23:52'),
('614646b0fb0548a8ce59a0640e3a1a9e78154b68cbdc9b43fa952724447c3af2194dc4df3a26d519', 'eda16f7735e67168c40e6e02713bdc6c72986a2835ff83152dd91531e8794ac191b48e3bba37f49c', 0, '2024-11-08 06:26:01'),
('6224b4829d4ce1c0bc984102ce39f6b0ef5bcfb374c814d105fcb130b6d74cb9501914270cce9166', 'e371b502d0294a3066883744fb2c1554a5f7e06318a36e194679c6cebab896b9fa00d168272584ae', 0, '2024-10-23 12:20:50'),
('62b6d1bd1bb2f0212073e321b40bf685515043bb7e38d6349821a21c987188ba142a1d897a1bc4d5', 'a28bd864f0e3b9992b1787ee8c622b1e1bc2a4a435304e716a9a604fdf71d3a97b1b626ab3c4e0e4', 0, '2024-11-29 08:49:26'),
('62eb1850840c6364d626d0747c23ba290992b651fc14804ffb268d328de3730e483b01e9575e3dfe', 'e72e72c6f1f00ad39b51e06e21b8ccdddb53e4951f30d6e001e5be859d7bc4c3192884f5a926128f', 0, '2024-12-19 10:42:06'),
('64334a8c9567f56de2d6d54a9358d8cfe7092e8cf580c61bb96830f645714c67db1889aa61edcf8d', '64212df31ef2566b37b3e65efe98a3876fe97d3208cf1290c624e3c3673de89fec2a57bb510c388a', 0, '2024-11-29 08:53:21'),
('65bdaee3141eb8e7cc8cab0f544f428236e45d9c749c20c55c7ee3853e37752111a77dda87ae8074', '05a843dca0795099c469fd17f81254b8fa4d320538e85a7bce990556680d7df63928a489a71f7676', 0, '2024-10-27 09:57:11'),
('65d671e81e34fbf61d8d91b225385a9f0dc3f60b2251c80c66b0a7f04056982259b7502c79bd2ed8', '6ae84e8466b2bdc14d904769f7f140f6a265c5048c819462ee1f47690b97dfa0b15e5f66eb05c24a', 0, '2024-10-25 11:21:10'),
('65f8900e4b6bdeca9848e9de5f191bbabaf55eb979c141025431908be210fb160983a4565e269bbb', 'b1138217ba0035b88369035aab9f304de5ae50a3311860c74f9e944d7f883674ec7b1ce287df51d2', 0, '2024-12-14 06:08:23'),
('664794193bd359ba370838f4fb33caf21fa0cd700381b35525aaa9a47530a8dd10d858d8e87dfae8', '049f75dc7d8bba051e3898685b75af6aa2ee0cabfa56bbb3a754738c85c0488452030bff6a33f73e', 0, '2024-10-27 11:53:57'),
('6692504ce29d7a66d2f85ab47cb234c94bded20e8878f0f92e6ef8ed153a331cf17577825f09aef6', '4966af976b1c8d4f5c2e9be8792aed6ddea8b046536e97a62e50b78cec39478d0f7d5e89e4927511', 0, '2024-12-29 05:01:07'),
('6692d2046d84d6b48c1f00dc98792d4587d066109dc454defb48094922104da76b8d95bb39e9ea72', 'e00570b131c6ff59ffdc0b1cc80b4008ea2f673342b9906ad453b1af5ab3fdaa32fac38605bf6356', 0, '2024-12-18 06:04:20'),
('66b064f3fa8e03e451bf60b4c99d94a4aa8bf3b2a35eefe81db2a922a9a9a7e5f1236d8f74d78afd', 'e996b714428c4031ec1cd9223aa9c6298e7957579befa64474dbb1722b8fe2e165288187c56c1978', 0, '2025-01-03 06:48:44'),
('67b81b448811a199bfadb426296a50f4924a27c64b90c171c1b2e5ebc300685a0e1df21dcb72defc', '124cdf2ed8524b3bd983e432885d263d14c114c67dd9be295ea80f6fcd38feab4e62ef511516e701', 0, '2024-12-07 07:15:32'),
('67c8c27c7ff8d366ce966e0b5791a10ca33f660719a5ca7d55b1e2cf5311ca9eddd92427ac1d8929', '9b034a5ca58cc36de5f4008c675e75df16c8d7533c56fca90defe6a003bed7530b72b9997e6751da', 0, '2024-11-08 05:38:00'),
('69649bedf9a58d38e1341dae0d69a322a1aad67f5745292e464afc68c47c6c2bc3cf23e0b65a0d8e', '6bc8e80d9cbfbe11751c868ca769dc97953f207771dd8e65cb3de0af2a0f8f9a3203125fd3cf250e', 0, '2024-11-23 11:41:35'),
('6a8d27c36d507c67294d3819a96aa2938849a6a87a5305f1a593a34d17938796c4fdefba62393e1f', '674f6c5e028cc01272692aaf3911f2081f53209d09b18db14931c5ea21738658af63584d255c611a', 0, '2024-12-12 09:43:42'),
('6b91bfa4e411e136b035e49f8050ae4f767ff5b7053a8a17cd6d21bb669709123a58439af1e9c09d', 'f734d088d0b379e6930963b8211def5cc220c374454934c775f4268fd22e0945bdb00ba701d53336', 0, '2024-12-04 03:48:53'),
('6c2cc28ab9f91a4daebc0fa4c62a86d6e870e6967a1761e4adb88082630e80593bf23e9617e0b8d3', '8790b52008b800c471321da793d6e713085808244f760914ea7f21f5bb5baace95186b86f272fa73', 0, '2024-10-30 05:35:11'),
('6c864fa62730accb6c6123b09eb92d7d49b0303ed70e27a45603feb399539a6ac118b29126628d5a', 'da9361637329681dad4266684c685a4d52f689314b77372b894c07be0479a86452220d1f255d1246', 0, '2024-12-20 11:03:43'),
('6d73883190e8b53cef08503690e59578ab6fcad51555493f7c19b5ffd3216dfad53dcfba178fc38e', '07a2c6a7450a1b12b47e891702d8ceab467c45a6ec3f98ed65a73ba2f53212049ffdee13571a734d', 0, '2024-12-07 08:49:53'),
('6dbc22172a6bc1b5868b2577df624cdf406ed2d153059ac6efba7d474c204878744458781d196b65', 'db8838e8ef9fe1af554a5777d42d20020142fad3df78df5d73f3408198572cc42443e5e62fdabc2d', 0, '2024-12-19 11:08:01'),
('6e2dadda47e3e53108f124db47d6ff110e0f39785fcdf563e37e575afb8b2ceae9d3bf58e94838fe', 'f7184c39fa541cb0cd59533a8560fb96bd5abbc256dd475ef4a7bb9a97fba4c76967e901f9600129', 0, '2024-11-09 08:42:01'),
('6ead3cd6590559fc5b5887d806ac360e4dc68645ea92584d55f5ec9b43e4442ac52bfde829a8d9d1', '755e5e9184f565c988bb165d1ba94fe51971e73531b7a27257a4916ad5cbaa138c8a6916cbb8d77b', 0, '2024-12-19 11:06:55'),
('6f1b1bf660b3e4cc88ad5932df62560681e0bc4347aedf44b5d6b88dc117014aed476baaa704bea5', '3f1e3c1b9fc6bb9dd3c6a62d5ec98191c5614b491c5faf5515a00e2014e25a98cea2424aa117a746', 0, '2024-11-23 08:32:57'),
('6fad91ed2c1ea0e21d1941e3938cf8f66b4d3473f2aebae6ed4dda7d9bf7318c1d3e3e59bbfb1c7c', 'c2a13d48283976e5ed84d5caa8143658c4329c7b15d5e1b12c7be24dd4d77b6f320b852e1712dfe0', 0, '2024-12-27 09:21:09'),
('6ff64c94a86d99713dd77758cf368098c0ffc6d55c31d028ff20d31fc1e4249c409f501e8404b35c', '0168bc2b93d0f3cee4902e2e2ce17b97ab40d2ab82340db8689d804a781b92daf8ddd6ef92344219', 0, '2024-11-09 11:07:04'),
('704e10642dc46736b0ff0d7506a3f98bf6035faee09cbc2852610faf2edb7aa38c85bcc7a262f55d', '82f0c87ca29ee81071e9850d396a749952c18ebef4971815f5e7fef8b50c39395f0516fc16d2dbf2', 0, '2024-11-08 12:47:06'),
('707d83f54769a8edef98331a4fafda79b64cb0edf3cbff63e74f06fe3d7794c9babbf681d72ecc83', 'febc22b3552107c6634de9f8f9d18c19c8a10bb034d8fdfb4cff95261836007f31ac2ff0ce0b5342', 0, '2024-12-28 05:44:20'),
('71a539f052e8449d8e369bd819f864cb193a4398e9157022c9c3c7a0398765251567d8254ca53f88', '86fd6bc1999bad3acb0decaf7de47d9538aa8ef386d037a103786ba9f4a9870a3e9aff0e8509c70a', 0, '2024-12-11 09:48:53'),
('71b36875635cead55313d44add695ec0f51115d50ecd3faabc2065fd483b8ef76af6779ea04cd5c6', 'cc0aefdcd7d75f793088200f45491126e43a2ab30a7d4d55024cd329bd2fc7b43589c64f3e66e339', 0, '2025-01-11 08:54:00'),
('720339dfda2b9aedb581d4100f2288c1ee02f683a0a7d3212a727aadf6a9492aebf1bf2fc4613a55', 'be7c84d7c5e49b76709dbe211f20a0a9acad6e5e5305669dc2cf94e150bf54c4f5d9c1281182c33d', 0, '2024-12-12 09:07:02'),
('725d07ca9358af1b8d921c89d26dd9a00a7c1ce9825a3ce294b16fe74841b6bb7f5d4c645427eac9', 'd71a4f240c7961118533e2ce6d50529bb50f896fb34538835f76de6282b30aef277e26add114c6c6', 0, '2024-12-05 04:09:33'),
('72827dea8e7adaacaf6fd3413a27e73fead91b7b80d0f8722d5d729bd1e3f82a8f56ee17440505c0', 'f243f702db8dc1c85553cfb15a16c45657a1ccfd4ab314aa393491f7b0da72e7e7f8def97f364ad6', 0, '2025-01-04 10:51:06'),
('73227be4af4a1782dde5e5b9192862fe468a8bb626b6a935a4b154e159479c283a0c9d9a5e8e5d75', 'd40f9baef5b0cb20ee31008286938c42e070521ffe569cb97f997cd6ba982ac681a34d6f3135cee1', 0, '2024-12-01 11:50:32'),
('733cd19d147652d1a5f9387ead2694f0170433a4958b959ea4286a51e2b67b85210b35b964f3cf6a', '9a679496d8bfb16b26b30f03af03b5c3be515ee476e362d3af7adf19c997bbcba234188281359b0a', 0, '2024-10-30 06:23:59'),
('73846c057c6295ca267d0268c814c5b5169a731aeecc8143d7e164e7bc679523e7b187670a73d4cf', '86f73af2d17adf1ce43e42e7b34990ca7a6f2540dc2a49c2d02ad6fbf1392bafb24d8758cc1456fb', 0, '2024-12-24 13:07:57'),
('73f3d4c97d57b67cfe0d254a27bd97abbb1991e435bcf1c105960cdeac67b0c07250c673e1057ed1', 'a27d3bc299647dfc7bb9fb1bb44987af2b448dbb15eea9d15ec90b2fd0c37d91eca9c4f8fe2ea2dc', 0, '2024-11-29 09:14:48'),
('7413a0a4df352276bf75289c9b7bac8117e84b398cdf4eb33ccdaa25647d4d52c5d68068a7b5a876', '97fc0292ab15e23d6797093a560e0b4d59e2d7148af77806ab7098434edec4ad9ed06c59b66237cf', 0, '2024-12-22 09:03:31'),
('75946e748797f2b7c4bd08290add4a8a9be77d4383e25cf0c71cf6300f71cfa4b296c8f79c78e835', 'ab9064f0d848546089c76af0efe4003114c3cb828ca51c48c66c9366f304f1e416812916fcfd05ad', 0, '2025-01-04 15:19:59'),
('761c0a6093e2c7aa200e6f570c1b8bc537402bbaa8f73c54dc4b78859927726fedbd3ee73d71e915', '4d1e8dfd2abf30d97611825347c4c4956b3655a75ba586dd47e397b5ca1f1c1bdfcf7c53c8ee9238', 0, '2024-12-18 07:17:44'),
('7649fcca72a8a19fce1a23bdc230fae725bed1fd77b6c1261216dffe6c4942973d37a42ceffe428c', 'ce314446692f155e0e69abf44f0fcf6e8962e5d9ca4653ec4f1810c3a08cb0d44348c6852a714da5', 0, '2024-12-06 11:13:27'),
('76a6bf10c7c02911bae7652859d32517cc634df268c38a99747b5591dd66f9ea9214cabc1899227a', 'ffca010ee88def0274a72d9c314e1ef849da3b94d9fdc5ec241dbdd35a1e76b238892d407b3d48e9', 0, '2024-10-31 06:33:44'),
('775ef1be822f7fc565f6bd31ba00ccf2d03b7cf2febe4da47be2f9bd31586a5d8038fca1e72d1187', '34de5c000120762f355c18f05589c536c10854046c6d7044b9b18ff8105c52ea94f5f16d3cbebc53', 0, '2025-01-04 04:13:06'),
('77860bc6702f256a379f03407938380960153a12ac73ccf112df9fcdeff0e61fbe7d9d488063768e', 'ec4ffff8fe4961a8ca70b47e62c3ffe2dabeeff4e09e223e96fd9306fbba135902c789dba201cc83', 0, '2024-11-29 10:57:37'),
('793a5f18f4c34f1881af12354fbc2f5192afcf15f45dc13b5ae545b710631c00f9736278c03fc050', '7aba65a9532df6bc404c771f1bc1fe40cca1898f975a13a583ee0b04ae740b04471606950c403f56', 0, '2024-11-10 08:44:51'),
('7a632e17059b7986a35da9b57d5bc695824efa68184401804dd2d6f9743c36475f7dbcb787db80e6', 'e414857729eae0a399d3d094a05fda620ff2165b79c4c7f452b815c1c192513c0e1f027d1d019d62', 0, '2024-12-19 05:08:32'),
('7a6a8b361ccef63bbefb7ac00e6cb327d16f0bab86a15d80ef2c9f0ff08994b71f3f07379877c131', '3fc7574ec7dc571c6a71dded64723c9675b1e65ddac2c3e80acbb2593e5c9f078e05971dda08248a', 0, '2025-01-11 10:06:52'),
('7ab4dd115f9260a4aae349e8002773666f674ed53a65995df9159e100caa341ece68b388ca3b76b9', 'f82c8352bc3d4a184c7262a8027a7e9693f8bfc73f790ceec501715fe63b0d587c9e45064a93fc81', 0, '2024-12-06 11:16:16'),
('7af82f37db8c4d4abe9ea42cf9f9df3b7818ff4b27ec1db84df6c67600ea267f6fbb0f3f09a53273', 'f109427cdcdd30e6707da2d1b4055fca7227f6953cea557ac1eb7bf2c111c10c0cf8c753906d2d0b', 0, '2024-10-30 06:02:08'),
('7b3f53c5edbda2f7d1ae59111c849572b8032a2bca37a18f84eb5eef2ed51c8b3d88364f8158e921', 'fc4c29a3631bd142441cdc9df3c5703e92b073c685cbd35d4979121b2b1f5dcd60bf4f4f3beb3436', 0, '2024-12-22 09:14:37'),
('7c71a557bedc34f087265d7dfed9e30a215ec7e76a36978807d67c7afa806aca2d6b19f319f8f3e8', '8d70a866054999026a5929c2398ff121985750e9547d0b9afd26d55c6081c37e244d16804f0af6fb', 0, '2024-11-29 04:47:04'),
('7cc5eabc456d4d4b496add642372e4232b7d6b858f737d0ebecb79576b9fa6c05cb36aa9f5a466c1', '50c0098088311a0de370de3183df776f44da23caf409a34a596009eb237fc0dfeb3a7d5f451efb6f', 0, '2024-12-08 07:19:29'),
('7cde40b7db571d9c593824f26198ba1bbb25a4e5dcb45ff3eb74ecd32001a366e0529f9f694c987a', '6c578c073b00ddfdf87ba96bd2bf44366ec526f72be920462f787034353b4c15813c5bfeed715d71', 0, '2025-01-01 06:56:17'),
('7d44f2e1595361ef4b3eacc3edc0bc3338b3602b093ab32826752af67c20929c0979188321a69ce1', '29cb3e913933f3b20f93346c09cd8a4074257e87600bfb59f841efdec389e20a1cace8acc9fbcb61', 0, '2024-11-02 11:58:41'),
('7dc5813669e8474904e5cefcefe630d66628a7ff7de121266393abd55e6f341131a5d9268f52abcc', '30041fe8c1c79bdc369ecd6b2a3af0e3d9b14472ab54e3fa16484566030dbddddcbaef428e714804', 0, '2024-12-14 11:46:33'),
('7dee8fdcff4d1b9a3f4389bed42bf9ce1cde5559aa901369869e2999266254bde4802ada0f4df19b', '4d56665c4b40145dc4b2ab2e63cb4c15129d08b4c69e1525895344688646cb315d9611dd4e9a3e7a', 0, '2024-12-10 14:54:08'),
('7e05b47655d471b359f19efc188a872c2231335d3b98f5cd5619a07ec608937344940d75063adfa9', '318cb09f42c4d129c3d9efe0f14e5028e481ea471323908d6e715d8e1c90152f39a16c716b2640b1', 0, '2024-12-22 07:26:25'),
('7f6783bcd8756937dbe4fe7106f286982c382560c50e51e0865cc94b201c7f77759aea3fc3beb262', '6693b4df43a43d263571e0a64fdde256b06d9548798f89c910e4a17a3d345a7b96e694403dadee07', 0, '2024-12-01 05:11:16'),
('7f69fbd83758393e157ff6e912b493483e61c75d4cdfc1150f8479f8a01abc6f85076bae6870b2e2', '7928a649e005f652ad7c74fcaff11ce05c958e2a299fd59986f2bb86fd3c631f78ea51e1eb64dc44', 0, '2024-12-19 04:42:36'),
('7fde0d42244f9c0925e65a63b43aed333e80403d9654c16063b5f788986deaeb493c753fcc63874d', '4175451ed111f779359d5cd5586d233e930812873d5d2d3f929e5660a1f73f756f797351629ab79b', 0, '2024-12-28 07:16:59'),
('803117df0baf97a27fc72451fd98d07c8fba46a037a0f7498ed40da19ac074251cd45d8df05cc376', '0625fc620bd3831ccb3f630cdfea7428ff78ff5252d5311b6ebc06757897afa40b8e25abfd67d9b7', 0, '2024-11-06 09:42:05'),
('805238e60d89e21443b0c4c9a5d9ba7ad865038167a131392433a1ef78e3177be609dc379c48f9c7', 'd6a6b3a64090f562f7004d4fe0a786aad12c110e1ae551bb65f5f9440486b16c2d4e2c84a0dd3d3b', 0, '2024-10-30 05:55:28'),
('80b66938ae1d45b495408201f1a2a2f63b89bd7ad8f9ee33e2933ad19793eb88a1d0914e10c68507', 'd804a7c4164944e15adbb7f1b7aa1a1ea933dc46a8c0a536076b371104fc64c234b95393582fdac0', 0, '2024-12-07 10:23:24'),
('80fcb79a187a72508f0295dbe1135965601501dcc32c26afa5f19876dfafe5ac3e17113f01f2fe6e', 'b2adf448a8a10c40a7858fb7c049178e85869b290daed4f92c1c79fd6f50e35e97db01c567dc4c60', 0, '2024-11-01 04:25:40'),
('826bb4644a6759c0e9e39caa20d3ebbe36cf8eb4487f46534389113a05fea2d2f85faaa868a8dbad', '96485407fee44208a1bea93f8500805a3ae5db992f14b2e51e38e8ffd74dd013b3dcdd51306e5178', 0, '2024-11-28 12:06:08'),
('82a60573a0eff981ded1732e5447c2a4f1ed966f458fad4644a26bd5d78fa6ab9a9a13e222fa46ec', 'c9a394cd24835abc479e83c2df70212b5a86ac00cca002608e7027738e71d01e0af671d54eec54f1', 0, '2024-11-27 07:16:40'),
('82f9266682546324c0f17a053e364b47f29f11afa2599748eeb0265ea1c17638a61c42d5b3616d31', '9a89a2fe695a6c62420acd988c387d046a624a807f66dae00052704433e6e775f53443f7c6ac3ef0', 0, '2024-12-19 11:22:13'),
('82fa4daf8a186ebbb326bade25c7b0771263e671e7b92913d58affb40d6056fbd057ddb7d32bc540', '4c0207bf29fd28177fc1cbc89d05be2f63f4e9b7a33545f54abab36efe7a60182556806e22318481', 0, '2024-12-13 05:48:13'),
('836e954195c0f9b450307855fd3cbc80597ce311dcb3cdf79df2934b8bddb1da09bc4316fb9a285d', '913b730e25576726e3a71f6e60f913825fc10a1f29ae210079033f94f1206fda7baee48c250eb596', 0, '2024-10-23 03:16:37'),
('84b531ef94e40212842e7c99d96344ac143cc9fdca7fbcc4cf986e959f19856c8282f741915e0c8e', '04ad8f8beddf6070c4641af16921f4243143a6775b908779e277076a8b28177b1903c507dc9a717a', 0, '2024-11-22 09:47:39'),
('84d013fe6e9862a4974ed9dada02c489db04b45f45ec479d77b32bffd60ca710a15db3bf53e019dd', 'f1627d1d2a79432563f9b5cdb4958723725f77564800e2f6fedb031a7919a2b59a3d5455b4c9eebd', 0, '2024-12-13 04:48:22'),
('854bd7c8190008f7d50d7e1f96f3f0282e4464edd0dfb085d54d174802672008d85a84ef94ceadeb', '130f76001d87ed61fe1bdb34705ed08bf97d2998b740531581c715702f166d08a68bc9199ea8e2e4', 0, '2024-12-11 09:29:45'),
('85aa7f18cb97ace1a79dcddccf2f8a2704f6c92bea826e00f64851e8b97ccbf4cb1a1c0e04b0321e', 'e7f0891e88b7f0dcff5df479a4a48bb55ed5392ebb2b738ba69f9eb929fb759810af428fc6acb398', 0, '2024-12-04 05:26:04'),
('865de1ffe3d80c7698863e2936220cb56bfbc5d974afbd29adcebe9900d83901481f8188f5e3e8d7', '281d1e7257306f2642a28fb0eda9411714085dd712372ef80ea255a65abc835dfa3b49d49ce28a41', 0, '2024-12-28 11:16:43'),
('86d71fd0c2ac0a57cec6a9f75d74e0244c94b88d8bbbb7392d20e0009364e4179ec2653084d73c0d', 'd2dd81be4c3d791a31efe30341200c9b1029865c6b9e83518ebb885f46b36dc05f822302257bb7eb', 0, '2024-11-08 08:36:17'),
('87f814061e5e81bef5254a329bbb35edcffa4275b1bac82fcb3315c09c31a9a765ede80fa02f0b8a', '098481ebfdccc80daa79ef28ac8305b2e56c2307bdbbbee8ddb1e4aaaddf2d0e5112506e8dab5ca1', 0, '2024-10-19 17:42:44'),
('8852b30b2a92505020beb8796e0d70a6962bfa48573c134f6f1b556be077ecb7fca4d101f83314a6', '10d2176329682b4523e0a30622d778825a76fa81d6dff27f2b4cc531391f8f5f28d110ad4596a7f0', 0, '2024-11-29 12:46:46'),
('89210ea0179c5a87d35fa4bb2bf5ebd9f4bca436ae9d3edd72c7efa9d3eae4fb5881520efbf39ee1', '316ea7b266f7aeedcf469b93dda901b0f336e77c3feb1bb1a0c46ddae401ef05c473ba4525faad32', 0, '2024-12-18 10:43:06'),
('894143928266572cc27d6f75c5e96975a5b1a40710b370b8062d0717a86f57196d99152ff2208f6d', 'e644979e6ea27ac9d857f0efe6d258a4bf3c738ef4cb6837be545340a08cfc4a51fdf9920595bfb7', 0, '2024-11-29 09:41:27'),
('89721378add7b0a7c753ae66e0fb8c50f8cd37f8d5317c31e8c909aefbdafe585bd2a10ddd008a61', '7b4c22f2bb092a5fe6aa4853c857b2dc8538705a443ea7796da93f4f6f6e08dea3b9f09eacca6ef2', 0, '2024-12-06 10:28:59'),
('89d580b7c030bc648ce68c1f6d38bb02907de4689addb2eb58084f196ad020530641d42aae7b16ca', 'a1292b6e904173ea735d41be885c5a356dec8e5feb657927ad6df4f141f6f13f4418c69b02beb123', 0, '2024-11-22 07:02:08');
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('8a68f22a54c22df8c30e5fe2eb552aba34bb4557fb711fd401c29f65f2e900fea0b0a00ed3f0ebf1', '50ed292d5c8968e75dba939817db4f3308ec352fc04bd2e2180b629bf0178085326c16ac6c2a47e3', 0, '2024-12-07 08:24:14'),
('8aa2aa8098e70c2a370b8db06e8e1883ecd33e56091e83042312687759ba7e4978c6750d20b8bf15', '6f29cc2639c49769f54653cb706c3735496abd81d07e9c431e099b9874b93a10fabf20fb4f0c1247', 0, '2024-10-25 04:14:29'),
('8aea3b424b2ad23579e01c20d2a1fa9af1e6af8f2f4d07253c9dc4e84563a012076aebc8094818e9', '467c97747193d987121b869edce1e003d762c9bb4d99d7e51e6c1868ccf793cd68740fd4108c5f12', 0, '2024-11-30 03:56:51'),
('8b58cb8a2fc69565a2dbf7aafa8bc3d5a202e304c27a12f5b8629ce568bfb7d84f589a85b672d7e1', '430a5f73bb3324dc60e7c44cd1508ae4601866d85c67ecc076384fcef4a708e1d53c65877f253d62', 0, '2024-12-08 09:01:51'),
('8baef88ee95703f693a47965954f0363f0547878293bcf574583ec320cee962890e7e8e31ec24aef', '55d1cf007b2d995c5c03d348cf992b7b46ce15ed6d3eec766c454688616c0cc84eca9bd59835d269', 0, '2024-11-24 05:53:47'),
('8c1e11f2a2ad4ceb1bc9359df579324b1ffbcf2d291f98339a3cd8fdeeb893bc888e9a68cfb0752d', 'c365c5b1a8d0928f1b75ae3dad5a2c2be15901a058ccb9540ae55ccae499d5291187d1e4c954c34c', 0, '2024-12-22 06:23:21'),
('8c9b31b489bcf86f1e63946a11a367cb0bf44e9324476d21e6b82abf70fd674cc2ddb639aff6e066', 'b1da2ef11adf3a76d61f6f230974ebee028bf630950f0847b86ae20e4a92f17e2ea5c54197c75a00', 0, '2024-12-10 12:44:10'),
('8cb9ee08830555b3771ffee6abefe08b88fe0c61da3f7660b38e873a7481cb93b77bc82e597c036a', '0e2b2a206256f19efdbc61119779454bb149cc4623eb4c09d29901a764e7267443b8a86d2291abaf', 0, '2025-01-03 08:57:40'),
('8cc74f6507cc9365cb38fef135aad2465c85b16b9e85c41a02a0026e0a6e7773f30626fe9c7d2e55', '53d20cf972bc1067fd363836ae81d7fb79de90b406942dec44c751ec269c36cca73d9d189854e8d7', 0, '2024-11-28 08:52:00'),
('8d034d5f64ab20c106197e28eb7e7a5f214b5e62fe44cc480f143d3a77d5863e9ccf9fa63d40f0cc', 'd78c6cab76f8d15343424a889125f2498f0e06b3589d18a5ab4b1805df9fa8e4ae8e588f9d902bf2', 0, '2024-10-19 17:03:49'),
('8e011c9fd4bfa08363defc518519482780917dbb13306725706506260c3d651132150dcf1f2a2a6e', 'f8e177dd955f43b708c36bc3c93b8ead087f156c6b7cff494cb678803089246909991d9c12a06e8c', 0, '2024-11-08 10:01:10'),
('8fc8e45ecea4e447da868e35f6ae3fdd9e33c5f7bf75a979d1d446ad228b55c86a4c21194089e96c', '31f6ba30f635ded824d24aaf97313de73385dd26554f43c97f71355c1546c9eb1428f9c2b822a1ce', 0, '2024-12-11 06:51:05'),
('8fca6f4d5b491088bf15413dbbba513466c8117dedc61c17cd1105bf645c483f496852bcc5a5fa7c', 'e9beec1b237d3b49c938001b0dde4e27e757f4693db0d089fc5aa05bdb3d0685d353bb0c10360fcd', 0, '2024-11-03 11:46:53'),
('9126b99ac932fa4738fa72606268a29cb2eb260d6811183d9277103c7682b4201013505565904618', 'ab139c91beb47247399955c83788b83e0a4803cd84854c94b0cdfe0277a2672409c5cc50a1560478', 0, '2024-12-19 06:26:39'),
('913a2777b13be46c2815e06f99a88fd54d7fbe866d182b0e8ca4cfbe1cc4503e0bc31f235a35a780', 'bc191586f046f866d070253adaf1d025f82706b44e6d24b95008d6eee116531029a183471a1779de', 0, '2025-01-01 06:41:58'),
('925b929fe3ffa8bbd9c0f4f9f18426229328ce2b322945e2d0e1ce9737da9317a18f855b7c566e59', '39a8b913ca3d8866f1837943ef6d7b71efcb574686e60f47f992dbfe14fe23c1d08e336f9672fa43', 0, '2024-10-23 05:15:51'),
('939002a79f18dcf9f0e812c76985a154f27bebf4d5abb9e51d30866ddd7a5ebe585723876bdbaaf2', '220600e2c2566f9d98a0ee152265322d4dfd0f0596df88a715641b764b935e7d40284fc15a0ffcca', 0, '2024-12-06 07:18:09'),
('947ac15e58827678418caafc69447a1a6facdbfbaaae6bfbba68ab56c18c1d60e442ab41565e8c86', '1d9f16a7a9d536092a72f3b48b09ebd2e645e4c3b8bd837b1ce649bef798dc08f562b98583340b42', 0, '2024-11-09 08:36:50'),
('94cc3d585b5307723be3b4f6a3a02b657c73cb5de2e3c305cdb004b942abdc4ef2dc10edf82d58a2', 'f51ecaa9fb6d3fffc28ee30ee42256b70cf7c224253c781e23c268a66ea2a33e5f5a2aff917aa680', 0, '2024-12-12 09:35:51'),
('954f9f33634b34cfb4b86add5c4f6694a06187b395b3d331b420b8815344d308ab0e70b9a6a993dd', '02123f531b19e58c21ab2cfd1f0be513c28f3548415890966ce69095f88ce82392bd79dddde4dc71', 0, '2024-12-07 07:01:31'),
('959a6e4e7bed6f75520caf93daa817850451a2394649b7eec775e94591f87882547dfc60b39ee58f', '6781c0e754dcebf5514996ae798564fdad853f35e82cde3457c6c028302dc1b690f696158925fac9', 0, '2024-12-18 07:27:57'),
('961cd200a534fb2370b0ca6f53820f24de3f61e776598e040bf1d80e9ef4e8eb2255a1a81996100e', '2eb3181ab97f3bfb396849427fd83b04e015717fa8ef31db6c2b310d402faebba63bc396c18b5947', 0, '2024-10-27 09:59:49'),
('96a5ebe4e48402806e9ec5706bde19167efc8fbb66c358188a4fa776d23dcc3c01e2bc4445dcf21d', '64761a65d4f27400d47989c02c9d16c440ad33d9aef5272ba74d60f59941b33b065c1b45116eafd1', 0, '2025-01-04 10:57:30'),
('97149cde131f0bb54c0cae927c96e0e5c94172075f5a0c5f0d1cba679113a5067bdcf898e01aa139', 'a55409b60f57bcdb23fcfafb29b9eaa257dc46884bfb323224e41ca84771ef8361bfe58f58f50dcd', 0, '2024-11-28 04:49:58'),
('976b2de5a43022dca9d18df4266b88c9a0aebe45fb27afa0f96e5ddb38bb0dcc1462ac17abe716d2', '7902005cf035bfd8d263c77cc3df665df0cdeb9c47a180152632d73438e58aa1eb54ecd43a79cb0f', 0, '2024-12-25 06:43:44'),
('9809d14a3f0b25078d9cd2f3576665c831e80d431a70fb298a6d506d8a496cfdb997ca1387d20c13', 'e09fd67f0193e49d8e739a6d15bfbc7184242af201753698dc6a1f790a1737f66174e9d5775515ea', 0, '2024-11-24 05:46:27'),
('98281d61c64b13af6704954facee588184fc1e81dcabbc9242de884fddbc5c66229e05ceb87f53e5', '941bdcea8ccb21ed97edec125b90252b8bf5167e1e5f6b9322025e026142ea260566522064f050a5', 0, '2024-12-21 12:08:06'),
('9a2090e1fa5e3dfbd858b708569335573e5058c56f34081e0e3d245c19704f781ca991a123d052fb', '5bcd996a55e002d59f11452c61772a038e48d8a66c2ad2073db2cf0aa8f94c6bc75156434455c06e', 0, '2025-01-01 04:00:07'),
('9a6aef248b1caeb5ee2df0d3d43ac697413d9a4e523594642bcb4956666039d862f20b812f8e37c0', '028b16f2be420ce77c1fbfd9292658105440bc558c8e78f623e402eb146ada2746348006fd44d731', 0, '2024-12-07 07:23:58'),
('9b658fdc2cfb9e9efd976c80b978013e09a0f9e51cb39b1b07695b424cf1bec93f1d990bea545528', '764f36311be6fa2f02b8715867c2b1702860773cf75fcca644a7cfa4dad5fbc7f226a06c5372edd8', 0, '2024-11-27 05:51:43'),
('9b84f0f7c85163515a1bd20ec87efa29abeed2974ca525ebfcae312e69200580d83220c99cc88b41', '48f97ea88319cba01232f7c1f89d7f084f6376dffdc7ab696174c0a7f99e28d204c633d067ebd1c3', 0, '2024-11-03 11:42:12'),
('9b8e2f3883c462735b984c137361f2b15f2827d462256fd7b328094b532796c77006ed37d3a4f320', 'f11e61317090d3e4663d69c069593b013e90568d9e39c67892664ff8523afee977f801092a1af1cb', 0, '2024-12-04 16:42:51'),
('9bc6f68eb6608fc2ed85cd15413dffb1ffe0b52093ed440edae405762a9c1876f692161c44680b00', 'b6bc66c4314871f01354717f45516b802c2e67e99426c6fe1a0f97bdcb127a3d8c0a5aadaccbcb0e', 0, '2024-12-20 10:02:09'),
('9c473098d814734d4e33edc5c7838e812d29c4a0f67272b64af0d94012f7ef6767827e068bd9ada5', '92ecba6bbc2375c75345e81f81dfe1e0dbf7a9914963b1e8dc8fa6a2165c6cf232f8ade6ddd30dd2', 0, '2025-01-09 05:41:35'),
('9d9cb422d602335878b0d03982ea639b078bc26a1b39fa271b0858e1a3b24a2d837bcfd838a73d3e', 'cec0a9e1e25db7dd199ef3bb7f38e5b786a71fe5f78b3dabd92d41cd60ff869b91ba05ea6c2fde30', 0, '2024-12-04 08:53:20'),
('9da03400ca42a8236f3b67fde4370196dd7b205169c010619422d88d0f41982c46a13b04cc9c5d67', 'b97555f6e1f6a0c7f8b06d9c955efa972ecba9d8d953952b7dc59576f0410fe9d2b09bfb19cae530', 0, '2024-10-30 15:00:08'),
('9e3047f69069616928164c2f813661478e56652ec7630dfe364d43248a70987dc8a2fc42a8a927c3', 'd67b12db55db12df442908110457f11227c0edc7c59aec06146468c4eb2a6b67b5c8c27a2c92d7e5', 0, '2024-11-30 09:54:02'),
('9ed999dffb20fd6cfa36374907ac2d6979dfdffaa1b504c74b487ce3290a9d05cd0870f16a4b5ac4', 'e2d87bb7f587437bbaaf899feee76a5a3fafe088524a56952f2581914cff5928692541671772f028', 0, '2024-12-05 08:41:41'),
('9faa38b6850faa8028367ddbec72701127988775305097c63557bde1582d791c9fbd4feed093e43f', '610a7ba322a37e47470e3e566d1398d58fe96de9d9c96f2037ae7332c7e76e5c6535b8f63c12d8e5', 0, '2025-01-04 05:33:48'),
('a0fe2aab33a6175b91ad8ef277d9c769a7227358ef7ad706db7e2b51e20b05e9ce42a09afe5ec927', '928cfa829cdd9cdfd7a9496b29fb27a109f5f9821d1b6a63214efbddb945778020088903da210b6a', 0, '2024-12-19 09:55:23'),
('a194c71c0819417e5091320316af19dfd771fb29c06edc3c976d13909cd15404dad90d4e6e83f1cb', '814e97504b45936ceda188813ac8efcb3a8b63601fce56fd18c9e90dd72eb81dc6214ac36985bd15', 0, '2024-12-13 12:04:28'),
('a1eee9f245c9ae187df2723129d3b5b13351a99aac108563e1c3e4e533151c9144a79dc940482827', '38ec48a0e59d5b4565de9b52458e9d03259f02b690919f63a8604f7fe45160418aa2e9a471a919dd', 0, '2024-11-09 08:51:38'),
('a1f968989891deec1d585bece1c1131149517a15de6936c8363ec0e1370754b710f4cdaf57e64113', 'dd650eaddca3c827199637ff7ec62f708c8d5c97a5bf1549d75e583a5858e2a4ca5c5c98afa83c3e', 0, '2024-12-11 05:08:23'),
('a2f12f698820014cdc880c2fd50f13d831230d1924e82b8b3b3ab0fa6ef7839232a790c9cdf8e99d', 'c4216c1972983aa54388ab01aa35733f3edf52746915957c604fdfde170d8e4f121a80ff31790fe7', 0, '2024-11-09 12:46:59'),
('a3cf09453eed79ae8e2a7d6b62e1dde079c3dd7677eab4796f6af615928972c4da26706b570e55f6', '9d0c7f6b37f3eae6e5189b00f4732ef03df963be34c30f1e9f17b8128b1651345d9e2fc5abe289c8', 0, '2024-12-10 14:47:57'),
('a40e3c7a25fd0ce41a7423620df241c17041f1855548ff497b05f042d6429173e2223f1502bef026', 'e1dba06467a276c4228ff4e8d6676878000a1c84254e7362d84bbaab28a13a7e45876cde1363db6b', 0, '2024-11-09 11:54:00'),
('a494cae61010ea2d92c28ab9fab63e3be627dcc37c3c5abec772ec0929082ac5cb26ffe045172126', '417590f6002302362d5e3233d8deb24e95d5dce12fb451a51c8f2b929fbbc9d1187f4621fd5108d6', 0, '2024-12-20 10:32:28'),
('a568ef7b9ffc0f32ba7ab53442247daa2ed7ce4ead590e61447e3470ef4fbfaa9624cc957d62ed99', '39ec849d3ebef7784ad55715b8afefe3c1d9c37d805c69315257c16f428ad1e3916ae3f2952e9437', 0, '2024-11-09 10:37:57'),
('a59daf6c02137fad144314e702483afbb9c434f2915cf68ac6b18e4cbd7a54067574daf319ded1ef', 'ba07e5feb2799c4ca6b0823eb45f756b28404324e5df6df27900e4e7e4e80a8fc204170a8b712bce', 0, '2024-11-07 11:24:39'),
('a5d1e68ccf3beb13e4e3a2aba132c8ba3159044459847a66e7247d91e58e0e35ea957ee4ac50144d', '2127b7f903a503cd6c414cf218f9e0500b5d9f7bfd840a1ba2c1db6d9a99ac300698f32d6ca4455a', 0, '2024-11-08 09:42:24'),
('a61a85156dcd10fb13ae1fb32c6509b6acc890426814df701f22eda9f5b075b63dd34ca7774465e5', '1edcef2a65b217b9ce9a36c8fd5006b3e41c6def9ceefd79ef0cf42377cd7deb8da0446ea6446e12', 0, '2024-12-19 05:43:42'),
('a662b49466bdc5f60ad8c6fdc6ad996bb6bfcbe6cd9564b7bc4c0efff41117275cc3be9686fcedf5', 'ac8f4ab557bdac6373c1cb4dca9f0221c3a12ae09a4225640ba42524f5c41ce88aa9db70c4196252', 0, '2025-01-04 10:12:19'),
('a6821c0109290a61b2de5af976c5d9fa1e37bb6668f4114c59e155c2508c1760a5998fbe7e7aaf38', '07a1be54d9d7283fab8d08d1bf1681460ec99f4b2f88bf1f8482c9bed723b97bf7747c9b81793e9d', 0, '2024-12-22 08:46:01'),
('a6bcfbf91adf793b981b9331b0ff8d9ea3156cf272776c97a42ad93b4b10c58d7451c9bd1c0f3207', 'cf33d43c208779415f947d55ebc25fc6c96446128b400a6eccaef4d2e1b99094ea1fc84da1f0d4d5', 0, '2024-11-02 15:34:31'),
('a6c1eaaa99804e50e4a4445d102bb40172cedf4b9d00288385926306612d625b9cd03c42e7336e1f', '755cf4b9ab6d563d5b21572570078f8ff0e110155bae8d972ee6a9177ca857a291d1b12172bfaf2a', 0, '2024-11-06 04:13:07'),
('a6f70f1d603e01d5e6a9f5763ddec72572045aabdea8c2818bb70f7920f479cd2104098f94e1b887', '0756493c72c85a89b59ebfaf37e281d83804ca1972e428618fe35f778f893547706bbb952c921417', 0, '2024-12-04 09:09:48'),
('a7fce74c227c89f78ca4c32d6182e69578332d2b5bb018e599984d45aac11b7508b035b24d9f6b1e', 'c3a6d6f4342f110f6f47e3551254361295310706f13812bbf4786bc377445917ac7129064ded08c1', 0, '2024-11-03 11:53:45'),
('a8dcfe7cb3d38793098ba1ef86dec70e576494ac76ffd2689e66186354a174dc0de6ea34233524f8', '32420632cacb36f8b9cbcc2e0eecadbca3e7fc20d628e6f1fb871605174170f20e0875a868768f77', 0, '2024-11-14 18:37:19'),
('aac792f48d3b7f24fe31d4acc9aea66c98db7b443102afc1da92c368cda4a740a2332c71cb8bff06', 'bf018d58482eeca3eeac006cf6dd6905d3dedd7ab8833ea104e6e543c97f4486c49448cef00bd134', 0, '2024-10-31 03:58:17'),
('ab2552a8743097269e24122c3d3260587f74313e98f78ec49da6488b336e453dceabf5502f66fbe5', 'ee88fbad05704ac23b722fbe2de70c95b70cf385b4e7989a3b6ad004548d1f1b785a4b3de4bf47bb', 0, '2024-12-13 08:49:27'),
('abacdf3904c74a67dc3a1e4f11842f45ef1c142898d17408228b81f4a6778359bd942b45d52dd398', 'cc5907589314ab536c212e409a0055ea3903e1e0ccd80aeb95123ccfa398a190e28aaf54ac5e35fb', 0, '2025-01-01 08:21:10'),
('ac16c415c83aa0f132486acf1d4f095ff8008fcd0d45c14931d0173574d117791bf7f59af74a1ae8', '0df187a2e263ef9924645b8ecd67d8ba45b4fab9120e72a7d85ebbc5b9ab1b3414874385fd557aab', 0, '2024-12-01 10:50:59'),
('ac312436b3c4393cc0410a0690806b0f41436edd04b890dcd7b57ba59a376d033eda3b9242531a0a', 'c499a3a38de0d5983f916fd4dc069cb3ab5092df6571ac4062ed5ccd21dc6e4c96b866bb123b29d2', 0, '2024-11-29 12:01:37'),
('adce9c607d141c5e08093d4b5260a3e5c6ebe1f1c34e8ab8c1bc729276b6ce3fe2b41b7027436fc1', 'd1c200e9a91b05fb9348d596568ce33ee17d9d8d94af31cbe0c8ac69a1ff083451bd258f5c566727', 0, '2024-11-20 04:20:34'),
('ae54f50aeaf05297d0351d3a1951cac84b611e123c29c053d45fb0f97ad02db3115742f162f8b711', '5b86d3e30c285006da37f2004973f1fbe56d0d857b2208b67ce200b1f84d3204a2397b3ccf2050a7', 0, '2024-10-25 05:37:34'),
('afe03f348e7ca9e4d81855a257bb74c66c0270fa7dc68f167ffecdb392a517200b68bb1fc23099c3', '73e287f773b2112d7308b60b88adf9cdeb63a67085fca76f86373ff28bd803ff747032e040590a58', 0, '2025-01-05 05:09:55'),
('b03d487f3d750918935f8770674009640aae144e9cf53e09055a27bc218600e54d0b1d30ec37077e', '7929581fdf41c493effcf954bc3d95b32aebb3fcd4ce28f6ba50456b4efc3527313e6c0deab57ccb', 0, '2024-12-04 05:00:25'),
('b160a6aab154a3f8caf37d4e2138354c380020c2149573748d9f17a77d5d4038e6199eec85f75828', '1976a6d7688ad74587bd60d9c670779d4055bbb689a8d697af47e93637f5d7a29579da68c61aa89c', 0, '2024-11-15 19:34:50'),
('b18d6c8d85f12d5974e6bd948778932f41509187181bb556ef04f40c74a2999637fec39bd40df994', '038a4359a9509f18cebc7dce9791725a37cae9c4d2576cff415b2aa6a7b4c1e2f17ed29be2e391d8', 0, '2024-12-21 10:23:02'),
('b21d3d3adbbb8b237875fd43bf796abc38da6df3309f70f91dcf5778bc0e9868fadf1ad1cec5747e', 'f299dc8ff8110682dd205c1a3bff5ce8e4b721e6f3ced6e1363b9790aa5716d512a9888819f688fb', 0, '2024-11-22 07:06:50'),
('b26d53c76b6e0898c6b67121f078eecc0842f29ba708eec07f0077cba6ceb6849a9e81f23290c16d', '497836cec1889926d97eb8b93c24e364419268fe82124d14553d1f34ee309533a5359b3c43c3763f', 0, '2024-11-08 06:05:21'),
('b2c14fcf67d4f6f53530e7efde3be383e3c07921e1b9db49cf81fa2821f4bcb84f5430f80f465fa6', 'fa5112cf39aa20db089e8ff5154fe98faa927d8b879dcf3f9adf0fc740b33be2183ea1df0cbc2266', 0, '2024-11-29 05:00:05'),
('b30f9e6692fa6d2e44cbf889e17a2d932da4aaeba02c1e0596f41807de36352d64203c0705073d5d', '4ed820a8b2eca3e66cc85a1ed6506773033c9349a34de89ac492c0455d9383dc36caef40f1b89c4e', 0, '2024-11-09 06:08:44'),
('b3486dff058e694e734f8098cd0742194e549b31e29c48b2ccf509e618ae7ed33d0a319068256906', 'f24e8cf6b16ae9a81dcf9df74962130fb611f8c5d796190d2664ea35fdd143ced6a1b91e25073f5b', 0, '2025-01-01 08:49:31'),
('b3e07a14de5916e752de329982093a3edf540e3df8e13c8ca712a60356212cee1320535f854323d1', '0f21095ccc6fe6850646ba03d521008d9d58f8ea689951554ed4a4107fe5ffc55ba82428e69a02b9', 0, '2024-10-31 10:20:43'),
('b3ee482c95969deda9e8bdb4b6aa726950d0a8ec578413d83703d556fd12d2c3b0e542ab22231f42', 'bb810fd69210d402aa8f1b1ece3f43730c08e123343a4cbbbaf0f1e25998386535c585d28ae82dc6', 0, '2024-10-23 08:31:31'),
('b424f7f55acf3b17fbf508c5dff294504ef65122748dffae70b71d0be295939cb23f767bef165ca6', '810039a19001369792a805c41dadf667b4309ee6323f788b9b590e30f843f6e81b404485c36482b6', 0, '2024-11-22 17:21:14'),
('b43b9dc6b6283420f6a35f54f385bf001cc78776e5ab0e84371cbc93ff394c685670b730d5ebdc4d', 'af1a7b1df1c0daec9170b6be50963364ac1022fd70c54641f8bdc63696ef35156220c5dfbe054ac8', 0, '2025-01-09 05:18:38'),
('b4557ef921dc25e9a8bcbad93b3249298bfc65edb1460f283d43a72d0696f8d2b31b319b81e0c4ab', 'e3e4fad2ec1dc2d22eed3fad9d4d9a4586e0cb627abbd51008552e58b0dc452c14ff04db84114d2d', 0, '2024-12-11 04:11:41'),
('b5a2e32877df0a3fd26aabbf0dbeb94ab5a65a37b7cbc550ef91233a6353da52cd175b32dcd96927', 'b2b2d01e0840ca3460047afc6822fd4881637a93dee5b8261b839249a0cf79f421c7dcd8ec280048', 0, '2024-11-08 10:07:49'),
('b5e8af600560988195a64e5f4c08664c76531318bb6812fe9ecdc98a690bff59f6dfe8a25b8b4a1c', '0229ce4105f9f77697495d63e5e82e9849982c9d81c1faa4fbed7561b7c7482b7eca2a55582be418', 0, '2024-11-08 06:02:27'),
('b61e670584dc771e49fde7a6c69b084e5200de71fadf33490d4d4ef6a6d1f9e00f74922f5e2cb3bb', '871c75c2de3f780a30e5cfaf9d238100d4ecbf28e86ef3b2a17e7c5b2b373b4cfed0d81187ef3b36', 0, '2024-11-02 06:18:20'),
('b6871aece4a898d1271c8e4eb5386e8d0192071024f0e50415791a775966448e6c21fce0c7f79dff', 'ea0871afa862748c74597d986769d286db938672d0c7a7fcda8e4842bf4014c9b81442274461ee9d', 0, '2024-12-25 12:15:22'),
('b87bbda2c43c6875c640309b538e0a77ff6a3dcc3d4ae659818d6805e95eeb756a7191017995cbf1', '3db216e86fe752e387daebaecc8123ad80cde640bd03378c1376401140da586d8622b2ffe66ac4f2', 0, '2024-12-18 07:20:58'),
('b9157badc862a9aa692eedbd53ab89958e8d6388f2a3e1e3f3d00ccb80459899a54d13e10ab3c2ac', '87cba6d722c7b1316c27e7c517d60cd2b6c27d1a960ed154420f9495e047697c112884800d58fb77', 0, '2024-11-01 04:48:01'),
('b9bebc527b75c4d142825c9649ea9eb00f5e183def203962e67ba7dac044290561b5b70299a26b68', '3ae84f3cb081f7eabb908e4de46f76e7b0e39d55334b55c464141882a94c482f74e718ca41d59b22', 0, '2024-11-28 08:59:56'),
('bc3a6678bb222bfb2e525522af7ccfd9711d8a2d66be32ad56e418af8b030e8901fccc02c9aab80b', '20ff03558d028f6803ea6c54c8351223602d339e839b042df75a3a6a9dd6d1bcccc14daa969958f9', 0, '2024-11-01 04:33:42'),
('bc80bfa9bee294162d33d67317755d9567119de49cb8de317779b7161ab2f732294aed438a78afd0', '5141c86f0d043a4621dbd5931325b1a9e97172bb1f3f70d3620688fdf7009a345d43553b12effb35', 0, '2024-11-08 06:21:24'),
('bd2cb9b8c495018dc2c833218acd470e0a7a0ca7b3d54f9060ac45ae1d26ef7c28d85ebed11b0af3', '2a4d23f4e19632d5dbfd1c6193690bc10127c00ba0d4f894d826b9b418c931ea1ada5ef84610f62c', 0, '2025-01-02 04:05:29'),
('bd5399a5ad645f9380af38b692d897e6fd90cfac176c2ca37a63c79f0caf79e34ced4720829d227a', 'd2997d94dae9046d8dde75f86f2f9ca24771e72f30507a1e23bf00353e5d9b4eaeee6e93727eeb40', 0, '2024-12-12 09:22:28'),
('bd7c6b846750205423ae44ea799b66870d47961be73852e3d7177957ea471b3e4ad465e09acd8420', '2bc10cd248cc1e0abb4aadc089fe89efe58f550fd68d4aec24734be8410f33b73aefaf6b3ec2a504', 0, '2024-12-06 11:42:06'),
('bd91b4408438eac7a4692aa4be4ae30c9e3b254a28a8f44cdd8d3a326e698197648668e63c41c144', '0246d85d82e9de2ad92494cc43447d53827d02e7193a11c3c6e8fffd0a472682005e1650c6685d38', 0, '2024-11-02 06:59:08'),
('bdbfd91faa626b9b18c0c09ff3ef30c1f02c07b885e90280f27aee06128f94180418ae03e67a4b37', 'a54d49249e7331090083485314cdb822528f524d51bc60893f833432bf6489df679b0ce4b3fa0c62', 0, '2024-11-28 10:39:28'),
('be4cacdd438c036597053e4cc475002cb210f3d657bdd622623ca4c66e4382a40b95c8bf17cfc88b', 'cb21d2ecdf150e24e69b587f8036b1859fe6422c7e840a8868cc43587ef93468efa5f5b899ebb2f0', 0, '2024-11-09 08:31:36'),
('be51fc39ce8cdb007d4368a78ada6a29688f9f07faab794e7ad9567a41a0a57f1ecc68f613c4dce3', '7c92e9aa91c6f852e03499e06f83521f202a788cdfc3de6666b034778c8c19b02812c1440b624f07', 0, '2024-11-08 10:20:18'),
('bea69e9b3eb6fc42b491ca1d2f36d72b58fc8484140884d9f7fe001b480521854296a614d302271c', 'fed18ebdb401802c26e1c328dd8ea0a720e4c3a989baa8e535b1ca83f1f6bdb947b9616792a9a609', 0, '2024-12-19 10:38:45'),
('bf554a8d4de5a25d8e32a3b1648ddf219ed48a88412aafff46a592e7913098cd2b6025fc96c65ed2', 'a502f6e7ddd86956e4340d8cb89067b0baf94446819f766daeb4f30fd65914700ee3a5289bdbd96b', 0, '2024-12-22 08:44:18'),
('c0005813eb8ab5e6fc694ce3d58809913900a628860b357b757af3cd75060012243f14117fe321c1', '3064fb85ad6c0a4be9c2ee3ee59fc050166e3fb114a49cfa3bc23fbc097fb1437b32e0ccb106b291', 0, '2024-12-13 04:38:47'),
('c008e2fd1b27a859692c4cfc64f29c6bb200a7040dfe1869f0b71aed3dafaaaae380e6205e8947cd', '980984298421415944debdb2df5cdc0fbbb808015a0f6ed4fff15a453df796f2706b84a4b0750ed2', 0, '2024-11-08 10:26:52'),
('c06d3a310d85b4c91129aa015f6ed81eef3149ab16946c6fca895afc5f36af97aeb47ee5f0e44938', 'afb37dc7bbbafe3236519962d48dffc72e848f3f37ab151df07d730f22e23fa8c125cb5f839d8d43', 0, '2024-11-20 07:10:41'),
('c0be041dc014cfb74fa23a89c4da2b5c93f4c017046b80c7bc5a45e96f1bd8c3e2689e88710adcd1', 'a60b490dcc565368f128eeb6bd073e26c3c1d031681a135075c88d9e33d9aad7d68b0d47aac2b332', 0, '2024-12-01 09:19:57'),
('c10d8e46d7dadab56b5f6a958be9b4a95eb8653af01ccf167ffa0a54cc30a4afae29e949a0b8104b', 'e143fd84b3d46686829a10de06fb32c384f6a97d7d88efb6d4819fbc543f4b8f76cc4c0d7e45fa53', 0, '2024-12-11 10:31:26'),
('c11790423e3657b2964d727164c0486925a39f42c36f54bca3b9fc8dc33490e844b2b5fbfe780a03', 'b68dd9dcb8c8390789328808cfd49833433bd464c3e31b95eb1823e4d105cf9de620076a2c604acb', 0, '2024-11-29 05:29:51'),
('c14157f16adace09b95b43e2a850746e116ea462805eb5cc9bac0bd8048a7d619e69ae17e746aef5', '4f69407481d1eb21bb6df37a2c26edf5cd4dc4c50aa65fcfce16eeac45e5e0cf48a5b471f13c08d0', 0, '2024-11-29 10:44:32'),
('c169bccdba1057c46e417a0e57fb1b036e2b24407a9b67a1648deddd9aa83034d614df68137ddd93', '1c90a8dbd42abbaffcbf58bc541a4d01a90a7b8bcdfd8a290ea7b616f543b4b2fac524f77b2eb34c', 0, '2024-12-18 11:04:05'),
('c1f1f8dbad6326e5620737a103d4102eb78f716b1829ed6ee5b9a89133a431c53b7af787a6629102', '1d0b1e21df82a12c89b9f22beb44116a15782efcb57d5904a46126556d5b97f94ddafce88ec9ed05', 0, '2024-12-07 09:50:44'),
('c26d2bf6a45e1db3f6e57b0ec10636b42da21c6daf94bbfdb77b4eb81bdd129a92bc918afb894d1a', '090e28ab60d02bbf884b5fb5109fc862c965c55653c22ce65c460ed7e6b8636786373f560c1b10e9', 0, '2024-10-27 05:47:33'),
('c2708c50fdbf86fa2aaaaffa5d1b13e057f52c1bc89f6ffc74b9fe25266170217e471db5a1245025', '31904366055670c7a5e5fcb8aed02996338e22812a9528634ddf44ca823b3abbaed703e1ed4928ab', 0, '2024-12-01 12:06:17'),
('c29730b974151d2e17da8f8d13a107a0641f41ba7101404ae405dcb0f2afa8af8b566b172603669d', '9b1d4fd2a3e89a46e355c59bb61725baf6f5052ccd3b8a6eb4dacb39ef03a95482c95f7dd68bb03c', 0, '2024-12-06 10:27:38'),
('c2d331cefb85a4cc31a3bce1c7bf62b339e3fba35754a5b12cf8cb4332ff2e6f6f16c80533674f65', '6f64704790dd35b621c80d6f8c1a632d9ffbc2b37834bd6396571516f5fd6fdc6f3e9aad91455582', 0, '2024-12-12 12:08:26'),
('c2efd0905b0d7807efd3f9237adda50808a4024a7b0b7c078e4999a95cb98439e4c291858b7ded07', '49a28edf2fd89e636ce24b377500e376dd6bfa139f7ffd95aa858404bcc662cbae197922f27ffccd', 0, '2024-10-27 11:18:59'),
('c3195869c3a028e6f00a71032ca6925329d684c862702aa4b003b829190a3043b218dae18a0d3bb4', 'fcdc4ac9e67db77d036afcda39778cd64a13143442c4af27e9d7c05b692995ca0114cbbe412db083', 0, '2024-10-30 05:19:33'),
('c4eeec7de7dbbf8e78095ce679b686c7356af25f509aa13c614d6c1094e93d35ffe6095ecf19658c', 'c358e71b8c40ad0008443d592e65efc8068052c4a9dfdd0e6178566559b7e697553fa48c8fbb3311', 0, '2024-12-01 09:40:29'),
('c4fa0bd2aa4f5bd148680515d6fea435889b472080a5d7ceedb7bac05ffefc419e632d9430990f29', 'eabdf714521acefb280f894e1c9bdc1354072bf655fab4c7843ae80f90ed2975f3d504ba6e7c3f24', 0, '2024-11-01 11:35:10'),
('c544abfcd3a966f7617e89beef6ad21f340125a883bc6cf48f8d44b940c9819e2dc486534a874615', 'd671918ff02ff300565cc7191f77140cd753cbf66a085b0bd21fa939fbc6485559816d4bc97f2f44', 0, '2024-10-24 10:29:24'),
('c54c43f44e22eb95dbecd873002c08eb96e0295ce12dd235dcc792c0cfdf621930e501455bc61290', '78dc3aead135d72887c305472c7902ea70f5257fdc861000ce63f1bdddfbdb37241e491e87769416', 0, '2024-12-07 11:26:48'),
('c5959af816bccc9fa7dcab7e460ef0d751992a2c8c8afaff66a4816ce307f19e98628c90eb0148da', '8e571d696dca8023583c3fd7ae7f54e727d4d665948e39e84f2a45148101dda034547fbbb8d94bef', 0, '2024-12-04 08:47:07'),
('c5be425fb5644fb7a89ac806e2089ccd8982b3a8977cf7ebd58b02c633517eca97b5024080a78adc', '15257bd4e50d8125a8b079fc57853bf3a887e13c9a1549ead3d5184893e9381862fab15ce69a3440', 0, '2024-11-24 06:47:45'),
('c5c511ecf539bec2feec518b4f90e81e6e714a1c14a093a02a83e5cdf971422ce10b9faef3d454af', '05d64b27fddca912c2323bfbd643c10c47f43ea5969b468826d4d28af883819a53e774fc8783871e', 0, '2025-01-11 07:09:36'),
('c67bfd6e5b43b140d19703843d265061f514ef966228322277bdcc30d0080841526b2440bbcaf31b', '416675955f8ba8221b047db5f8f4ae564404da09071211721ada4eda2b160b727401e43a89134b0f', 0, '2024-11-03 12:47:14'),
('c72808f758ce4ae13becb06765843ff106f574381fedca5cf9f5354113577b4fad893f214a86472a', '7e9280bd76bc16af2bb83c6f0d3028b1f935f4ca38b3cf67a30206d4fd3ae787ac0ecd29f422e433', 0, '2024-10-25 04:04:43'),
('c73085833927e5e6b1c58abfbee64eb05accdc8ee8ddc3af63bfa7c686ad2f2ed723d349ffbf4fe0', '3f219f313d53bf04391aa9b6ad77e2e36ff306d54156a281f507c16fd166f7b5966c2f75b3caaefc', 0, '2024-10-24 10:30:21'),
('c7cca2a11deddb8fa887070264f66d61bf39e91d906eb33503392a1e8bdbd7813c0158c05bf8befa', '65df277d2348e6613903a1df2768dd3dd9645938ebaea9205fd56a50c60f963277cb70e0ba3738a4', 0, '2024-12-15 05:14:03'),
('c877bcf5c34924efb5bdce2a184baacee871bd2fba4f5fd8fe29d50bc198416b7f11caf0fe36f44a', '85ddfffd18679a4a944ad8132277b168f8e5542c9aa88e93523ce7adbf7e5367ec02172cbcc24d89', 0, '2024-12-18 07:06:03'),
('c927fb41e77f48b4c753b1c952c690f55939afab3bd6c37586089cb8b4f32815eecc0f4ca6a0d9f1', 'efc1e55287275507b4c0ba4267c7e9fd12693f1db1ca2d7e05e4fea3681bec0f798414c37515e631', 0, '2024-12-29 05:20:58'),
('c9f06e62aeadd44efb7f8fa3fbe0245385023e249ee235935ee035f0aba50ef1f753175000846bfe', '6d88fa7863db9c14e81ed353ea77eb46cb2e7f81660e6345eea3815cd6ba06d3b2a5fccb4a87b55a', 0, '2024-10-31 10:31:40'),
('c9f585684fb8058a501472ada6e7ce82379f3ec5fb4f578900d062e42b928652e61ae56576fff0ca', 'bdeecab4441ab2c2f990fa3fa155bdbb0cb1e5b6e98b242a07fe11b25cd6b2a581f4776c6fc9a883', 0, '2024-11-08 04:56:42'),
('ca8007a1b17771328a6870031ea5f3d0b6ed60111117452a36aea7f89053a96036f3f6446ec7475c', '7fc2b7723653bcee177ebfe8a21ffa6624513821a9977175ee72f6ae5072fb1085aaf7ff1f482554', 0, '2024-11-08 09:53:37'),
('caea69724008e14c4ff3b1980c55e90900b6f1deb2bf6b2aed702fbe6484546dfedc461b5568c2a6', '02e73d66de2b1a37d1379e79e044b0ddd819f4d3b3aadb9150bbe63a2f79842740627c669fcb2588', 0, '2024-11-30 05:10:03'),
('cb2d23e66e234db80d8f36b40086e1e424ede170b4de7b9f2015415bb9aa0ef62bd417ca067a56f1', '7092e7f49f245694d4406d425985af2128763ffb59a51093b53169e662685834ac3ecd487417c940', 0, '2024-10-30 09:56:41'),
('cb6c0cc2279ba46d3f8e67c68fd9ec20be899826b7b6c3d45ea1ee228c6ba5264a2ae56fbe070146', 'ad47d6ae62497fc36bf98d8bde1e44606bc6e7fa4e49629ecf574d742b84ca396b6692bd2352cfb5', 0, '2024-11-07 10:58:08'),
('cba3f5b8e21c3ffec041ebc351c606a410a8e9ce82b89dbd9019f0187839a0084e0343cd99583ea6', 'e98bc6892ef25b586646057d8c0a253ccf203223f64622f126de6975cd52c6bd82e575aa5f4b733f', 0, '2024-11-10 03:54:14'),
('cd002a7be4a52c8258da9cc350ec0f2b39624d6f0272d40a9fffc3f1ee5a263dfe3023aca6c63669', 'efc0b0ab923bf15afef8b23b1183f621461efd321fc0065d561443c19c2109c099050adc457eae4e', 0, '2024-12-01 12:31:31'),
('cd55c081dd0512aeaa71572fafce4295c003a2e1aaf59399bad9bf36d2c403ff9cec5c586d6ed5e4', 'c8ed463a2f7e15b08d3d0e7d9ea7c4a0e46c820c84f2432e21d574d299ccaaa0ea9286fd6e4f9a2f', 0, '2025-01-01 04:50:07'),
('cddf1ffec40bd4ddcc0ffb3a38beae434b4c49a8e7f6900302e7cf50253a1d99a4290fff37ae098e', '4c5f1194a98bb1deeda8f1cf488c550a03ee90e5d554bfca055bacb2c389276efae3cbdeb0d34d11', 0, '2024-12-19 06:16:44'),
('ceb13e9b05c1a943d830dbec77d7efbbeab9415aa964bec683aa79641e24e19d49d77b0d249f53e6', 'f61aa6da39814619ef3447ad019b33af800019b98ed8f4b9d86926a833e1a33fd8f7ee5962761f85', 0, '2024-10-27 13:24:10'),
('ceb536441e54827965093d2f692de90a832fea01bdc7da0d3371525f49c18a5cf4a4ef6a9159540b', '084d6cd4d827e3e1f1524fb7df02565e384be68b690aab502a7b4b9f98fb4194e1bc1f6b50d54f9e', 0, '2024-10-30 06:02:24'),
('ceb8743502114b2f0961e91b62a011293ce92c5b02ee4feb0f856f4c0f8bacda6d780228da262a87', '85dfa0f3e6bcc48123a0d08ae417efc3cabeca62583c341bb6c01c3f78aae7f36bedacf28506acaf', 0, '2024-12-21 09:26:55'),
('cf46e30bd433c3aa953ed5a9ec19a45d9be4cb26ccad2c349805ce3046a30a722772dcec0abe21d2', 'b25170095b28384264a87c5c1130d8e777dfab1ec35c4036bef7a84ac5215030c2a666a80af624e4', 0, '2025-01-11 09:11:01'),
('cf4bdc5cace995ce99c965ee60965cb2e231a0785e7f3132cd742471b415d2a343227f8b8cdbeb68', '0be7ea930bd5bde28e06484de98c200100d0313ba8b30a83f76e9d8a2648c8ef417ee55b5b7b5f29', 0, '2025-01-04 10:55:34'),
('cfdd4417566c33eccafa37dde1b534dd28a7a6b20e84ba3b67d4d283ec7cde633bc0739cb39786f4', 'b5d7d11e3bcac953743ed55e7fcf442528ee8f2cd068e36da05be15b74cd80435c71a3ec8a600170', 0, '2024-10-19 17:35:48'),
('d0129396c615380398c12c2d5c1a583479eaac8ed6795048000fba5920ee04bb4cf63187b0e9a054', '9e8c185c86492c7e8d8040cf02f129c86133113c7863af48532e8f56152902639ab2287581e66c11', 0, '2024-12-20 04:53:08'),
('d05083e355c72c833e8c584f7cdca1e96856870014d0b2e48df2c50ebdc2d9b08645beabcf42f11f', 'eba31703571d10742cb0ce57ec614408060d7b06063edb0de6ebeb599cf0e3734a7dc50611ed4943', 0, '2024-11-07 11:18:19'),
('d0f27a9b05062db47d1012bee8dce6574ef8277f2649244750497355e0a813886718fcb8f2d2919b', '240085f8236ed6ea7277dc0293dfd98e195a2634bc76544229b579e7a038d3b95442708a799492ee', 0, '2024-12-01 04:12:42'),
('d12fee205a4ab3a6a64c79fe1133c4238f4c2bf1b76d71bd04731dd0a5fc1ebc9d4e22000c09c1f5', '288ea8acb9221d4661807499b9cf59181af5883f1f0446ed6dedaba0bbbf8d66452a0fd144f44ec4', 0, '2024-12-07 08:45:53'),
('d171bec54259d1581addcd87be596ddb327eb57eca0022a0cc34d8817a7c2a1573a082caf69f80e0', 'eb64cf3228b4687938dbf183219a35a012a7a0b26b9a0b904cb259bde1077a67c07f292f756a312a', 0, '2024-12-19 06:11:03'),
('d18fedbe520a57a756483211462627ba50d21ac2ddd5d13a0f33d6b64943ca4b80eec6acfbb2b08d', '2c91182a74fa8d13a58fbfade15c1fdd8a96e23f5c7f2bc3482a5eab4213ccfd033860256c5793a1', 0, '2025-01-09 05:43:42'),
('d22f377e76711c3351e009cfce77d39be79f30043910f68499a78e4b4882cda14cc18ce49460f618', '5685b67575f5b97062656955441e2aec5fd60d6ad3f5e545f06d9235d566499bd59e4dd43ac02d3e', 0, '2024-10-30 05:24:32'),
('d344b398ff9b1e3390ea018e1fc4ed1071ae1485a51996ff14b0aea535df8bd17437d331959a3c65', 'aef321aee59cc7a4ba9936582a095632e7fc6977f09c11a56891517d2168e061c5907a58dc65097f', 0, '2025-01-09 05:09:42'),
('d38a0e2daf79c8afc0232085168beb2ab4ae321cf8bc63353ee4439e019810698663a0e9c22109f7', '39977c41ee14c7686e431a59ecec3bfce98fa72c45e819554c7de8d1b378aa5484fac8ad342adaed', 0, '2024-11-02 03:48:37'),
('d424c168302f1fb9022aa4088ab0580773765eb032dd281564e6bd0d49d7044b56e177575a32280e', 'c76ae01e61d9aecfcea09c5e0e2ad6ed151adef4eac639ab990ce8877d955664c92d50e62e76b2b4', 0, '2024-12-08 09:33:28'),
('d4d81c3d131b22250a9df52ac53d8ad9481e83280c82204cfffad018906de550280a3bc8a527073d', '524aaab50ccc047b11dfa8d4487cafcde499581d42f20215122d92d9fd934b9e1555e72c79674159', 0, '2024-11-08 10:31:50'),
('d596f1a7d574025c24ea47a40dab98c98ad5782c2275db8ec4f38212f649d935ad3e76adbb8eda40', '705e99cd4c4810d63fed309896272c398b3da22995bff67eae62c31ed52fd6bc75834873063e27b4', 0, '2024-12-06 08:57:16'),
('d5ac3a7eacc525deb8d6cf14f1094815a9fc77f68dd04ae1a56545b9a14d8ac9eb57f37fbba522b4', 'c983405ceea92472fe9438853920c33c238d6b8cce37dac8384e471e9fede987d1499a08d3a506e6', 0, '2024-12-28 06:06:24'),
('d604f3a55d81fa4af08e32ec608cc4c8f999cb9f171ef22073bb611f68fa52aad81e204a01d74a68', '7fdcd01563ffb52460ce42b752373492ba2e5a5c0d09e1de5ff8a1a9ccf95fe3b47a60cef5192470', 0, '2024-11-29 12:29:07'),
('d61e1f3c416f9dcee27293fd51d3b6c560df1ba8bc3dfaf86ab6b124121898b31594b4feeb72acad', '13abd78fce3f405a751a2785e1559b04a844110f488cf30655eb80a186cbac79526244672be12b8f', 0, '2024-11-02 06:28:12'),
('d65a63f349492e068cc1b4f67d6b5618b50c41ed5f21a00fe8f70af24adb06262f0120d173097e86', '855f4b199aecf42a9dd35296ec7bf38f1b5f9d98f319d55e712861c99e6be55cb2d6fdf86eb06dd5', 0, '2024-12-14 05:51:55'),
('d77e4f40c37660a73a261fe709667d22ab382994caf84405e0e1def0b7b93f1ef31ad79f6c163d5a', '8fc8b6ffce603326d9da02eebba6e4a430cbbeed7bd815ba6f2613aa1b1c570d169ca7aff7d0d977', 0, '2024-12-10 14:58:09'),
('d7dbc60b582d0dcd4a22ae916533a2fb9c2160f592a022fd02884fd4c81af6ca624ba47bd858667d', '8b56f8d9c8fa269895313a8bb9ff88560e91e082341174d7a2b1f2d56d1367e00e1ecebd500229d0', 0, '2025-01-09 05:06:28'),
('d86490e1303b9b3e46d76ecfce9f8160da7f80e8a6655df027605c47c4607d8da9550ec041f502a5', '837ea681862fcb7ed96b2077760975555a44252682d1fd5a57cfaf692b17b0adcb0c242efea502e0', 0, '2024-10-27 13:19:28'),
('d923965338c86c76c3aba498877c5b841a36ff944beb43665151abf736940930432dbdad315b3486', '5eda10cbf5959b25882a1fe663934c13f62d2e585f2c00ff660f791e8f6408d35e6f07e7eabdd57f', 0, '2024-12-04 05:35:40'),
('d9865f5236746e6290afd79db20f0690e8a3f986a7af8fab2f9689f04598fea7ce78bdaa4457c4d9', '9b0d28929d382d3de1bb8f00f1c213899ff76d4c842ed6aeaf192c7afeb63fc8152be1a14fee8a84', 0, '2024-12-19 04:05:42'),
('d9b93eb6580a38a732a9e85c5ef11666ef4dac006a9924a7469f16c0e881378647d0f53ecbeaa63d', '26b9b4644cbda11ede02d70176f13a91af9600d01e6df59e62fc75b0dd6b46162c587ecc1356b053', 0, '2024-12-12 05:18:49'),
('dbb044742f41a665ed41c7fabd23200bf9a98a080a799e4c4b049ddcde3341100fe6a3283b230472', '3f89ff6aa890d5643b122c6f8675f93e9fa4abc410a1182296e696b6d63ccdcfeea7ed09fbf740bd', 0, '2024-11-09 08:34:29'),
('dbba67df147d84afe6e9eda1d43aea59e4676478898f7eae5dca959d0a889c73d9415610d426c76c', '12a4645a5f7dfa9c52ae9631c6a512d4d64c20a852f482463c4bd3d0cb739498baf986cfbae2dee4', 0, '2024-11-13 11:16:19'),
('dc2ab4464f194f4cf3354b76396519a53d7e03bed5d1465c89ff6c181f7fad7fb56b350f676b20e7', '26c2e07fd06c5b42141d337e3c0d8647d21552e9a0a5308545fda9d3cd477d6e50246a31ad2a17cf', 0, '2024-12-10 13:39:56'),
('dc6a68e80f34550d29f77de7f6fb614fda1956867b9734549ee534390029217d02215043aa195d6b', 'ddbf2fc144031dff312461737ebeb9e6894b5ae87f93f2c75ffb65f513a2f3d37041bf80cebf1d7d', 0, '2024-10-27 13:23:36'),
('dc6b2b75e86abff1fbdd739892124667a678ef80dedee900dc15e25070932da2c8ad42ba04faf5c5', '4e025482e564b19f6fb452bf21705d83910691787944f0f99362c03c5a33e76c1166905f31fd42ea', 0, '2024-12-12 07:13:19'),
('dc89b1248cee1dff395f0be87fd4d58f9a09bf0be3367cc6e4b09e1a24e2338c0bf7365ac3f7853c', '7e50ba48ec24ff8f7f34ac6312ee307daef36c148593dc14bc9f973bb13bfa4dcf70bac1ce211c23', 0, '2024-11-29 06:27:15'),
('dc988a84f77fb7f18d384996dcb458de5cb7c6502387083aba17b0121215db533094ed218a7eba01', '07c8b2e08c8d5e5bf6c28b6f0b4fb02bb88652e557185a8134d7f8492cd03b9b3a72f60b43b357a1', 0, '2024-11-07 11:19:54'),
('dce2dca05d11a3a8c837a84d355620d3a32bf8852aff063fae4943dccda73a71d5c2b148933a331a', 'f2da4cf02b84a358a2fb17d3f124f38a696f00244d619f4d80b6adcde5ac69d6a62d79eb5d163210', 0, '2024-12-08 05:01:23'),
('de02ce16a16c01bf44c593a4d15f9515c7c5e87573c27db369c88118dd0cf77037b548d0e1d0cb5c', '8f6e256aa2ffba300f999ac84ff7db45865d6d997d141a88b295191834086870f27df307c6eeee6a', 0, '2024-12-07 11:24:48'),
('decbbb7b34dc6cd90d9b3ff14665b49659f3abee1c3ea44c9408e1f06e32bea47cbf93f45db3bc83', 'f08c38f5335420420c3e57052a0c8039454327d093241b084b19c411cd26c551ee0aed2b5dfcc84e', 0, '2024-12-10 15:09:09'),
('df5d842da6675e86e2eb821099cf9aee1abed3d08397474a77595608108ba7863711b87c98cb2132', '2d9214ab084acfef0bfa9ad59cb198503fa8707048c6a9f37c976f7c0909700a0776ae8c7af995c8', 0, '2024-12-14 06:44:10'),
('e021346e9c5e68c3528944946cd1a3d9b91b49a1378c4735bd7942ba2a445097cd894cda1cf1bcf2', 'd1c15c819d7cdecd9e73e3fc9dd59aa816e2991a9c7480e0f0fc30a1a97e0c01cc361ea897a88693', 0, '2024-12-28 08:47:00'),
('e068b96c1558372fcb5dfd774267f0d33a625f69013c9723c4d51f3590dcb259b1b562e5cec3418c', 'fc57afe7df561fa3d7a374227a9e12356968fb5487408406d7bb0ebffddafe48f68ec643343e97c5', 0, '2024-11-13 08:43:56'),
('e0ded0382f32f082795797729d69373d729a644e3cc2928f9572871718f109e8a913d42f10e2ae40', '18be6a81307f8fd4ff4c4ba13a9fe934f2adf8cae540d47f4ef39fb3909a3325be39ff6b023b6981', 0, '2024-11-10 04:31:40'),
('e19b496adc8ac5ddcb25f030f1936300fceed66adadd5b5a09041df34191be679ff26708274d01cd', 'd78b49c4a75265942308870eaeedf873a9556b47f1dae57274bd5883c25d5ccbc7fe5bc655fc9027', 0, '2024-11-01 04:07:49'),
('e21915673bee6b652eae3a627e654c2693f1b09410b525ce759da9d206e490d4f3b3d9aef93d1fa9', 'eb739cc938b2bc2d647ee8839e12ec6ace25bdb409dd7cb71e747bb7545b7776ff4f393ac5d799a6', 0, '2024-12-22 04:21:38'),
('e27428eb45ba7cc554da74d5ca7387ecbdab7feabd0cd951128b28d3042dacdd5617816c300199cc', 'b7307a9e1b9eb4cf43ad9f955eb5e8346d36fdc928ff4419fb0be64489d394591c8e3564d639e054', 0, '2024-12-05 08:31:47'),
('e328e630bee5fa659b468c3f2ba22f3bc8400d8c5b673e6550198f06d60b193b7c5764b45db57d2d', '67a967a1a9e5f3c2e4f5e549dc992c53cb47f6e3013890b64355ecf2cafeafee5571c1a72315d7fa', 0, '2024-11-29 12:51:30'),
('e367c5cdda0db51c05feaedd87a06f85712261ebe47e6af0ec3175dad8124371767b9401f8f06611', '01caacee5ad8cb9648f796c400f89df8f128039cf56fe84b8fc21d44fe0f443b19e5755873d4dbe1', 0, '2024-11-29 05:49:09'),
('e382e152b92c9b48b863379388bcd71d9316888f28f7e0f4294467bd5ab96014060191897de2b88f', 'e2e88e1052bcac67786e66c33808fd5cdbfc034465bddf3fad33549fbeebbf3bfa9f5bee38ce9d23', 0, '2024-10-27 12:50:38'),
('e4780c638dbf809dd705660badeeb641c9fbf801a8dc36e5a4514a2571601ad06c3a84f4d39db9f1', 'fe27062325750e78be1eee393aac4697c1d22a7484d1cdbfdfec75a0932071b0ad4b1592af890702', 0, '2024-10-27 12:41:30'),
('e488ca331513c88f55429c36128957c8e2fd91233f93c3bb9448908949d644dbe8ad8c942986413e', '5f7cf0a0a6653c99a06b5fab43789bf965b920a9fcd86830e1ef561f47b2061c557f6cb554d4a9d7', 0, '2024-11-06 09:20:15'),
('e52adf545da5b188ba3849bfaeee1369d9cf02c8adac71c42118feb9abefc367cb1f167321ed84f7', '82cf2378afbd53e55629d5954579ecf8bcdf00fd1851294f727a618e41834b46e0c6aa338ec3f23e', 0, '2024-12-22 05:19:51'),
('e5726a8e33f840ab4ccf0e5848a4be535a297468eaf194e4eabe6b3c184d4c3e7ee81af474607570', '4aba914c1bdae75bdd73db293980e6b291fc66373ec97fd5afc515f6b255fb012b87a47e328957fa', 0, '2024-10-27 11:50:55'),
('e59feebb8416b6c34eba6d05a74ceffd6e33a37639153f94e2a63ec9f899dfe942f0fa863fc35c98', '4b3fb5f386f9b4cfd5bb28ec844eb89ae2c25b2f9457e6fb2404201da96f53731c7d1acd50716b24', 0, '2024-10-31 08:55:03'),
('e5d69688585813a45d213b90306c336e7b2606cb5b3e16fddd9bde98b3de7bda731a70b521cff74b', '95a2b53fd10338b5737158dac1a27daf68da1375893d6eb1ac3de222ca61e2d84a7c60159e39330b', 0, '2024-11-02 12:41:33'),
('e61966d9b8b7d0cc958fc10f9ecfb7fab5e3856516191f7f3d298833c356da5d5c42ad16d683d881', 'bd5e8934a48f8f82b202cceba5fc6815a420940c59de30be090647f816bee9ec6478284d3c6311d9', 0, '2024-12-20 11:19:24'),
('e6848d7c200aa09a9e121b9400fc30d1deccd9793efe6be7cd07118d9030154504f1e060003ae8bd', '2cb25dff99303b384c76bff975afa398e367822e32c1d7f530f34385be12dde46f5433f040f6bbf5', 0, '2024-11-06 11:48:50'),
('e6d9611358765ec2db7536e8a78bb34f9226edd36bdd99e12f50ce2d49d6a6a332de2e878525cfe6', 'ba2226746e6ae078a4d6af9061c50a6467a5a569639d9f960382e1ae7d6acfe38a028a712e80468f', 0, '2024-10-27 11:52:30'),
('e6dfe07372c41e93aec13b1f7d68518ec4a282b02551ed5e3b2b4080cd8ffa15eeec2eb7de30eea9', '6c820c7d1278c00df5d29932829735122996d680e26fec3013d7b05a9d7c4f6c310b417b5849fe99', 0, '2024-12-14 07:11:08'),
('e7221fdc14a75d807bf24354deb97a5bf4df979f8acbe8a8adf680802039526b5a2535eaef5d0283', 'e6b9f9ae7a2ea713d52f548ceae8ba9af42c9d719baa17b4fd99541d88f64b54ea6274e5a146ffad', 0, '2024-12-10 14:26:57'),
('e73b79f235ce5ffe20e7185f20ccaab07efde6600072b7da9bbc2e16cacbbbc4d8a9135512fdbf41', 'a838c124325018bfed9a26982da8d2089ef87271e17ba89b871bf8bc93cbf41104c134c633303259', 0, '2024-10-27 13:07:28'),
('e8ad0cdaec01f3b7f21317356025d0cdf45f9656a329c9aefbe047d3dc78cee1ca3057dc6e1592ee', '9a34e6664eb06b05716e1e6e99c4a193a1cab21bc2b4873beba5ae5be9750ab11236601bc0b9e9d6', 0, '2024-10-30 05:03:40'),
('e8d983ee921ed8611b3af5c22a742defae3d0bfcae5e96632e23986cc17e0d1579e8fc8004cbed21', '08b7bb5df0e65b62036ffb4c870cde31b8bdd19d3d9ab175c899f1f74301501f0b466b7ee6d93e5e', 0, '2024-12-21 12:03:13'),
('eab570f358e1d139c47bce4c70d7e363f1feb97f9d5f1d86954f2fa529a31e6d5c5c8117b8accb60', 'fed91b113b070fd578be0e80d0d78b62ea277551edd3a5acb34495b52589702852d2f337833dfcad', 0, '2024-10-30 08:37:16'),
('eba674dfcbb6f2b405d2b6ad23cac27d819c31d60c4d23312ede178e764d1077d62d9f9778c4989d', '3fc58e54ff3bca421b52758fbf5fe980f9c73b164f34be1624e914d7f745415fee3e7d933f60f196', 0, '2024-12-06 09:45:34'),
('ebdc4a4b310227477471a918f02e7e8cd0dd88683e524de0feccee105eaaf99cc0af4c48c64a5883', '6a708878087de3967d320f484f3f4e1a36043929a9646ed20ec1ff99b18969a08b834a6a6de14d28', 0, '2024-12-18 05:52:57'),
('ed541dba72cca44c24c59884ac181c14969b328956975aaa73057bfce9d0f988fd0bdce07462ff17', '1305e2b5fa587e9906825bfd3ed8fbbef9d21135927af55ed12344f1b7297eb9441f96ef63c33386', 0, '2024-11-07 05:26:35'),
('ed5d081791d8a2ef52a3d9d80174a30377beddb528acb6d6db969e610c514fdf8797fc3daf8392fa', '34810c363e93783c6278f39ac31839bab84f4757c28390b1bf02674d0636c3874690b86321881cc2', 0, '2024-12-12 07:10:10'),
('ed7740376d63e98fbf1530548031ba3ef47fe54aaa2388f0049f60195ee5f09c21feaa7d2730cd02', 'db29990bdd209dfcf927dc35c4afc8b924628ea6dff452fd6bd94ddcd9a66711f34b9907075126cf', 0, '2024-10-27 12:48:36'),
('ed827cb39b45388cf5d4ffe45e3ec7697a2a33ba08d1dfe2daf82f0e2e3c5466a15305df1746ea75', 'aa92b9ca3cb4b68e25020c282c5f9f5fa0a4eb8757400c7f19c8c58b0fa256e95ce47fcf6e79a261', 0, '2024-11-06 09:31:34'),
('ee00822518f4cbf3a0e0cc8b66d11e10132c0134b0b0f4668a4a18a099720d74488cea4c346530d1', '5528093de4a9ce12d34793708c0c7a43ef3143864905dec90b8d3cfe6070208deb0082dce7845eac', 0, '2024-11-09 11:28:36'),
('ee4b7b50ded3b6b8ea2086e169c73d251e23133af258959e63aa47d2531d5f27f6438bd593396715', '1ffdcf374f599bd488cbfe30419c7ce0002b84e0b263d07c36d86dd62488d7c815ee8a226e99ddb3', 0, '2024-12-27 07:31:08'),
('ef23b86d08722c4a5c4276f035d57815db5a1503c5883bca689032666aeca56b5cc369411ac4cf89', '71b4c03b25420d5a7ed42924f778d21698a74400435670a4aa94ad33e0876138856162c44c3e1843', 0, '2024-12-20 05:22:50'),
('f037b724d0609ef35da03685bd61dd2df6ef0ac3333184985b5ae61a7095b317b36763e6f17ce2c9', 'cbcd861f66dcee36b9cf94b00b782664bd351964f848362e810114cf5d45fb7a5b40aa6eb1eae448', 0, '2024-12-04 06:04:29'),
('f0ab1ae80d8a6e2e156bdd91d0c6b8a5a2d9ac38f2fd3bb851db2b46378cd618705adb436ffc0d7e', '6dd77aad8af827d9bb0e18cc1eedf16b6009b79a3d86685ee12080782e227dad358573b724b7e692', 0, '2024-12-21 10:52:04'),
('f0e87aa34c150531694e5c9fa459ab88e2d45219530b5bc055013285ec62ae6353bd3ea5d6e94036', 'daea3822fd9adb77af5d8d3fae4c1de4535a9911beb24b102f8c6d704973f39319918f0827043ed2', 0, '2024-12-06 10:48:52'),
('f0eb7942a806f211464402c8e5112c4936e437f55beb520bfca662a099ca67652ab83e44df2eb751', '9c8405b058ddc5d20f4f40e72513d68dd9fd23dacedba78d6f4d51149191f9182d665f649ee8db23', 0, '2024-10-30 07:09:09'),
('f0edc1d925f4ed5fc521cb6e39a3779fa43d3bc2fa258bb80e6f9bca7ef7b2fcf4182c6a978c8f70', '22ef264492a6394b401b5e8ac45507d22b3709a23d79ba377886356980f3090207829b56b56fa116', 0, '2024-12-01 07:19:17'),
('f337f1683802a94c9ac6c4205a2b7bea5fa09dfecc946172b4377f105dba6d213c0624dec984d7f9', '03cddfb98695fff1825c188cdd72e3fbecb967704f5c509d10d903617e1faca617c97d4f073e0d9b', 0, '2024-12-05 06:18:25'),
('f347ca9342dfb677e5ee220abc7cb00f9f7be00a343238600c5cd3a05672f3fdad6e62eaa8c0981f', 'e39b1c4fd9a8ec011b1d427eb4a6d34df95f36b965ea7b4ef923cee4d23c328fd1e7b1e38aa2c73b', 0, '2024-11-27 04:27:47'),
('f404d067c394c6c3a6a4b161dd4acb69f6524a686658465360d3446057a830dec105a404adb9e21b', 'f795a4cfe8db60bde9d17df443664feb84dd302e318b4e868ca65f409d1852204bc0ce23ec1e5fe7', 0, '2024-12-06 05:00:28'),
('f412432319a727399a2baa8dcd8c0866f7a02750e06dbd4489a5fd6a22e3056c152334f7743dbffa', 'e9d2cead9b85fc6dfb5bbb4b475e57575f4e851c5d683b5f5fb49414dd701f5517e06933d85549eb', 0, '2024-11-07 07:24:03'),
('f43a0b1cc7b9974b4b9194eacc9791e9d3010962422915e6a9dda57d520557c6d41ed14dc67e9b45', 'deb47304851bf562dd89d653a1418db7f202e653b7ffe742c631ec129618b526e2e99714eb1f0ba4', 0, '2024-11-29 12:26:10'),
('f461184aca413a3cb87eaa133b81f92571b76ba16ce27661117f48c2a7e61aff065e619a87f34b1f', 'e7e7ff1d0e29c2a9db930c55751bb462d21d88cd8375c796c2dbcf74155f508c9c2a03df3e446cca', 0, '2024-11-08 12:14:41'),
('f6ec1f1e69d20b4f69b223f58abeae6d2d732721d4a7153a999f2548ab72c57b45b48ccb5a4ef6bb', 'fe6ec2b951f27f96d083283d64162d12b59e6067129582615ce2fa29ca5967c19411c0a120071592', 0, '2024-11-01 04:34:35'),
('f7f952982262cd27bb1f28af95c54fe1577954f7804ded9b3d26e78eeec0b055052f65dff5b0abac', '98a0dfaf7afda2be6e164b358dafedfec7f9e94f21c949e6d11deb34fdd2175f71e249b8816f305d', 0, '2024-12-14 06:15:42'),
('f88355f53d44087ab821304c91c79a5d34efd9b303e159b0ed028a4e956c7abee61d06f5a92c9de7', 'abff0ebf29e58cb4212e13f8b7253db8e032ed001965d9927369be619b312df0d8f029cc4caf0747', 0, '2024-10-30 03:47:32'),
('f88bb7733187921222f95f068b46777c89ba609ccba7846e65a9bf4264b11ed08d60829ced94a475', 'a0b9a5bbd458218a3e52fd1ebf713b0de9ffee01eb000d1d348edc01c94ecd2ff6ff1420814f7531', 0, '2024-11-08 09:47:35'),
('f8deb246002c50eefa9357e92563d90a05ea460bb54d7dff4e6cb220b8dfe2e4dd62d2005ceb5b16', '56747d121ebfc035481bbeb3f4d2dc96fc109ef3b47d5ce7309a902ce5e09734c901c47f80e7de4f', 0, '2024-10-25 05:58:27'),
('f9771618a360e0ca63ddc083d97a0e53bb8277a5624477acf78ba7ddccc93a8c84666fe1d2aa1681', 'b0ffc7fed27bfa965d8f2579012fe74516c2e7f09fb0f917f60d2385bd09a07385c35fd37a59406d', 0, '2024-11-27 09:03:29'),
('f9808c7a1838353f59aec5abacdb65e200fb597a8a4f9116659e0fd1036d3acafdac64c6325aba4b', '77a4d7ca36a7a1bff70ab3c3ae88fe548408f342e93127633f578cc3fd4dbb4a5ef153b79022ac00', 0, '2024-10-27 12:08:34'),
('f9de7dd6db467b4b75f5f6f6a8d23fe1dada41b96eff32a9a49590a6ca8b137dfc5d9226dbd77e2d', 'fd315ad15b92fe9136b2228a71b1303430c10f83313ff700154b43415ea8ba8ad3915d4ad2ea2236', 0, '2024-12-21 12:06:12'),
('f9e1949d74bfc997e4d348066c9339fdd335f265273bb7889f8ef75c36df8b4cbd94b7a1961a64f2', 'd82514725ca1186ae8cb45172c2cbe3663e0c07ec8f51611abc815a7ae6d5cc7d6e20aa5063afef2', 0, '2024-12-19 12:04:47'),
('f9eb6999ea3a90a8e78a2fa227a709bc8014bdd27bed46f6e0831ce9cf3d2e77e92790ad2038cb6a', 'e2f7ab79210c4e7b01c5edb6a59d50d341d80b26dfe36b0a3a46244ddda4cd19df8de7c8779119fd', 0, '2024-11-07 11:20:50'),
('fad91727ada38b0eb5340be1608a620d0d979aace28ea0e91b0dfacd174325b2e815f4a4f19f289f', '884babcd17fe09a66ff02dbb0ba22c843357dadefbdba9a83b7a94f248dcd1e67635faf85dd07b4c', 0, '2024-12-08 05:00:42'),
('fba6631cebf86b3a06cc009d8ff04fc6b9d1aa56b33502bcee672290ad394fa58fb806fbd44416d5', '7be533bd277516dd4b776377e7fceae9389c1496621afcd45a58f3a3812c5f0120dbc8d8dee4b57b', 0, '2024-11-08 04:53:26'),
('fc0cb889f7fa8a821b1feac8c9e1f33f2c228e06407a4b60a9b88571459c297ed42952d01af5247c', '61027835fe2806b04eb9fa8186bd5aed3203c8357384c4418d8eab62702383e32700af38f67c664d', 0, '2024-12-19 11:38:21'),
('fceb9c8d0dd0d80f0e296780f4dae6f856d0ec56d3feb6ca899c7b915797f4f92dd8e025061e46c1', 'b4128031109a4e96f26e5394148fa29203303507d30d995defea5a1c41210582512381678893a2ee', 0, '2024-11-10 06:52:09'),
('fd44609ff3f7b3fbbf9e5cf5e0fc76dec5e293a943497f8c0538463c027346f017f70ccc062d2568', '2d845171362aef55fdb14432c2ffd5972ee49c4bcfbd99d6039d80692cf98ee391434b2f84462026', 0, '2024-12-21 09:06:53'),
('fd5faaf0734fe43f902d641c05ef091f8d4ec3eb8a9ef828561c626c6c70eb28013028fcf3d59aa6', '9261ed673c994edad6ca6509559eae3c90903fe30a2e9ff7bd9a66f5ae8788c06d2326fe335313f6', 0, '2024-12-27 10:17:37'),
('fdae61446ba51c57c52b04a3cf82e7eeeb76ff3981c985ee99e79385e96128f1163b2ef4c1913fdf', '7cb42fade321d87a5b959cf4a97f6108ba0b2ab1d49635f9d5327939ad5a2122b49e8e6a0c8fca95', 0, '2024-10-27 11:41:22'),
('fded64af2c8422ff3b97335336c77aaf3ee8f7215c332f558d8100b12fc4b22327d6c4caf8c4c98b', '83f20c098ba1aa35be60af0355609485d9a02619f04a43f7aef16906ef3590add059c5dfa0218624', 0, '2024-12-08 09:21:30'),
('fe728519c86953c31d0be4576f7e5de7159d4b185488fb26a1c572375bc208ae281a4740b1e81650', '425007d8df63253641c2aaa13faeac57266a4afac8c939d72d258a1bb3ab72696e1ed4e19e5be075', 0, '2024-11-09 08:21:54'),
('fec8b81d1b06fa3a1fa4e97ec746a4ccdbcf4dcc2cd37587955ea0aea5aea2c9b518137d1c19aa32', '58d45591dd8a948f08bf1e73cd5a67279704a3570ce6eff04ac28ecd91f63f34cdfe607efdec3e0d', 0, '2024-12-06 07:31:39'),
('fee6412742ebe076112d69735c6162bef64ca753b383e1ecce2c7aa9ec0187757771fd094e4e5e9f', 'a0062d1d1d8fcd823ffb63c0c235218edc46b624eb843fe19f97f0857fc64d82c9fe1215b22ad085', 0, '2024-12-08 04:52:43'),
('ffcbefbae2483878bdf80fdfa5d573d912c3f9c8cffcf4bf5b938419e83ab45c57cac51f7841902c', '299edaa70312edc302c5e198cf6d32fc4bc13e9c03c62d11b56eb727405009f3a658c8229c819e8d', 0, '2024-12-04 08:35:02');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `price` varchar(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `months` int(11) DEFAULT NULL,
  `playid` varchar(255) DEFAULT NULL,
  `appid` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `price`, `title`, `months`, `playid`, `appid`, `description`, `created_at`, `updated_at`) VALUES
(3, '8', 'Try It', 1, 'getPackage', 'com.retrytech.orange.1month', NULL, NULL, NULL),
(4, '30', 'Popular', 6, 'android.test.purchased', 'com.retrytech.orange.6month', '$5.0/mth', NULL, NULL),
(5, '49', 'Best Value', 12, 'minimumPackage', 'com.retrytech.orange.12month', '$4.1/mth', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(55) NOT NULL,
  `privacy` text DEFAULT NULL,
  `termsofuse` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `privacy`, `termsofuse`, `created_at`, `updated_at`) VALUES
(1, '<pre style=\"font-family: Menlo, Monaco, Consolas, \" courier=\"\" new\",=\"\" monospace;=\"\" font-size:=\"\" 13px;=\"\" padding:=\"\" 9.5px;=\"\" margin-bottom:=\"\" 10px;=\"\" line-height:=\"\" 1.42857;=\"\" word-break:=\"\" break-all;=\"\" overflow-wrap:=\"\" break-word;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" background-color:=\"\" rgb(245,=\"\" 245,=\"\" 245);=\"\" border:=\"\" 1px=\"\" solid=\"\" rgb(204,=\"\" 204,=\"\" 204);=\"\" border-radius:=\"\" 4px;\"=\"\"><h1 style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 36px; font-family: AR12; font-weight: normal; color: rgb(58, 72, 81); white-space: normal;\"><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">5 July 2020</span></p></h1><h3 style=\"text-align: left; border: 0px; margin: 20px 0px; padding: 0px; font-size: 22px; font-family: ALO8; font-weight: normal; color: rgb(58, 72, 81); white-space: normal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demo Privacy Policy1</span></h3><h1 style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 36px; font-family: AR12; font-weight: normal; color: rgb(58, 72, 81); white-space: normal;\"><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos follows the relevant legal requirements and takes all reasonable precautions to safeguard personal information.</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">INTRODUCTION</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos is committed to protecting your privacy and security. This policy explains how and why we use your personal data, to ensure you remain informed and in control of your information.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">You can decide not to receive communications or change how we contact you at any time. If you wish to do so please contact us by emailing&nbsp;hello@demos.co.uk, writing to 76 Vincent Square, London, SW1 2PD or 020 3878 3955 (Lines open 9.30am – 6pm, Mon – Fri).</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We will never sell your personal data, and will only ever share it with organisations we work with where necessary and if its privacy and security are guaranteed. Personal information submitted to Demos is only used to contact you regarding Demos activities.&nbsp;</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Information about visitors to the Demos website domain is automatically logged for the purposes of statistical analysis. Such information includes the IP address from which you visit, referral address, and other technical information such as browser type and operating system. Your email address is not automatically logged without your knowledge.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We will not distribute, sell, trade or rent your personal information to third parties. Demos may provide aggregate statistics about our website’s users, traffic patterns and related site information to reputable third-parties such as Demos’s funding bodies or potential partners. Such statistical information will not include personally identifying information.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Questions?</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Any questions you have in relation to this policy or how we use your personal data should be sent to&nbsp;hello@demos.co.uk&nbsp;for the attention of Demos’ Head of External Affairs.</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">ABOUT US</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Your personal data (i.e. any information which identifies you, or which can be identified as relating to you personally) will be collected and used by Demos (charity no:1042046,&nbsp; company registration no: 2977740).</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">THE INFORMATION WE COLLECT</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Personal data you provide</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We collect data you provide to us. This includes information you give when joining as a member or signing up to our newsletter, placing an order or communicating with us. For example:</span></p><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">personal details (name, job title, organisation and email) when you sign up to our newsletter and / or events.</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">financial information (payment information such as credit/debit card or direct debit details, when making donations or paying for a service. Please see section 8 for more information on payment security); and</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">details of Demos events you have attended.</span></li></ul><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Sensitive personal data</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We do not normally collect or store sensitive personal data (such as information relating to health, beliefs or political affiliation) about those signed up to Demos’s newsletter. However there are some situations where this will occur (e.g. if you have an accident on one of our events). If this does occur, we’ll take extra care to ensure your privacy rights are protected.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Accidents or incidents</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If an accident or incident occurs on our property, at one of our events or involving one of our staff then we’ll keep a record of this (which may include personal data and sensitive personal data).</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">HOW WE USE INFORMATION2222</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We only ever use your personal data with your consent, or where it is necessary in order to:</span></p><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">enter into, or perform, a contract with you;</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">comply with a legal duty;</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">protect your vital interests;</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">for our own (or a third party’s) lawful interests, provided your rights don’t override these.</span></li></ul><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">In any event, we’ll only use your information for the purpose or purposes it was collected for (or else for closely related purposes).</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Administration</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We use personal data for administrative purposes (i.e. on our research and events programmes). This includes:</span></p><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">maintaining databases of those signed up to our newsletter;</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">fulfilling orders for goods or services (whether placed online, over the phone or in person);</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">helping us respect your choices and preferences (e.g. if you ask not to receive marketing material, we’ll keep a record of this).</span></li></ul><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">DISCLOSING AND SHARING DATA</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Your personal data – which may include your name, organisation, position, and email address are held by our mailing list provider. By signing up to our newsletter you are agreeing to the terms and conditions of MailChimp.com (</span><a href=\"https://mailchimp.com/legal/terms/\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(14, 40, 42); outline: none;\">http://mailchimp.com/legal/terms/</a><span style=\"border: 0px; margin: 0px; padding: 0px;\">). This information is not shared with any other organisation. If you wish to unsubscribe from our mailing list at any time, you can do so by clicking the ‘unsubscribe’ link, found at the bottom of any email we send you – or by sending your name and email address to&nbsp;</span><span style=\"border: 0px; margin: 0px; padding: 0px;\">hello@demos.co.uk</span><span style=\"border: 0px; margin: 0px; padding: 0px;\">&nbsp;– stating ‘Unsubscribe’ in the email in the subject line or body of the email.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If you register to attend an event, your personal data which may include your name, organisation, and email address are held by our event registration provider. By registering to attend an event you are agreeing to the terms and conditions of Eventbrite (</span><a href=\"https://www.eventbrite.com/l/LegalTerms/\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(14, 40, 42); outline: none;\">https://www.eventbrite.com/l/LegalTerms/</a><span style=\"border: 0px; margin: 0px; padding: 0px;\">)</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Occasionally, where we partner with other organisations, we may also share information with them (for example, if you register to attend an event being jointly organised by us and another organisation). We’ll only share information when necessary and we will never share your contact information (e.g. email or telephone).</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">MARKETING</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos will ask for individuals to “opt-in” for most communications. This includes all our marketing communications (the term marketing is broadly defined and covers information shared in our newsletter.)</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We use personal data to communicate with people, to promote Demos and to help with fundraising activities. This includes keeping you up to date with information from Demos on our research, events, news, job opportunities and other information relating to our work.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">You can decide not to receive communications or change how we contact you at any time. If you wish to do so please contact us by emailing&nbsp;</span><span style=\"border: 0px; margin: 0px; padding: 0px;\">hello@demos.co.uk,</span><span style=\"border: 0px; margin: 0px; padding: 0px;\">&nbsp;writing to Demos, 76 Vincent Square, London SW1P 2PD or telephoning 020 3878 3955 (Lines open 9.30am – 6pm, Mon – Fri).</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">What does ‘marketing’ mean?</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Marketing does not just mean offering things for sale, but also includes news and information about:</span></p><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">our research programme, including details of recent reports or blogs;</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">our events and activities; and</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">job opportunities.</span></li></ul><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">When you receive a communication, we may collect information about how you respond to or interact with that communication, and this may affect how we communicate with you in future.</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">HOW WE PROTECT DATA</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We employ a variety of physical and technical measures to keep your data safe and to prevent unauthorised access to, or use or disclosure of your personal information.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Electronic data and databases are stored on secure computer systems and we control who has access to information (using both physical and electronic means). Our staff receive data protection training and we have a set of detailed data protection procedures which personnel are required to follow when handling personal data.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Payment security</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">All electronic Demos forms that request financial data use pass your details to our payment provider (Stripe Payments Europe:&nbsp;</span><a href=\"https://stripe.com/gb/privacy\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(14, 40, 42); outline: none;\">https://stripe.com/gb/privacy</a><span style=\"border: 0px; margin: 0px; padding: 0px;\">;&nbsp;</span><a href=\"https://stripe.com/privacy-shield-policy\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(14, 40, 42); outline: none;\">https://stripe.com/privacy-shield-policy</a><span style=\"border: 0px; margin: 0px; padding: 0px;\">). Demos complies with the payment card industry data security standard (PCI-DSS) published by the PCI Security Standards Council, and will never store card details. If you would rather make a payment through BACS or by cheque please contact us by emailing&nbsp;hello@demos.co.uk, writing to Unit 1, Lloyd’s Wharf, 2-3 Mill Street, London SE1 2BD or telephoning 020 3878 3955 (Lines open 9.30am – 6pm, Mon – Fri).</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Of course, we cannot guarantee the security of your home computer or the internet, and any online communications (e.g. information provided by email or our website) are at the user’s own risk.</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">STORAGE</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Where we store information</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos’ operations are based in England and we store our data within the European Union.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">How long we store information</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We will only use and store information for so long as it is required for the purposes it was collected for. How long information will be stored for depends on the information in question and what it is being used for. For example, if you ask us not to send you marketing emails, we will stop storing your emails for marketing purposes (though we’ll keep a record of your preference not to be emailed).</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We continually review what information we hold and delete what is no longer required. We never store payment card information.</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">KEEPING YOU IN CONTROL</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We want to ensure you remain in control of your personal data. Part of this is making sure you understand your legal rights, which are as follows:</span></p><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">the right to confirmation as to whether or not we have your personal data and, if we do, to obtain a copy of the personal information we hold (this is known as subject access request);</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">the right to have your data erased (though this will not apply where it is necessary for us to continue to use the data for a lawful reason);</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">the right to have inaccurate data rectified;</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">the right to object to your data being used for marketing or profiling; and</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">where technically feasible, you have the right to personal data you have provided to us which we process automatically on the basis of your consent or the performance of a contract. This information will be provided in a common electronic format.</span></li></ul><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Please keep in mind that there are exceptions to the rights above and, though we will always try to respond to your satisfaction, there may be situations where we are unable to do so.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If you would like further information on your rights or wish to exercise them, please write to Demos’ Head of External Affairs, 76 Vincent Square, London, SW1P 2PD or by email;&nbsp;hello@demos.co.uk</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Complaints</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">You can complain to Demos directly by contacting our Head of External Affairs using the details set out above.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If you are not happy with our response, or you believe that your data protection or privacy rights have been infringed, you can complain to the UK Information Commissioner’s Office which regulates and enforces data protection law in the UK. Details of how to do this can be found at&nbsp;</span><a href=\"https://www.ico.org.uk/\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(14, 40, 42); outline: none;\">www.ico.org.uk</a></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">COOKIES AND LINKS TO OTHER SITES</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Cookies</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We use cookies on our website. Cookies files are downloaded to a device when certain websites are accessed by users, allowing the website to identify that user on subsequent visits.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">The only cookies in use on our site are for Google Analytics. Google Analytics are tools employed by organisations to help them understand how visitors engage with their website, so improvements can be made. Google Analytics collects information anonymously – and reports overall trends, without disclosing information on individual visitors. By using our site you are consenting to saving and sending us this data. You can opt out of Google Analytics – which will not affect how you visit our site. Further information on this can be found here:&nbsp;</span><a href=\"https://tools.google.com/dlpage/gaoptout\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(14, 40, 42); outline: none;\">https://tools.google.com/dlpage/gaoptout</a></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Our website uses local storage strictly for system administration to provide you with the best possible experience – used in order to create reports relating to web traffic and user preferences. This includes: your IP address; details of which web browser or operating system was used; and information on how you use the site.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Links to other sites</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Our website contains hyperlinks to many other websites. We are not responsible for the content or functionality of any of those external websites.</span></p><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If an external website requests personal information from you (e.g. in connection with an order for goods or services), the information you provide will not be covered by the Demos’ Privacy Policy. We suggest you read the privacy policy of any website before providing any personal information.</span></p><ol style=\"border: 0px; margin: 20px 0px 20px 3px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">CHANGES TO THIS PRIVACY POLICY</span></li></ol><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We’ll amend this Privacy Policy from time to time to ensure it remains up-to-date and accurately reflects how and why we use your personal data. The current version of our Privacy Policy will always be posted on our website.</span></p></h1><h4 style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 20px; font-family: AR12; font-weight: normal; color: rgb(58, 72, 81); white-space: normal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Note on compliance with the General Data Protection Regulation as pertaining to use of social media data within Demos projects</span></h4><h1 style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 36px; font-family: AR12; font-weight: normal; color: rgb(58, 72, 81); white-space: normal;\"><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">The Centre for the Analysis of Social Media (CASM) often conducts research which involves the collection and analysis of publicly available data from social media platforms.&nbsp; Much of this data, including usernames, is considered personal data under the General Data Protection Regulation (GDPR). In order to ensure this data is processed lawfully and transparently, the following procedures are followed by CASM projects undertaken by Demos:</span></p><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">All data collected from social media platforms is accessed through the official application programming interface (API) of that platform, and stored and used in compliance with that API’s terms of service.</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Data is only collected from platforms for which users have provided clear consent, as defined in Article 4(11) of the GDPR, to provide that platform with published data</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">CASM often applies techniques in artificial intelligence to social media data, in order to conduct research on this data. As we have throughout our history as a research centre, we ensure that the reasons for applying these techniques, the methodology used to analyse data, and the conclusions drawn from our analysis are presented clearly and fully in each report. This includes publishing detailed accuracy scores for any machine learning algorithms applied as part of the research.</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">This data is securely stored on a monitored server, accessible only to CASM staff, and encrypted in transit. In the event that a data breach is discovered, CASM will act swiftly to ensure that damage from this breach is minimised, including informing relevant supervisory authorities and acting to identify and resolve any security issues allowing the breach.</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos will maintain a publicly accessible page on its website for each project, explaining the sources and character of data collected for that project, the purposes for which this data will be used, and including contact details for a designated member of staff responsible for responding to public queries about this data.</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Data collected from social media sites is not stored for longer than is necessary to complete each project</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">In order to respect the rights of data controllers to maintain control of their personal data, CASM will remove from any dataset personal data pertaining to an individual who requests such deletion. This includes taking reasonable measures to ensure that content deleted from social media platforms is also removed from datasets used by CASM.</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">CASM does not publish any personal data collected during its research, nor is personal data shared with third parties external to CASM or transferred out of the UK, without the explicit consent of the data subject. Any data published or shared with a third party is aggregated, anonymised or altered to prevent identification a natural person.</span></li></ul><ul style=\"border: 0px; margin: 20px 0px 20px 20px; padding: 0px; font-size: 18px; list-style: none; font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Where quotes from social media users are published in reports, these quotes are bowdlerised – altered in a way which preserves meaning but prevents retroactive identification of the original post through e.g an online search. An occasional exception to this policy is observed when the user is publically known to the extent that they would not reasonably expect their social media posts to be private. It should be noted here that the GDPR only applies to natural persons, and not companies or organisations.</span></li></ul><p style=\"border: 0px; margin: 20px 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word; color: rgb(58, 72, 81); font-family: ABOOK1, \" times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">This Privacy Policy was last updated on 05.07.2020 234</span></p></h1></pre><p>\r\n                    </p>', '<pre courier=\"\" new\",=\"\" monospace;=\"\" font-size:=\"\" 13px;=\"\" padding:=\"\" 9.5px;=\"\" margin-bottom:=\"\" 10px;=\"\" line-height:=\"\" 1.42857;=\"\" word-break:=\"\" break-all;=\"\" overflow-wrap:=\"\" break-word;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" background-color:=\"\" rgb(245,=\"\" 245,=\"\" 245);=\"\" border:=\"\" 1px=\"\" solid=\"\" rgb(204,=\"\" 204,=\"\" 204);=\"\" border-radius:=\"\" 4px;\"=\"\" style=\"font-size: 12.25px;\"><h1 style=\"margin: 20px 0px; font-weight: normal; font-size: 36px; border: 0px; padding: 0px; font-family: AR12; color: rgb(58, 72, 81); white-space: normal;\"><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">5 July 2020</span></p></h1><h3 style=\"margin: 20px 0px; font-weight: normal; font-size: 22px; border: 0px; padding: 0px; font-family: ALO8; color: rgb(58, 72, 81); white-space: normal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Terms Of Use:</span></h3><h1 style=\"margin: 20px 0px; font-weight: normal; font-size: 36px; border: 0px; padding: 0px; font-family: AR12; color: rgb(58, 72, 81); white-space: normal;\"><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos follows the relevant legal requirements and takes all reasonable precautions to safeguard personal information.</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">INTRODUCTION</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos is committed to protecting your privacy and security. This policy explains how and why we use your personal data, to ensure you remain informed and in control of your information.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">You can decide not to receive communications or change how we contact you at any time. If you wish to do so please contact us by emailing&nbsp;hello@demos.co.uk, writing to 76 Vincent Square, London, SW1 2PD or 020 3878 3955 (Lines open 9.30am – 6pm, Mon – Fri).</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We will never sell your personal data, and will only ever share it with organisations we work with where necessary and if its privacy and security are guaranteed. Personal information submitted to Demos is only used to contact you regarding Demos activities.&nbsp;</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Information about visitors to the Demos website domain is automatically logged for the purposes of statistical analysis. Such information includes the IP address from which you visit, referral address, and other technical information such as browser type and operating system. Your email address is not automatically logged without your knowledge.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We will not distribute, sell, trade or rent your personal information to third parties. Demos may provide aggregate statistics about our website’s users, traffic patterns and related site information to reputable third-parties such as Demos’s funding bodies or potential partners. Such statistical information will not include personally identifying information.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Questions?</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Any questions you have in relation to this policy or how we use your personal data should be sent to&nbsp;hello@demos.co.uk&nbsp;for the attention of Demos’ Head of External Affairs.</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">ABOUT US</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Your personal data (i.e. any information which identifies you, or which can be identified as relating to you personally) will be collected and used by Demos (charity no:1042046,&nbsp; company registration no: 2977740).</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">THE INFORMATION WE COLLECT</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Personal data you provide</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We collect data you provide to us. This includes information you give when joining as a member or signing up to our newsletter, placing an order or communicating with us. For example:</span></p><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">personal details (name, job title, organisation and email) when you sign up to our newsletter and / or events.</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">financial information (payment information such as credit/debit card or direct debit details, when making donations or paying for a service. Please see section 8 for more information on payment security); and</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">details of Demos events you have attended.</span></li></ul><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Sensitive personal data</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We do not normally collect or store sensitive personal data (such as information relating to health, beliefs or political affiliation) about those signed up to Demos’s newsletter. However there are some situations where this will occur (e.g. if you have an accident on one of our events). If this does occur, we’ll take extra care to ensure your privacy rights are protected.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Accidents or incidents</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If an accident or incident occurs on our property, at one of our events or involving one of our staff then we’ll keep a record of this (which may include personal data and sensitive personal data).</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">HOW WE USE INFORMATION</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We only ever use your personal data with your consent, or where it is necessary in order to:</span></p><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">enter into, or perform, a contract with you;</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">comply with a legal duty;</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">protect your vital interests;</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">for our own (or a third party’s) lawful interests, provided your rights don’t override these.</span></li></ul><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">In any event, we’ll only use your information for the purpose or purposes it was collected for (or else for closely related purposes).</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Administration</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We use personal data for administrative purposes (i.e. on our research and events programmes). This includes:</span></p><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">maintaining databases of those signed up to our newsletter;</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">fulfilling orders for goods or services (whether placed online, over the phone or in person);</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">helping us respect your choices and preferences (e.g. if you ask not to receive marketing material, we’ll keep a record of this).</span></li></ul><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">DISCLOSING AND SHARING DATA</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Your personal data – which may include your name, organisation, position, and email address are held by our mailing list provider. By signing up to our newsletter you are agreeing to the terms and conditions of MailChimp.com (</span><a href=\"https://mailchimp.com/legal/terms/\" style=\"color: rgb(14, 40, 42); border: 0px; margin: 0px; padding: 0px; outline: none;\">http://mailchimp.com/legal/terms/</a><span style=\"border: 0px; margin: 0px; padding: 0px;\">). This information is not shared with any other organisation. If you wish to unsubscribe from our mailing list at any time, you can do so by clicking the ‘unsubscribe’ link, found at the bottom of any email we send you – or by sending your name and email address to&nbsp;</span><span style=\"border: 0px; margin: 0px; padding: 0px;\">hello@demos.co.uk</span><span style=\"border: 0px; margin: 0px; padding: 0px;\">&nbsp;– stating ‘Unsubscribe’ in the email in the subject line or body of the email.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If you register to attend an event, your personal data which may include your name, organisation, and email address are held by our event registration provider. By registering to attend an event you are agreeing to the terms and conditions of Eventbrite (</span><a href=\"https://www.eventbrite.com/l/LegalTerms/\" style=\"color: rgb(14, 40, 42); border: 0px; margin: 0px; padding: 0px; outline: none;\">https://www.eventbrite.com/l/LegalTerms/</a><span style=\"border: 0px; margin: 0px; padding: 0px;\">)</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Occasionally, where we partner with other organisations, we may also share information with them (for example, if you register to attend an event being jointly organised by us and another organisation). We’ll only share information when necessary and we will never share your contact information (e.g. email or telephone).</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">MARKETING</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos will ask for individuals to “opt-in” for most communications. This includes all our marketing communications (the term marketing is broadly defined and covers information shared in our newsletter.)</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We use personal data to communicate with people, to promote Demos and to help with fundraising activities. This includes keeping you up to date with information from Demos on our research, events, news, job opportunities and other information relating to our work.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">You can decide not to receive communications or change how we contact you at any time. If you wish to do so please contact us by emailing&nbsp;</span><span style=\"border: 0px; margin: 0px; padding: 0px;\">hello@demos.co.uk,</span><span style=\"border: 0px; margin: 0px; padding: 0px;\">&nbsp;writing to Demos, 76 Vincent Square, London SW1P 2PD or telephoning 020 3878 3955 (Lines open 9.30am – 6pm, Mon – Fri).</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">What does ‘marketing’ mean?</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Marketing does not just mean offering things for sale, but also includes news and information about:</span></p><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">our research programme, including details of recent reports or blogs;</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">our events and activities; and</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">job opportunities.</span></li></ul><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">When you receive a communication, we may collect information about how you respond to or interact with that communication, and this may affect how we communicate with you in future.</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">HOW WE PROTECT DATA</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We employ a variety of physical and technical measures to keep your data safe and to prevent unauthorised access to, or use or disclosure of your personal information.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Electronic data and databases are stored on secure computer systems and we control who has access to information (using both physical and electronic means). Our staff receive data protection training and we have a set of detailed data protection procedures which personnel are required to follow when handling personal data.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Payment security</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">All electronic Demos forms that request financial data use pass your details to our payment provider (Stripe Payments Europe:&nbsp;</span><a href=\"https://stripe.com/gb/privacy\" style=\"color: rgb(14, 40, 42); border: 0px; margin: 0px; padding: 0px; outline: none;\">https://stripe.com/gb/privacy</a><span style=\"border: 0px; margin: 0px; padding: 0px;\">;&nbsp;</span><a href=\"https://stripe.com/privacy-shield-policy\" style=\"color: rgb(14, 40, 42); border: 0px; margin: 0px; padding: 0px; outline: none;\">https://stripe.com/privacy-shield-policy</a><span style=\"border: 0px; margin: 0px; padding: 0px;\">). Demos complies with the payment card industry data security standard (PCI-DSS) published by the PCI Security Standards Council, and will never store card details. If you would rather make a payment through BACS or by cheque please contact us by emailing&nbsp;hello@demos.co.uk, writing to Unit 1, Lloyd’s Wharf, 2-3 Mill Street, London SE1 2BD or telephoning 020 3878 3955 (Lines open 9.30am – 6pm, Mon – Fri).</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Of course, we cannot guarantee the security of your home computer or the internet, and any online communications (e.g. information provided by email or our website) are at the user’s own risk.</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">STORAGE</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Where we store information</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos’ operations are based in England and we store our data within the European Union.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">How long we store information</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We will only use and store information for so long as it is required for the purposes it was collected for. How long information will be stored for depends on the information in question and what it is being used for. For example, if you ask us not to send you marketing emails, we will stop storing your emails for marketing purposes (though we’ll keep a record of your preference not to be emailed).</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We continually review what information we hold and delete what is no longer required. We never store payment card information.</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">KEEPING YOU IN CONTROL</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We want to ensure you remain in control of your personal data. Part of this is making sure you understand your legal rights, which are as follows:</span></p><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">the right to confirmation as to whether or not we have your personal data and, if we do, to obtain a copy of the personal information we hold (this is known as subject access request);</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">the right to have your data erased (though this will not apply where it is necessary for us to continue to use the data for a lawful reason);</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">the right to have inaccurate data rectified;</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">the right to object to your data being used for marketing or profiling; and</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">where technically feasible, you have the right to personal data you have provided to us which we process automatically on the basis of your consent or the performance of a contract. This information will be provided in a common electronic format.</span></li></ul><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Please keep in mind that there are exceptions to the rights above and, though we will always try to respond to your satisfaction, there may be situations where we are unable to do so.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If you would like further information on your rights or wish to exercise them, please write to Demos’ Head of External Affairs, 76 Vincent Square, London, SW1P 2PD or by email;&nbsp;hello@demos.co.uk</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Complaints</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">You can complain to Demos directly by contacting our Head of External Affairs using the details set out above.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If you are not happy with our response, or you believe that your data protection or privacy rights have been infringed, you can complain to the UK Information Commissioner’s Office which regulates and enforces data protection law in the UK. Details of how to do this can be found at&nbsp;</span><a href=\"https://www.ico.org.uk/\" style=\"color: rgb(14, 40, 42); border: 0px; margin: 0px; padding: 0px; outline: none;\">www.ico.org.uk</a></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">COOKIES AND LINKS TO OTHER SITES</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Cookies</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We use cookies on our website. Cookies files are downloaded to a device when certain websites are accessed by users, allowing the website to identify that user on subsequent visits.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">The only cookies in use on our site are for Google Analytics. Google Analytics are tools employed by organisations to help them understand how visitors engage with their website, so improvements can be made. Google Analytics collects information anonymously – and reports overall trends, without disclosing information on individual visitors. By using our site you are consenting to saving and sending us this data. You can opt out of Google Analytics – which will not affect how you visit our site. Further information on this can be found here:&nbsp;</span><a href=\"https://tools.google.com/dlpage/gaoptout\" style=\"color: rgb(14, 40, 42); border: 0px; margin: 0px; padding: 0px; outline: none;\">https://tools.google.com/dlpage/gaoptout</a></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Our website uses local storage strictly for system administration to provide you with the best possible experience – used in order to create reports relating to web traffic and user preferences. This includes: your IP address; details of which web browser or operating system was used; and information on how you use the site.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Links to other sites</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Our website contains hyperlinks to many other websites. We are not responsible for the content or functionality of any of those external websites.</span></p><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">If an external website requests personal information from you (e.g. in connection with an order for goods or services), the information you provide will not be covered by the Demos’ Privacy Policy. We suggest you read the privacy policy of any website before providing any personal information.</span></p><ol times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 3px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none decimal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">CHANGES TO THIS PRIVACY POLICY</span></li></ol><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">We’ll amend this Privacy Policy from time to time to ensure it remains up-to-date and accurately reflects how and why we use your personal data. The current version of our Privacy Policy will always be posted on our website.</span></p></h1><h4 style=\"margin: 20px 0px; font-weight: normal; font-size: 20px; border: 0px; padding: 0px; font-family: AR12; color: rgb(58, 72, 81); white-space: normal;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Note on compliance with the General Data Protection Regulation as pertaining to use of social media data within Demos projects</span></h4><h1 style=\"margin: 20px 0px; font-weight: normal; font-size: 36px; border: 0px; padding: 0px; font-family: AR12; color: rgb(58, 72, 81); white-space: normal;\"><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">The Centre for the Analysis of Social Media (CASM) often conducts research which involves the collection and analysis of publicly available data from social media platforms.&nbsp; Much of this data, including usernames, is considered personal data under the General Data Protection Regulation (GDPR). In order to ensure this data is processed lawfully and transparently, the following procedures are followed by CASM projects undertaken by Demos:</span></p><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">All data collected from social media platforms is accessed through the official application programming interface (API) of that platform, and stored and used in compliance with that API’s terms of service.</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Data is only collected from platforms for which users have provided clear consent, as defined in Article 4(11) of the GDPR, to provide that platform with published data</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">CASM often applies techniques in artificial intelligence to social media data, in order to conduct research on this data. As we have throughout our history as a research centre, we ensure that the reasons for applying these techniques, the methodology used to analyse data, and the conclusions drawn from our analysis are presented clearly and fully in each report. This includes publishing detailed accuracy scores for any machine learning algorithms applied as part of the research.</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">This data is securely stored on a monitored server, accessible only to CASM staff, and encrypted in transit. In the event that a data breach is discovered, CASM will act swiftly to ensure that damage from this breach is minimised, including informing relevant supervisory authorities and acting to identify and resolve any security issues allowing the breach.</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Demos will maintain a publicly accessible page on its website for each project, explaining the sources and character of data collected for that project, the purposes for which this data will be used, and including contact details for a designated member of staff responsible for responding to public queries about this data.</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Data collected from social media sites is not stored for longer than is necessary to complete each project</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">In order to respect the rights of data controllers to maintain control of their personal data, CASM will remove from any dataset personal data pertaining to an individual who requests such deletion. This includes taking reasonable measures to ensure that content deleted from social media platforms is also removed from datasets used by CASM.</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">CASM does not publish any personal data collected during its research, nor is personal data shared with third parties external to CASM or transferred out of the UK, without the explicit consent of the data subject. Any data published or shared with a third party is aggregated, anonymised or altered to prevent identification a natural person.</span></li></ul><ul times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px 20px 20px; border: 0px; padding: 0px; font-size: 18px; list-style: none;\"><li style=\"border: 0px; margin: 5px 0px 5px 20px; padding: 0px; list-style: outside none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">Where quotes from social media users are published in reports, these quotes are bowdlerised – altered in a way which preserves meaning but prevents retroactive identification of the original post through e.g an online search. An occasional exception to this policy is observed when the user is publically known to the extent that they would not reasonably expect their social media posts to be private. It should be noted here that the GDPR only applies to natural persons, and not companies or organisations.</span></li></ul><p times=\"\" new=\"\" roman\",=\"\" times,=\"\" serif;\"=\"\" style=\"margin: 20px 0px; color: rgb(58, 72, 81); border: 0px; padding: 0px; font-size: 18px; overflow-wrap: break-word;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">This Privacy Policy was last updated on 05.07.2020</span></p></h1></pre>', '2022-05-18 10:45:41', '2022-10-04 02:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'MyApp', '0d6e50f7a8ee0a29bc69c3f4736dccb38581b50a981648774ec9a8e3accad737', '[\"*\"]', '2023-08-25 09:47:10', NULL, '2023-08-25 04:12:50', '2023-08-25 04:12:50'),
(2, 'App\\Models\\User', 2, 'MyApp', '702a82fdfdc3e84be3b17503c3c4b7d8e56cc70ec6f161a2c11215c8a6d80c03', '[\"*\"]', NULL, NULL, '2023-08-25 04:18:12', '2023-08-25 04:18:12'),
(3, 'App\\Models\\User', 2, 'MyApp', '2115e5cbd1d791ff2f09b6833069314b378cd4c9ac7f1d219774eeb98a0c281b', '[\"*\"]', '2023-08-25 04:22:25', NULL, '2023-08-25 04:18:14', '2023-08-25 04:22:25'),
(4, 'App\\Models\\User', 6, 'Laravel', '4d07d514ed74accc4862a33ef9e559783b3455fd42a9058fde470b3ecfd5a8d7', '[\"*\"]', NULL, NULL, '2023-08-25 04:32:33', '2023-08-25 04:32:33'),
(5, 'App\\Models\\User', 7, 'Laravel', '8c88d59fb612419b69d115760c811c07c4cdf312590ee2b44ba93e79e9a53723', '[\"*\"]', NULL, NULL, '2023-08-25 04:33:07', '2023-08-25 04:33:07'),
(6, 'App\\Models\\User', 8, 'Laravel', '12382308380a1878e33efcd980a3ae9f6e0221b0a1407d7a788695f4fd7d0a67', '[\"*\"]', NULL, NULL, '2023-08-25 04:33:30', '2023-08-25 04:33:30');

-- --------------------------------------------------------

--
-- Table structure for table `personal_questions`
--

CREATE TABLE `personal_questions` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  `question` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_questions`
--

INSERT INTO `personal_questions` (`id`, `type`, `title`, `image`, `question`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'about_me', 'Zodiac', 'images/zodiac.png', 'What is your Zodiac sign?', NULL, '2023-08-28 04:57:55', '2023-08-28 04:57:55'),
(2, 'about_me', 'Education', 'images/education.png', 'What is your Education?', NULL, '2023-08-28 04:57:55', '2023-08-28 04:57:55'),
(3, 'about_me', 'Family Plans', 'images/childran.png', 'Do you want children?', NULL, '2023-08-28 04:57:55', '2023-08-28 04:57:55'),
(4, 'lifestyle', 'Pets', 'images/pets.png', 'Do you have any pets?', NULL, '0000-00-00 00:00:00', '2023-08-28 04:57:55'),
(5, 'lifestyle', 'Smoking', 'images/smoke.png', 'How often do you smoke?', NULL, '2023-08-28 04:57:55', '2023-08-28 04:57:55'),
(6, 'lifestyle', 'Drinking', 'images/drinking.png', 'How often do you drink?', NULL, '2023-08-28 04:57:55', '2023-08-28 04:57:55'),
(13, 'about_me', 'Clothing', 'images/personality_type.png', 'Your clothing style ?', NULL, '2023-08-28 04:57:55', '2023-08-28 04:57:55'),
(14, 'about_me', 'Communication style', 'images/communication _style.png', 'What is communication type?', NULL, '2023-08-28 04:57:55', '2023-08-28 04:57:55'),
(15, 'about_me', 'Love style', 'images/love_style.png', 'How do you receive love?', NULL, '2023-08-28 04:57:55', '2023-08-28 04:57:55'),
(16, 'lifestyle', 'Workout', 'images/workout.png', 'Do you workout?', NULL, '0000-00-00 00:00:00', '2023-08-28 04:57:55'),
(17, 'lifestyle', 'Dietary preference', 'images/dietary_preference.png', 'What are dietary preferences?', NULL, '2023-08-28 04:57:55', '2023-11-24 11:27:40'),
(18, 'lifestyle', 'Social media', 'images/social_media.png', 'How do you receive love?', NULL, '2023-08-28 04:57:55', '2023-08-28 04:57:55'),
(19, 'lifestyle', 'Cooking', 'uploads/PersonalQuestion/1701948216.png', 'Do you like cooking ?', NULL, '2023-08-28 04:57:55', '2023-12-07 11:23:36');

-- --------------------------------------------------------

--
-- Table structure for table `personal_questions_translations`
--

CREATE TABLE `personal_questions_translations` (
  `lang_code` varchar(191) NOT NULL,
  `personal_questions_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `question` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_questions_translations`
--

INSERT INTO `personal_questions_translations` (`lang_code`, `personal_questions_id`, `title`, `question`) VALUES
('it', 1, 'Zodiaco', 'Qual\'è il tuo segno zodiacale?'),
('it', 2, 'Formazione scolastica', 'Che studi hai fatto?'),
('it', 3, 'Piani familiari', 'Vuoi avere bambini?'),
('it', 4, 'Animali domestici', 'Hai animali domestici?'),
('it', 5, 'Fumo', 'Quanto spesso fumi?'),
('it', 6, 'Alcool', 'quanto spesso bevi?'),
('it', 13, 'Abbigliamento', 'Il tuo stile di abbigliamento?'),
('it', 14, 'Stile di comunicazione', 'Qual è il tipo di comunicazione?'),
('it', 15, 'Stile d\'amore', 'Come ricevi amore?'),
('it', 16, 'Allenamento', 'Ti alleni?'),
('it', 17, 'Preferenza dietetica\nVuoto', 'Quali sono le preferenze dietetiche?'),
('it', 18, 'Social media', 'Come ricevi amore?'),
('it', 19, 'cucinando', 'Ti piace cucinare?'),
('fr', 1, 'Zodiaque', 'Quel est ton signe du zodiaque?'),
('fr', 2, 'Éducation', 'Quel est votre niveau d\'etudes?'),
('fr', 3, 'Forfaits familiaux', 'Voulez-vous des enfants?'),
('fr', 4, 'Animaux domestiques', 'Avez-vous des animaux domestiques?'),
('fr', 5, 'Smoking', 'Combien de fois fumez-vous?'),
('fr', 6, 'En buvant', 'Combien de fois buvez-vous?'),
('fr', 13, 'Vêtements', 'Votre style vestimentaire ?'),
('fr', 14, 'Mode de communication', 'Quel est le type de communication ?'),
('fr', 15, 'Aimer le style', 'Comment recevoir l\'amour ?'),
('fr', 16, 'Entraînement', 'Est-ce que tu fais du sport?'),
('fr', 17, 'Préférence alimentaire\nVide', 'Quelles sont les préférences alimentaires ?'),
('fr', 18, 'Réseaux sociaux', 'Comment recevoir l\'amour ?'),
('fr', 19, 'Cuisson', 'Est-ce que tu aimes cuisiner?'),
('de', 1, 'Zodiac', 'What is your Zodiac sign?'),
('de', 2, 'Education', 'What is your Education?'),
('de', 3, 'Family Plans', 'Do you want children?'),
('de', 4, 'Pets', 'Do you have any pets?'),
('de', 5, 'Smoking', 'How often do you smoke?'),
('de', 6, 'Drinking', 'How often do you drink?'),
('de', 13, 'Clothing', 'Your clothing style ?'),
('de', 14, 'Communication style', 'What is communication type?'),
('de', 15, 'Love style', 'How do you receive love?'),
('de', 16, 'Workout', 'Do you workout?'),
('de', 17, 'Dietary preference\nEmpty', 'What are dietary preferences?'),
('de', 18, 'Social media', 'How do you receive love?'),
('de', 19, 'Cooking', 'Do you like cooking ?'),
('es', 1, 'Zodíaco', '¿Cuál es tu signo del zodiaco?'),
('es', 2, 'Educación', '¿Cuál es tu educación?'),
('es', 3, 'Planes familiares', 'Quieres tener hijos?'),
('es', 4, 'Mascotas', '¿Tiene mascotas?'),
('es', 5, 'Smoking', '¿Qué tan a menudo fumas?'),
('es', 6, 'Bebiendo', '¿Con qué frecuencia usted bebe?'),
('es', 13, 'Ropa', '¿Tu estilo de vestir?'),
('es', 14, 'Estilo de comunicación', '¿Qué es el tipo de comunicación?'),
('es', 15, 'Estilo de amor', '¿Cómo recibes el amor?'),
('es', 16, 'Ejercicio', '¿Haces ejercicio?'),
('es', 17, 'Preferencia de dieta\nVacío', '¿Qué son las preferencias dietéticas?'),
('es', 18, 'Medios de comunicación social', '¿Cómo recibes el amor?'),
('es', 19, 'Cocinando', '¿Te gusta cocinar?'),
('en', 1, 'Zodiac', 'What is your Zodiac sign?'),
('en', 17, 'Dietary preference', 'What are dietary preferences?');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` text DEFAULT NULL,
  `description` text NOT NULL,
  `price` double(8,2) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `limited` int(11) NOT NULL,
  `free_boost` int(11) DEFAULT 0,
  `boost_duration` enum('weekly','monthly') DEFAULT NULL,
  `free_superlike` int(11) DEFAULT 0,
  `superlike_duration` enum('weekly','monthly') DEFAULT NULL,
  `metadata` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `type`, `name`, `description`, `price`, `currency`, `duration`, `limited`, `free_boost`, `boost_duration`, `free_superlike`, `superlike_duration`, `metadata`, `created_at`, `updated_at`) VALUES
(1, 'premium', '1 Month', '1 Month', 14.90, 'EUR', 30, 0, 0, NULL, 0, NULL, '[\"Unlimited likes\",\"See who likes you\",\"2 Free boost per month\",\"5 Free super likes per week\",\"Control your profile\"]', '2023-11-01 00:25:13', '2023-11-01 00:25:13'),
(2, 'premium', '3 Month', '3 Month', 38.70, 'EUR', 90, 0, 5, 'weekly', 1, 'monthly', '[\"Unlimited likes\",\"See who likes you\",\"2 Free boost per month\",\"5 Free super likes per week\",\"Control your profile\"]', '2023-11-01 00:33:50', '2023-11-27 08:33:00'),
(3, 'premium', '6 Month', '6 Month', 59.40, 'EUR', 180, 0, 0, NULL, 0, NULL, '[\"Unlimited likes\",\"See who likes you\",\"2 Free boost per month\",\"5 Free super likes per week\",\"Control your profile\"]', '2023-11-01 00:34:34', '2023-11-01 00:34:34'),
(6, 'gold', '1 Month', '1 Month', 9.90, 'EUR', 30, 0, 0, NULL, 0, NULL, '[\"Unlimited likes\",\"See who likes you\",\"2 Free boost per month\",\"5 Free super likes per week\",\"Control your profile\"]', '2023-11-01 00:41:52', '2023-11-01 00:41:52'),
(7, 'gold', '3 Month', '3 Month', 26.70, 'EUR', 90, 0, 0, NULL, 0, NULL, '[\"Unlimited likes\",\"See who likes you\",\"2 Free boost per month\",\"5 Free super likes per week\",\"Control your profile\"]', '2023-11-01 00:42:47', '2023-11-01 00:42:47'),
(8, 'gold', '6 Month', '6 Month', 47.40, 'EUR', 180, 0, 0, NULL, 0, NULL, '[\"Unlimited likes\",\"See who likes you\",\"2 Free boost per month\",\"5 Free super likes per week\",\"Control your profile\"]', '2023-11-01 00:43:21', '2023-11-01 00:43:21'),
(9, 'boosts', '1 Boost', 'You Get 1 Boosts', 5.00, 'EUR', 0, 1, 0, NULL, 0, NULL, '[]', '2023-11-01 03:34:26', '2023-11-27 11:09:30'),
(10, 'boosts', '5 Boost', 'You Get 5 Boosts', 19.90, 'EUR', 0, 5, 0, NULL, 0, NULL, '[]', '2023-11-01 03:35:15', '2023-11-27 10:47:15'),
(11, 'boosts', '10 Boost', 'You Get 10 Boosts', 35.00, 'EUR', 0, 10, 0, NULL, 0, NULL, '[]', '2023-11-01 03:35:58', '2023-11-27 10:47:06'),
(12, 'super_likes', '3 Super Likes', 'You Get 3 Super Likes', 6.00, 'EUR', 0, 3, 0, NULL, 0, NULL, '[]', '2023-11-01 03:36:37', '2023-11-01 03:36:37'),
(13, 'super_likes', '15 Super Likes', 'You Get 15 Super Likes', 22.50, 'EUR', 0, 15, 0, NULL, 0, NULL, '[]', '2023-11-01 03:36:59', '2023-11-01 03:36:59'),
(14, 'super_likes', '30 Super Likes', 'You Get 30 Super Likes', 37.50, 'EUR', 0, 30, 0, NULL, 0, NULL, '[]', '2023-11-01 03:37:14', '2023-11-01 03:37:14');

-- --------------------------------------------------------

--
-- Table structure for table `plans_translations`
--

CREATE TABLE `plans_translations` (
  `lang_code` varchar(191) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `metadata` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans_translations`
--

INSERT INTO `plans_translations` (`lang_code`, `plan_id`, `name`, `description`, `metadata`) VALUES
('it', 14, '30 Super Likes', '30 Super Likes', NULL),
('it', 3, '6 Mesi', '6 Mesi', 'Mi piace illimitati,Vedi a chi piaci,2 Boost gratuiti al mese,5 Super Like gratuiti a settimana,Controlla il tuo profilo'),
('it', 2, '3 Mesi', '3 Mesi', 'Mi piace illimitati,Vedi a chi piaci,2 Boost  gratuiti al mese,5 Super Like gratuiti a settimana,Controlla il tuo profilo'),
('it', 1, '1 Mese', '1 Mese', 'Mi piace illimitati,Vedi a chi piaci,2 Boost  gratuiti al mese,5 Super Like gratuiti a settimana,Controlla il tuo profilo'),
('it', 6, '1 Mese', '1 Mese', 'Mi piace illimitati,Vedi a chi piaci,1 Boost gratuito al mese,5 Super Like gratuiti al mese,Controlla il tuo profilo'),
('it', 7, '3 Mesi', '3 Mesi', 'Mi piace illimitati,Vedi a chi piaci,1 Boost gratuito al mese,5 Super Like gratuiti al mese,Controlla il tuo profilo'),
('it', 8, '6 Mesi', '6 Mesi', 'Mi piace illimitati,Vedi a chi piaci,1 Boost gratuito al mese,5 Super Like gratuiti al mese,Controlla il tuo profilo');

-- --------------------------------------------------------

--
-- Table structure for table `plan_subscriptions`
--

CREATE TABLE `plan_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `plan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `charging_price` double(8,2) DEFAULT NULL,
  `charging_currency` varchar(255) DEFAULT NULL,
  `is_recurring` tinyint(1) DEFAULT 0,
  `recurring_each_days` int(11) NOT NULL DEFAULT 30,
  `starts_on` timestamp NULL DEFAULT NULL,
  `expires_on` timestamp NULL DEFAULT NULL,
  `cancelled_on` timestamp NULL DEFAULT NULL,
  `payment_id` varchar(200) DEFAULT NULL,
  `boost_duration` enum('weekly','monthly') DEFAULT NULL,
  `free_boost` int(11) DEFAULT NULL,
  `superlike_duration` enum('weekly','monthly') DEFAULT NULL,
  `free_superlike` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_subscriptions`
--

INSERT INTO `plan_subscriptions` (`id`, `plan_id`, `user_id`, `charging_price`, `charging_currency`, `is_recurring`, `recurring_each_days`, `starts_on`, `expires_on`, `cancelled_on`, `payment_id`, `boost_duration`, `free_boost`, `superlike_duration`, `free_superlike`, `created_at`, `updated_at`) VALUES
(6, 8, 1, 47.40, 'EUR', 0, 180, '2023-12-22 05:32:57', '2024-06-19 05:32:57', NULL, NULL, NULL, 0, NULL, 0, '2023-12-06 09:48:15', '2023-12-22 05:32:57'),
(7, 6, 1, 9.90, 'EUR', 0, 30, '2023-12-22 08:39:30', '2024-01-21 08:39:30', NULL, NULL, NULL, 0, NULL, 0, '2023-12-07 07:25:38', '2023-12-22 08:39:30'),
(8, 1, 56, 14.90, 'EUR', 0, 30, '2023-12-25 06:44:26', '2024-01-24 06:44:26', NULL, NULL, NULL, 0, NULL, 0, '2023-12-19 12:17:27', '2023-12-25 06:44:26'),
(9, 1, 1, 14.90, 'EUR', 0, 30, '2023-12-22 08:41:46', '2024-01-21 08:41:46', NULL, NULL, NULL, 0, NULL, 0, '2023-12-22 05:13:54', '2023-12-22 08:41:46'),
(10, 6, 28, 9.90, 'EUR', 0, 30, '2023-12-22 09:04:54', '2024-01-21 09:04:54', NULL, NULL, NULL, 0, NULL, 0, '2023-12-22 09:04:54', '2023-12-22 09:04:54'),
(11, 6, 62, 9.90, 'EUR', 0, 30, '2023-12-24 13:16:46', '2024-01-23 13:16:46', NULL, NULL, NULL, 0, NULL, 0, '2023-12-24 13:16:46', '2023-12-24 13:16:46');

-- --------------------------------------------------------

--
-- Table structure for table `plan_usages`
--

CREATE TABLE `plan_usages` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('boosts','super_likes') NOT NULL,
  `limit` double(9,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_usages`
--

INSERT INTO `plan_usages` (`id`, `user_id`, `type`, `limit`, `created_at`, `updated_at`) VALUES
(1, 1, 'boosts', 90.00, '2023-12-07 07:25:38', '2023-12-22 08:41:46'),
(2, 1, 'super_likes', 212.00, '2023-12-07 07:25:38', '2023-12-22 08:41:46'),
(3, 56, 'boosts', 10.00, '2023-12-19 12:17:27', '2023-12-25 06:44:56'),
(4, 56, 'super_likes', 3.00, '2023-12-19 12:17:27', '2023-12-25 06:46:21'),
(5, 1, 'boosts', 0.00, '2023-12-22 05:13:54', '2023-12-22 08:41:46'),
(6, 1, 'super_likes', 0.00, '2023-12-22 05:13:54', '2023-12-22 08:41:46'),
(7, 28, 'boosts', 0.00, '2023-12-22 09:04:54', '2023-12-22 09:04:54'),
(8, 28, 'super_likes', 0.00, '2023-12-22 09:04:54', '2023-12-22 09:04:54'),
(9, 62, 'super_likes', 0.00, '2023-12-24 13:15:16', '2023-12-24 13:15:26'),
(10, 62, 'boosts', 1.00, '2023-12-24 13:16:17', '2023-12-24 13:16:17'),
(11, 62, 'boosts', 0.00, '2023-12-24 13:16:46', '2023-12-24 13:16:46'),
(12, 62, 'super_likes', 0.00, '2023-12-24 13:16:46', '2023-12-24 13:16:46');

-- --------------------------------------------------------

--
-- Table structure for table `redeem_requests`
--

CREATE TABLE `redeem_requests` (
  `id` int(55) NOT NULL,
  `user_id` int(55) DEFAULT NULL,
  `request_id` varchar(55) DEFAULT NULL,
  `coin_amount` int(55) DEFAULT NULL,
  `payment_gateway` varchar(255) DEFAULT NULL,
  `account_details` text DEFAULT NULL,
  `amount_paid` varchar(255) DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0 = pending 1=completed',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_by` int(11) NOT NULL,
  `reason` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sexual_orientations`
--

CREATE TABLE `sexual_orientations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sexual_orientations`
--

INSERT INTO `sexual_orientations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Hetero', '2023-08-16 10:09:06', '2023-08-15 18:30:00'),
(2, 'Gay', '2023-08-15 18:30:00', '2023-08-16 10:09:26'),
(3, 'Bisexual', '2023-08-16 10:10:54', '2023-08-16 10:11:36'),
(4, 'Asexual', '2023-08-15 18:30:00', '2023-08-15 18:30:00'),
(5, 'Demisexual', '0000-00-00 00:00:00', '2023-08-15 18:30:00'),
(6, 'Pansexual', '2023-08-15 18:30:00', '0000-00-00 00:00:00'),
(7, 'Queer', '2023-08-16 10:11:16', '2023-08-16 10:12:05'),
(8, 'Uncertain', '2023-08-15 18:30:00', '2023-08-15 18:30:00'),
(10, 'Omnisexual', '2023-08-22 18:30:00', '2023-08-15 18:30:00'),
(11, 'Lesbian', '2023-11-02 11:31:37', '2023-11-02 11:31:40'),
(13, 'Aromantic', '2023-11-08 10:32:24', '2023-11-08 10:32:27');

-- --------------------------------------------------------

--
-- Table structure for table `sexual_orientations_translations`
--

CREATE TABLE `sexual_orientations_translations` (
  `lang_code` varchar(191) NOT NULL,
  `sexual_orientations_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sexual_orientations_translations`
--

INSERT INTO `sexual_orientations_translations` (`lang_code`, `sexual_orientations_id`, `name`) VALUES
('fr', 1, 'hétéro'),
('fr', 2, 'Gays'),
('fr', 3, 'Bisexuel'),
('fr', 4, 'Asexué'),
('fr', 5, 'Demisexuel'),
('fr', 6, 'Pansexuel'),
('fr', 7, 'pédé'),
('fr', 8, 'Incertain'),
('fr', 9, 'Un romantique'),
('fr', 10, 'Omnisexuel'),
('it', 1, 'Etero'),
('it', 2, 'Gay'),
('it', 3, 'Bisessuale'),
('it', 4, 'Asessuale'),
('it', 5, 'Demisessuale'),
('it', 6, 'Pansessuale'),
('it', 7, 'queer'),
('it', 8, 'Incerto'),
('it', 9, 'Un romantico'),
('it', 10, 'Omnisessuale'),
('de', 1, 'Hetero'),
('de', 2, 'Gay'),
('de', 3, 'Bisexual'),
('de', 4, 'Asexual'),
('de', 5, 'Demisexual'),
('de', 6, 'Pansexual'),
('de', 7, 'Queer'),
('de', 8, 'Uncertain'),
('de', 9, 'Aromantic'),
('de', 10, 'Omnisexual'),
('es', 1, 'hetero'),
('es', 2, 'Homosexuales'),
('es', 3, 'Bisexual'),
('es', 4, 'Asexual'),
('es', 5, 'demisexual'),
('es', 6, 'pansexual'),
('es', 7, 'queer'),
('es', 8, 'Incierto'),
('es', 9, 'Un romántico'),
('es', 10, 'omnisexual'),
('it', 11, 'Lesbica'),
('it', 12, 'Aromantico'),
('it', 13, 'Aromantico');

-- --------------------------------------------------------

--
-- Table structure for table `stripe_customers`
--

CREATE TABLE `stripe_customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `model_id` int(11) NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `swipe_counts`
--

CREATE TABLE `swipe_counts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `swipe_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `swipe_counts`
--

INSERT INTO `swipe_counts` (`id`, `user_id`, `swipe_count`, `created_at`, `updated_at`) VALUES
(3, 5, 3, '2023-07-08 10:50:12', '2023-07-08 10:54:54'),
(6, 14, 0, '2023-07-10 05:30:06', '2023-07-10 05:30:29'),
(10, 17, 14, '2023-07-12 13:43:47', '2023-07-12 13:43:47'),
(15, 20, 0, '2023-07-14 06:56:13', '2023-07-14 06:56:27'),
(16, 19, 14, '2023-07-14 08:46:53', '2023-07-14 08:46:53'),
(19, 23, 13, '2023-07-18 23:00:51', '2023-07-18 23:01:30'),
(20, 18, 14, '2023-07-19 11:35:17', '2023-07-19 11:35:17'),
(24, 33, 12, '2023-07-20 07:24:03', '2023-07-20 07:24:31'),
(25, 7, 0, '2023-07-21 12:19:42', '2023-07-21 12:19:58'),
(26, 53, 6, '2023-07-21 19:35:00', '2023-07-21 22:07:39'),
(28, 55, 0, '2023-07-24 18:02:30', '2023-07-24 18:07:10'),
(30, 58, 14, '2023-07-25 02:26:22', '2023-07-25 02:26:22'),
(31, 10, 4, '2023-07-26 05:33:35', '2023-07-26 05:54:20'),
(34, 62, 7, '2023-07-27 12:52:14', '2023-07-27 13:11:02'),
(35, 65, 5, '2023-07-27 18:19:30', '2023-07-27 18:22:09'),
(36, 66, 13, '2023-07-27 19:58:16', '2023-07-27 20:00:17'),
(38, 73, 10, '2023-07-29 16:08:06', '2023-07-29 16:08:44'),
(39, 75, 13, '2023-07-29 18:08:51', '2023-07-29 18:09:14'),
(40, 76, 9, '2023-07-29 19:09:23', '2023-07-29 19:18:38'),
(42, 79, 4, '2023-07-29 23:40:26', '2023-07-29 23:50:35'),
(45, 83, 14, '2023-07-30 20:45:20', '2023-07-30 20:45:20'),
(46, 81, 14, '2023-07-31 10:13:52', '2023-07-31 10:13:52'),
(48, 85, 14, '2023-07-31 21:33:11', '2023-07-31 21:33:11'),
(49, 89, 13, '2023-08-01 07:56:33', '2023-08-01 07:56:34'),
(50, 90, 12, '2023-08-01 09:13:43', '2023-08-01 09:16:06'),
(52, 94, 13, '2023-08-02 01:49:24', '2023-08-02 01:49:25'),
(53, 1, 10, '2023-08-02 11:47:11', '2023-08-02 12:00:00'),
(54, 99, 11, '2023-08-04 02:05:52', '2023-08-04 02:06:25'),
(55, 100, 14, '2023-08-04 02:34:14', '2023-08-04 02:34:14'),
(56, 101, 0, '2023-08-04 07:13:01', '2023-08-04 07:14:27'),
(57, 80, 13, '2023-08-04 14:52:32', '2023-08-04 14:52:35'),
(59, 105, 14, '2023-08-04 23:01:43', '2023-08-04 23:01:43'),
(60, 93, 14, '2023-08-05 06:13:11', '2023-08-05 06:13:11'),
(62, 112, 0, '2023-08-05 20:15:25', '2023-08-05 20:15:55'),
(63, 57, 14, '2023-08-06 01:26:14', '2023-08-06 01:26:14'),
(64, 116, 13, '2023-08-06 04:18:41', '2023-08-06 07:12:04'),
(65, 3, 11, '2023-08-07 08:15:20', '2023-08-07 08:15:29'),
(66, 123, 2, '2023-08-07 14:51:04', '2023-08-07 14:52:38'),
(67, 128, 14, '2023-08-08 08:56:35', '2023-08-08 08:56:35'),
(68, 87, 2, '2023-08-08 16:02:15', '2023-08-08 16:02:32'),
(69, 130, 13, '2023-08-08 16:51:05', '2023-08-08 16:51:20'),
(70, 111, 13, '2023-08-08 19:25:30', '2023-08-08 19:25:33'),
(71, 135, 9, '2023-08-08 22:17:29', '2023-08-08 22:17:54'),
(72, 134, 14, '2023-08-08 22:21:06', '2023-08-08 22:21:06'),
(73, 138, 14, '2023-08-09 18:05:08', '2023-08-09 18:05:08'),
(74, 141, 13, '2023-08-10 06:21:42', '2023-08-10 06:24:46'),
(75, 104, 8, '2023-08-10 09:35:02', '2023-08-10 09:36:26'),
(76, 146, 14, '2023-08-10 19:36:29', '2023-08-10 19:36:29'),
(77, 152, 8, '2023-08-11 21:52:29', '2023-08-11 22:32:00'),
(78, 153, 10, '2023-08-12 07:45:15', '2023-08-12 07:45:38'),
(79, 159, 4, '2023-08-12 18:44:20', '2023-08-12 18:46:17'),
(80, 163, 14, '2023-08-13 06:37:01', '2023-08-13 06:37:01'),
(81, 164, 3, '2023-08-13 08:06:31', '2023-08-13 08:07:48'),
(82, 168, 9, '2023-08-13 21:21:54', '2023-08-13 21:22:14'),
(83, 169, 12, '2023-08-13 22:40:08', '2023-08-13 22:40:37'),
(84, 173, 10, '2023-08-14 15:41:52', '2023-08-14 15:41:59'),
(85, 174, 7, '2023-08-14 17:17:28', '2023-08-14 17:18:22'),
(86, 4, 12, '2023-08-15 05:35:00', '2023-08-15 05:35:01');

-- --------------------------------------------------------

--
-- Table structure for table `type_of_relationships`
--

CREATE TABLE `type_of_relationships` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type_of_relationships`
--

INSERT INTO `type_of_relationships` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Monogamy', NULL, NULL),
(2, 'Ethical non-monogamy', NULL, NULL),
(3, 'Polyamory', NULL, NULL),
(4, 'Open to exploring', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `type_of_relationships_translations`
--

CREATE TABLE `type_of_relationships_translations` (
  `lang_code` varchar(191) NOT NULL,
  `type_of_relationships_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type_of_relationships_translations`
--

INSERT INTO `type_of_relationships_translations` (`lang_code`, `type_of_relationships_id`, `name`) VALUES
('de', 1, 'Monogamy'),
('de', 2, 'Ethical non-monogamy'),
('de', 3, 'Polyamory'),
('de', 4, 'Open to exploring'),
('de', 1, 'Monogamy'),
('de', 2, 'Ethical non-monogamy'),
('de', 3, 'Polyamory'),
('de', 4, 'Open to exploring'),
('it', 1, 'Monogamia'),
('it', 2, 'Non monogamia etica'),
('it', 3, 'Poliamore'),
('it', 4, 'Relazione Aperta'),
('es', 1, 'Monogamia'),
('es', 2, 'No monogamia ética'),
('es', 3, 'poliamor'),
('es', 4, 'Abierto a explorar'),
('fr', 1, 'Monogamie'),
('fr', 2, 'Non-monogamie éthique'),
('fr', 3, 'Polyamour'),
('fr', 4, 'Ouvert à l\'exploration');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT '+91',
  `mobile_number` varchar(20) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `identity` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL COMMENT '1=male 2=female 3=other',
  `birth_date` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `interests` varchar(255) DEFAULT NULL,
  `sexual_orientation` text DEFAULT NULL,
  `show_me` tinyint(1) NOT NULL DEFAULT 1,
  `likedprofile` mediumtext DEFAULT NULL,
  `savedprofile` mediumtext DEFAULT NULL,
  `instagram` text DEFAULT NULL,
  `is_block` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=no 1=blocked',
  `youtube` text DEFAULT NULL,
  `facebook` text DEFAULT NULL,
  `live` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `about` text DEFAULT NULL,
  `login_type` int(11) DEFAULT NULL,
  `device_token` text DEFAULT NULL,
  `blocked_users` text DEFAULT NULL,
  `wallet` int(55) NOT NULL DEFAULT 0,
  `total_collected` int(55) NOT NULL DEFAULT 0,
  `total_streams` int(55) NOT NULL DEFAULT 0,
  `device_type` int(11) DEFAULT NULL,
  `is_notification` int(1) NOT NULL DEFAULT 1 COMMENT '1=yes 0=no',
  `is_verified` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=no 1=pending 2=verified',
  `photo_option` tinyint(1) NOT NULL DEFAULT 0,
  `show_on_map` int(1) NOT NULL DEFAULT 1,
  `anonymous` int(1) NOT NULL DEFAULT 0,
  `is_video_call` int(1) NOT NULL DEFAULT 1,
  `can_go_live` int(1) NOT NULL DEFAULT 0 COMMENT '0=no 1=pending 2=yes',
  `is_live_now` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=no 1=yes',
  `is_fake` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=no 1=yes',
  `referral_code` varchar(255) DEFAULT NULL,
  `reference_by` int(11) DEFAULT NULL,
  `attribute` text DEFAULT NULL,
  `language_know` text DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `city_live` varchar(255) DEFAULT NULL,
  `show_age` tinyint(1) NOT NULL DEFAULT 0,
  `show_distance` tinyint(1) NOT NULL DEFAULT 0,
  `i_am_looking` text DEFAULT NULL,
  `show_gender` tinyint(1) NOT NULL DEFAULT 0,
  `show_sexual_orientation` tinyint(1) NOT NULL DEFAULT 0,
  `type_of_relation` text DEFAULT NULL,
  `boost_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `country_code`, `mobile_number`, `user_name`, `email`, `identity`, `password`, `gender`, `birth_date`, `age`, `interests`, `sexual_orientation`, `show_me`, `likedprofile`, `savedprofile`, `instagram`, `is_block`, `youtube`, `facebook`, `live`, `bio`, `about`, `login_type`, `device_token`, `blocked_users`, `wallet`, `total_collected`, `total_streams`, `device_type`, `is_notification`, `is_verified`, `photo_option`, `show_on_map`, `anonymous`, `is_video_call`, `can_go_live`, `is_live_now`, `is_fake`, `referral_code`, `reference_by`, `attribute`, `language_know`, `job_title`, `school`, `city_live`, `show_age`, `show_distance`, `i_am_looking`, `show_gender`, `show_sexual_orientation`, `type_of_relation`, `boost_time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Italo', 'Melo', '+91', '9988776655', 'Italo77799940', 'gautam.codezee@gmail.com', 'GldHXnH0bxLn', '$2y$10$nGIiqkFW57nJa8CG4VoxveXd/gwOUb.Zp/IWHMuoeTFuQxJwFHWuC', 1, '2005-09-10', 25, '[15,16,17,18,52]', '[1,2,3,6,10]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'I AM GAUtamN IISAJ NNSSGgh HDHDs ss', 1, 'dkG54ixDSPeBYuCVRH5JLA:APA91bEVU3bzaBsNOuJLIj6wdRc4KMQHP9TTYpAYhEOFywHaFPs-d8w0bvnJ2ZElgyrAlKJq5GFYdbLCINz_Ae8to6s_U5zxh1zN5RoKi_fGy-bI2om3Kjz_-GN6E_2mksCUljY5mR7C', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[4,15,23,28,47,50,57,67,75,80,85,92,97]', '[2,3,4]', 'Flutter Developer', 'Shri V B Shah', 'suratt', 1, 1, '1', 0, 0, '2', '2023-12-06 10:23:34', '2023-11-08 09:20:21', '2023-12-22 07:26:24', NULL),
(2, 'Horacio', 'Rojas', '+91', '9876543210', 'Horacio56498512', NULL, 'QbipQnffES6i', '$2y$10$m.P6GZNZhKoFMRy9rv2lPeWpzMwtJ8f5VJgznjdyvRVMK6OFGzNXC', 1, '1997-02-11', 25, '[1,4,7,10,13]', '[1,4,7]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'Good morning 🌞', 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, '[3,16,24,28,44,50,56,67,76,82,86,93,98]', '[1,2,3]', 'Ios developer', NULL, NULL, 0, 0, '4', 0, 0, '2', NULL, '2023-11-08 09:42:23', '2023-11-08 09:45:21', NULL),
(3, 'Brett', 'Sayles', '+91', '9998979695', 'Brett74510202', NULL, 'iyKgiuzyq4a5', '$2y$10$p8mk4wLy81RLSiR0GZD5..1eGseqz.hTBhZ/LxHKgFo7UACi4O5Jq', 1, '1998-07-09', 26, '[1,4,7,10,13]', '[1,2,3]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[7,16,23,28,43,52,58,68,76,80,85,93,98]', '[1,2,5]', 'Business', NULL, NULL, 1, 0, '2', 0, 0, '4', NULL, '2023-11-08 09:47:35', '2023-11-08 09:50:18', NULL),
(4, 'Bruno', 'Salvador', '+91', '9080706050', 'Bruno36375111', 'sankets.codezee@gmail.com', 'aZZi6dQVxgzZ', '$2y$10$XyUfw0/76C0Q9KVvGFdfTuhxUg4qFRGeB9vWukQ9jNPSVJ3o/a2Ie', 1, '1999-01-10', 27, '[1,4,7,10,11]', '[1,4,7]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'c98u0RuUR1G632VU-T-5UO:APA91bFwCPsTU13aB0vW3tCo6y9ONdnJXOxi_t4xAaIpDtPehDCBONChOzbOQqJVE6DKmuJhrC1H0043AVf8LnJQRsJ7tbDIvvlFkfy0Hgfvneb4-khJPaFAMezLhl94Igi87-2OhNGu', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[4,16,23,27,43,50,57,69,75,80,85,93,97]', '[1,2,5]', 'Diamond', NULL, 'kokata', 0, 1, '2', 0, 0, '1', NULL, '2023-11-08 09:53:37', '2023-12-22 09:10:24', NULL),
(5, 'Simon', 'Robben', '+91', '9192939495', 'Simon94772119', NULL, 'URxeWRjWyEKU', '$2y$10$LoFmp.6Vcf5401613IS2peZM47g7fRevWz0Ld4mhkjefhHMWOWYFK', 1, '1994-01-05', 27, '[1,8,13,20,22]', '[1,4,7]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[11,16,23,29,44,50,56,68,76,82,85]', '[2,4,5]', 'Photographer', NULL, NULL, 0, 0, '5', 0, 0, '3', NULL, '2023-11-08 10:01:10', '2023-11-08 10:02:38', NULL),
(6, 'Ayo', 'Ogunseinde', '+91', '8182838485', 'Ayo13323013', NULL, 'vrhsJZpIHXtp', '$2y$10$MvDdz54utPWX/Ikg7Xo5TOLUGIPEGlsPysggpLc2mpXGWoVKhwxy2', 2, '1999-06-01', 28, '[4,8,11,14,17]', '[3,7,11]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[3,15,27,44,51,59,68,78,81,85,93,97]', '[5,3,2]', 'Model', NULL, NULL, 1, 0, '1', 0, 0, '1', NULL, '2023-11-08 10:07:49', '2023-11-08 10:10:15', NULL),
(7, 'Brain', 'Lawson', '+91', '9090909090', 'Brain66636382', NULL, 'pJ3j2MrhQY8p', '$2y$10$Mq7zGbXQ7lEmvlQ3GuSiNua2WBvLo9w6o1awiD/WfeeIbuXcnDf6y', 2, '1992-11-11', 29, '[8,11,14,17,20]', '[7,8,11]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[3,16,23,31,44,51,56,68,76,82,92]', '[2,4,5]', 'Food Vendor', NULL, NULL, 0, 0, '2', 0, 0, '1', NULL, '2023-11-08 10:15:19', '2023-11-08 10:17:14', NULL),
(8, 'Matheus', 'Ferrero', '+91', '8800880088', 'Matheus89031666', NULL, 'gOjDP7EJfKye', '$2y$10$iJDWZU10A/ysBhRil6QGMuDpvmw6Yy6t8v1Qg9Zis/DgBxP1l0CNu', 2, '2005-01-01', 30, '[14,16,17,19,20]', '[1,4,7]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'Hii I am flutter Developer', 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, '[4,16,23,80,85,96]', '[4,5]', 'Software developer', 'Surat', 'London', 1, 1, '6', 1, 1, '3', NULL, '2023-11-08 10:20:17', '2023-11-08 10:22:55', NULL),
(9, 'Peyman', 'Farmani', '+91', '9696969696', 'Peyman26376289', NULL, 'Jpz8O0Oj0lnC', '$2y$10$UO/Ly//JXDMPyanBAk.FcOSyMOcBvoAtEJ9Z69.yhGTwv7XyA7q6K', 2, '1995-09-11', 31, '[8,10,13,7,9]', '[5,8,10]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[4,46,60,67]', '[1,2]', NULL, NULL, NULL, 1, 0, '1', 0, 1, '2', NULL, '2023-11-08 10:26:51', '2023-11-08 10:28:20', NULL),
(10, 'Fineas', 'Garve', '+91', '8070605040', 'Fineas73875732', 'pratikf.codezee@gmil.com', 'ElX3YoE9kWoE', '$2y$10$1SOqX1pp.gjxtGBw0hOW5e.OQM0.DpzeHxqyBHA6.3tRQoNj37.cO', 2, '2000-05-11', 32, '[1,5,7,11,13]', '[7,8,11,13]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'Hello', 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[4,22,44,50,63,75,85,97]', '[]', NULL, NULL, NULL, 1, 0, '6', 0, 1, '2', NULL, '2023-11-08 10:31:50', '2023-11-08 21:24:45', NULL),
(11, 'Athena', NULL, '+91', '9595959595', 'Athena35362488', NULL, 'i0qiRNIl8DJQ', '$2y$10$/0rwF93EQyFmhGTJa.N7W.Y9mXQEW0ld74A/qP7NwL97PA.SNDuBO', 2, '2005-01-01', NULL, '[1]', '[11]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'c72Hz9QYIkbCnQ93jioSt9:APA91bGngx_1pmDmKNgQRx7oIHTHx3-TD9kleQR-Uz4egiygElEj-HDQzBcNrZH0mKatkDS_Gc1kiiXLd-42sQ0RrC552ojCMAsOhh1OsKnE4u0QWHk5oC04VhENx8gWmIRF_HOo4T2f', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[]', '[]', NULL, NULL, NULL, 0, 0, '0', 0, 0, '0', NULL, '2023-11-09 09:03:10', '2023-12-08 05:28:42', NULL),
(12, 'Bhavik', NULL, '+91', '982487170', 'Bhavik27115623', NULL, 'bwD7V6YdEneV', '$2y$10$2kjDauPowOLuG2yr2lUC.eUzHg9qhDcy5e/7mwe4nELXqcvuY8yYi', 1, '2005-01-01', NULL, '[1,6,8,11]', '[1,2,3]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[]', '[1]', NULL, NULL, NULL, 0, 0, '0', 0, 0, '0', NULL, '2023-11-09 11:28:36', '2023-11-09 11:32:49', NULL),
(13, 'Dghk', NULL, '+91', '3496587981', 'Dghk62532802', NULL, 'IQ4zZt5ZV7NU', '$2y$10$xue5EX.2EN.XLk86Zn0.kuEakSm9XurLTeiAYyDlWtnbMrJExOpci', 3, '2005-01-01', NULL, '[4,5,8,9]', '[1]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'va bene cosi', 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[]', '[]', NULL, NULL, NULL, 0, 0, '0', 0, 0, '0', NULL, '2023-11-09 11:53:59', '2023-12-01 10:56:20', NULL),
(14, 'Leo', NULL, '+91', '9989978788', 'Leo70689155', 'urmin.codezee@gmail.com', 'EQLLQ8ugxry8', '$2y$10$VclYqrfbZc1PtUyILI2GOOAFMOY7PZijyJTUqLQyzuHe0dNGmyoee', 1, '1995-05-01', NULL, '[4,1,2,7]', '[1,4]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-11-10 04:18:49', '2023-11-10 04:35:44', NULL),
(15, 'Sed', 'Mok', '+91', '3214565698', 'Sed80932347', NULL, 'EpdXVJUvhK24', '$2y$10$1ysCzdjrdVKc9hbR.JipPezvPmVlRgJdl6NOp3lSsDHev5QhiRKEi', 1, '2005-01-01', NULL, '[1]', '[1]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-11-10 04:23:49', '2023-11-10 04:23:49', NULL),
(16, 'Wise', 'Distal', '+91', '9554288559', 'Wise90524885', NULL, '0iJo6kTnm9SK', '$2y$10$jn.vuXU6pjSxIXs4g2FJEuMJE9g7/s4uZ/kZhxTzCRJbAkeGwc2C6', 1, '2004-11-08', NULL, '[1]', '[1]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-11-10 04:31:40', '2023-11-10 04:31:40', NULL),
(17, 'Agj', 'Set', '+91', '995511773', 'Agj48528574', NULL, 'orxF4aoXhA3T', '$2y$10$a8Ghxns1Dc3xWc3jNqqXg.8gRwdYs0.yZhyzMTIyf13j61w6fLm.C', 1, '2005-01-01', NULL, '[1]', '[1]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-11-10 04:33:16', '2023-11-10 04:33:16', NULL),
(18, 'Test', NULL, '+91', '9925577255', 'Test61749168', NULL, 'iBGx7MbtZjT9', '$2y$10$7s5a.HRuKu4qDH8vvGIih.1AmYVJPC0TxG7W8ncfJ83UDgEpcxJJ6', 1, '2005-01-01', NULL, '[10]', '[1,11]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-11-10 05:22:51', '2023-11-10 05:22:51', NULL),
(19, 'Karma', NULL, '+91', '6352417890', 'Karma46021510', NULL, 'aVZmPtgAkRTg', '$2y$10$HTKweIO79gvrfpIys9tQgu10a/4PK.rRIws6dQaRUvlqAffYEvb1m', 1, '2004-05-10', NULL, '[1]', '[1]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-11-10 06:07:32', '2023-11-10 06:07:32', NULL),
(20, 'Ale', NULL, '+91', '3382246843', 'Ale46601818', NULL, 'E81qtmzgHans', '$2y$10$Q8SR7n3wwCdkq.cRpVV8Zu7GAypRWRShR7c6r9HFzLQ0JHBzKvSZq', 1, '2005-04-12', NULL, '[1,3,5]', '[1]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'sono serio e deciso', 1, 'd7_O684_hEdQujOIlK1ZVH:APA91bHR4Js_IeZA4nuig0sCADEMQNNgQ8xjLxahiGpEEWw_qfoQPj5vL0ZGpJpTn8VCm_nZJh2Nr5ojcsSR24wS6Lb91SbdbAWttFHfx1gHsGW6qmLK-mWVj3uLoZl-v9NWK-Rb1VY9', NULL, 0, 0, 0, NULL, 1, 0, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, '[]', '[]', NULL, NULL, NULL, 0, 0, '0', 0, 0, '0', NULL, '2023-11-10 08:44:51', '2023-12-24 12:57:43', NULL),
(21, 'Alessandro', NULL, '+91', '3524123654', 'Alessandro98016578', NULL, 'kYkZn9zmiXNx', '$2y$10$W8wawML2ixC8iBl3eFtPx.vLWB6prHE83FniG3nmOu1aYOdxcuh4C', 1, '1996-06-01', NULL, '[1,2,3,11,15]', '[1]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'sono una persona seria e tranquilla. 😄😗😝😙🥲😋😐', 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, '[]', '[]', NULL, NULL, 'Vicenza', 0, 0, '0', 0, 0, '0', NULL, '2023-11-13 11:16:19', '2023-11-16 10:29:30', NULL),
(22, 'Marco', 'Niger', '+91', '3405182217', 'Marco30810851', NULL, 'r0Cro0UPDxpJ', '$2y$10$UJl1EfBu0Hx9wBbjRp31COgaW8hxPgy5pSrkXuAYGuRGBL6TC4XTC', 1, '1979-03-09', NULL, '[1,12,9,7,5]', '[1]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'dIkAaEddSxWjZqI4w-OWJK:APA91bEFlScW6sPxfIZ6CpwwWQSJ2cDm5CVyPqZHsBl9z6O97A0m38qesXk_JF0qENsN0dQf-pKiG15yg73f1eKGDcWSmewoPEL-9DiAG0u6mTmVJnc8v818sR1QrmKbbvTfPjlUlaRh', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-11-14 18:37:18', '2023-12-10 11:49:00', NULL),
(23, 'Tito', 'Sera', '+91', '562523256', 'Tito59430861', NULL, 'eujQEofDFtRm', '$2y$10$QY/WwAG.ZB/fx.J1f/T6neql.xGGcgUeuyUXrNNjShwUmeub9Cy.m', 1, '2005-01-01', NULL, '[138,132,128,126]', '[1]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-11-22 17:21:14', '2023-11-22 17:21:14', NULL),
(24, 'Fil', NULL, '+91', '3483216711', 'Fil69114195', NULL, '9OF8Pp0dsphr', '$2y$10$SPVe9tVVDQReceUXckjYQeUWOex/nnioykIxLdKIit2y6UDIaSDl2', 1, '2005-01-01', NULL, '[2]', '[1]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-11-23 11:41:35', '2023-11-23 11:41:35', NULL),
(25, 'Jethalal', 'Gada', '+91', '1234567890', 'Jethalal59032590', NULL, 'zhdCsSHPBTHu', '$2y$10$7MEDgFsdg46.qkoovVk39.H8jymUsSEdOZpsf1rXiJSXNf.dfffIC', 1, '2004-02-11', NULL, '[3,6,10,11,12]', '[1,3]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'I am Jethalal ga', 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[3,16,23,28,46,53,59,69,76,80,85,94,96]', '[2,3]', 'Business man', 'K. D. Ambani School', 'Mumbai', 0, 0, '5', 0, 0, '1', '2023-12-07 04:15:08', '2023-11-24 11:12:05', '2024-01-01 19:49:17', NULL),
(26, 'Facebook', NULL, '+91', '9879879870', 'Facebook66680186', NULL, 'pNc7Phv8EJKG', '$2y$10$q295hFGvBpYMqIUrwwfEEuD39lJG6V5Rpb1ItJONcD6eSJNh0zppu', 1, '2005-01-01', NULL, '[1,2,3,4,5]', '[1]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-11-28 08:52:00', '2023-11-28 08:52:00', NULL),
(27, 'Facebook', NULL, '+91', '9879879879', 'Facebook61575717', NULL, 'cTo9lk0cCAEb', '$2y$10$KIeYGo0mVq2Ec.jB0eTft.T4VYvAkPnW82MIWbewAXs.N1f8s7aZm', 1, '2005-01-01', NULL, '[1,2,3,4,5]', '[1]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-11-28 08:59:55', '2023-11-28 08:59:55', NULL),
(28, 'Cc', NULL, '+91', '123456789', 'Cc47352531', NULL, 'eCJjAQG54Hsz', '$2y$10$VO.etMlZbg3hxp3Z.HZUoObIzEhVTucGv4vcs8MphhAvzlpcynagm', 1, '2005-01-01', NULL, '[1,2]', '[1,4,7]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[4,16,23,27,43,50,58,69,75,80,85,93,97]', '[2,5]', 'job title', NULL, 'kokata', 0, 1, '3', 0, 0, '1', NULL, '2023-11-28 10:39:27', '2023-12-25 19:15:22', NULL),
(29, '1', '11', '+91', '1111111111', '126271874', NULL, 'C8Rr3MWwscHI', '$2y$10$MmUAjfhXN/o8qmjCBNqZV.OKcgVayLV1HKGNniuGN0pFWZRxpiUja', 1, '2004-08-12', NULL, '[1,2]', '[1,2]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[]', '[]', NULL, NULL, NULL, 0, 0, '0', 0, 0, '0', NULL, '2023-11-28 12:06:08', '2023-12-14 12:44:15', NULL),
(30, 'Alex', NULL, '+91', '3256699745', 'Alex44915298', NULL, 'GiHraVLJCyzD', '$2y$10$prLM60UBtuZEyULEcfZyJu1NoIcgk6hVC8jujRwt7g73ADn1eGHOK', 3, '1984-03-01', NULL, '[8,9,10,11,12]', '[1]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-01 11:50:31', '2023-12-01 11:50:31', NULL),
(31, 'Aless', NULL, '+91', '2536987412', 'Aless17672506', NULL, 'Bjvzd7UW2mTP', '$2y$10$0hF4R2CUEcXrdYZG/NmbKeqRGjys0aXMIbp5/PhWKr5BPeYwRnMl2', 1, '1997-05-01', NULL, '[8,9,6,5,3]', '[1]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-01 12:06:16', '2023-12-01 12:06:16', NULL),
(32, 'Alessa', NULL, '+91', '0896523147', 'Alessa49784858', 'a.leox@libero.it', 'jQQNO7pJ6SSD', '$2y$10$V2MEqJeXE/7uArjXnXVz0uDS6WelBuexHQ863rgCEkB.ZuhetTN0m', 1, '1999-02-01', NULL, '[5,9,11,15]', '[1]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'abbastanza fuori di testa...fjfhh..okokok', 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, '[10,18,102,30,43,50,55,69,78,83,90,94,106]', '[2,4,5,6]', 'impiegato', 'itis', 'Vicenza', 0, 0, '1', 0, 0, '1', NULL, '2023-12-01 12:31:30', '2023-12-01 16:12:50', NULL),
(33, 'Hello', 'World', '+91', '0000000000', 'Hello53674889', NULL, 'CJirACfU3jg5', '$2y$10$jp7xvmCsC81pbxpJvtiCCuT1SvA8pcinUznA2bMooitQ/O3j8Ak4a', 1, '2005-01-01', NULL, '[1,2,3]', '[1,2,3]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[]', '[]', NULL, NULL, NULL, 0, 0, '1', 0, 0, '0', NULL, '2023-12-04 08:47:06', '2023-12-04 09:17:49', NULL),
(34, 'io', NULL, '+91', '3428384357', 'io97911234', NULL, 'SLYMMrSfPHdH3bChCP9K5cXwqfg2', '$2y$10$Cs0Ch1c501VNZ/mreEGEPObwqTIiN8e5fNldvN.GvVkgKEfscwvf6', 3, '2005-01-01', NULL, '[1,2,27,49,72]', '[1]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-04 16:42:51', '2023-12-04 16:42:51', NULL),
(35, 'Alex', NULL, '+91', '3625232147', 'Alex40641968', NULL, 'NwG8VPXzEapv', '$2y$10$/wz2DARASoVNxSWywi12dOWlxO7mqnmqmyQRax.FUgZx8tm.aqL5q', 1, '1993-12-01', NULL, '[6,5,2,3,9]', '[1]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-05 08:31:47', '2023-12-05 08:31:47', NULL),
(36, 'Alexx', NULL, '+91', '3256321471', 'Alexx30166811', NULL, 'AUzk8eq2oCXg', '$2y$10$Irk6r4rO1ytPS.4vvvDjBeTZUv2UAnGMVjuiHhXwTv1jZmiNXX5Aq', 1, '1995-12-01', NULL, '[11,14,15,18,20]', '[1]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[]', '[]', 'impiegato', NULL, 'vicenza', 0, 0, '0', 0, 0, '0', NULL, '2023-12-05 08:41:40', '2023-12-05 09:13:48', NULL),
(37, 'Hetro', 'Women', '+91', '8888888888', 'Hetro24247459', NULL, 'SCnyD8vOfe43', '$2y$10$kMMl/zXOOEIkShg.gUAJ0uoHzK/5gLNONP7OQkYNgDFMgzFJLUERa', 2, '2005-01-01', 18, '[1,2,3,4,5]', '[1,3,11]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, '[]', '[]', NULL, NULL, NULL, 0, 0, '0', 0, 0, '0', '2023-12-06 13:00:38', '2023-12-06 10:35:10', '2023-12-20 11:05:26', NULL),
(38, 'Alex', NULL, '+91', '7046984805', 'Alex29964595', NULL, 'ujoapaCNxJOxWUElaLsiv8ewdaJ2', '$2y$10$umGkK40YqFVS3LvaaAfdIuDQTMBZcHkY7x8B9K0AqXHpqxtMW2GYu', 2, '2000-10-01', 23, '[5,6,9,15]', '[3,7]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[]', '[]', 'testt', NULL, NULL, 0, 0, '0', 0, 0, '0', NULL, '2023-12-07 10:50:10', '2023-12-08 05:00:41', NULL),
(39, 'Scomsen', NULL, '+91', '9988998877', 'Scomsen56965606', NULL, 'oKr0nk1Krznv', '$2y$10$63qDIIoUgk.UpxIW.lHWyOEZ5W3X6ZOlHwPlB9Ob.24fkIo3uPz9O', 1, '2005-02-10', 18, '[2,3,4,5]', '[1,2,3,4,5,8,13]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, '[5,15,22]', '[3,4,5,6,8]', NULL, NULL, NULL, 1, 1, '1', 0, 0, '1', NULL, '2023-12-08 05:14:31', '2023-12-20 09:06:16', NULL),
(40, 'Vv', 'Gt', '+91', '147258369', 'Vv25729476', NULL, 'T3F5zhvJ7Ltq', '$2y$10$o6Zb0zgKlEg6MiGX/o.Peev19aSCjxjUDmZS68uPB4Tc5NvwB7YU6', 2, '2004-01-12', 19, '[8]', '[10]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-08 09:01:50', '2023-12-08 09:01:50', NULL),
(41, 'Abc', 'Tyr', '+91', '159357159', 'Abc54882580', NULL, 'bNH6gBHr7Oeq', '$2y$10$ZzYHFApli7mBmed9vDiwJeAntAJkfRDAvy8HudQOcvJb.Uw1daZg2', 2, '2004-03-12', 19, '[6]', '[10]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, '[]', '[]', NULL, NULL, NULL, 0, 0, '0', 0, 0, '0', NULL, '2023-12-08 09:33:28', '2023-12-14 08:41:29', NULL),
(42, 'Roberto', 'Rossi', '+91', '2367295024', 'Roberto46874749', NULL, 'UdhFd48wZ9ry', '$2y$10$nduxgSVT2olKqZZvJ.mNe.Ed7NoHeddl4iEMR8JSk0ZZcbGdQ99QK', 1, '1996-12-01', 27, '[2,5,14,18,101]', '[1]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'c_vX3dZMSGaNiU5hkqMmBY:APA91bFRxRUCG-2tFXeLKzobzHvVA73tSzYXPc2Wr8wEOMixK9geBd0SuSCzGS_sKZWWDQUFdvdzG_-zaArrttZUe1cdOqxnTFAp5Xzxg7mWDntezADkg2fevw8F8Get9cDy0xOOAVfr', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-10 13:39:56', '2023-12-10 13:39:56', NULL),
(43, 'Leila', 'Rossi', '+91', '346983569', 'Leila31704259', NULL, 'V1vMEQtOTC0j', '$2y$10$HeLgZm//k2NOWHKFyfXRZeZopbFxn8GJ719aeOznPzlnOkcwM8kNy', 2, '2000-10-02', 23, '[1,2,17,27,49]', '[1]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'ezzudy3bTXW6EC-e4sLtxk:APA91bFpsAsrxo4DOr4gSrTvhZHn1GUgm4N6Jr_xWpGEugAJ3pq8MeY4IGdIIOKAfjEzy1RvSpaRuF0yo2zDtQmN9y8ypxaVSGXqFZ7NtszI5BKatb-N4G_bJJQiFePJjU-a4q2ui1c_', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-10 14:26:57', '2023-12-10 14:26:57', NULL),
(44, 'Enea', 'Maestri', '+91', '649568344', 'Enea79629494', NULL, 'WR32bO3nrPMB', '$2y$10$j3hIepBuhg1nY.JXz1L3d.LzZLfe3m6DJ3zkiwakT2JaC/JLfNixq', 1, '1996-12-03', 27, '[5,14,16,31,27]', '[1]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'ezzudy3bTXW6EC-e4sLtxk:APA91bFpsAsrxo4DOr4gSrTvhZHn1GUgm4N6Jr_xWpGEugAJ3pq8MeY4IGdIIOKAfjEzy1RvSpaRuF0yo2zDtQmN9y8ypxaVSGXqFZ7NtszI5BKatb-N4G_bJJQiFePJjU-a4q2ui1c_', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-10 14:47:56', '2023-12-10 14:47:56', NULL),
(45, 'Gustavo', 'P.', '+91', '664169987', 'Gustavo51403043', NULL, '0NN86NVHlL3l', '$2y$10$zPnb6kdJ5CNR0Ai2tuLaK.ZFWtFE/l2GPh9plGfsQ5h3RguBgBzwK', 1, '1990-04-04', 33, '[13,32,27,36,62]', '[1]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'ezzudy3bTXW6EC-e4sLtxk:APA91bFpsAsrxo4DOr4gSrTvhZHn1GUgm4N6Jr_xWpGEugAJ3pq8MeY4IGdIIOKAfjEzy1RvSpaRuF0yo2zDtQmN9y8ypxaVSGXqFZ7NtszI5BKatb-N4G_bJJQiFePJjU-a4q2ui1c_', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-10 14:54:08', '2023-12-10 14:54:08', NULL),
(46, 'Emanuel', 'G.', '+91', '646284967', 'Emanuel69014339', NULL, 'V6qri3KrMfoo', '$2y$10$y2oc42PfbN9pZ/1k5gvT7.KkrCR.IWOzKlOxT2TlGdVJBBaarxJzq', 1, '1980-01-01', 43, '[1,2,16,49,9]', '[1]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'ezzudy3bTXW6EC-e4sLtxk:APA91bFpsAsrxo4DOr4gSrTvhZHn1GUgm4N6Jr_xWpGEugAJ3pq8MeY4IGdIIOKAfjEzy1RvSpaRuF0yo2zDtQmN9y8ypxaVSGXqFZ7NtszI5BKatb-N4G_bJJQiFePJjU-a4q2ui1c_', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-10 14:58:08', '2023-12-10 14:58:08', NULL),
(47, 'Christian', 'W.', '+91', '654793476', 'Christian27378036', NULL, 'hBQnVtlGPIgn', '$2y$10$sbaaypuLJjv63DmU4cnVq.vwSspR2uqc//72QbOnsfcMmx245pJGq', 1, '1993-11-07', 30, '[1,2,13,16,49]', '[1]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'ezzudy3bTXW6EC-e4sLtxk:APA91bFpsAsrxo4DOr4gSrTvhZHn1GUgm4N6Jr_xWpGEugAJ3pq8MeY4IGdIIOKAfjEzy1RvSpaRuF0yo2zDtQmN9y8ypxaVSGXqFZ7NtszI5BKatb-N4G_bJJQiFePJjU-a4q2ui1c_', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-10 15:01:35', '2023-12-10 15:01:35', NULL),
(48, 'Emanuela', 'F.', '+91', '688967966', 'Emanuela92811184', NULL, 'brKEwYytvAbO', '$2y$10$Rcl.g9/OFsi0Lr2nj2Zgq.fWgg0HfusmAZ65cHXfoERpetYKqIiae', 2, '1999-12-03', 24, '[1,2,49,16,69]', '[1]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'ezzudy3bTXW6EC-e4sLtxk:APA91bFpsAsrxo4DOr4gSrTvhZHn1GUgm4N6Jr_xWpGEugAJ3pq8MeY4IGdIIOKAfjEzy1RvSpaRuF0yo2zDtQmN9y8ypxaVSGXqFZ7NtszI5BKatb-N4G_bJJQiFePJjU-a4q2ui1c_', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-10 15:09:09', '2023-12-10 15:09:09', NULL),
(49, 'Simona', 'De Vita', '+91', '6542876657', 'Simona89369046', NULL, 'TKUEOeFBB6c8', '$2y$10$Mv4HbE0dEO8KF4XabuTlneLt76uJNqbH5Q.u4fwbRG07UK6C1hIte', 2, '1991-04-09', 32, '[1,2,7,16,49]', '[1]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'ezzudy3bTXW6EC-e4sLtxk:APA91bFpsAsrxo4DOr4gSrTvhZHn1GUgm4N6Jr_xWpGEugAJ3pq8MeY4IGdIIOKAfjEzy1RvSpaRuF0yo2zDtQmN9y8ypxaVSGXqFZ7NtszI5BKatb-N4G_bJJQiFePJjU-a4q2ui1c_', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-10 15:13:49', '2023-12-10 15:13:49', NULL),
(50, 'Alex', NULL, '+91', '3625874123', 'Alex98095004', 'info@tymer.it', 'J92tZ3q86LVK', '$2y$10$l7nrxWgic1SGCq1uP6ezWev.3rQRF7oLi08QpRwI3Lt8z.lWblIX2', 1, '1993-05-01', 30, '[5,7,8,14,15]', '[1]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'persona seria e affidabile.😀😄      😁😅😂xxxxghuikgg hu', 1, 'dzinkRX_Qy69e2cdw4oTZC:APA91bECQZEREnIPvoKMIMpSD2DjIIGgOMYSdh951er_ya_mdsz9hLVqwQnZ3LkTeYw40SpomXjWbJk_0RFQvvbeDMl_clqWKeaMp3uQncBbeS71tD3TOPvvRRIa1HEhtgHfL5CQuzVk', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[10,18,23,30,43,50,55,69,104,83,90,94,96]', '[2,6]', 'product', 'itis', 'Vicenza', 0, 0, '4', 0, 0, '1', NULL, '2023-12-11 08:22:39', '2023-12-11 10:10:33', NULL),
(51, 'A', NULL, '+91', '123457648', 'A92003370', NULL, '8zRYWzFIvhBK', '$2y$10$R6/jN68q8AJMv.MC/bpqcO8VBVQo6eaSuWQeocGTDyFdyxcLdEIa2', 1, '2005-01-01', 18, '[3,1,12,10,11]', '[1]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'fyuYVElnM0aihCwFUx637-:APA91bEtYyqzJ19UDkuulVtszp6_1-kw6-EnoECYoUx4SJU6ps8QYhA-j8_mDT_Br_12pDoAYx7cih0McvX3LQoFP6JTPeJ6zBWqDgqaJWH5_Q9Y6CTjIVj51lkZ-0KacNvTLj_hipT6', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-13 08:49:27', '2023-12-13 08:49:27', NULL),
(52, 'Viva', NULL, '+91', '1010101010', 'Viva58915320', NULL, '43iPjo2rfsrg', '$2y$10$mJNaaZ8.gl38xt5FLzrZ8exn6.mQgYIq41.tfgrGn1jJpDpiBjx0q', 1, '2004-04-08', 19, '[1,4,2,5,3]', '[1]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-14 06:50:15', '2024-01-04 17:55:34', NULL),
(53, 'Himanshu', 'Patel', '+91', '5555555555', 'Himanshu57396404', NULL, 'pP3cqcDLsLdn', '$2y$10$B3w6y4P02ZGwRODi.yp9ZeFrF2qyfEEUHKnODLICS2.bxzdokSv.m', 2, '2005-01-01', 18, '[2,4,5,6,3]', '[5,6,11,7,13,10,7,5,6,4,3,1,3,4,5,6,3,1,2,3,4,1,2,1,2,3,4,5,6,7,4,3,2,1,1,2,3,4,5,6,7,8,5,4,3]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-14 07:11:07', '2023-12-14 07:11:07', NULL),
(54, 'Yashraj', 'Muskaan', '+91', '9999999999', 'Yashraj84917314', NULL, 'xMjCjT85Yly3', '$2y$10$UKKmoucOjUzpP4bF9PUeye0h333YeRs0z/m.rsWotNoGQ4ktMSene', 1, '1992-11-11', 31, '[1,2]', '[1]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, '[9,17,25,29,46,54,58,96]', '[3,4,5]', 'test', 'test', 'test', 1, 1, '0', 1, 0, '0', NULL, '2023-12-18 07:17:44', '2023-12-27 14:09:33', NULL),
(55, 'Aloha', 'Prachi', '+91', '7777777777', 'Aloha51058179', 'bhavik.codezee@gmail.com', 'p1ps2a85YP88', '$2y$10$0lTdOMkKZTcoC..djk6jC.DSbr5v8rwPmDW6qCQx/S3pXOGjZlaSq', 2, '1997-02-10', 26, '[1,12,14,16,17]', '[2,13]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, '[19]', '[2,4,5,6]', NULL, NULL, NULL, 0, 0, '0', 1, 1, '2', NULL, '2023-12-18 07:27:57', '2023-12-27 14:31:08', NULL),
(56, 'Clusiv', NULL, '+91', '9904032950', 'Clusiv51393004', NULL, 'xmoVMetI1ZSZ', '$2y$10$bULGwgouqDsjVeOFkd9WaeoiZq0PxVqMd/7wPFPy97HOTYRgp35k.', 2, '1991-07-01', 32, '[2,4,1,11,14]', '[3,5,8]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'ck3HewjjQcOuJtlQBgAgkz:APA91bGU9Ao6H2PrBmblzebOrpSdZpFaYoZvPNbLHkNUwfEqslNR1RrWny5YI6P8PTCPaOEjEmYCzgWqmsdDI4aLo9RwoQ9WE_wRJvjZhy4PXPy8sPydIYvH_DwpSee7RTPwDy6n-d8I', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, '2023-12-25 07:14:56', '2023-12-19 10:42:05', '2023-12-25 06:44:56', NULL),
(57, 'A', NULL, '+91', '1245784854', 'A52856875', NULL, 'UpnIo8HTbroi', '$2y$10$3lag2VsLyOtzyxcKtCGRVuoprfzFg6R0E8.9g3noBltEe/J5MpCXa', 1, '2005-01-01', 18, '[12,9,7,14]', '[7,8]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'f-015hcG90JPrlRXdYhAtg:APA91bHDUNe8oimAg3DFuXHzX95o_JqJuDTcMJPHMKiNjTo9PiDUTGOrCofT0wxdQWiup4mkT9g3vHiXT22fc0eLoC5gQ6Nq2m71xyZ6Yt38-OC8nSZSbMYwOahAcVDyJqhJOg35GoNL', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-19 11:15:13', '2023-12-19 11:15:13', NULL),
(58, 'Aless', 'DD', '+39', '7989798979', 'Aless90545782', 'aless@gmail.com', 'BKJVv3Fcef1C', '$2y$10$iIpkR6P/G.CcwluV2s.XxeN7nmzHe4Na44WqEID64vUW2lq0ZZ8Oe', 1, '2000-06-21', 23, NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-20 04:59:24', '2023-12-20 04:59:24', NULL),
(59, 'Diego', NULL, '+91', '3454331225', 'Diego19235873', NULL, 'Dv4S8KtqBsbtTpx1Wv0SAai21gq2', '$2y$10$g5xiGoeRphjQ8uAPZC6WL.tAUm4XQxJw3P1EtYY/j330vVsC/i0.W', 1, '1998-12-07', 25, '[49,64,96,135,112]', '[1]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 5, 'e97Fz2PbWkrmkLUDilJm6m:APA91bGlEl0QIVdIA3asaFxjXEeEXMF3sFt4wPm0FL2pm_wmnZ-_EY6c45m_DT_xRb2-NO7jUPI5NdF3-CaJC1XJyF4T9IN7iccXzzPnlYijb7B47XtapZCw6TwqOLZ1ltHTfixDDIzL', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2023-12-21 10:52:03', '2023-12-21 10:52:03', NULL),
(60, 'Vdsbs', 'Hdjd', '+91', '4646595956', 'Vdsbs49790122', NULL, '5bCaeHMwQIiz', '$2y$10$eTOyKhzGOX9rprMl5DeFruK2uzTIcZReLTmKHNfX9SFjY6jRo3OoC', 1, '2000-01-01', 23, '[7,5,6,3,2]', '[1]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, '\'[]\'', NULL, NULL, NULL, 0, 0, NULL, 1, 0, NULL, NULL, '2023-12-22 10:25:35', '2023-12-22 10:25:35', NULL),
(61, 'Cri', NULL, '+91', '634625760', 'Cri14206109', NULL, 'SVKMUs8hyhl6', '$2y$10$b/uGOb5wsQ34TRLwMxZygeKAVGsd96qx1M18aBBc58xS5dhi5WhIq', 2, '1977-01-01', 46, '[13,16,72,99,102]', '[1]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'ciao!', 1, 'eFvrgrJHhExApLux_SpUQ2:APA91bHdPhZd8wSGHYBOqceq8XaWeiEOc0-0TAkqPie01xZH9pInKUV0e3rDQ3Ldw_J8ZmKkTZgxhq8aunFdsCOTbhmIqBP0HtPlbfpjxKOPiV9VJDb6VGdUrcx4XqFPdgTinSNqO0XE', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[3,16,23,30,43,50,65,69,78,83,90,94,96]', '[6,3,2]', NULL, NULL, 'Barcelona', 0, 0, '5', 0, 0, '1', NULL, '2023-12-23 22:48:21', '2023-12-23 22:52:34', NULL),
(62, 'Alessandro', NULL, '+91', '3258855231', 'Alessandro57509196', NULL, 'nUvioSiG8793', '$2y$10$eLbop0rPNgchNCDFrW1AC.e5I43x2OjEi5GaINlFIXOMos2XHzdvG', 1, '1975-02-08', 48, '[1,3,6,14,18]', '[1]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'I have a dream! se era facile … lo facevano tutti! vediamo se ci riesco! 💪', 1, 'd7_O684_hEdQujOIlK1ZVH:APA91bHR4Js_IeZA4nuig0sCADEMQNNgQ8xjLxahiGpEEWw_qfoQPj5vL0ZGpJpTn8VCm_nZJh2Nr5ojcsSR24wS6Lb91SbdbAWttFHfx1gHsGW6qmLK-mWVj3uLoZl-v9NWK-Rb1VY9', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, '[10,18,30,43,55,70,78,82,90,94,96]', '[2,6,8]', NULL, 'itis', 'Vicenza', 0, 0, '5', 0, 0, '1', NULL, '2023-12-24 13:07:57', '2023-12-24 13:11:36', NULL),
(63, 'Chales', 'Babej', '+91', '4444444444', 'Chales91947336', NULL, 'NRalThiye2Px', '$2y$10$5Ce7jQmLEz6V.k5.8OarCu.Zz6ElRAE0xxD8T25V05lCm3i06CPgq', 1, '1997-12-01', 26, '[5]', '[4]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 1, NULL, NULL, '2023-12-27 18:04:22', '2023-12-27 18:04:22', NULL),
(64, 'john', 'Carter', '+91', '97250297389', 'john47054063', NULL, 'LASthdoTMRq2', '$2y$10$EvAHOASL5E6H1fhBLpNqF.LtoXurtzkYz7LkM5k11D1CEUm4TRery', 1, '1993-04-10', 30, '[1,2]', '[1,5,7,11,13]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'token', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 1, NULL, NULL, '2023-12-29 12:20:58', '2023-12-29 12:20:58', NULL),
(65, 'john', 'Carter', '+91', '97250297399', 'john76415690', NULL, '5zpxtrKy2ZlC', '$2y$10$QQ/cf0HeNhokMM.KYmyA4OFDghCzSJwQ8UA9Akikz78VDu1dMQhUy', 1, '1993-04-10', 30, '[1,2]', '[1,5,7,11,13]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'token', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 1, NULL, NULL, '2024-01-01 13:41:58', '2024-01-01 13:41:58', NULL),
(66, 'john', 'Carter', '+91', '97250297391', 'john16337284', NULL, 'gWSbMW1F2XXR', '$2y$10$Zqn44Pki2bVfzGIJNcdD6OAWgNt6BJtRDSqX/kD9dewdzgHAzt68O', 1, '1993-04-10', 30, '[1,2]', '[1,5,7,11,13]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 'token', NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 1, NULL, NULL, '2024-01-01 13:56:17', '2024-01-01 13:56:17', NULL),
(67, 'kishan', 'Sharma', '+91', '8080808080', 'kishan77849182', NULL, 'CVvmOuyQY5Q3', '$2y$10$2hWgbNwH7n7E43qMRzDOoeyLr5WkPg8FCk1.ZW6l0.bUC0.YkRSEm', 1, '2005-05-10', 18, '[5,7,8,9,11]', '[4,6,7,10]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2024-01-04 17:12:19', '2024-01-04 17:12:19', NULL),
(68, 'Nikunj', NULL, '+91', '7070707070', 'Nikunj63594737', NULL, 'jAgWyhsXQtJp', '$2y$10$Tj8XNM4hR04RVXWR0p3wnOuBBE8GqRXpCpe1SbQgjrcp2U.zN2ApG', 1, '1999-11-10', 24, '[5,6,9]', '[4,8,10,5,13]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 1, NULL, NULL, '2024-01-04 17:51:06', '2024-01-04 17:51:06', NULL),
(69, 'Urmin', 'Gajera', '+91', '2020202020', 'Urmin58908090', NULL, 'yOgS0nezxz9X', '$2y$10$Muvlq8apEd/.pdO0o4zGs.EWGnRWPXc7rLl8G3I4VehhfQWf/Uypi', 1, '2000-01-10', 23, '[4,5,8]', '[5,8]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 1, NULL, NULL, '2024-01-04 17:57:29', '2024-01-04 17:57:29', NULL),
(70, 'bharti', 'pandey', '+91', '3030303030', 'bharti20255692', NULL, 'xoUnNjEZLv0M', '$2y$10$hZsDs1bR4qNoggZYLQQaW.1EuidHxwwu1HmCILJyi/a8dEBAphdUi', 2, '1999-01-12', 24, '[1,10]', '[2,4]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2024-01-05 12:09:54', '2024-01-05 12:09:54', NULL),
(71, 'Tina', NULL, '+91', '4040404040', 'Tina74017437', NULL, 'RqCgUPcs2cjA', '$2y$10$Ptk8hXnVvAeI/W/4Go5NA.ofZX3bF.Xma0e7BgkX5yWbCxAbMK8Mu', 2, '2005-01-11', 18, '[4]', '[4,5]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2024-01-05 18:49:54', '2024-01-05 18:49:54', NULL),
(72, 'sahil', 'bhuva', '+91', '2550255025', 'sahil75377895', NULL, 'dWeI9vSSNxXP', '$2y$10$KQw54rxlEN3oVe8TOqthy.HQC6/7STRWb6yOGKyznO.NyfR20MveO', 1, '1996-04-10', 27, '[5,4,3,2]', '[2,4,10]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 0, NULL, NULL, '2024-01-09 12:39:46', '2024-01-09 12:39:46', NULL),
(73, 'hiren', 'savani', '+91', '5025502550', 'hiren54243325', NULL, 'HAWBRhF1hvUL', '$2y$10$6azxg0dXwLaGwux9Bn8/Te12SKUeo19tXcsF7uGjh5o7JsI.LDX7u', 1, '2006-03-11', 17, '[2,3,4]', '[4,5]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 1, NULL, NULL, '2024-01-09 12:43:42', '2024-01-09 12:43:42', NULL),
(74, 'Shahid', 'Narayan', '+91', '5050505050', 'Shahid82674807', NULL, 'XEff5Di7rU0L', '$2y$10$tQJLO37DyzPr1j2oNUqm9eFLTGe0AkNBt8AJevAOcdPwNbD2RbQoy', 1, '1999-01-11', 25, '[1,4]', '[5,8]', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 1, 0, NULL, NULL, '2024-01-11 14:09:35', '2024-01-11 14:09:35', NULL),
(75, 'Bhavik', 'Codezee', '+91', '9824871770', 'Bhavik64666955', NULL, 'cn4hIdmlY4nV', '$2y$10$rWWXaG.Ari4hzPXpmUKoNO2tuzH6E2MpqIrEXuRm77cYlPORBAyGG', 1, '2006-01-01', 18, '[1]', '[2]', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2024-01-11 10:06:51', '2024-01-11 10:06:51', NULL),
(76, 'Gautam', 'Codezee', '+91', '9081342033', 'Gautam61246610', NULL, 'aQnSdlKlwFSL', '$2y$10$bacJ.f7E2MMoB.SfNWZHVuW282lnBtmKHYH7n4enjRoHjs2AR6kmy', 1, '2006-01-01', 18, '[1]', '[1]', 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, 1, 0, 0, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, '2024-01-11 10:15:37', '2024-01-11 10:15:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_notification`
--

CREATE TABLE `user_notification` (
  `id` int(55) NOT NULL,
  `sender_id` int(10) DEFAULT NULL,
  `sender_avatar` text DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `msg` text NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `extra_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notification`
--

INSERT INTO `user_notification` (`id`, `sender_id`, `sender_avatar`, `user_id`, `msg`, `read`, `extra_data`, `created_at`, `updated_at`) VALUES
(1, 1, 'https://www.revadiamonds.in/bitlove/public/uploads/391699520590.jpg', 11, '<b>Athena </b> Like your profile.', 1, NULL, '2023-11-09 09:41:15', '2023-11-09 09:41:15'),
(2, 1, 'https://www.revadiamonds.in/bitlove/public/uploads/391699520590.jpg', 11, '<b>Athena </b> Like your profile.', 1, NULL, '2023-11-09 09:42:27', '2023-11-09 09:42:27'),
(3, 1, 'https://www.revadiamonds.in/bitlove/public/uploads/391699520590.jpg', 11, '<b>Athena </b> Like your profile.', 1, NULL, '2023-11-09 10:03:50', '2023-11-09 10:03:50'),
(4, 1, 'https://www.revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> SuperLike your profile.', 1, NULL, '2023-11-29 09:42:05', '2023-11-29 09:42:05'),
(5, 25, 'https://www.revadiamonds.in/bitlove/public/uploads/661699435221.jpg', 1, '<b>Italo Melo</b> Like your profile.', 1, NULL, '2023-11-29 09:42:29', '2023-11-29 09:42:29'),
(6, 25, 'https://www.revadiamonds.in/bitlove/public/uploads/661699435221.jpg', 1, '<b>Italo Melo</b> SuperLike your profile.', 1, NULL, '2023-11-29 09:43:08', '2023-11-29 09:43:08'),
(7, 1, 'https://www.revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> SuperLike your profile.', 1, NULL, '2023-11-29 09:44:04', '2023-11-29 09:44:04'),
(8, 25, 'https://www.revadiamonds.in/bitlove/public/uploads/661699435221.jpg', 1, '<b>Italo Melo</b> SuperLike your profile.', 1, NULL, '2023-11-29 09:44:16', '2023-11-29 09:44:16'),
(9, 1, 'https://www.revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> SuperLike your profile.', 1, NULL, '2023-11-29 09:49:18', '2023-11-29 09:49:18'),
(10, 1, 'https://www.revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> SuperLike your profile.', 1, NULL, '2023-11-29 09:49:41', '2023-11-29 09:49:41'),
(11, 1, 'https://www.revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> SuperLike your profile.', 1, NULL, '2023-11-29 09:49:42', '2023-11-29 09:49:42'),
(12, 1, 'https://www.revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> SuperLike your profile.', 1, NULL, '2023-11-29 09:49:43', '2023-11-29 09:49:43'),
(13, 1, 'https://www.revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> SuperLike your profile.', 1, NULL, '2023-11-29 09:50:02', '2023-11-29 09:50:02'),
(14, 1, 'https://www.revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> SuperLike your profile.', 1, NULL, '2023-11-29 09:50:03', '2023-11-29 09:50:03'),
(15, 1, 'https://www.revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> SuperLike your profile.', 1, NULL, '2023-11-29 09:50:05', '2023-11-29 09:50:05'),
(16, 1, 'https://www.revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> SuperLike your profile.', 1, NULL, '2023-11-29 09:50:14', '2023-11-29 09:50:14'),
(17, 1, 'https://www.revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> SuperLike your profile.', 1, NULL, '2023-11-29 09:50:15', '2023-11-29 09:50:15'),
(18, 1, 'https://www.revadiamonds.in/bitlove/public/uploads/391699520590.jpg', 11, '<b>Athena </b> Like your profile.', 1, NULL, '2023-12-05 06:04:28', '2023-12-05 06:04:28'),
(19, 37, 'https://revadiamonds.in/bitlove/public/uploads/391699520590.jpg', 11, '<b>Athena </b> SuperLike your profile.', 1, NULL, '2023-12-06 12:02:45', '2023-12-06 12:02:45'),
(20, 37, 'https://revadiamonds.in/bitlove/public/uploads/391699520590.jpg', 11, '<b>Athena </b> SuperLike your profile.', 1, NULL, '2023-12-06 12:03:28', '2023-12-06 12:03:28'),
(21, 37, 'https://revadiamonds.in/bitlove/public/uploads/391699520590.jpg', 11, '<b>Athena </b> Like your profile.', 1, NULL, '2023-12-06 12:06:31', '2023-12-06 12:06:31'),
(22, 37, 'https://revadiamonds.in/bitlove/public/uploads/391699520590.jpg', 11, '<b>Athena </b> Like your profile.', 1, NULL, '2023-12-08 04:28:10', '2023-12-08 04:28:10'),
(23, 25, 'https://revadiamonds.in/bitlove/public/uploads/921699605891.jpg', 20, '<b>Ale </b> Like your profile.', 1, NULL, '2023-12-08 04:40:15', '2023-12-08 04:40:15'),
(24, 25, 'https://revadiamonds.in/bitlove/public/uploads/661699435221.jpg', 1, '<b>Italo Melo</b> Like your profile.', 1, NULL, '2023-12-08 05:39:49', '2023-12-08 05:39:49'),
(25, 1, 'https://revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> Like your profile.', 1, NULL, '2023-12-08 05:40:07', '2023-12-08 05:40:07'),
(26, 25, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 05:41:23', '2023-12-08 05:41:23'),
(27, 25, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 06:35:06', '2023-12-08 06:35:06'),
(28, 25, 'https://revadiamonds.in/bitlove/public/uploads/431699593771.jpg', 18, '<b>Test </b> Like your profile.', 1, NULL, '2023-12-08 06:36:13', '2023-12-08 06:36:13'),
(29, 25, 'https://revadiamonds.in/bitlove/public/uploads/261699438069.jpg', 6, '<b>Ayo Ogunseinde</b> Like your profile.', 1, NULL, '2023-12-08 06:39:49', '2023-12-08 06:39:49'),
(30, 25, 'https://revadiamonds.in/bitlove/public/uploads/661699435221.jpg', 1, '<b>Italo Melo</b> Like your profile.', 1, NULL, '2023-12-08 06:45:22', '2023-12-08 06:45:22'),
(31, 25, 'https://revadiamonds.in/bitlove/public/uploads/661699435221.jpg', 1, '<b>Italo Melo</b> Like your profile.', 1, NULL, '2023-12-08 06:51:01', '2023-12-08 06:51:01'),
(32, 1, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 06:53:32', '2023-12-08 06:53:32'),
(33, 1, 'https://revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> Like your profile.', 1, NULL, '2023-12-08 06:54:20', '2023-12-08 06:54:20'),
(34, 1, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 06:55:19', '2023-12-08 06:55:19'),
(35, 1, 'https://revadiamonds.in/bitlove/public/uploads/861700673674.jpg', 23, '<b>Tito Sera</b> Like your profile.', 1, NULL, '2023-12-08 06:55:36', '2023-12-08 06:55:36'),
(36, 1, 'https://revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> Like your profile.', 1, NULL, '2023-12-08 06:56:10', '2023-12-08 06:56:10'),
(37, 1, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 06:57:23', '2023-12-08 06:57:23'),
(38, 1, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 07:03:06', '2023-12-08 07:03:06'),
(39, 1, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 07:08:12', '2023-12-08 07:08:12'),
(40, 1, 'https://revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> Like your profile.', 1, NULL, '2023-12-08 07:08:18', '2023-12-08 07:08:18'),
(41, 1, 'https://revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> Like your profile.', 1, NULL, '2023-12-08 07:10:00', '2023-12-08 07:10:00'),
(42, 1, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 07:10:58', '2023-12-08 07:10:58'),
(43, 1, 'https://revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> Like your profile.', 1, NULL, '2023-12-08 07:11:05', '2023-12-08 07:11:05'),
(44, 1, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 07:13:30', '2023-12-08 07:13:30'),
(45, 1, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 07:20:56', '2023-12-08 07:20:56'),
(46, 1, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 07:25:14', '2023-12-08 07:25:14'),
(47, 1, 'https://revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> Like your profile.', 1, NULL, '2023-12-08 07:25:24', '2023-12-08 07:25:24'),
(48, 1, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 07:26:37', '2023-12-08 07:26:37'),
(49, 1, 'https://revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> Like your profile.', 1, NULL, '2023-12-08 07:26:42', '2023-12-08 07:26:42'),
(50, 1, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 07:27:44', '2023-12-08 07:27:44'),
(51, 1, 'https://revadiamonds.in/bitlove/public/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> Like your profile.', 1, NULL, '2023-12-08 07:27:54', '2023-12-08 07:27:54'),
(52, 25, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 08:18:29', '2023-12-08 08:18:29'),
(53, 25, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 08:18:51', '2023-12-08 08:18:51'),
(54, 25, 'https://revadiamonds.in/bitlove/public/uploads/661699435221.jpg', 1, '<b>Italo Melo</b> Like your profile.', 1, NULL, '2023-12-08 08:19:02', '2023-12-08 08:19:02'),
(55, 25, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 08:23:05', '2023-12-08 08:23:05'),
(56, 25, 'https://revadiamonds.in/bitlove/public/uploads/661699435221.jpg', 1, '<b>Italo Melo</b> Like your profile.', 1, NULL, '2023-12-08 08:23:30', '2023-12-08 08:23:30'),
(57, 25, 'https://revadiamonds.in/bitlove/public/uploads/661699435221.jpg', 1, '<b>Italo Melo</b> Like your profile.', 1, NULL, '2023-12-08 08:28:59', '2023-12-08 08:28:59'),
(58, 25, 'https://revadiamonds.in/bitlove/public/uploads/661699435221.jpg', 1, '<b>Italo Melo</b> Like your profile.', 1, NULL, '2023-12-08 08:32:15', '2023-12-08 08:32:15'),
(59, 25, 'https://revadiamonds.in/bitlove/public/uploads/661699435221.jpg', 1, '<b>Italo Melo</b> SuperLike your profile.', 1, NULL, '2023-12-08 08:38:51', '2023-12-08 08:38:51'),
(60, 25, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> SuperLike your profile.', 1, NULL, '2023-12-08 08:39:08', '2023-12-08 08:39:08'),
(61, 25, 'https://revadiamonds.in/bitlove/public/uploads/491699590796.jpg', 17, '<b>Agj Set</b> SuperLike your profile.', 1, NULL, '2023-12-08 08:39:15', '2023-12-08 08:39:15'),
(62, 25, 'https://revadiamonds.in/bitlove/public/uploads/861701167967.jpg', 28, '<b>Cc </b> SuperLike your profile.', 1, NULL, '2023-12-08 08:39:19', '2023-12-08 08:39:19'),
(63, 25, 'https://revadiamonds.in/bitlove/public/uploads/661699435221.jpg', 1, '<b>Italo Melo</b> SuperLike your profile.', 1, NULL, '2023-12-08 08:40:32', '2023-12-08 08:40:32'),
(64, 25, 'https://revadiamonds.in/bitlove/public/uploads/311701858910.jpg', 37, '<b>Hetro Women</b> Like your profile.', 1, NULL, '2023-12-08 08:40:48', '2023-12-08 08:40:48'),
(65, 25, 'https://revadiamonds.in/bitlove/public/uploads/551699439211.jpg', 9, '<b>Peyman Farmani</b> Like your profile.', 1, NULL, '2023-12-08 08:41:02', '2023-12-08 08:41:02'),
(66, 25, 'https://revadiamonds.in/bitlove/public/uploads/171702282959.jpg', 50, '<b>Alex </b> Like your profile.', 1, NULL, '2023-12-12 06:33:24', '2023-12-12 06:33:24'),
(67, 25, 'https://revadiamonds.in/bitlove/public/uploads/451701433890.jpg', 32, '<b>Alessa </b> Like your profile.', 1, NULL, '2023-12-12 06:33:27', '2023-12-12 06:33:27'),
(68, 25, 'https://revadiamonds.in/bitlove/public/uploads/521701946210.jpg', 38, '<b>Alex </b> Like your profile.', 1, NULL, '2023-12-12 06:33:30', '2023-12-12 06:33:30'),
(69, 25, 'https://revadiamonds.in/bitlove/public/uploads/881699590229.jpg', 15, '<b>Sed Mok</b> Like your profile.', 1, NULL, '2023-12-12 06:33:30', '2023-12-12 06:33:30'),
(70, 25, 'https://revadiamonds.in/bitlove/public/uploads/631701765700.jpg', 36, '<b>Alexx </b> Like your profile.', 1, NULL, '2023-12-12 06:33:35', '2023-12-12 06:33:35'),
(71, 25, 'https://revadiamonds.in/bitlove/public/uploads/211699437217.jpg', 4, '<b>Bruno Salvador</b> Like your profile.', 1, NULL, '2023-12-12 06:33:40', '2023-12-12 06:33:40'),
(72, 25, 'https://revadiamonds.in/bitlove/public/uploads/791701679626.jpg', 33, '<b>Hello World</b> Like your profile.', 1, NULL, '2023-12-12 06:33:41', '2023-12-12 06:33:41'),
(73, 25, 'https://revadiamonds.in/bitlove/public/uploads/801699874179.jpg', 21, '<b>Alessandro </b> Like your profile.', 1, NULL, '2023-12-12 06:33:46', '2023-12-12 06:33:46'),
(74, 25, 'https://revadiamonds.in/bitlove/public/uploads/771702026519.jpg', 40, '<b>Vv Gt</b> Like your profile.', 1, NULL, '2023-12-12 06:33:49', '2023-12-12 06:33:49'),
(75, 25, 'https://revadiamonds.in/bitlove/public/uploads/171702282959.jpg', 50, '<b>Alex </b> Like your profile.', 1, NULL, '2023-12-12 06:33:54', '2023-12-12 06:33:54'),
(76, 25, 'https://revadiamonds.in/bitlove/public/uploads/451701433890.jpg', 32, '<b>Alessa </b> Like your profile.', 1, NULL, '2023-12-12 06:33:59', '2023-12-12 06:33:59'),
(77, 25, 'https://revadiamonds.in/bitlove/public/uploads/521701946210.jpg', 38, '<b>Alex </b> Like your profile.', 1, NULL, '2023-12-12 06:34:00', '2023-12-12 06:34:00'),
(78, 25, 'https://revadiamonds.in/bitlove/public/uploads/881699590229.jpg', 15, '<b>Sed Mok</b> Like your profile.', 1, NULL, '2023-12-12 06:34:01', '2023-12-12 06:34:01'),
(79, 25, 'https://revadiamonds.in/bitlove/public/uploads/631701765700.jpg', 36, '<b>Alexx </b> Like your profile.', 1, NULL, '2023-12-12 06:34:07', '2023-12-12 06:34:07'),
(80, 25, 'https://revadiamonds.in/bitlove/public/uploads/211699437217.jpg', 4, '<b>Bruno Salvador</b> Like your profile.', 1, NULL, '2023-12-12 06:34:10', '2023-12-12 06:34:10'),
(81, 25, 'https://revadiamonds.in/bitlove/public/uploads/791701679626.jpg', 33, '<b>Hello World</b> Like your profile.', 1, NULL, '2023-12-12 06:34:16', '2023-12-12 06:34:16'),
(82, 25, 'https://revadiamonds.in/bitlove/public/uploads/801699874179.jpg', 21, '<b>Alessandro </b> Like your profile.', 1, NULL, '2023-12-12 06:34:17', '2023-12-12 06:34:17'),
(83, 25, 'https://revadiamonds.in/bitlove/public/uploads/771702026519.jpg', 40, '<b>Vv Gt</b> Like your profile.', 1, NULL, '2023-12-12 06:34:21', '2023-12-12 06:34:21'),
(84, 25, 'https://revadiamonds.in/bitlove/public/uploads/171702282959.jpg', 50, '<b>Alex </b> Like your profile.', 1, NULL, '2023-12-12 06:34:23', '2023-12-12 06:34:23'),
(85, 25, 'https://revadiamonds.in/bitlove/public/uploads/451701433890.jpg', 32, '<b>Alessa </b> Like your profile.', 1, NULL, '2023-12-12 06:34:25', '2023-12-12 06:34:25'),
(86, 25, 'https://revadiamonds.in/bitlove/public/uploads/521701946210.jpg', 38, '<b>Alex </b> Like your profile.', 1, NULL, '2023-12-12 06:34:26', '2023-12-12 06:34:26'),
(87, 25, 'https://revadiamonds.in/bitlove/public/uploads/881699590229.jpg', 15, '<b>Sed Mok</b> Like your profile.', 1, NULL, '2023-12-12 06:34:29', '2023-12-12 06:34:29'),
(88, 25, 'https://revadiamonds.in/bitlove/public/uploads/631701765700.jpg', 36, '<b>Alexx </b> Like your profile.', 1, NULL, '2023-12-12 06:34:33', '2023-12-12 06:34:33'),
(89, 25, 'https://revadiamonds.in/bitlove/public/uploads/211699437217.jpg', 4, '<b>Bruno Salvador</b> Like your profile.', 1, NULL, '2023-12-12 06:34:34', '2023-12-12 06:34:34'),
(90, 25, 'https://revadiamonds.in/bitlove/public/uploads/791701679626.jpg', 33, '<b>Hello World</b> Like your profile.', 1, NULL, '2023-12-12 06:34:38', '2023-12-12 06:34:38'),
(91, 25, 'https://revadiamonds.in/bitlove/public/uploads/801699874179.jpg', 21, '<b>Alessandro </b> Like your profile.', 1, NULL, '2023-12-12 06:34:39', '2023-12-12 06:34:39'),
(92, 25, 'https://revadiamonds.in/bitlove/public/uploads/771702026519.jpg', 40, '<b>Vv Gt</b> Like your profile.', 1, NULL, '2023-12-12 06:34:58', '2023-12-12 06:34:58'),
(93, 25, 'https://revadiamonds.in/bitlove/public/uploads/171702282959.jpg', 50, '<b>Alex </b> Like your profile.', 1, NULL, '2023-12-12 06:35:01', '2023-12-12 06:35:01'),
(94, 25, 'https://revadiamonds.in/bitlove/public/uploads/451701433890.jpg', 32, '<b>Alessa </b> Like your profile.', 1, NULL, '2023-12-12 06:35:04', '2023-12-12 06:35:04'),
(95, 25, 'https://revadiamonds.in/bitlove/public/uploads/521701946210.jpg', 38, '<b>Alex </b> Like your profile.', 1, NULL, '2023-12-12 06:35:08', '2023-12-12 06:35:08'),
(96, 28, 'https://revadiamonds.in/uploads/761700824325.jpg', 25, '<b>Jethalal Gada</b> Like your profile.', 1, NULL, '2023-12-18 06:05:19', '2023-12-18 06:05:19'),
(97, 28, 'https://revadiamonds.in/uploads/661699435221.jpg', 1, '<b>Italo Melo</b> Like your profile.', 1, NULL, '2023-12-18 06:05:39', '2023-12-18 06:05:39'),
(98, 28, 'https://revadiamonds.in/uploads/801699874179.jpg', 21, '<b>Alessandro </b> Like your profile.', 1, NULL, '2023-12-18 06:12:03', '2023-12-18 06:12:03'),
(99, 28, 'https://revadiamonds.in/uploads/451701433890.jpg', 32, '<b>Alessa </b> Like your profile.', 1, NULL, '2023-12-18 06:31:47', '2023-12-18 06:31:47'),
(100, 28, 'https://revadiamonds.in/uploads/881699590229.jpg', 15, '<b>Sed Mok</b> Like your profile.', 1, NULL, '2023-12-18 06:34:11', '2023-12-18 06:34:11'),
(101, 28, 'https://revadiamonds.in/uploads/631701765700.jpg', 36, '<b>Alexx </b> Like your profile.', 1, NULL, '2023-12-18 06:36:19', '2023-12-18 06:36:19'),
(102, 28, 'https://revadiamonds.in/uploads/211699437217.jpg', 4, '<b>Bruno Salvador</b> Like your profile.', 1, NULL, '2023-12-18 06:36:34', '2023-12-18 06:36:34'),
(103, 1, 'https://revadiamonds.in/uploads/781702028008.jpg', 41, '<b>Abc Tyr</b> SuperLike your profile.', 1, NULL, '2023-12-19 10:18:29', '2023-12-19 10:18:29'),
(104, 1, 'https://revadiamonds.in/uploads/771702026519.jpg', 40, '<b>Vv Gt</b> SuperLike your profile.', 1, NULL, '2023-12-19 10:18:40', '2023-12-19 10:18:40'),
(105, 1, 'https://revadiamonds.in/uploads/361699439510.jpg', 10, '<b>Fineas Garve</b> SuperLike your profile.', 1, NULL, '2023-12-19 10:18:47', '2023-12-19 10:18:47'),
(106, 1, 'https://revadiamonds.in/uploads/151702883864.jpg', 54, '<b>Yashraj Muskaan</b> SuperLike your profile.', 1, NULL, '2023-12-19 10:38:53', '2023-12-19 10:38:53'),
(107, 56, 'https://revadiamonds.in/uploads/171702282959.jpg', 50, '<b>Alex </b> Like your profile.', 1, NULL, '2023-12-19 12:18:21', '2023-12-19 12:18:21'),
(108, 56, 'https://revadiamonds.in/uploads/891699436855.jpg', 3, '<b>Brett Sayles</b> Like your profile.', 1, NULL, '2023-12-19 12:18:22', '2023-12-19 12:18:22'),
(109, 56, 'https://revadiamonds.in/uploads/311702220048.jpg', 45, '<b>Gustavo P.</b> Like your profile.', 1, NULL, '2023-12-19 12:18:28', '2023-12-19 12:18:28'),
(110, 56, 'https://revadiamonds.in/uploads/791699436543.jpg', 2, '<b>Horacio Rojas</b> Like your profile.', 1, NULL, '2023-12-19 12:18:30', '2023-12-19 12:18:30'),
(111, 56, 'https://revadiamonds.in/uploads/411702536615.jpg', 52, '<b>Viva </b> Like your profile.', 1, NULL, '2023-12-19 12:18:32', '2023-12-19 12:18:32'),
(112, 56, 'https://revadiamonds.in/uploads/211699437670.jpg', 5, '<b>Simon Robben</b> Like your profile.', 1, NULL, '2023-12-19 12:18:35', '2023-12-19 12:18:35'),
(113, 56, 'https://revadiamonds.in/uploads/891699436855.jpg', 3, '<b>Brett Sayles</b> Like your profile.', 1, NULL, '2023-12-19 12:18:37', '2023-12-19 12:18:37'),
(114, 56, 'https://revadiamonds.in/uploads/311702220048.jpg', 45, '<b>Gustavo P.</b> Like your profile.', 1, NULL, '2023-12-19 12:18:39', '2023-12-19 12:18:39'),
(115, 56, 'https://revadiamonds.in/uploads/511702220495.jpg', 47, '<b>Christian W.</b> Like your profile.', 1, NULL, '2023-12-19 12:18:44', '2023-12-19 12:18:44'),
(116, 56, 'https://revadiamonds.in/uploads/181702219676.jpg', 44, '<b>Enea Maestri</b> Like your profile.', 1, NULL, '2023-12-20 04:55:04', '2023-12-20 04:55:04'),
(117, 57, 'https://revadiamonds.in/uploads/871702218417.jpg', 43, '<b>Leila Rossi</b> Like your profile.', 1, NULL, '2023-12-20 06:00:37', '2023-12-20 06:00:37'),
(118, 61, 'https://revadiamonds.in/uploads/921703156379.jpg', 59, '<b>Diego </b> Like your profile.', 1, NULL, '2023-12-23 22:53:21', '2023-12-23 22:53:21'),
(119, 61, 'https://revadiamonds.in/uploads/261702220288.jpg', 46, '<b>Emanuel G.</b> Like your profile.', 1, NULL, '2023-12-23 22:53:26', '2023-12-23 22:53:26'),
(120, 61, 'https://revadiamonds.in/uploads/971699530839.jpg', 13, '<b>Dghk </b> Like your profile.', 1, NULL, '2023-12-23 22:53:30', '2023-12-23 22:53:30'),
(121, 61, 'https://revadiamonds.in/uploads/851701431431.jpg', 30, '<b>Alex </b> Like your profile.', 1, NULL, '2023-12-23 22:53:32', '2023-12-23 22:53:32'),
(122, 62, 'https://revadiamonds.in/uploads/831701432376.jpg', 31, '<b>Aless </b> Like your profile.', 1, NULL, '2023-12-24 13:12:34', '2023-12-24 13:12:34'),
(123, 62, 'https://revadiamonds.in/uploads/531703371701.jpg', 61, '<b>Cri </b> Like your profile.', 1, NULL, '2023-12-24 13:12:39', '2023-12-24 13:12:39'),
(124, 62, 'https://revadiamonds.in/uploads/131701173168.jpg', 29, '<b>1 11</b> Like your profile.', 1, NULL, '2023-12-24 13:12:44', '2023-12-24 13:12:44'),
(125, 62, 'https://revadiamonds.in/uploads/581699589929.jpg', 14, '<b>Leo </b> Like your profile.', 1, NULL, '2023-12-24 13:12:47', '2023-12-24 13:12:47'),
(126, 62, 'https://revadiamonds.in/uploads/861700673674.jpg', 23, '<b>Tito Sera</b> Like your profile.', 1, NULL, '2023-12-24 13:12:48', '2023-12-24 13:12:48'),
(127, 62, 'https://revadiamonds.in/uploads/571703240735.jpg', 60, '<b>Vdsbs Hdjd</b> Like your profile.', 1, NULL, '2023-12-24 13:12:50', '2023-12-24 13:12:50'),
(128, 62, 'https://revadiamonds.in/uploads/831701432376.jpg', 31, '<b>Aless </b> Like your profile.', 1, NULL, '2023-12-24 13:12:51', '2023-12-24 13:12:51'),
(129, 62, 'https://revadiamonds.in/uploads/531703371701.jpg', 61, '<b>Cri </b> Like your profile.', 1, NULL, '2023-12-24 13:12:52', '2023-12-24 13:12:52'),
(130, 62, 'https://revadiamonds.in/uploads/131701173168.jpg', 29, '<b>1 11</b> Like your profile.', 1, NULL, '2023-12-24 13:12:53', '2023-12-24 13:12:53'),
(131, 62, 'https://revadiamonds.in/uploads/581699589929.jpg', 14, '<b>Leo </b> Like your profile.', 1, NULL, '2023-12-24 13:12:53', '2023-12-24 13:12:53'),
(132, 62, 'https://revadiamonds.in/uploads/861700673674.jpg', 23, '<b>Tito Sera</b> Like your profile.', 1, NULL, '2023-12-24 13:12:55', '2023-12-24 13:12:55'),
(133, 62, 'https://revadiamonds.in/uploads/571703240735.jpg', 60, '<b>Vdsbs Hdjd</b> Like your profile.', 1, NULL, '2023-12-24 13:12:55', '2023-12-24 13:12:55'),
(134, 62, 'https://revadiamonds.in/uploads/831701432376.jpg', 31, '<b>Aless </b> Like your profile.', 1, NULL, '2023-12-24 13:13:01', '2023-12-24 13:13:01'),
(135, 62, 'https://revadiamonds.in/uploads/531703371701.jpg', 61, '<b>Cri </b> Like your profile.', 1, NULL, '2023-12-24 13:13:07', '2023-12-24 13:13:07'),
(136, 62, 'https://revadiamonds.in/uploads/131701173168.jpg', 29, '<b>1 11</b> Like your profile.', 1, NULL, '2023-12-24 13:13:12', '2023-12-24 13:13:12'),
(137, 62, 'https://revadiamonds.in/uploads/581699589929.jpg', 14, '<b>Leo </b> Like your profile.', 1, NULL, '2023-12-24 13:13:13', '2023-12-24 13:13:13'),
(138, 62, 'https://revadiamonds.in/uploads/861700673674.jpg', 23, '<b>Tito Sera</b> Like your profile.', 1, NULL, '2023-12-24 13:15:23', '2023-12-24 13:15:23'),
(139, 62, 'https://revadiamonds.in/uploads/571703240735.jpg', 60, '<b>Vdsbs Hdjd</b> SuperLike your profile.', 1, NULL, '2023-12-24 13:15:24', '2023-12-24 13:15:24'),
(140, 62, 'https://revadiamonds.in/uploads/831701432376.jpg', 31, '<b>Aless </b> SuperLike your profile.', 1, NULL, '2023-12-24 13:15:25', '2023-12-24 13:15:25'),
(141, 62, 'https://revadiamonds.in/uploads/531703371701.jpg', 61, '<b>Cri </b> SuperLike your profile.', 1, NULL, '2023-12-24 13:15:26', '2023-12-24 13:15:26'),
(142, 62, 'https://revadiamonds.in/uploads/131701173168.jpg', 29, '<b>1 11</b> Like your profile.', 1, NULL, '2023-12-24 13:16:53', '2023-12-24 13:16:53'),
(143, 62, 'https://revadiamonds.in/uploads/581699589929.jpg', 14, '<b>Leo </b> Like your profile.', 1, NULL, '2023-12-24 13:16:55', '2023-12-24 13:16:55'),
(144, 62, 'https://revadiamonds.in/uploads/861700673674.jpg', 23, '<b>Tito Sera</b> Like your profile.', 1, NULL, '2023-12-24 13:16:57', '2023-12-24 13:16:57'),
(145, 62, 'https://revadiamonds.in/uploads/571703240735.jpg', 60, '<b>Vdsbs Hdjd</b> Like your profile.', 1, NULL, '2023-12-24 13:16:58', '2023-12-24 13:16:58'),
(146, 62, 'https://revadiamonds.in/uploads/831701432376.jpg', 31, '<b>Aless </b> Like your profile.', 1, NULL, '2023-12-24 13:16:59', '2023-12-24 13:16:59'),
(147, 62, 'https://revadiamonds.in/uploads/531703371701.jpg', 61, '<b>Cri </b> Like your profile.', 1, NULL, '2023-12-24 13:17:00', '2023-12-24 13:17:00'),
(148, 62, 'https://revadiamonds.in/uploads/131701173168.jpg', 29, '<b>1 11</b> Like your profile.', 1, NULL, '2023-12-24 13:17:59', '2023-12-24 13:17:59'),
(149, 62, 'https://revadiamonds.in/uploads/581699589929.jpg', 14, '<b>Leo </b> Like your profile.', 1, NULL, '2023-12-24 13:18:00', '2023-12-24 13:18:00'),
(150, 62, 'https://revadiamonds.in/uploads/861700673674.jpg', 23, '<b>Tito Sera</b> Like your profile.', 1, NULL, '2023-12-24 13:18:01', '2023-12-24 13:18:01'),
(151, 62, 'https://revadiamonds.in/uploads/571703240735.jpg', 60, '<b>Vdsbs Hdjd</b> Like your profile.', 1, NULL, '2023-12-24 13:18:03', '2023-12-24 13:18:03'),
(152, 62, 'https://revadiamonds.in/uploads/831701432376.jpg', 31, '<b>Aless </b> Like your profile.', 1, NULL, '2023-12-24 13:18:04', '2023-12-24 13:18:04'),
(153, 62, 'https://revadiamonds.in/uploads/531703371701.jpg', 61, '<b>Cri </b> Like your profile.', 1, NULL, '2023-12-24 13:18:06', '2023-12-24 13:18:06'),
(154, 62, 'https://revadiamonds.in/uploads/131701173168.jpg', 29, '<b>1 11</b> Like your profile.', 1, NULL, '2023-12-24 13:18:07', '2023-12-24 13:18:07'),
(155, 62, 'https://revadiamonds.in/uploads/581699589929.jpg', 14, '<b>Leo </b> Like your profile.', 1, NULL, '2023-12-24 13:18:08', '2023-12-24 13:18:08'),
(156, 62, 'https://revadiamonds.in/uploads/861700673674.jpg', 23, '<b>Tito Sera</b> Like your profile.', 1, NULL, '2023-12-24 13:18:18', '2023-12-24 13:18:18'),
(157, 62, 'https://revadiamonds.in/uploads/571703240735.jpg', 60, '<b>Vdsbs Hdjd</b> Like your profile.', 1, NULL, '2023-12-24 13:18:20', '2023-12-24 13:18:20'),
(158, 62, 'https://revadiamonds.in/uploads/831701432376.jpg', 31, '<b>Aless </b> Like your profile.', 1, NULL, '2023-12-24 13:18:22', '2023-12-24 13:18:22'),
(159, 62, 'https://revadiamonds.in/uploads/531703371701.jpg', 61, '<b>Cri </b> Like your profile.', 1, NULL, '2023-12-24 13:57:43', '2023-12-24 13:57:43'),
(160, 62, 'https://revadiamonds.in/uploads/131701173168.jpg', 29, '<b>1 11</b> Like your profile.', 1, NULL, '2023-12-24 13:57:45', '2023-12-24 13:57:45'),
(161, 62, 'https://revadiamonds.in/uploads/581699589929.jpg', 14, '<b>Leo </b> Like your profile.', 1, NULL, '2023-12-24 13:57:45', '2023-12-24 13:57:45'),
(162, 62, 'https://revadiamonds.in/uploads/861700673674.jpg', 23, '<b>Tito Sera</b> Like your profile.', 1, NULL, '2023-12-24 13:57:46', '2023-12-24 13:57:46'),
(163, 62, 'https://revadiamonds.in/uploads/571703240735.jpg', 60, '<b>Vdsbs Hdjd</b> Like your profile.', 1, NULL, '2023-12-24 13:57:47', '2023-12-24 13:57:47'),
(164, 62, 'https://revadiamonds.in/uploads/831701432376.jpg', 31, '<b>Aless </b> Like your profile.', 1, NULL, '2023-12-24 13:57:48', '2023-12-24 13:57:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE `user_settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mobile_no_verified` tinyint(1) NOT NULL DEFAULT 0,
  `language_id` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `global` tinyint(1) NOT NULL DEFAULT 0,
  `maximum_distance` int(11) DEFAULT NULL,
  `show_me` enum('1','2','3') NOT NULL DEFAULT '3',
  `age_range_from` int(11) DEFAULT NULL,
  `age_range_to` int(11) DEFAULT NULL,
  `only_range` tinyint(1) NOT NULL DEFAULT 0,
  `balance_recommend` tinyint(1) NOT NULL DEFAULT 0,
  `who_see_you` tinyint(1) NOT NULL DEFAULT 0,
  `show_me_on_bitlove` tinyint(1) NOT NULL DEFAULT 0,
  `recommend_sort` tinyint(1) NOT NULL DEFAULT 0,
  `push_notification` text DEFAULT NULL,
  `email_notification` text DEFAULT NULL,
  `team_btilove` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_settings`
--

INSERT INTO `user_settings` (`id`, `user_id`, `mobile_no_verified`, `language_id`, `address`, `latitude`, `longitude`, `global`, `maximum_distance`, `show_me`, `age_range_from`, `age_range_to`, `only_range`, `balance_recommend`, `who_see_you`, `show_me_on_bitlove`, `recommend_sort`, `push_notification`, `email_notification`, `team_btilove`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Green Elina Adajan Surat', '21.2145217', '72.8398383', 1, 100, '3', 18, 65, 0, 1, 0, 1, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-08 09:20:21', '2023-12-07 11:25:42'),
(2, 2, 0, NULL, NULL, '21.2145316', '72.8398242', 0, NULL, '3', 23, 31, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-08 09:42:23', '2023-11-08 09:42:23'),
(3, 3, 0, NULL, NULL, '21.2145302', '72.8398229', 0, NULL, '3', 25, 31, 1, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-08 09:47:35', '2023-11-08 09:47:35'),
(4, 4, 0, 1, 'Green Elina Adajan Surat', '21.2145494', '72.8397999', 1, 70, '3', 18, 65, 0, 1, 1, 1, 0, '{\"new_matches\":1,\"message\":0,\"message_likes\":1,\"super_likes\":1,\"top_packs\":0}', '{\"new_matches\":1,\"new_message\":0,\"promotions\":1}', 1, NULL, '2023-11-08 09:53:37', '2023-12-13 09:11:50'),
(5, 5, 0, NULL, NULL, '21.2145282', '72.8398291', 0, NULL, '3', 26, 31, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-08 10:01:10', '2023-11-08 10:01:10'),
(6, 6, 0, NULL, NULL, '21.2145334', '72.8398225', 0, NULL, '3', 28, 38, 1, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-08 10:07:49', '2023-11-08 10:07:49'),
(7, 7, 0, NULL, NULL, '21.2145342', '72.8398194', 0, NULL, '3', 28, 30, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-08 10:15:19', '2023-11-08 10:15:19'),
(8, 8, 0, NULL, NULL, '21.2145293', '72.8398324', 0, NULL, '3', 21, 31, 1, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-08 10:20:17', '2023-11-08 10:20:17'),
(9, 9, 0, 1, 'Green Elina Adajan Surat', '21.2145238', '72.8398374', 0, 0, '3', 19, 32, 1, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-08 10:26:51', '2023-11-08 12:42:41'),
(10, 10, 0, 1, 'Green Elina Adajan Surat', '21.2145288', '72.8398239', 0, 0, '3', 58, 65, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-08 10:31:50', '2023-11-09 04:26:48'),
(11, 11, 0, 1, 'Green Elina Adajan Surat', '21.214563035123213', '72.83973443267627', 0, 0, '3', 19, 28, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-09 09:03:10', '2023-11-09 09:06:15'),
(12, 12, 0, NULL, NULL, '21.2145469332138', '72.83990171148093', 0, NULL, '3', 18, 24, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-09 11:28:36', '2023-11-09 11:28:36'),
(13, 13, 0, NULL, NULL, '45.6969716', '11.4813599', 0, NULL, '3', NULL, NULL, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-09 11:53:59', '2023-11-09 11:53:59'),
(14, 14, 0, NULL, NULL, '21.214529847906803', '72.83980077534981', 0, NULL, '3', 18, 40, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-10 04:18:49', '2023-11-10 04:18:49'),
(15, 15, 0, 1, 'Green Elina Adajan Surat', '21.2145374', '72.8398489', 0, 0, '3', 18, 24, 1, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-10 04:23:49', '2023-11-20 12:14:08'),
(16, 16, 0, NULL, NULL, '21.214563035123213', '72.83973443267627', 0, NULL, '3', 18, 24, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-10 04:31:40', '2023-11-10 04:31:40'),
(17, 17, 0, NULL, NULL, '21.214563035123213', '72.83973443267627', 0, NULL, '3', 18, 24, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-10 04:33:16', '2023-11-10 04:33:16'),
(18, 18, 0, NULL, NULL, '21.214563035123213', '72.83973443267627', 0, NULL, '3', 18, 24, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-10 05:22:51', '2023-11-10 05:22:51'),
(19, 19, 0, NULL, NULL, '21.214563035123213', '72.83973443267627', 0, NULL, '3', 22, 27, 1, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-10 06:07:32', '2023-11-10 06:07:32'),
(20, 20, 0, 2, 'Green Elina Adajan Surat', '45.6969202377584', '11.481127186215321', 0, 100, '3', 23, 62, 0, 0, 0, 1, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-10 08:44:51', '2023-11-30 10:43:34'),
(21, 21, 1, 2, 'Green Elina Adajan Surat', '45.6969758', '11.4812671', 1, 100, '3', 18, 65, 0, 0, 0, 1, 1, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-13 11:16:19', '2023-11-14 08:46:01'),
(22, 22, 0, NULL, NULL, '45.7087208', '11.4731421', 0, NULL, '3', 18, 48, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-14 18:37:19', '2023-11-14 18:37:19'),
(23, 23, 0, NULL, NULL, '44.3800492', '11.7377023', 0, NULL, '3', 18, 24, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-22 17:21:14', '2023-11-22 17:21:14'),
(24, 24, 0, 2, 'Green Elina Adajan Surat', '44.4428724', '11.8361401', 0, 0, '1', 18, 24, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-23 11:41:35', '2023-11-23 11:43:59'),
(25, 25, 0, 1, 'Green Elina Adajan Surat', '21.214569984792362', '72.83987260600482', 0, 100, '3', 18, 65, 0, 1, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":1,\"super_likes\":0,\"top_packs\":1}', '{\"new_matches\":0,\"new_message\":1,\"promotions\":0}', 1, NULL, '2023-11-24 11:12:06', '2023-12-22 04:44:58'),
(26, 26, 0, NULL, NULL, '37.785834', '-122.406417', 0, NULL, '3', 18, 24, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-28 08:52:00', '2023-11-28 08:52:00'),
(27, 27, 0, NULL, NULL, '37.785834', '-122.406417', 0, NULL, '3', 18, 24, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-28 08:59:55', '2023-11-28 08:59:55'),
(28, 28, 0, 1, 'Green Elina Adajan Surat', '21.2145426', '72.8398029', 1, 89, '3', 18, 65, 0, 0, 0, 1, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-28 10:39:27', '2023-12-18 07:10:02'),
(29, 29, 0, NULL, NULL, '21.2145378', '72.8398093', 0, NULL, '3', 57, 65, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-11-28 12:06:08', '2023-11-28 12:06:08'),
(30, 30, 0, NULL, NULL, '45.6969607', '11.4813093', 0, NULL, '3', 36, 65, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-01 11:50:31', '2023-12-01 11:50:31'),
(31, 31, 0, NULL, NULL, '45.6969637', '11.48131', 0, NULL, '3', 18, 40, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-01 12:06:16', '2023-12-01 12:06:16'),
(32, 32, 0, 2, 'Green Elina Adajan Surat', '45.696964', '11.4812841', 0, 100, '3', 18, 65, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-01 12:31:30', '2023-12-01 16:19:26'),
(33, 33, 0, 2, 'Green Elina Adajan Surat', '21.2145327', '72.8397989', 0, 0, '3', 19, 26, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-04 08:47:06', '2023-12-04 08:59:47'),
(34, 34, 0, NULL, NULL, '45.4053159', '8.7845195', 0, NULL, '3', 18, 24, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-04 16:42:51', '2023-12-04 16:42:51'),
(35, 35, 0, NULL, NULL, '45.696969', '11.4812639', 0, NULL, '3', 48, 65, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-05 08:31:47', '2023-12-05 08:31:47'),
(36, 36, 0, 2, 'Green Elina Adajan Surat', '45.6969724', '11.4811738', 0, 0, '3', 18, 65, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-05 08:41:40', '2023-12-05 08:45:36'),
(37, 37, 0, 1, 'Green Elina Adajan Surat', '37.4219983', '-122.084', 0, 0, '3', 18, 24, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-06 10:35:10', '2023-12-18 07:22:09'),
(38, 38, 0, 2, 'Green Elina Adajan Surat', '21.214512349968576', '72.83975556645831', 0, 0, '3', 18, 39, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-07 10:50:10', '2023-12-07 11:14:43'),
(39, 39, 0, 1, 'Green Elina Adajan Surat', '21.2144917', '72.8398518', 0, 0, '3', 18, 38, 0, 1, 1, 0, 0, '{\"new_matches\":1,\"message\":1,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":1,\"new_message\":1,\"promotions\":0}', 0, NULL, '2023-12-08 05:14:31', '2023-12-20 09:47:34'),
(40, 40, 0, 1, 'Green Elina Adajan Surat', '21.2145387', '72.8398413', 1, 100, '3', 18, 65, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-08 09:01:50', '2023-12-08 09:16:56'),
(41, 41, 0, 1, 'Green Elina Adajan Surat', '21.214542', '72.8398312', 0, 100, '3', 18, 65, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-08 09:33:28', '2023-12-14 09:21:57'),
(42, 42, 0, NULL, NULL, '45.4053099', '8.7845467', 0, NULL, '3', 22, 35, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-10 13:39:56', '2023-12-10 13:39:56'),
(43, 43, 0, NULL, NULL, '45.4053078', '8.7845437', 0, NULL, '3', 22, 32, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-10 14:26:57', '2023-12-10 14:26:57'),
(44, 44, 0, NULL, NULL, '45.4053081', '8.7845435', 0, NULL, '3', 23, 33, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-10 14:47:56', '2023-12-10 14:47:56'),
(45, 45, 0, NULL, NULL, '45.405308', '8.7845434', 0, NULL, '3', 27, 33, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-10 14:54:08', '2023-12-10 14:54:08'),
(46, 46, 0, NULL, NULL, '45.4053096', '8.7845359', 0, NULL, '3', 24, 38, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-10 14:58:08', '2023-12-10 14:58:08'),
(47, 47, 0, NULL, NULL, '45.4053051', '8.7845348', 0, NULL, '3', 22, 30, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-10 15:01:35', '2023-12-10 15:01:35'),
(48, 48, 0, NULL, NULL, '45.4053049', '8.784543', 0, NULL, '3', 21, 32, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-10 15:09:09', '2023-12-10 15:09:09'),
(49, 49, 0, NULL, NULL, '45.4053089', '8.7845374', 0, NULL, '3', 20, 38, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-10 15:13:49', '2023-12-10 15:13:49'),
(50, 50, 0, 2, 'Green Elina Adajan Surat', '45.6969686', '11.4813014', 0, 100, '3', 18, 65, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-11 08:22:39', '2023-12-11 08:38:07'),
(51, 51, 0, NULL, NULL, '21.214539687343716', '72.83977027944044', 0, NULL, '3', 18, 24, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-13 08:49:27', '2023-12-13 08:49:27'),
(52, 52, 0, 1, 'Green Elina Adajan Surat', '21.214542', '72.8398067', 1, 0, '3', 18, 24, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-14 06:50:15', '2024-01-05 16:36:38'),
(53, 53, 0, NULL, NULL, '21.2145279', '72.8398225', 0, NULL, '3', 20, 65, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-14 07:11:07', '2023-12-14 07:11:07'),
(54, 54, 0, 1, 'Green Elina Adajan Surat', '21.2145425', '72.839769', 1, 0, '2', 18, 54, 0, 0, 1, 1, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":1,\"new_message\":1,\"promotions\":1}', 0, NULL, '2023-12-18 07:17:44', '2024-01-02 10:50:22'),
(55, 55, 0, 1, 'Green Elina Adajan Surat', '21.2145003', '72.8398654', 0, 0, '3', 18, 65, 0, 1, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-18 07:27:57', '2023-12-27 17:24:43'),
(56, 56, 0, NULL, NULL, '21.214560903875334', '72.83976620566712', 0, NULL, '3', 18, 40, 1, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-19 10:42:05', '2023-12-19 10:42:05'),
(57, 57, 0, NULL, NULL, '21.21454264324652', '72.83978848826438', 0, NULL, '3', 18, 24, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-19 11:15:13', '2023-12-19 11:15:13'),
(58, 59, 0, NULL, NULL, '39.3127131', '8.5359933', 0, NULL, '3', 18, 35, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-21 10:52:03', '2023-12-21 10:52:03'),
(59, 60, 0, 1, 'Green Elina Adajan Surat', '21.1966157', '72.8607919', 0, 2, '3', 18, 36, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-22 10:25:35', '2023-12-23 18:55:31'),
(60, 61, 0, NULL, NULL, '39.827249766993006', '15.777085732868214', 0, NULL, '3', 18, 65, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-23 22:48:21', '2023-12-23 22:48:21'),
(61, 62, 0, NULL, NULL, '39.902262175506046', '15.776432005335312', 0, NULL, '3', 18, 65, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-24 13:07:57', '2023-12-24 13:07:57'),
(62, 63, 0, 1, 'Green Elina Adajan Surat', '21.2144987', '72.8398529', 1, 100, '3', 18, 65, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2023-12-27 18:04:22', '2023-12-28 15:47:25'),
(63, 64, 0, NULL, 'Green Elina Adajan Surat', '21.190769', '72.794006', 0, NULL, '3', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, '2023-12-29 12:20:58', '2023-12-29 12:20:58'),
(64, 65, 0, NULL, 'Green Elina Adajan Surat', '21.190769', '72.794006', 0, NULL, '3', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, '2024-01-01 13:41:58', '2024-01-01 13:41:58'),
(65, 66, 0, NULL, 'Green Elina Adajan Surat', '21.190769', '72.794006', 0, NULL, '3', NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, '2024-01-01 13:56:17', '2024-01-01 13:56:17'),
(66, 67, 0, NULL, NULL, '37.4219983', '-122.084', 0, NULL, '3', 18, 65, 1, 0, 0, 0, 0, NULL, NULL, 0, NULL, '2024-01-04 17:12:19', '2024-01-04 17:12:19'),
(67, 68, 0, NULL, NULL, '37.4219983', '-122.084', 0, NULL, '3', 18, 65, 1, 0, 0, 0, 0, NULL, NULL, 0, NULL, '2024-01-04 17:51:06', '2024-01-04 17:51:06'),
(68, 69, 0, 1, 'Green Elina Adajan Surat', '37.4219983', '-122.084', 1, 0, '3', 18, 65, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2024-01-04 17:57:29', '2024-01-09 12:14:29'),
(69, 70, 0, 1, 'Green Elina Adajan Surat', '37.4219983', '-122.084', 1, 0, '3', 18, 65, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2024-01-05 12:09:55', '2024-01-05 16:36:28'),
(70, 71, 0, NULL, NULL, '37.4219983', '-122.084', 0, NULL, '3', 18, 65, 1, 0, 0, 0, 0, NULL, NULL, 0, NULL, '2024-01-05 18:49:54', '2024-01-05 18:49:54'),
(71, 72, 0, 1, 'Green Elina Adajan Surat', '37.4219983', '-122.084', 0, 100, '3', 18, 65, 0, 0, 0, 0, 0, '{\"new_matches\":0,\"message\":0,\"message_likes\":0,\"super_likes\":0,\"top_packs\":0}', '{\"new_matches\":0,\"new_message\":0,\"promotions\":0}', 0, NULL, '2024-01-09 12:39:46', '2024-01-09 12:45:12'),
(72, 73, 0, NULL, NULL, '37.4219983', '-122.084', 0, NULL, '3', 18, 65, 1, 0, 0, 0, 0, NULL, NULL, 0, NULL, '2024-01-09 12:43:42', '2024-01-09 12:43:42'),
(73, 74, 0, NULL, NULL, '21.2144883', '72.8398522', 0, NULL, '3', 18, 65, 1, 0, 0, 0, 0, NULL, NULL, 0, NULL, '2024-01-11 14:09:35', '2024-01-11 14:09:35'),
(74, 75, 0, NULL, NULL, '37.4219983', '-122.084', 0, NULL, '3', 18, 24, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, '2024-01-11 10:06:51', '2024-01-11 10:06:51'),
(75, 76, 0, NULL, NULL, '37.4219983', '-122.084', 0, NULL, '3', 18, 24, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, '2024-01-11 10:15:37', '2024-01-11 10:15:37');

-- --------------------------------------------------------

--
-- Table structure for table `verification_request`
--

CREATE TABLE `verification_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `document` varchar(555) DEFAULT NULL,
  `document_type` varchar(255) DEFAULT NULL,
  `selfie` varchar(555) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending 1=approved',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_notification`
--
ALTER TABLE `admin_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `admob`
--
ALTER TABLE `admob`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appdata`
--
ALTER TABLE `appdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `block_users`
--
ALTER TABLE `block_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diamond_packs`
--
ALTER TABLE `diamond_packs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gifts`
--
ALTER TABLE `gifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `know_languages`
--
ALTER TABLE `know_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_application`
--
ALTER TABLE `live_application`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_foreign` (`user_id`);

--
-- Indexes for table `live_history`
--
ALTER TABLE `live_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_live_history_const` (`user_id`);

--
-- Indexes for table `lookings`
--
ALTER TABLE `lookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `personal_questions`
--
ALTER TABLE `personal_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_subscriptions`
--
ALTER TABLE `plan_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_usages`
--
ALTER TABLE `plan_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `redeem_requests`
--
ALTER TABLE `redeem_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_redeem_request` (`user_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sexual_orientations`
--
ALTER TABLE `sexual_orientations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stripe_customers`
--
ALTER TABLE `stripe_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `swipe_counts`
--
ALTER TABLE `swipe_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_of_relationships`
--
ALTER TABLE `type_of_relationships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notification`
--
ALTER TABLE `user_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verification_request`
--
ALTER TABLE `verification_request`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_notification`
--
ALTER TABLE `admin_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admob`
--
ALTER TABLE `admob`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `appdata`
--
ALTER TABLE `appdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `block_users`
--
ALTER TABLE `block_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `diamond_packs`
--
ALTER TABLE `diamond_packs`
  MODIFY `id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gifts`
--
ALTER TABLE `gifts`
  MODIFY `id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `interests`
--
ALTER TABLE `interests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `know_languages`
--
ALTER TABLE `know_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `live_application`
--
ALTER TABLE `live_application`
  MODIFY `id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_history`
--
ALTER TABLE `live_history`
  MODIFY `id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lookings`
--
ALTER TABLE `lookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_questions`
--
ALTER TABLE `personal_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `plan_subscriptions`
--
ALTER TABLE `plan_subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `plan_usages`
--
ALTER TABLE `plan_usages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `redeem_requests`
--
ALTER TABLE `redeem_requests`
  MODIFY `id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sexual_orientations`
--
ALTER TABLE `sexual_orientations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `stripe_customers`
--
ALTER TABLE `stripe_customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `swipe_counts`
--
ALTER TABLE `swipe_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `type_of_relationships`
--
ALTER TABLE `type_of_relationships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `user_notification`
--
ALTER TABLE `user_notification`
  MODIFY `id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `user_settings`
--
ALTER TABLE `user_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `verification_request`
--
ALTER TABLE `verification_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `live_application`
--
ALTER TABLE `live_application`
  ADD CONSTRAINT `user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `redeem_requests`
--
ALTER TABLE `redeem_requests`
  ADD CONSTRAINT `user_id_redeem_request` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
