-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 09 nov. 2024 à 09:40
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `producteurmanagement_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `code_producteur` varchar(50) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `secteur` varchar(100) NOT NULL,
  `rib` varchar(30) DEFAULT NULL,
  `nom_banque` varchar(100) DEFAULT NULL,
  `code_guichet` varchar(20) DEFAULT NULL,
  `numero_de_compte` varchar(30) DEFAULT NULL,
  `cle_rib` varchar(10) DEFAULT NULL,
  `mobile_money_choice` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `payment`
--

INSERT INTO `payment` (`id`, `code_producteur`, `nom`, `prenom`, `secteur`, `rib`, `nom_banque`, `code_guichet`, `numero_de_compte`, `cle_rib`, `mobile_money_choice`, `phone`) VALUES
(1, '2046506', 'TRUTRURTU', 'TUTRU', '', '58546464', '95iujnug', 'byuu549', '5444464', '6419684984', 'wave', '6194949'),
(2, '5082712', 'SDGFSDGSD', 'GSDGSDG', '', '58546464', 'dwsqsdfq', 'fdqsf', '64948', '57464', 'wave', '6654'),
(3, '3022694', 'SDGSD', 'GSDFGSDGF', '', '58546464', 'sqdfsqdf', 'qsdfsqdfqsf', '9594894', '9545', 'wave', 'sdfsdqfdqsf'),
(4, '2046506', 'TRUTRURTU', 'TUTRU', '', 'sqfqsfqsf', '899498878', '447', '9849498', '98494', 'wave', '94894'),
(5, '2046506', 'TRUTRURTU', 'TUTRU', '', 'dfsdfgfdqsg', 'dfgdsfgdsgds', 'gdsgdsg', '98494', '4894894', 'wave', '858974'),
(6, '2046506', 'TRUTRURTU', 'TUTRU', '', 'qsdqsd', 'qsdsqfd', 'qsfqsfqs', '4898484', '89849', 'wave', '4949844'),
(7, 'fggfdsgdg', 'TRUTRURTU', 'TUTRU', '', 'qsdqsd', 'qsdsqfd', 'qsfqsfqs', '4898484', '89849', 'wave', '4949844'),
(8, 'dsfgdsfgdsg', 'TRUTRURTU', 'TUTRU', '', 'qsdqsd', 'dsfgdsg', 'qsfqsfqs', '4898484', '89849', 'wave', '4949844');

-- --------------------------------------------------------

--
-- Structure de la table `tbl_events`
--

CREATE TABLE `tbl_events` (
  `event_id` int(11) NOT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  `event_description` varchar(255) DEFAULT NULL,
  `event_source_IP` varchar(255) DEFAULT NULL,
  `event_source_UA` varchar(255) DEFAULT NULL,
  `event_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `actor_id` int(11) DEFAULT NULL,
  `actor_name` varchar(255) DEFAULT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `tbl_events`
--

INSERT INTO `tbl_events` (`event_id`, `event_type`, `event_description`, `event_source_IP`, `event_source_UA`, `event_status`, `created_at`, `actor_id`, `actor_name`, `subject_type`, `subject_id`, `subject_name`) VALUES
(1, 'Consultation', 'Michel a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-20 22:06:44', 19, 'Michel', 'Secteur', NULL, 'N/A'),
(2, 'Consultation', 'Michel a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-20 22:06:46', 19, 'Michel', 'Producteur', NULL, 'N/A'),
(3, 'Consultation', 'Michel a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-20 22:06:49', 19, 'Michel', 'Producteur', NULL, 'N/A'),
(4, 'Génération Carte', 'Michel a généré la carte du producteur N°9 - BOAMAN  ADONY LUCIEN MARTIAL ', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-20 22:06:58', 19, 'Michel', 'Producteur', 9, 'BOAMAN  ADONY LUCIEN MARTIAL '),
(5, 'Consultation', 'Michel a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-20 22:09:05', 19, 'Michel', 'Producteur', NULL, 'N/A'),
(6, 'Consultation', 'Michel a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-20 22:09:41', 19, 'Michel', 'Producteur', NULL, 'N/A'),
(7, 'Consultation', 'Michel a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-20 22:09:50', 19, 'Michel', 'Producteur', NULL, 'N/A'),
(8, 'Consultation', 'Michel a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-20 22:09:57', 19, 'Michel', 'Producteur', NULL, 'N/A'),
(9, 'Consultation', 'Michel a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-20 22:10:45', 19, 'Michel', 'Producteur', NULL, 'N/A'),
(10, 'Consultation', 'Michel a consulté le producteur N°2 - FADIKA MALICK', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-20 22:10:54', 19, 'Michel', 'Producteur', 2, 'FADIKA MALICK'),
(11, 'Génération Fiche', 'Michel a généré la fiche du producteur N°2 - FADIKA MALICK', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-20 22:10:59', 19, 'Michel', 'Producteur', 2, 'FADIKA MALICK'),
(12, 'Consultation', 'Michel a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-20 22:11:32', 19, 'Michel', 'Producteur', NULL, 'N/A'),
(13, 'Consultation', 'Faizan a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:20:24', 1, 'Faizan', 'Secteur', NULL, 'N/A'),
(14, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:20:26', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(15, 'Consultation', 'Faizan a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:20:28', 1, 'Faizan', 'Secteur', NULL, 'N/A'),
(16, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:21:03', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(17, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:21:04', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(18, 'Consultation', 'Faizan a consulté le producteur N°2 - FADIKA MALICK', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:25:12', 1, 'Faizan', 'Producteur', 2, 'FADIKA MALICK'),
(19, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:25:25', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(20, 'Modification', 'Faizan a modifié le producteur N°2 - FADIKA MALICK', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:25:36', 1, 'Faizan', 'Producteur', 2, 'FADIKA MALICK'),
(21, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:25:36', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(22, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:25:42', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(23, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:25:57', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(24, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:26:10', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(25, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:26:11', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(26, 'Suppression', 'Faizan a supprimé le producteur N°12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:26:15', 1, 'Faizan', 'Producteur', 12, 'N/A'),
(27, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:26:17', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(28, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:33:41', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(29, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:33:44', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(30, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:33:45', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(31, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:34:19', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(32, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:46:44', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(33, 'Consultation', 'Faizan a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:46:46', 1, 'Faizan', 'Secteur', NULL, 'N/A'),
(34, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:46:47', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(35, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:46:47', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(36, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:46:49', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(37, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:06:18', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(38, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:26:08', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(39, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:27:31', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(40, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:34:01', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(41, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:34:02', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(42, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:34:06', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(43, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:34:08', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(44, 'Consultation', 'Faizan a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:34:32', 1, 'Faizan', 'Secteur', NULL, 'N/A'),
(45, 'Consultation', 'Faizan a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:35:34', 1, 'Faizan', 'Secteur', NULL, 'N/A'),
(46, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:35:37', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(47, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:35:46', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(48, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:35:48', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(49, 'Consultation', 'Faizan a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:35:50', 1, 'Faizan', 'Utilisateur', NULL, NULL),
(50, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:35:59', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(51, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:36:02', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(52, 'Consultation', 'Faizan a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:36:36', 1, 'Faizan', 'Secteur', NULL, 'N/A'),
(53, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:38:58', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(54, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:41:02', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(55, 'Consultation', 'Faizan a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:41:06', 1, 'Faizan', 'Secteur', NULL, 'N/A'),
(56, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:41:20', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(57, 'Consultation', 'Faizan a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:42:11', 1, 'Faizan', 'Secteur', NULL, 'N/A'),
(58, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:44:19', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(59, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 16:51:24', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(60, 'Consultation', 'Faizan a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 17:15:25', 1, 'Faizan', 'Utilisateur', NULL, NULL),
(61, 'Consultation', 'Faizan a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 17:15:29', 1, 'Faizan', 'Utilisateur', NULL, NULL),
(62, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 17:35:43', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(63, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 17:35:51', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(64, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 17:35:57', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(65, 'Consultation', 'Faizan a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 17:39:34', 1, 'Faizan', 'Utilisateur', NULL, NULL),
(66, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 17:46:29', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(67, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 17:46:31', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(68, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 17:46:34', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(69, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 17:46:37', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(70, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 17:46:42', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(71, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:00:14', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(72, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:00:17', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(73, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:01:29', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(74, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:02:02', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(75, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:02:05', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(76, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:02:14', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(77, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:02:53', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(78, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:02:54', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(79, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:03:06', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(80, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:03:06', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(81, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:03:20', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(82, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:03:20', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(83, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:03:28', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(84, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:03:28', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(85, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:03:31', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(86, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:03:31', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(87, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:03:31', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(88, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:03:31', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(89, 'Consultation', 'Faizan a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:03:46', 1, 'Faizan', 'Utilisateur', NULL, NULL),
(90, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:03:47', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(91, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:03:49', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(92, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:04:03', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(93, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:04:48', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(94, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:06:20', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(95, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:06:59', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(96, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:07:00', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(97, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:07:33', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(98, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:07:34', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(99, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:14:40', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(100, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:29:20', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(101, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 22:36:41', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(102, 'Création', 'Faizan a créé le producteur N°60 - DSGFSDGFSDG DFSGSDG', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:10:13', 1, 'Faizan', 'Producteur', 60, 'DSGFSDGFSDG DFSGSDG'),
(103, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:10:15', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(104, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:10:21', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(105, 'Consultation', 'Faizan a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:10:38', 1, 'Faizan', 'Utilisateur', NULL, NULL),
(106, 'Déconnexion', 'Faizan s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:10:42', 1, 'Faizan', 'Connexion', NULL, NULL),
(107, 'Connexion', 'test s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:11:01', 14, 'test', 'Connexion', NULL, NULL),
(108, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:11:11', 14, 'test', 'Producteur', NULL, 'N/A'),
(109, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:11:14', 14, 'test', 'Producteur', NULL, 'N/A'),
(110, 'Consultation', 'test a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:11:18', 14, 'test', 'Utilisateur', NULL, NULL),
(111, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:11:19', 14, 'test', 'Producteur', NULL, 'N/A'),
(112, 'Consultation', 'test a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:17:04', 14, 'test', 'Utilisateur', NULL, NULL),
(113, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:17:05', 14, 'test', 'Producteur', NULL, 'N/A'),
(114, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:19:42', 14, 'test', 'Producteur', NULL, 'N/A'),
(115, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:19:47', 14, 'test', 'Producteur', NULL, 'N/A'),
(116, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:20:51', 14, 'test', 'Producteur', NULL, 'N/A'),
(117, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:20:56', 14, 'test', 'Producteur', NULL, 'N/A'),
(118, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:21:26', 14, 'test', 'Producteur', NULL, 'N/A'),
(119, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:21:28', 14, 'test', 'Producteur', NULL, 'N/A'),
(120, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:21:35', 14, 'test', 'Producteur', NULL, 'N/A'),
(121, 'Consultation', 'test a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:22:49', 14, 'test', 'Utilisateur', NULL, NULL),
(122, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:22:50', 14, 'test', 'Producteur', NULL, 'N/A'),
(123, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:23:00', 14, 'test', 'Producteur', NULL, 'N/A'),
(124, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:23:08', 14, 'test', 'Producteur', NULL, 'N/A'),
(125, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:23:11', 14, 'test', 'Producteur', NULL, 'N/A'),
(126, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:23:12', 14, 'test', 'Producteur', NULL, 'N/A'),
(127, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:23:14', 14, 'test', 'Producteur', NULL, 'N/A'),
(128, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:23:19', 14, 'test', 'Producteur', NULL, 'N/A'),
(129, 'Consultation', 'test a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:23:22', 14, 'test', 'Utilisateur', NULL, NULL),
(130, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:23:24', 14, 'test', 'Producteur', NULL, 'N/A'),
(131, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:23:28', 14, 'test', 'Producteur', NULL, 'N/A'),
(132, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:23:31', 14, 'test', 'Producteur', NULL, 'N/A'),
(133, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:24:04', 14, 'test', 'Producteur', NULL, 'N/A'),
(134, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:24:06', 14, 'test', 'Producteur', NULL, 'N/A'),
(135, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:24:06', 14, 'test', 'Producteur', NULL, 'N/A'),
(136, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:24:22', 14, 'test', 'Producteur', NULL, 'N/A'),
(137, 'Consultation', 'test a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:26:23', 14, 'test', 'Secteur', NULL, 'N/A'),
(138, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:26:28', 14, 'test', 'Producteur', NULL, 'N/A'),
(139, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:26:29', 14, 'test', 'Producteur', NULL, 'N/A'),
(140, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:26:32', 14, 'test', 'Producteur', NULL, 'N/A'),
(141, 'Consultation', 'test a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:26:32', 14, 'test', 'Utilisateur', NULL, NULL),
(142, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:26:33', 14, 'test', 'Producteur', NULL, 'N/A'),
(143, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:26:34', 14, 'test', 'Producteur', NULL, 'N/A'),
(144, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:26:36', 14, 'test', 'Producteur', NULL, 'N/A'),
(145, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:26:38', 14, 'test', 'Producteur', NULL, 'N/A'),
(146, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:26:40', 14, 'test', 'Producteur', NULL, 'N/A'),
(147, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:26:42', 14, 'test', 'Producteur', NULL, 'N/A'),
(148, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:26:43', 14, 'test', 'Producteur', NULL, 'N/A'),
(149, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:26:47', 14, 'test', 'Producteur', NULL, 'N/A'),
(150, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:26:54', 14, 'test', 'Producteur', NULL, 'N/A'),
(151, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:26:58', 14, 'test', 'Producteur', NULL, 'N/A'),
(152, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:27:02', 14, 'test', 'Producteur', NULL, 'N/A'),
(153, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:43:21', 14, 'test', 'Producteur', NULL, 'N/A'),
(154, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:43:22', 14, 'test', 'Producteur', NULL, 'N/A'),
(155, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:44:48', 14, 'test', 'Producteur', NULL, 'N/A'),
(156, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:44:53', 14, 'test', 'Producteur', NULL, 'N/A'),
(157, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:44:56', 14, 'test', 'Producteur', NULL, 'N/A'),
(158, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:44:57', 14, 'test', 'Producteur', NULL, 'N/A'),
(159, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:44:59', 14, 'test', 'Producteur', NULL, 'N/A'),
(160, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:45:01', 14, 'test', 'Producteur', NULL, 'N/A'),
(161, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:45:05', 14, 'test', 'Producteur', NULL, 'N/A'),
(162, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:45:16', 14, 'test', 'Producteur', NULL, 'N/A'),
(163, 'Consultation', 'test a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:46:07', 14, 'test', 'Utilisateur', NULL, NULL),
(164, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:46:08', 14, 'test', 'Producteur', NULL, 'N/A'),
(165, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:46:13', 14, 'test', 'Producteur', NULL, 'N/A'),
(166, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:47:58', 14, 'test', 'Producteur', NULL, 'N/A'),
(167, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:48:02', 14, 'test', 'Producteur', NULL, 'N/A'),
(168, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:48:13', 14, 'test', 'Producteur', NULL, 'N/A'),
(169, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:48:14', 14, 'test', 'Producteur', NULL, 'N/A'),
(170, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:48:16', 14, 'test', 'Producteur', NULL, 'N/A'),
(171, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:49:59', 14, 'test', 'Producteur', NULL, 'N/A'),
(172, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:50:03', 14, 'test', 'Producteur', NULL, 'N/A'),
(173, 'Déconnexion', 'test s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:50:45', 14, 'test', 'Connexion', NULL, NULL),
(174, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:50:52', 1, 'Faizan', 'Connexion', NULL, NULL),
(175, 'Consultation', 'Faizan a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:50:58', 1, 'Faizan', 'Secteur', NULL, 'N/A'),
(176, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:51:03', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(177, 'Consultation', 'Faizan a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:51:04', 1, 'Faizan', 'Utilisateur', NULL, NULL),
(178, 'Déconnexion', 'Faizan s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:51:05', 1, 'Faizan', 'Connexion', NULL, NULL),
(179, 'Connexion', 'test s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:51:13', 14, 'test', 'Connexion', NULL, NULL),
(180, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:51:23', 14, 'test', 'Producteur', NULL, 'N/A'),
(181, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:56:03', 14, 'test', 'Producteur', NULL, 'N/A'),
(182, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:57:56', 14, 'test', 'Producteur', NULL, 'N/A'),
(183, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:58:27', 14, 'test', 'Producteur', NULL, 'N/A'),
(184, 'Consultation', 'test a consulté le producteur N°26 - TRUTRURTU TUTRU', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:58:29', 14, 'test', 'Producteur', 26, 'TRUTRURTU TUTRU'),
(185, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:58:30', 14, 'test', 'Producteur', NULL, 'N/A'),
(186, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:59:07', 14, 'test', 'Producteur', NULL, 'N/A'),
(187, 'Consultation', 'test a consulté le producteur N°26 - TRUTRURTU TUTRU', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:59:09', 14, 'test', 'Producteur', 26, 'TRUTRURTU TUTRU'),
(188, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 23:59:10', 14, 'test', 'Producteur', NULL, 'N/A'),
(189, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:00:40', 14, 'test', 'Producteur', NULL, 'N/A'),
(190, 'Consultation', 'test a consulté le producteur N°26 - TRUTRURTU TUTRU', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:00:41', 14, 'test', 'Producteur', 26, 'TRUTRURTU TUTRU'),
(191, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:00:43', 14, 'test', 'Producteur', NULL, 'N/A');
INSERT INTO `tbl_events` (`event_id`, `event_type`, `event_description`, `event_source_IP`, `event_source_UA`, `event_status`, `created_at`, `actor_id`, `actor_name`, `subject_type`, `subject_id`, `subject_name`) VALUES
(192, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:01:40', 14, 'test', 'Producteur', NULL, 'N/A'),
(193, 'Consultation', 'test a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:11:28', 14, 'test', 'Utilisateur', NULL, NULL),
(194, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:11:48', 14, 'test', 'Producteur', NULL, 'N/A'),
(195, 'Déconnexion', 'test s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:11:51', 14, 'test', 'Connexion', NULL, NULL),
(196, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:11:56', 1, 'Faizan', 'Connexion', NULL, NULL),
(197, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:12:01', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(198, 'Déconnexion', 'Faizan s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:12:23', 1, 'Faizan', 'Connexion', NULL, NULL),
(199, 'Connexion', 'test s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:12:29', 14, 'test', 'Connexion', NULL, NULL),
(200, 'Consultation', 'test a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:15:01', 14, 'test', 'Utilisateur', NULL, NULL),
(201, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:15:07', 14, 'test', 'Producteur', NULL, 'N/A'),
(202, 'Déconnexion', 'test s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:15:10', 14, 'test', 'Connexion', NULL, NULL),
(203, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:15:13', 1, 'Faizan', 'Connexion', NULL, NULL),
(204, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:15:24', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(205, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:22:40', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(206, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:22:47', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(207, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:24:43', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(208, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:25:04', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(209, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:25:21', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(210, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:25:22', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(211, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:25:38', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(212, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:25:39', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(213, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:27:17', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(214, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:27:18', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(215, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:27:20', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(216, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:27:40', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(217, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:27:41', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(218, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:28:05', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(219, 'Consultation', 'Faizan a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:28:06', 1, 'Faizan', 'Utilisateur', NULL, NULL),
(220, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:28:06', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(221, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:28:48', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(222, 'Modification', 'Faizan a modifié le producteur N°26 - TRUTRURTU TUTRU', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:29:03', 1, 'test', 'Producteur', 26, 'TRUTRURTU TUTRU'),
(223, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:29:03', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(224, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 00:38:00', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(225, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:05:05', 1, 'Faizan', 'Connexion', NULL, NULL),
(226, 'Déconnexion', 'Faizan s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:05:16', 1, 'Faizan', 'Connexion', NULL, NULL),
(227, 'Connexion', 'test s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:05:20', 14, 'test', 'Connexion', NULL, NULL),
(228, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:14:57', 14, 'test', 'Producteur', NULL, 'N/A'),
(229, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:17:55', 14, 'test', 'Producteur', NULL, 'N/A'),
(230, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:19:39', 14, 'test', 'Producteur', NULL, 'N/A'),
(231, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:20:51', 14, 'test', 'Producteur', NULL, 'N/A'),
(232, 'Consultation', 'test a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:21:38', 14, 'test', 'Utilisateur', NULL, NULL),
(233, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:25:31', 14, 'test', 'Producteur', NULL, 'N/A'),
(234, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:25:37', 14, 'test', 'Producteur', NULL, 'N/A'),
(235, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:26:35', 14, 'test', 'Producteur', NULL, 'N/A'),
(236, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:26:38', 14, 'test', 'Producteur', NULL, 'N/A'),
(237, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:27:06', 14, 'test', 'Producteur', NULL, 'N/A'),
(238, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:27:07', 14, 'test', 'Producteur', NULL, 'N/A'),
(239, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:27:10', 14, 'test', 'Producteur', NULL, 'N/A'),
(240, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:28:03', 14, 'test', 'Producteur', NULL, 'N/A'),
(241, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:53:11', 14, 'test', 'Producteur', NULL, 'N/A'),
(242, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:53:19', 14, 'test', 'Producteur', NULL, 'N/A'),
(243, 'Consultation', 'test a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:53:19', 14, 'test', 'Utilisateur', NULL, NULL),
(244, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:53:22', 14, 'test', 'Producteur', NULL, 'N/A'),
(245, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:53:23', 14, 'test', 'Producteur', NULL, 'N/A'),
(246, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 10:56:27', 14, 'test', 'Producteur', NULL, 'N/A'),
(247, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:19:55', 14, 'test', 'Producteur', NULL, 'N/A'),
(248, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:19:59', 14, 'test', 'Producteur', NULL, 'N/A'),
(249, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:20:10', 14, 'test', 'Producteur', NULL, 'N/A'),
(250, 'Consultation', 'test a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:20:11', 14, 'test', 'Utilisateur', NULL, NULL),
(251, 'Consultation', 'test a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:20:14', 14, 'test', 'Producteur', NULL, 'N/A'),
(252, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:20:23', 14, 'test', 'Producteur', NULL, 'N/A'),
(253, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:20:31', 14, 'test', 'Producteur', NULL, 'N/A'),
(254, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:20:44', 14, 'test', 'Producteur', NULL, 'N/A'),
(255, 'Consultation', 'test a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:20:57', 14, 'test', 'Producteur', NULL, 'N/A'),
(256, 'Déconnexion', 'test s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:21:28', 14, 'test', 'Connexion', NULL, NULL),
(257, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:21:31', 1, 'Faizan', 'Connexion', NULL, NULL),
(258, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:21:36', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(259, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:21:46', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(260, 'Consultation', 'Faizan a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:21:53', 1, 'Faizan', 'Utilisateur', NULL, NULL),
(261, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:21:59', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(262, 'Consultation', 'Faizan a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:22:15', 1, 'Faizan', 'Utilisateur', NULL, NULL),
(263, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:22:16', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(264, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:22:42', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(265, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:14', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(266, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:18', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(267, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:19', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(268, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:21', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(269, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:23', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(270, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:24', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(271, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:26', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(272, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:27', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(273, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:29', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(274, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:32', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(275, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:36', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(276, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:38', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(277, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:39', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(278, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:40', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(279, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:42', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(280, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:46', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(281, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:48', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(282, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 12:23:50', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(283, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 18:11:07', 1, 'Faizan', 'Connexion', NULL, NULL),
(284, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 18:11:12', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(285, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 18:49:02', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(286, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 18:49:30', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(287, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 18:49:43', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(288, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 18:50:45', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(289, 'Création', 'Faizan a créé le producteur N°61 - QSFQSFQSF QSFQS', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 18:56:59', 1, 'Faizan', 'Producteur', 61, 'QSFQSFQSF QSFQS'),
(290, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 18:57:00', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(291, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 18:57:23', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(292, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 18:58:42', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(293, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 18:58:50', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(294, 'Consultation', 'Faizan a consulté le producteur N°61 - QSFQSFQSF QSFQS', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 18:59:03', 1, 'Faizan', 'Producteur', 61, 'QSFQSFQSF QSFQS'),
(295, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 18:59:11', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(296, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 19:00:23', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(297, 'Modification', 'Faizan a modifié le producteur N°61 - QSFQSFQSF QSFQS', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 19:01:31', 1, 'Faizan', 'Producteur', 61, 'QSFQSFQSF QSFQS'),
(298, 'Modification', 'Faizan a modifié le producteur N°61 - QSFQSFQSF QSFQS', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 19:01:58', 1, 'Faizan', 'Producteur', 61, 'QSFQSFQSF QSFQS'),
(299, 'Modification', 'Faizan a modifié le producteur N°61 - QSFQSFQSF QSFQS', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 19:02:08', 1, 'Faizan', 'Producteur', 61, 'QSFQSFQSF QSFQS'),
(300, 'Modification', 'Faizan a modifié le producteur N°61 - QSFQSFQSF QSFQS', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 19:04:02', 1, 'Faizan', 'Producteur', 61, 'QSFQSFQSF QSFQS'),
(301, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 19:04:02', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(302, 'Consultation', 'Faizan a consulté le producteur N°61 - QSFQSFQSF QSFQS', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-07 19:04:13', 1, 'Faizan', 'Producteur', 61, 'QSFQSFQSF QSFQS'),
(303, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 07:20:02', 1, 'Faizan', 'Connexion', NULL, NULL),
(304, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 07:37:56', 1, 'Faizan', 'Connexion', NULL, NULL),
(305, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 07:48:20', 1, 'Faizan', 'Connexion', NULL, NULL),
(306, 'Déconnexion', 'Faizan s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 07:55:16', 1, 'Faizan', 'Connexion', NULL, NULL),
(307, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 08:05:06', 1, 'Faizan', 'Connexion', NULL, NULL),
(308, 'Déconnexion', ' s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 08:11:02', NULL, NULL, 'Connexion', NULL, NULL),
(309, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 08:11:03', 1, 'Faizan', 'Connexion', NULL, NULL),
(310, 'Déconnexion', ' s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 08:14:02', NULL, NULL, 'Connexion', NULL, NULL),
(311, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 08:14:03', 1, 'Faizan', 'Connexion', NULL, NULL),
(312, 'Création', 'Faizan a créé le producteur N°62 - DGSD SDGSDFG', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 08:14:52', 1, 'Faizan', 'Producteur', 62, 'DGSD SDGSDFG'),
(313, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 08:14:54', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(314, 'Consultation', 'Faizan a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 08:18:26', 1, 'Faizan', 'Secteur', NULL, 'N/A'),
(315, 'Déconnexion', ' s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 08:26:05', NULL, NULL, 'Connexion', NULL, NULL),
(316, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 08:26:06', 1, 'Faizan', 'Connexion', NULL, NULL),
(317, 'Déconnexion', ' s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 08:41:34', NULL, NULL, 'Connexion', NULL, NULL),
(318, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 08:41:35', 1, 'Faizan', 'Connexion', NULL, NULL),
(319, 'Creation', 'Faizan created producer No. 63 - FDHDFGH HGDFGHD', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Success', '2024-11-08 08:50:02', 1, 'Faizan', 'Producer', 63, 'FDHDFGH HGDFGHD'),
(320, 'Creation', 'Faizan created producer No. 64 - FDHDFGH HGDFGHD', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Success', '2024-11-08 08:51:19', 1, 'Faizan', 'Producer', 64, 'FDHDFGH HGDFGHD'),
(321, 'Déconnexion', ' s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 08:56:25', NULL, NULL, 'Connexion', NULL, NULL),
(322, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 08:56:26', 1, 'Faizan', 'Connexion', NULL, NULL),
(323, 'Création', 'Faizan a créé le producteur N°65 - SQFSQ SQDFQSF', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 08:57:42', 1, 'Faizan', 'Producteur', 65, 'SQFSQ SQDFQSF'),
(324, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 08:57:43', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(325, 'Creation', 'Faizan created producer No. 66 - FQSF QSFQS', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Success', '2024-11-08 08:58:48', 1, 'Faizan', 'Producer', 66, 'FQSF QSFQS'),
(326, 'Creation', 'Faizan created producer No. 67 - FQSF QSFQS', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Success', '2024-11-08 09:10:12', 1, 'Faizan', 'Producer', 67, 'FQSF QSFQS'),
(327, 'Creation', 'Faizan created producer No. 68 - FQSF QSFQS', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Success', '2024-11-08 09:11:38', 1, 'Faizan', 'Producer', 68, 'FQSF QSFQS'),
(328, 'Consultation', 'Faizan a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:12:30', 1, 'Faizan', 'Secteur', NULL, 'N/A'),
(329, 'Consultation', ' a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:13:14', NULL, NULL, 'Secteur', NULL, 'N/A'),
(330, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:13:16', 1, 'Faizan', 'Connexion', NULL, NULL),
(331, 'Consultation', 'Faizan a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:25:26', 1, 'Faizan', 'Secteur', NULL, 'N/A'),
(332, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:34:55', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(333, 'Déconnexion', ' s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:37:24', NULL, NULL, 'Connexion', NULL, NULL),
(334, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:37:26', 1, 'Faizan', 'Connexion', NULL, NULL),
(335, 'Consultation', 'Faizan a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:37:44', 1, 'Faizan', 'Secteur', NULL, 'N/A'),
(336, 'Déconnexion', ' s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:40:01', NULL, NULL, 'Connexion', NULL, NULL),
(337, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:40:03', 1, 'Faizan', 'Connexion', NULL, NULL),
(338, 'Consultation', 'Faizan a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:41:49', 1, 'Faizan', 'Secteur', NULL, 'N/A'),
(339, 'Déconnexion', ' s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:43:14', NULL, NULL, 'Connexion', NULL, NULL),
(340, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:43:15', 1, 'Faizan', 'Connexion', NULL, NULL),
(341, 'Déconnexion', ' s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:45:53', NULL, NULL, 'Connexion', NULL, NULL),
(342, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:45:54', 1, 'Faizan', 'Connexion', NULL, NULL),
(343, 'Déconnexion', ' s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:47:24', NULL, NULL, 'Connexion', NULL, NULL),
(344, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 09:47:25', 1, 'Faizan', 'Connexion', NULL, NULL),
(345, 'Déconnexion', ' s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:25:49', NULL, NULL, 'Connexion', NULL, NULL),
(346, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:25:50', 1, 'Faizan', 'Connexion', NULL, NULL),
(347, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:28:16', 1, 'Faizan', 'Connexion', NULL, NULL),
(348, 'Consultation', 'Faizan a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:28:43', 1, 'Faizan', 'Secteur', NULL, 'N/A'),
(349, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:30:15', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(350, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:30:17', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(351, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:30:30', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(352, 'Consultation', 'Faizan a consulté la liste des utilisateurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:30:31', 1, 'Faizan', 'Utilisateur', NULL, NULL),
(353, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:30:32', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(354, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:30:57', 1, 'Faizan', 'Connexion', NULL, NULL),
(355, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:31:03', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(356, 'Creation', 'Faizan created producer No. 69 - QSFQSFQSDF QSFDQSFQSF', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Success', '2024-11-08 10:33:00', 1, 'Faizan', 'Producer', 69, 'QSFQSFQSDF QSFDQSFQSF'),
(357, 'Déconnexion', ' s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:34:56', NULL, NULL, 'Connexion', NULL, NULL),
(358, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:34:57', 1, 'Faizan', 'Connexion', NULL, NULL),
(359, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:35:23', 1, 'Faizan', 'Connexion', NULL, NULL),
(360, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:39:03', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(361, 'Déconnexion', ' s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:45:07', NULL, NULL, 'Connexion', NULL, NULL),
(362, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:45:08', 1, 'Faizan', 'Connexion', NULL, NULL),
(363, 'Déconnexion', ' s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:52:26', NULL, NULL, 'Connexion', NULL, NULL),
(364, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:52:29', 1, 'Faizan', 'Connexion', NULL, NULL),
(365, 'Consultation', 'Faizan a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:52:33', 1, 'Faizan', 'Producteur', NULL, 'N/A'),
(366, 'Déconnexion', 'Faizan s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:55:33', 1, 'Faizan', 'Connexion', NULL, NULL),
(367, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:55:34', 1, 'Faizan', 'Connexion', NULL, NULL),
(368, 'Déconnexion', ' s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:55:41', NULL, NULL, 'Connexion', NULL, NULL),
(369, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:55:43', 1, 'Faizan', 'Connexion', NULL, NULL),
(370, 'Déconnexion', ' s\'est déconnecté', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:55:47', NULL, NULL, 'Connexion', NULL, NULL),
(371, 'Connexion', 'Faizan s\'est connecté avec succès', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-08 10:55:48', 1, 'Faizan', 'Connexion', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `tbl_invoice`
--

CREATE TABLE `tbl_invoice` (
  `invoice_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `subtotal` double NOT NULL,
  `discount` double NOT NULL,
  `sgst` float NOT NULL,
  `cgst` float NOT NULL,
  `total` double NOT NULL,
  `payment_type` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `due` double NOT NULL,
  `paid` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tbl_invoice`
--

INSERT INTO `tbl_invoice` (`invoice_id`, `order_date`, `subtotal`, `discount`, `sgst`, `cgst`, `total`, `payment_type`, `due`, `paid`) VALUES
(2, '2023-02-21', 425, 2, 2.5, 2.5, 437.75, 'Card', -62.25, 500),
(3, '2023-03-05', 0, 2, 2.5, 2.5, 0, 'Cash', 0, 0),
(4, '2023-02-21', 1045, 2, 2.5, 2.5, 1076.35, 'Check', 23.65, 1100),
(5, '2023-03-01', 185, 2, 2.5, 2.5, 190.55, 'Cash', -9.45, 200),
(6, '2023-03-02', 1220, 2, 2.5, 2.5, 1256.6, 'Card', 0, 1256.6),
(7, '2023-03-02', 22550, 2, 2.5, 2.5, 23226.5, 'Check', 0, 23226.5),
(8, '2023-03-02', 1000, 2, 2.5, 2.5, 1030, 'Card', 0, 1030),
(9, '2023-03-02', 22300, 2, 2.5, 2.5, 22969, 'Check', 0, 22969),
(10, '2023-03-02', 680, 2, 2.5, 2.5, 700.4, 'Cash', -9.6, 710),
(11, '2023-03-02', 200, 2, 2.5, 2.5, 206, 'Cash', -14, 220),
(12, '2023-03-02', 25, 2, 2.5, 2.5, 25.75, 'Cash', -4.25, 30),
(13, '2023-03-02', 800, 2, 2.5, 2.5, 824, 'Cash', -76, 900),
(14, '2023-03-02', 50, 2, 2.5, 2.5, 51.5, 'Card', 0, 51.5),
(15, '2023-03-02', 50, 2, 2.5, 2.5, 51.5, 'Check', 0, 51.5),
(16, '2023-03-02', 190, 2, 2.5, 2.5, 195.7, 'Card', 0, 195.7),
(17, '2023-03-04', 25, 2, 2.5, 2.5, 25.75, 'Cash', -4.25, 30),
(18, '2023-03-04', 1200, 2, 2.5, 2.5, 1236, 'Card', 0, 1236),
(19, '2023-03-04', 750, 2, 2.5, 2.5, 772.5, 'Check', 0, 772.5),
(20, '2023-03-04', 340, 2, 2.5, 2.5, 350.2, 'Cash', 0, 350.2),
(21, '2023-03-04', 400, 2, 2.5, 2.5, 412, 'Cash', 0, 412),
(22, '2023-03-04', 21500, 2, 2.5, 2.5, 22145, 'Card', 0, 22145),
(23, '2023-03-06', 2920, 2, 2.5, 2.5, 3007.6, 'Cash', -92.4, 3100),
(24, '2023-03-06', 225, 2, 2.5, 2.5, 231.75, 'Check', 0, 231.75),
(26, '2023-03-07', 25, 2, 2.5, 2.5, 25.75, 'Cash', -4.25, 30),
(27, '2023-03-07', 200, 2, 2.5, 2.5, 206, 'Card', 0, 206),
(36, '2023-03-08', 1845, 2, 2.5, 2.5, 1900.35, 'Card', 0, 1900.35),
(37, '2023-03-08', 840, 2, 2.5, 2.5, 865.2, 'Check', 0, 865.2),
(38, '2023-03-08', 22550, 2, 2.5, 2.5, 23226.5, 'Cash', -1773.5, 25000),
(39, '2023-03-09', 1050, 2, 2.5, 2.5, 1081.5, 'Cash', -18.5, 1100),
(40, '2023-03-09', 750, 2, 2.5, 2.5, 772.5, 'Cash', 27.5, 800),
(41, '2023-03-14', 750, 2, 2.5, 2.5, 772.5, 'Cash', -27.5, 800),
(42, '2023-03-14', 200, 2, 2.5, 2.5, 206, 'Card', 0, 206),
(43, '2023-03-17', 765, 2, 2.5, 2.5, 787.95, 'Cash', 787.95, 0),
(44, '2023-03-17', 1400, 2, 2.5, 2.5, 1442, 'Cash', 58, 1500);

-- --------------------------------------------------------

--
-- Structure de la table `tbl_invoice_details`
--

CREATE TABLE `tbl_invoice_details` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `barcode` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `rate` double NOT NULL,
  `saleprice` double NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_plantations`
--

CREATE TABLE `tbl_plantations` (
  `id` int(11) NOT NULL,
  `code_plantation` varchar(100) NOT NULL,
  `producteur_code` varchar(100) NOT NULL,
  `secteur_code` varchar(225) NOT NULL,
  `secteur_name` varchar(225) NOT NULL,
  `departement` varchar(225) NOT NULL,
  `sous_prefecture` varchar(225) NOT NULL,
  `village` varchar(225) NOT NULL,
  `superficie_hectares` decimal(10,5) NOT NULL,
  `production_annuelle_estimee` decimal(10,5) NOT NULL,
  `annee_plantation` year(4) NOT NULL,
  `geolocalise` enum('oui',' non') NOT NULL,
  `created_by` varchar(255) DEFAULT 'Faizan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `tbl_plantations`
--

INSERT INTO `tbl_plantations` (`id`, `code_plantation`, `producteur_code`, `secteur_code`, `secteur_name`, `departement`, `sous_prefecture`, `village`, `superficie_hectares`, `production_annuelle_estimee`, `annee_plantation`, `geolocalise`, `created_by`) VALUES
(2, 'PL9186719', 'BO082408551', 'BE04', 'Bettie', 'DJEBOUNOUA', 'ABENGOUROU', 'GH', '34.00000', '34.00000', 2002, 'oui', 'Faizan'),
(3, 'PL2086414', 'BO082408551', 'BE04', 'Bettie', 'DJEBOUNOUA', 'ABENGOUROU', 'GH', '12.00000', '12.00000', 2022, 'oui', 'Faizan'),
(4, 'PL8770511', 'BO082408551', 'BE04', 'Bettie', 'DJEBOUNOU', 'ABENGOUROU', 'GH', '12.00000', '12.00000', 2022, 'oui', 'Faizan'),
(5, 'PL0282637', 'ST163273487', 'AD04', 'Adzopé', 'DJEBOUNOUA', 'YAKASSE FEYASS', 'GH', '23.00000', '120.00000', 2002, 'oui', 'Faizan'),
(7, 'PL9846778', 'BO082408551', 'AD04', 'Adzopé', 'DJEBOUNOUA', 'ABENGOUROU', 'GH', '33.00000', '33.00000', 2023, 'oui', 'Faizan'),
(8, 'PL5215804', 'YA183887602', 'GB10', 'Grand Bereby', 'QSDQD', 'DQDQD', 'SQDQSFQSFDSQDF', '99999.99999', '55541.00000', 2000, 'oui', 'Faizan'),
(9, 'PL6406586', 'BO082408551', 'DI09', 'Divo', 'CSQCQQSD', 'SQDFDSQF', 'SQDFQSDFQS', '99999.99999', '8441.00000', 2000, 'oui', 'Faizan'),
(10, 'PL7743933', 'GA095766434', 'GL11', 'Grand Lahou', 'DFQSDFQSD', 'DSFGSDFG', 'DGFDSFGSDFG', '99999.99999', '5154.00000', 2000, 'oui', 'test'),
(11, 'PL7332681', 'GA095766434', 'GA09', 'Gagnoa', 'DGDSGF', 'GDSFGSDG', 'DGFSDGFSDG', '6559.00000', '5445.00000', 2000, 'oui', 'Faizan'),
(12, 'PL4126401', 'ME178305528', 'GL11', 'Grand Lahou', 'DFGHDFGH', 'DFHGDFHG', 'DFHDFHDFH', '98589.00000', '5474.00000', 2000, 'oui', 'Faizan'),
(13, 'PL6599314', 'BO082408551', 'GL11', 'Grand Lahou', 'DFQSDFQ', 'DQSFDQSFDQSDF', 'QSDFQSF', '99999.99999', '78897.00000', 2000, 'oui', 'Faizan'),
(14, 'PL4333410', 'GA095766434', 'MA14', 'Man', 'FGFDHD', 'DFHDFGH', 'FHDFH', '99999.99999', '46.00000', 2000, 'oui', 'Faizan'),
(15, 'PL0599744', 'BO082408551', 'MA14', 'Man', 'DSFGDSFG', 'SDFGSD', 'GSDFGSDGFSDG', '1854.00000', '8446.00000', 2000, 'oui', 'Faizan'),
(16, 'PL8763955', 'BO082408551', 'IS13', 'Issia', 'HGFDHGDFGH', 'FDHDFH', 'DFHGDFHG', '99999.99999', '99999.99999', 2000, 'oui', 'Faizan'),
(17, 'PL9943731', 'BO082408551', 'AD04', 'Adzopé', 'RGFDGDSFG', 'DQSFSQDFSD', 'QSQFSQF', '99999.99999', '7878.00000', 2000, 'oui', 'Faizan'),
(18, 'PL6142296', 'GA095766434', 'IS13', 'Issia', 'WXCWXC', 'WCVXWV', 'CXWC', '99999.99999', '78988.00000', 2000, 'oui', 'Faizan'),
(19, 'PL0523854', 'GA095766434', 'IS13', 'Issia', 'WXCWXC', 'WCVXWV', 'CXWC', '99999.99999', '78988.00000', 2000, 'oui', 'Faizan'),
(20, 'PL0523854', 'BO082408551', 'GL11', 'Grand Lahou', 'ALI', 'DFQSDF', 'GDSFGDSFG', '556.00000', '64.00000', 2000, 'oui', 'Faizan'),
(21, 'PL9865795', 'BO082408551', 'GU12', 'Guiglo', 'WXCW<XCW', 'XWCVWXV', 'XWVXWVC', '78456.00000', '4564.00000', 2000, 'oui', 'Faizan');

-- --------------------------------------------------------

--
-- Structure de la table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `pid` int(11) NOT NULL,
  `barcode` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `purchaseprice` float NOT NULL,
  `saleprice` float NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tbl_product`
--

INSERT INTO `tbl_product` (`pid`, `barcode`, `product`, `category`, `description`, `stock`, `purchaseprice`, `saleprice`, `image`) VALUES
(1, '8901057510028', 'Kangaro Stapler Pins', 'Hardware', 'no 10 mm', 474, 30, 50, '639a07f9bd5d4.jpg'),
(2, '8901057310062', 'Kangaro Stapler', 'Hardware', 'no 10', 189, 150, 200, '639a088ba5aa8.jpg'),
(3, '8901030865237', 'kissan tomato katchup', 'Grocery', '1.2kg', 166, 110, 160, '639a0eea4ae36.jpg'),
(4, '7121434', 'lenovo charger', 'Laptop', '12v', 94, 450, 800, '639a0f563d3b6.jpg'),
(5, '5120819', 'Veg Burger', 'Veg', 'small p', 997, 50, 80, '63b95327e78f0.png'),
(6, '6121422', 'Suger Packet 5 KG', 'Grocery', '5 KG Suger Packet ', 493, 120, 200, '639a19867b32a.jpg'),
(7, '8904000952210', 'Dyna Soap', 'Soap', 'Dyna Premium Beauty Sandal and Saffron Soap', 975, 15, 25, '63a54421a2087.jpg'),
(8, '8901030843891', 'Pepsodent Toothpaste', 'Grocery', 'Pepsodent GERMI CHECK JUMBO\r\nADVANCED GERMI CHECK FORMULA  ', 334, 80, 140, '63b9a7bc9175e.jpg'),
(9, '8809461562230', 'Modelling Comb', 'Electronics', 'Modelling Comb Electronic Comb for men .', 114, 130, 250, '63a5461349496.jpg'),
(10, '8906105612730', 'Wow Omega 3 Capsules', 'Medicines', 'Wow Omega 3 60N softgel Capsules  ', 107, 380, 500, '63a546b584e3b.jpg'),
(11, '6971914086630', 'Real me XT', 'Mobile', 'Model : RMX1921', 145, 18000, 21500, '63a547ca0e89a.jpg'),
(12, '12114804', 'Mix Spices 500gm', 'Grocery', 'Mix Spices Pack 500gm', 296, 180, 240, '63a5481c962ff.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `tbl_producteurs`
--

CREATE TABLE `tbl_producteurs` (
  `producteur_id` int(11) NOT NULL,
  `producteur_code` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `secteur_code` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `secteur_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `departement` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `sous_prefecture` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `localite` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `prenom` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `date_naissance` date NOT NULL,
  `lieu_naissance` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `sous_pref_naissance` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `departement_naissance` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `type_piece_identite` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `numero_piece` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `autre_piece` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `contact_telephonique` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `superficie_totale` decimal(10,2) NOT NULL,
  `delegue_village` enum('oui','non') CHARACTER SET utf8mb4 NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `signature` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `photo_recto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_verso` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tbl_producteurs`
--

INSERT INTO `tbl_producteurs` (`producteur_id`, `producteur_code`, `secteur_code`, `secteur_name`, `departement`, `sous_prefecture`, `localite`, `nom`, `prenom`, `date_naissance`, `lieu_naissance`, `sous_pref_naissance`, `departement_naissance`, `type_piece_identite`, `numero_piece`, `autre_piece`, `contact_telephonique`, `superficie_totale`, `delegue_village`, `photo`, `signature`, `created_at`, `created_by`, `photo_recto`, `photo_verso`) VALUES
(2, 'ME178352505', 'ME17', 'MEAGUI', 'DJEBOUNOUA', 'YAKASSE FEYASSE', 'ARRAH', 'FADIKA', 'MALICK', '2002-02-08', 'ABJ', 'LAGUNES', 'ARRAH', 'CNI', 'CI33333229293', 'FGHFDGH', '44949944', '23.00', 'oui', 'ME178352505.jpg', 'SIGN_ME178352505.png', '2024-09-27 21:33:57', 'Faizan', NULL, NULL),
(8, 'BO082408551', 'BO08', 'BONGOUANOU', 'DJEBOUNOUA', 'YAKASSE FEYASS', 'ARRAH', 'PATRICIA TOURE', 'MALICK', '2009-03-08', 'COCODY', 'ABIDJAN', 'LAGUNES', 'CNI', '474789922', 'CARTE CM', '0787431901', '376.00', 'non', 'BO082408551.jpg', 'SIGN_BO082408551.png', '2024-10-03 11:28:34', 'Faizan', NULL, NULL),
(9, 'AB010010003', 'AB01', 'ABENGOUROU', 'ABENGOUROU', 'ABENGOUROU', 'ABENGOUROU', 'BOAMAN ', 'ADONY LUCIEN MARTIAL ', '1973-10-12', 'BETTIE', 'BETTIE', 'ABENGOUROU', 'CNI', 'CI003268018', '', '0709868500', '14.22', 'non', 'AB014130164.jpg', 'SIGN_AB014130164.png', '2024-10-07 10:15:35', 'Faizan', NULL, NULL),
(10, 'SO178121013', 'SO17', 'SOUBRE', 'DJEBOUNOUA', 'ABENGOUROU', 'ABENGOUROU', 'PATRICIA TOURE', 'ADONY LUCIEN MARTIAL ', '2002-02-08', 'COCODY', 'ABIDJAN', 'LAGUNES', 'CNI', 'CI8374999200', '', '44949944', '12.00', 'non', 'SO178121013.jpg', 'SIGN_SO178121013.png', '2024-10-08 11:31:05', 'Patricia Toure', NULL, NULL),
(13, 'SO172718971', 'SO17', 'SOUBRE', 'DJEBOUNOUA', 'ABENGOUROU', 'JJJ', 'FADIKA', 'MALICK', '2002-02-08', 'COCODY', 'ABIDJAN', 'LAGUNE', 'CNI', 'CI8374999200', 'CARTE CMU', '0787431901', '18.00', 'oui', 'SO172718971.jpg', 'SIGN_SO172718971.png', '2024-10-09 07:44:06', 'Faizan', NULL, NULL),
(14, 'YA186795521', 'YA18', 'YAMOUSSOUKRO', 'DQADQSD', 'SQDFQSFDQSF', 'SQFDSQDFQSF', 'QFQSDFQSDQG Q', 'GQ GQD', '2024-11-01', 'BASSAM', 'SDFDSQFSQF', 'QSFQSFQSF', 'PASSEPORT', 'SQDFQSDFQSF', 'GQDGQDGQD ', 'g  dqsgd gd', '0.12', '', 'YA186795521.jpg', 'SIGN_YA186795521.png', '2024-11-03 23:20:46', 'test', NULL, NULL),
(15, 'YA189842687', 'YA18', 'YAMOUSSOUKRO', 'SQFDQSDFQS', 'FQSDDF ', 'SDGFSDFHGSDFH', 'DFSGSDFG', 'SDFGSDGSDG', '2024-11-10', 'DQSFSQDFG', 'FQSFQSFQS', 'DFSGDSFGSDFG', 'PASSEPORT', 'SQDFQSDFQSF', 'SDSDFGSDGF', 'sdgsdffgsdgsd', '0.17', '', 'YA189842687.jpg', 'SIGN_YA189842687.png', '2024-11-03 23:33:27', 'Faizan', NULL, NULL),
(16, 'TO124605736', 'TO12', 'TOULEPLEU', 'QSDSD', 'SQDGFQSDGQD', 'SDFGSDFGSDFG', 'DSFGSDGF', 'GSDFGSDFG', '2024-11-14', 'QSDFQSDF', 'SDFSDQF', 'GDFGDSFG', 'PERMIS DE CONDUIRE', 'SDGFSDFG', 'GSDFGSDF', 'sdfgsdfgsdfg', '566.00', '', 'TO124605736.jpg', 'SIGN_TO124605736.png', '2024-11-05 02:37:06', 'Faizan', NULL, NULL),
(17, 'TO127386841', 'TO12', 'TOULEPLEU', 'SDFQSDF', 'QSFQSFQSF', 'QSDFQSFDQSDFQSF', 'GDSQGSDG', 'SDHGSDHSDFH', '2024-11-07', 'DQSFSQDFG', 'QSDFQSF', 'QSFQSFQSF', 'CNI', 'QSDFQSGQSD', 'HFSDHFDGH', 'fdshgfdh', '848.00', '', 'TO127386841.jpg', 'SIGN_TO127386841.png', '2024-11-05 04:46:46', 'Faizan', NULL, NULL),
(18, 'YA183887602', 'YA18', 'YAMOUSSOUKRO', 'DFGDSFH', 'GHDFHGDFGH', 'FDHGDFHGDFGH', 'GHDFHDFHDF', 'GHDFHDFHD', '2024-11-07', 'FGDQSFG', 'FGHYFDHDFG', 'FDGHDF', 'CNI', 'FGHFDGHDF', 'FHGDFHDF', 'hgdfhgdfhg', '4884.00', '', 'YA183887602.jpg', 'SIGN_YA183887602.png', '2024-11-05 05:02:00', 'Faizan', NULL, NULL),
(19, 'TO128051368', 'TO12', 'TOULEPLEU', 'DFQSF', 'DFGDSFG', 'DFGDSFG', 'DFSGSDG', 'DSFDSFG', '2024-11-09', 'DFDFG', 'SQFDQSDF', 'DSFGSDFG', 'PASSEPORT', 'SDFGSDFG', 'GDSGDSGFSDFG', 'sdfg', '545.00', '', 'TO128051368.jpg', 'SIGN_TO128051368.png', '2024-11-05 05:29:47', 'Faizan', NULL, NULL),
(20, 'YA180969057', 'YA18', 'YAMOUSSOUKRO', 'DFGD', 'FGDSFGDSF', 'FGSDFGDSFG', 'SDFGDFSG', 'DSFGDSFG', '2024-11-08', 'ZFGDSGDS', 'DSFGDS', 'GDSFGDS', 'CNI', 'DSFGSDFG', 'SDFGDSFGSDGSDG', 'dsfgsdg', '7552.00', '', 'YA180969057.jpg', 'SIGN_YA180969057.png', '2024-11-05 06:27:45', 'Faizan', NULL, NULL),
(21, 'YA184707182', 'YA18', 'YAMOUSSOUKRO', 'DQD', 'SDFG', 'DSGDSFGSD', 'FDGHFDH', 'DJDG', '2024-11-01', 'S<QDQSD', 'QDQS', 'HGFHDFH', 'CNI', 'DFHFDGH', 'GHJHGJGFHJ', 'gfjfgjgfj', '662.00', '', 'YA184707182.jpg', 'SIGN_YA184707182.png', '2024-11-05 06:42:57', 'Faizan', NULL, NULL),
(22, '9955612', '', '', 'GDFSGFG', 'DFGHDFGHJ', 'GFDJGFJH', 'GFJFGJ', 'FGJFGJFG', '2024-11-08', 'DSFSDQF', 'FDGHDFGH', 'FGJFGJFG', 'PASSEPORT', 'FGJGFHJ', 'FGJFGJFGJ', 'dfgdsfg', '544.00', '', '9955612.jpg', 'SIGN_9955612.png', '2024-11-05 07:03:00', 'Faizan', NULL, NULL),
(23, '3022694', '', '', 'SDDFGDQSG', 'SDGSDFG', 'SDFGSDG', 'SDGSD', 'GSDFGSDGF', '2024-11-07', 'GSDFGSDGSD', 'SDGSDG', 'SDGSDGSD', 'CNI', 'SDGSDG', 'GDSGDSFGSDG', 'sdgsdg', '58.00', '', '3022694.jpg', 'SIGN_3022694.png', '2024-11-05 07:03:00', 'Faizan', NULL, NULL),
(24, '5082712', '', '', 'DSFSDF', 'GGSDGG', 'SDG', 'SDGFSDGSD', 'GSDGSDG', '2024-11-07', 'DSFGSDGDG', 'SDGSDF', 'DFGDSGDSGD', 'CNI', 'GSDFGSDG', 'SDGSD', 'dgdfsgsg', '548.00', '', '5082712.jpg', 'SIGN_5082712.png', '2024-11-05 07:05:06', 'Faizan', NULL, NULL),
(25, '6215039', '', '', 'DQADQSD', 'RETYTREY', 'YRETYER', 'YERTYER', 'YERTYERY', '2024-11-06', 'ERYERYERYERY', 'RYERTY', 'YERYE', 'CNI', 'ERYERYER', 'ERYERY', 'eryerye', '8788.00', '', '6215039.jpg', 'SIGN_6215039.png', '2024-11-05 07:40:19', 'Faizan', NULL, NULL),
(26, '2046506', '', '', '-UYYERT', 'TURTURTU', 'DFBHDFHB', 'TRUTRURTU', 'TUTRU', '2024-11-07', 'BASSAM', 'UTYURTYU', 'RTURTU', 'CNI', 'TRURTURTURTUUT', 'TRUTYURTUURTU', 'rturturtu', '54545.00', '', '2046506.jpg', 'SIGN_2046506.png', '2024-11-05 07:40:19', 'Faizan', NULL, NULL),
(27, 'TO129003151', 'TO12', 'TOULEPLEU', 'SQFDQSDFQS', 'SQFQSFQS', 'FQSF', 'SQFSQF', 'SQDFQS', '2024-11-09', 'FSQFSQF', 'SQDFSQ', 'SQFQSFSQF', 'CNI', 'SQFSQFSDF', 'FQSFQSFSQQS', 'fqsf', '65415.00', '', NULL, 'SIGN_TO129003151.png', '2024-11-05 08:51:55', 'test', NULL, NULL),
(28, 'YA183300527', 'YA18', 'YAMOUSSOUKRO', 'DSFDSQF', 'SQDFSQFD', 'QSFQSFS', 'FDSQFSQFQSF', 'QSFQS', '2024-11-13', 'QSFQSFQS', 'QSFQSFDQSF', 'FDQSDFQFQSDF', 'CNI', 'QSFQSFQSDFQS', 'DFQSFSQF', 'qsfqsdfqsdfqs', '8448.00', '', NULL, 'SIGN_YA183300527.png', '2024-11-05 19:46:45', 'Faizan', NULL, NULL),
(29, 'TA100093618', 'TA10', 'TABOU', 'SDFGDSFG', 'DSGFDSFG', 'DSFGDSFG', 'DFGDSFG', 'DSFGDSFGSDFG', '2024-11-12', 'FDFDSG', 'DFGHDFHDFH', 'FDGHFDGH', 'PERMIS DE CONDUIRE', 'DSFGSDFH', 'GSDFHSFGDH', 'fgshfghfdghdfh', '6856.00', '', NULL, 'SIGN_TA100093618.png', '2024-11-05 19:48:06', 'Faizan', NULL, NULL),
(30, 'TA100900545', 'TA10', 'TABOU', 'SDFGFSDHG', 'FDGHFDGH', 'FDGHFDGH', 'FDGHDFGH', 'DFHGDFHG', '2024-11-07', 'FDGFG', 'DFGHDFGH', 'HFGFDGHF', 'CNI', 'DHGDFGHFDGH', 'FGHFDGH', 'fdghfdghfgdh', '84.00', '', 'TA100900545.jpg', 'SIGN_TA100900545.png', '2024-11-05 19:50:22', 'Faizan', NULL, NULL),
(31, 'TO120622992', 'TO12', 'TOULEPLEU', 'SDFQSD', 'QSDFQSDF', 'QSFSQDF', 'SDQFQSDFQSDF', 'QSDFQSDF', '2024-11-07', 'FQSDFQSDFQSDF', 'FQSDFQS', 'QSDFQSDF', 'CNI', 'SQDFSDF', 'QSDFQSDFSQDFSQDF', 'qsdfqsdf', '9889.00', '', 'TO120622992.jpg', 'SIGN_TO120622992.png', '2024-11-05 19:52:37', 'Faizan', NULL, NULL),
(32, 'YA185252881', 'YA18', 'YAMOUSSOUKRO', 'GHFGHFDGH', 'FDGHFDG', 'GHFGHD', 'FGHFGH', 'FHGFDGH', '2024-11-10', 'FGDFSG', 'FDGHFHG', 'GHFDGHFDGH', 'CNI', 'FDGHFDGHFGDHFDGH', 'FDGHFDGHFDGHFDGH', 'fdhgfdgh', '5645545.00', '', NULL, 'SIGN_YA185252881.png', '2024-11-05 19:57:16', 'Faizan', NULL, NULL),
(33, 'TO126308755', 'TO12', 'TOULEPLEU', 'DSFGSDFG', 'SDFGDSFG', 'DFGDSFG', 'SDFGSDFG', 'SDFGSDFG', '2024-11-08', 'SDFSQDF', 'DFSQSDGFF', 'SDFGDFSG', 'CNI', 'SDGFDSFG', 'SDFGSDFGDSG', 'dsfgsdfg', '654.00', '', NULL, 'SIGN_TO126308755.png', '2024-11-05 19:58:48', 'Faizan', NULL, NULL),
(34, 'TA106755585', 'TA10', 'TABOU', 'DSFGSDFG', 'DGFDSGFDSFG', 'DSFGSDFG', 'DSFGSDGFSDFG', 'DSFGDFG', '2024-11-14', 'GFDSFG', 'DSFGSDFG', 'SDFGSDFGSDGF', 'CNI', 'DSFGSDFGSDFG', 'DSFGDSFG', 'gsdfgsdfg', '848.00', '', NULL, 'SIGN_TA106755585.png', '2024-11-05 20:03:17', 'Faizan', NULL, NULL),
(35, 'YA183225328', 'YA18', 'YAMOUSSOUKRO', 'FGDSFG', 'GFHSDFGH', 'FDGHDFGH', 'DFGH', 'FHGDDFGHFH', '2024-11-08', 'FDGHFGDH', 'FGHFGH', 'GHFFGDH', 'CNI', 'DFHFDGH', 'FGHFDGH', 'fghdfghdfg', '65854.00', '', NULL, 'SIGN_YA183225328.png', '2024-11-05 20:06:34', 'Faizan', NULL, NULL),
(36, 'YA182867847', 'YA18', 'YAMOUSSOUKRO', 'DFGDFSG', 'SDFGSDFG', 'SDGSDGDS', 'GDGDSGF', 'DSGSD', '2024-11-15', '-RTYI', 'SDFGSDGF', 'DSFGSDFG', 'CNI', 'DSFGDGF', 'GFDFGDSFGDS', 'gsdfg', '959.00', '', NULL, 'SIGN_YA182867847.png', '2024-11-05 20:08:32', 'Faizan', NULL, NULL),
(37, 'TO121315482', 'TO12', 'TOULEPLEU', 'QSFDQSDF', 'QSFDSQDF', 'SQDFQSDF', 'SQDFSQD', 'FSQDFQSDF', '2024-11-08', 'SQDFDF', 'SDFSQDFS', 'SDFSFDQQSDF', 'CNI', 'SDFSQDF', 'SDFQSDFSQFD', 'sqfdqsdfqsfd', '554.00', '', 'TO121315482.jpg', 'SIGN_TO121315482.png', '2024-11-05 20:12:46', 'Faizan', NULL, NULL),
(38, 'TO123404287', 'TO12', 'TOULEPLEU', 'FSQDGSDFG', 'SDFG', 'SDFDFGSHSDF', 'FDHGFDGHD', 'FGHGFDHDFGH', '2024-11-08', 'DSFQSF', 'TYFDGHDFGH', 'FGHFDGHGDFH', 'CNI', 'FDGHDGFH', 'HDFGHGFHD', 'fdhdfghfdghh', '484.00', '', NULL, 'SIGN_TO123404287.png', '2024-11-05 20:14:47', 'Faizan', NULL, NULL),
(39, 'TO121167240', 'TO12', 'TOULEPLEU', 'QSDFQSD', 'QSFDF', 'SFDSFDSDF', 'SDFSQDF', 'SQDFSQF', '2024-11-08', 'DSFQSDF', 'FGGDSFG', 'SQDFQSDF', 'CNI', 'SFQQSF', 'QSFDSQD', 'fsqdf', '6787.00', '', 'TO121167240.jpg', 'SIGN_TO121167240.png', '2024-11-05 20:21:22', 'Faizan', NULL, NULL),
(40, 'TO123534592', 'TO12', 'TOULEPLEU', 'FSQDGSDFG', 'SDFG', 'SDFDFGSHSDF', 'FDHGFDGHD', 'FGHGFDHDFGH', '2024-11-08', 'DSFQSF', 'TYFDGHDFGH', 'FGHFDGHGDFH', 'CNI', 'FDGHDGFH', 'HDFGHGFHD', 'fdhdfghfdghh', '484.00', '', NULL, 'SIGN_TO123534592.png', '2024-11-05 20:22:12', 'Faizan', NULL, NULL),
(41, 'TO121949509', 'TO12', 'TOULEPLEU', 'SQFDQSDF', 'SQDFQSDFSQDF', 'SDFQSDF', 'SQDFSQDF', 'SQFDSQFD', '2024-11-05', 'SDFSQDF', 'FQSDFQSDF', 'SQFSQD', 'CNI', 'SQFDSQD', 'FSQDFQSDF', 'sdfsqdfqsdf', '66456.00', '', NULL, 'SIGN_TO121949509.png', '2024-11-05 20:22:12', 'Faizan', NULL, NULL),
(42, 'YA181147767', 'YA18', 'YAMOUSSOUKRO', 'SDFGSDF', 'SDGSDG', 'DSFGSDFG', 'GSDFGSDFG', 'SDGFSDFG', '2024-11-01', 'FDSFGSDG', 'GSDGF', 'DSFGSDFGSDGF', 'CNI', 'GDSFGSDF', 'SDGDSFGDSGF', 'dsfgsdfgdsfg', '6645.00', '', 'YA181147767.jpg', 'SIGN_YA181147767.png', '2024-11-05 20:23:25', 'Faizan', NULL, NULL),
(43, 'TA103909839', 'TA10', 'TABOU', 'FDSDF', 'DFHDFHD', 'FHDFGHDFH', 'DFGHDFH', 'DFHDFHG', '2024-11-22', 'SDFSDGSFD', 'DFGHDFGH', 'DFGHDFH', 'CNI', 'HGDFHFDHGDFGH', 'DFHDFGHDF', 'fdghdfghdf', '541545.00', '', NULL, 'SIGN_TA103909839.png', '2024-11-05 20:24:16', 'Faizan', NULL, NULL),
(44, 'TO120807484', 'TO12', 'TOULEPLEU', 'DFGDFSG', 'DSGFSDGF', 'DSGFSDGF', 'DSGFSDFG', 'DSFGSDFG', '2024-11-07', 'DSGFSDG', 'DSFGSDFG', 'GDSFGDGG', 'CNI', 'DSGFDSFG', 'DSGFSDGF', 'dfgdsfg', '544.00', '', 'TO120807484.jpg', 'SIGN_TO120807484.png', '2024-11-05 20:27:39', 'Faizan', NULL, NULL),
(45, 'YA188773404', 'YA18', 'YAMOUSSOUKRO', 'SDGSDG', 'SDGSDG', 'DSGFDSFG', 'GDFSDGFDSGF', 'SDFGSDG', '2024-11-06', 'DFGDSFG', 'SDGFSDFG', 'SDGDSG', 'CNI', 'SDGFSDGFGS', 'DSDFGSDGF', 'dsfgsdfg', '95954.00', '', 'YA188773404.jpg', 'SIGN_YA188773404.png', '2024-11-05 20:28:11', 'Faizan', NULL, NULL),
(46, 'ME178305528', 'ME17', 'MEAGUI', 'FGDSFGSDFGSDGF', 'SDFGSDFG', 'GDSFGSDFG', 'GDFGDFSG', 'SDGF', '2024-11-13', 'DFGSDFG', 'DFGDFSG', 'DSFGSDFGDGFS', 'CNI', 'DGFSGSDFG', 'DFGFDGDSFG', 'dsfgfdsdfgfdsg', '6565484.00', '', 'ME178305528.jpg', 'SIGN_ME178305528.png', '2024-11-05 20:29:46', 'Faizan', NULL, NULL),
(47, 'GA095766434', 'GA09', 'GAGNOA', 'SDGFSDGFG', 'DSFGDSFG', 'GDFSFGSD', 'FGSDGF', 'SDGFSDGF', '2024-10-30', 'QDSFGSDFGSDG', 'SDFGSDFG', 'DSGFDSFG', 'CNI', 'SDGFSD', 'SDGFSDFG', 'gfdsfggsd', '95489.00', '', 'GA095766434.jpg', 'SIGN_GA095766434.png', '2024-11-05 20:30:17', 'Faizan', NULL, NULL),
(48, 'TO124392098', 'TO12', 'TOULEPLEU', 'GSDF', 'GFGHFDGH', 'FDGHDFGHF', 'HDGDFGHFDGH', 'DFGHDFGH', '2024-11-09', 'FQSDF', 'DFGHDFGH', 'DFGH', 'CNI', 'FDGHFDGHFDGH', 'DFGHFDGH', 'dfghdfgh', '45.00', '', 'TO124392098.jpg', 'SIGN_TO124392098.png', '2024-11-05 20:31:20', 'Faizan', NULL, NULL),
(49, 'YA181024755', 'YA18', 'YAMOUSSOUKRO', 'QSFDQSFD', 'SDFQSDF', 'QSDFQSDFFSSFD', 'QSDFQSDF', 'QSFQSDFQSD', '2024-11-08', 'SQDFQSFFD', 'SDQFQSDF', 'FSQDQSDF', 'CNI', 'FSDFQQSDF', 'QSDFFDS', 'qsdfqsdf', '848.00', '', 'YA181024755.jpg', 'SIGN_YA181024755.png', '2024-11-05 20:31:43', 'Faizan', NULL, NULL),
(50, 'YA187839047', 'YA18', 'YAMOUSSOUKRO', 'SFGDSDFG', 'GFDSFG', 'SDFGDSFGDSFG', 'SDFGSDFGS', 'DGFDSFGSDFG', '2024-11-09', 'DFBFDSG', 'DFSGDSFG', 'SDFGSDFG', 'CNI', 'DGFDSGF', 'DGFSSDFG', 'fgddsfgsdfg', '545454.00', '', 'YA187839047.jpg', 'SIGN_YA187839047.png', '2024-11-05 20:37:09', 'Faizan', NULL, NULL),
(51, 'YA183948967', 'YA18', 'YAMOUSSOUKRO', 'SDGFSDG', 'SDGSDG', 'GDSGFSDFGSDG', 'DFSGDSGFFG', 'SDGSDGF', '2024-11-05', 'DFGDSFG', 'DFGSDFGSDFG', 'GDFSGS', 'CNI', 'DFGG', 'GDSDG', 'sgsdfgdfsg', '69786.00', '', 'YA183948967.jpg', 'SIGN_YA183948967.png', '2024-11-05 20:40:50', 'Faizan', NULL, NULL),
(52, 'TO128913602', 'TO12', 'TOULEPLEU', 'AZDA', 'RERAZRAZ', 'AZRAZR', 'AZRAZ', 'AZRAZ', '2024-11-06', 'RAZREAZ', 'RAZRA', 'RAZRAR', 'CNI', 'RAZRAZR', 'RAZR', 'rzaazrazrazr', '56654.00', '', 'TO128913602.jpg', 'SIGN_TO128913602.png', '2024-11-05 20:55:53', 'Faizan', NULL, NULL),
(53, 'TO129990809', 'TO12', 'TOULEPLEU', 'SDGSDG', 'GSDG', 'SDGSDGDS', 'GSDG', 'DSFGSDG', '2024-11-09', 'SDGSDGDS', 'FGDFSG', 'DSGSDG', 'CNI', 'SDG', 'SGSDG', 'sdfgsfgdsfggf', '84.00', '', 'TO129990809.jpg', 'SIGN_TO129990809.png', '2024-11-05 21:24:04', 'Faizan', NULL, NULL),
(54, 'TO120837001', 'TO12', 'TOULEPLEU', 'T--TFVT', 'VGGF', 'FQSDFF', 'SDFQSDF', 'FDFGHDF', '2024-11-13', '_Gè_GY', 'FT-T', 'HFDGHDF', 'CNI', 'GDFGHDFHDF', '5484', 'fdg', '544848.00', '', 'TO120837001.jpg', 'SIGN_TO120837001.png', '2024-11-05 21:29:14', 'Faizan', NULL, NULL),
(55, 'YA183973644', 'YA18', 'YAMOUSSOUKRO', 'DGDFG', 'SFGSDFG', 'DFGSDGSD', 'SDGSDGF', 'DSGDSGF', '2024-11-07', 'QDFFSF', 'DSFGD', 'SDGS', 'CNI', 'FGSDG', 'SDFGDSFG', 'dgdsfgdfhfdg', '54.00', '', 'YA183973644.jpg', 'SIGN_YA183973644.png', '2024-11-05 21:29:50', 'Faizan', NULL, NULL),
(56, 'YA182882058', 'YA18', 'YAMOUSSOUKRO', 'DFGH', 'FHGFDH', 'FGHDFDGH', 'FDGH', 'FDHFDH', '2024-11-08', 'FHFDGH', 'FDHGFGH', 'HFFGH', 'CNI', 'FDGHDFHG', 'HDF', 'ghdfghfgdhfhdfg', '545.00', '', 'YA182882058.jpg', 'SIGN_YA182882058.png', '2024-11-05 21:32:52', 'Faizan', NULL, NULL),
(57, 'TO121422389', 'TO12', 'TOULEPLEU', 'GFDFSG', 'GSDFGSDFG', 'FFDFSGSDFG', 'DFSGSDFGSDG', 'SDFG', '2024-11-01', 'DQSFSQDFG', 'SDGFDSG', 'SDFGDSGF', 'CNI', 'DSFGDSFG', 'DSFGSDGF', 'dsfgsdfgdsgf', '61615.00', '', 'TO121422389.jpg', 'SIGN_TO121422389.png', '2024-11-05 21:36:15', 'Faizan', NULL, NULL),
(58, 'TO129344486', 'TO12', 'TOULEPLEU', 'FSDG', 'FDGH', 'DFGHFDGH', 'DFGHDF', 'HDFGHDFGH', '2024-11-17', 'HFHGFHG', 'DFGSDFH', 'DFGHHFG', 'CNI', 'GHFHG', 'FGHDFG', 'fdhgdfh', '52.00', '', 'TO129344486.jpg', 'SIGN_TO129344486.png', '2024-11-05 21:39:00', 'Faizan', NULL, NULL),
(59, 'TO124904503', 'TO12', 'TOULEPLEU', 'DSGSDFG', 'SDGFDSG', 'DSGFDSFG', 'DSFG', 'DSGFSDFG', '2024-11-09', 'FGDSG', 'DGDSFG', 'DSFG', 'CNI', 'DFGDSFG', 'DFSGDSFGD', 'fsgfgd', '54.00', '', 'TO124904503.jpg', 'SIGN_TO124904503.png', '2024-11-05 21:39:00', 'Faizan', NULL, NULL),
(60, 'YA185596713', 'YA18', 'YAMOUSSOUKRO', 'GSDGSD', 'GSDGSDFGSDG', 'SDGSDGSDG', 'DSGFSDGFSDG', 'DFSGSDG', '2024-11-08', 'DQSDFGQG', 'QDFGGSD', 'SDFGSDG', 'CNI', 'SDGSDG', 'SDGFSDG', 'dfsgsdfgsdgsdgsg', '887487.00', '', 'YA185596713.jpg', 'SIGN_YA185596713.png', '2024-11-07 00:10:13', 'Faizan', NULL, NULL),
(61, 'TO124892903', 'TO12', 'TOULEPLEU', 'SQFDQSF', 'SQDFQS', 'FQSFQSF', 'QSFQSFQSF', 'QSFQS', '2024-11-08', 'DFGDSFG', 'FQSFQSFQS', 'FQSFQSFQS', 'CNI', 'FQSFQSFQS', 'FQSFQS', 'fqsfqsfqsfqsfsqf', '5844.00', 'oui', 'TO124892903.jpg', 'SIGN_TO124892903.png', '2024-11-07 19:56:59', 'Faizan', 'rectoTO124892903.jpg', 'versoTO124892903.jpg'),
(62, 'YA180886887', 'YA18', 'YAMOUSSOUKRO', 'DFGFDS', 'SDFGSD', 'SDGSDGS', 'DGSD', 'SDGSDFG', '2024-10-31', 'GSDFG', 'SDGFSDFG', 'GSDFG', 'CNI', 'GSDGF', 'SDFGSDGSDFG', 'sdgfsdf', '567.00', '', 'YA180886887.jpg', 'SIGN_YA180886887.png', '2024-11-08 09:14:52', 'Faizan', 'rectoYA180886887.jpg', 'versoYA180886887.jpg'),
(63, 'TA104057695', 'TA10', 'TABOU', 'DFGDSF', 'HGFDGHFD', 'FDGHFDGH', 'FDHDFGH', 'HGDFGHD', '2024-11-09', 'HGDFGHF', 'GDFSHGFDS', 'GHFDGH', 'CNI', 'FDGHFD', 'FGHFGHFDGH', 'fdgh', '75674756.00', '', '', 'SIGN_TA104057695.png', '2024-11-08 09:50:02', 'Faizan', NULL, NULL),
(64, 'TA104638038', 'TA10', 'TABOU', 'DFGDSF', 'HGFDGHFD', 'FDGHFDGH', 'FDHDFGH', 'HGDFGHD', '2024-11-09', 'HGDFGHF', 'GDFSHGFDS', 'GHFDGH', 'CNI', 'FDGHFD', 'FGHFGHFDGH', 'fdgh', '75674756.00', '', '', 'SIGN_TA104638038.png', '2024-11-08 09:51:19', 'Faizan', NULL, NULL),
(65, 'TA108447973', 'TA10', 'TABOU', 'DD', 'DQSFQS', 'QSFSQF', 'SQFSQ', 'SQDFQSF', '2024-11-09', 'SQFSQDF', 'SQDFSQF', 'FDQSF', 'CNI', 'FDQSFQSF', 'QSFQSDF', 'qsfqs', '0.07', '', 'TA108447973.jpg', 'SIGN_TA108447973.png', '2024-11-08 09:57:42', 'Faizan', 'rectoTA108447973.jpg', 'versoTA108447973.jpg'),
(66, 'TO126066251', 'TO12', 'TOULEPLEU', 'SQDFQSF', 'QSFQS', 'QSFQSFQS', 'FQSF', 'QSFQS', '2024-11-15', 'QSFQSFQ', 'SFQSF', 'FQSF', 'CNI', 'QSFQSF', 'FQSFQ', 'sfqsfqsf', '0.02', '', 'TO126066251.jpg', 'SIGN_TO126066251.png', '2024-11-08 09:58:48', 'Faizan', NULL, NULL),
(67, 'TO125998872', 'TO12', 'TOULEPLEU', 'SQDFQSF', 'QSFQS', 'QSFQSFQS', 'FQSF', 'QSFQS', '2024-11-15', 'QSFQSFQ', 'SFQSF', 'FQSF', 'CNI', 'QSFQSF', 'FQSFQ', 'sfqsfqsf', '0.02', '', 'TO125998872.jpg', 'SIGN_TO125998872.png', '2024-11-08 10:10:12', 'Faizan', 'TO125998872_recto.jpg', 'TO125998872_verso.jpg'),
(68, 'TO127240898', 'TO12', 'TOULEPLEU', 'SQDFQSF', 'QSFQS', 'QSFQSFQS', 'FQSF', 'QSFQS', '2024-11-15', 'QSFQSFQ', 'SFQSF', 'FQSF', 'CNI', 'QSFQSF', 'FQSFQ', 'sfqsfqsf', '0.02', '', 'TO127240898.jpg', 'SIGN_TO127240898.png', '2024-11-08 10:11:38', 'Faizan', 'TO127240898_recto.jpg', 'TO127240898_verso.jpg'),
(69, 'TO128744215', 'TO12', 'TOULEPLEU', 'SQFQSF', 'FQS', 'SQFQSFQSF', 'QSFQSFQSDF', 'QSFDQSFQSF', '2024-11-02', 'DCFDSQFSQFD', 'QSFQSF', 'FDQSFQS', 'PASSEPORT', 'DFGH', 'SQFDSQF', 'qsdfsdqfqsf', '5255.00', '', 'TO128744215.jpg', 'SIGN_TO128744215.png', '2024-11-08 11:33:00', 'Faizan', 'TO128744215_recto.jpg', 'TO128744215_verso.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `tbl_secteurs`
--

CREATE TABLE `tbl_secteurs` (
  `secteur_id` int(11) NOT NULL,
  `secteur_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secteur_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tbl_secteurs`
--

INSERT INTO `tbl_secteurs` (`secteur_id`, `secteur_code`, `secteur_name`) VALUES
(24, 'AB01', 'Abengourou'),
(25, 'AB02', 'Aboisso'),
(26, 'AD04', 'Adzopé'),
(27, 'AN03', 'Anguededou'),
(28, 'BE04', 'Bettie'),
(29, 'BO05', 'Bondoukou'),
(30, 'BO08', 'Bongouanou'),
(31, 'BO06', 'Bonoua'),
(32, 'DA07', 'Dabou'),
(33, 'DA13', 'Daloa'),
(34, 'DA08', 'Daoukro'),
(35, 'DI09', 'Divo'),
(36, 'GA09', 'Gagnoa'),
(37, 'GB10', 'Grand Bereby'),
(38, 'GL11', 'Grand Lahou'),
(39, 'GU12', 'Guiglo'),
(40, 'IS13', 'Issia'),
(41, 'MA14', 'Man'),
(42, 'ME17', 'Meagui'),
(43, 'SP15', 'San Pedro'),
(44, 'ST16', 'Sikensi-Tiassale'),
(45, 'SO17', 'Soubre'),
(46, 'TA10', 'Tabou'),
(47, 'TO12', 'Toulepleu'),
(48, 'YA18', 'Yamoussoukro');

-- --------------------------------------------------------

--
-- Structure de la table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `userid` int(11) NOT NULL,
  `username` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `useremail` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `userpassword` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tbl_user`
--

INSERT INTO `tbl_user` (`userid`, `username`, `useremail`, `userpassword`, `role`) VALUES
(1, 'Faizan', 'faizan@gmail.com', '12345', 'Admin'),
(2, 'user', 'user@gmail.com', '123', 'User'),
(14, 'test', 'test@gmail.com', '123', 'User'),
(15, 'Benoit Kouame', 'benoit@fph-ci.com', '123456789.', 'Admin'),
(16, 'Malick Fadika', 'fadika@fph-ci.com', '123456.', 'Admin'),
(17, 'Patricia Toure', 'pat@fph-ci.com', '1235', 'Admin'),
(18, 'eric', 'eric@gmail.com', '123', 'Middle');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tbl_events`
--
ALTER TABLE `tbl_events`
  ADD PRIMARY KEY (`event_id`);

--
-- Index pour la table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Index pour la table `tbl_invoice_details`
--
ALTER TABLE `tbl_invoice_details`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tbl_plantations`
--
ALTER TABLE `tbl_plantations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`pid`);

--
-- Index pour la table `tbl_producteurs`
--
ALTER TABLE `tbl_producteurs`
  ADD PRIMARY KEY (`producteur_id`);

--
-- Index pour la table `tbl_secteurs`
--
ALTER TABLE `tbl_secteurs`
  ADD PRIMARY KEY (`secteur_id`);

--
-- Index pour la table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `tbl_events`
--
ALTER TABLE `tbl_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=372;

--
-- AUTO_INCREMENT pour la table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `tbl_invoice_details`
--
ALTER TABLE `tbl_invoice_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT pour la table `tbl_plantations`
--
ALTER TABLE `tbl_plantations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `tbl_producteurs`
--
ALTER TABLE `tbl_producteurs`
  MODIFY `producteur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT pour la table `tbl_secteurs`
--
ALTER TABLE `tbl_secteurs`
  MODIFY `secteur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT pour la table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
