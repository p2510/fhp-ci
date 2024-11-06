-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 06 nov. 2024 à 13:49
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
(36, 'Consultation', 'Faizan a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'Succès', '2024-11-06 12:46:49', 1, 'Faizan', 'Producteur', NULL, 'N/A');

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
  `geolocalise` enum('oui',' non') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `tbl_plantations`
--

INSERT INTO `tbl_plantations` (`id`, `code_plantation`, `producteur_code`, `secteur_code`, `secteur_name`, `departement`, `sous_prefecture`, `village`, `superficie_hectares`, `production_annuelle_estimee`, `annee_plantation`, `geolocalise`) VALUES
(2, 'PL9186719', 'BO082408551', 'BE04', 'Bettie', 'DJEBOUNOUA', 'ABENGOUROU', 'GH', '34.00000', '34.00000', 2002, 'oui'),
(3, 'PL2086414', 'BO082408551', 'BE04', 'Bettie', 'DJEBOUNOUA', 'ABENGOUROU', 'GH', '12.00000', '12.00000', 2022, 'oui'),
(4, 'PL8770511', 'BO082408551', 'BE04', 'Bettie', 'DJEBOUNOU', 'ABENGOUROU', 'GH', '12.00000', '12.00000', 2022, 'oui'),
(5, 'PL0282637', 'ST163273487', 'AD04', 'Adzopé', 'DJEBOUNOUA', 'YAKASSE FEYASS', 'GH', '23.00000', '120.00000', 2002, 'oui'),
(7, 'PL9846778', 'BO082408551', 'AD04', 'Adzopé', 'DJEBOUNOUA', 'ABENGOUROU', 'GH', '33.00000', '33.00000', 2023, 'oui');

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
  `created_by` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tbl_producteurs`
--

INSERT INTO `tbl_producteurs` (`producteur_id`, `producteur_code`, `secteur_code`, `secteur_name`, `departement`, `sous_prefecture`, `localite`, `nom`, `prenom`, `date_naissance`, `lieu_naissance`, `sous_pref_naissance`, `departement_naissance`, `type_piece_identite`, `numero_piece`, `autre_piece`, `contact_telephonique`, `superficie_totale`, `delegue_village`, `photo`, `signature`, `created_at`, `created_by`) VALUES
(2, 'ME178352505', 'ME17', 'MEAGUI', 'DJEBOUNOUA', 'YAKASSE FEYASSE', 'ARRAH', 'FADIKA', 'MALICK', '2002-02-08', 'ABJ', 'LAGUNES', 'ARRAH', 'CNI', 'CI33333229293', 'FGHFDGH', '44949944', '23.00', 'oui', 'ME178352505.jpg', 'SIGN_ME178352505.png', '2024-09-27 21:33:57', 'Faizan'),
(8, 'BO082408551', 'BO08', 'BONGOUANOU', 'DJEBOUNOUA', 'YAKASSE FEYASS', 'ARRAH', 'PATRICIA TOURE', 'MALICK', '2009-03-08', 'COCODY', 'ABIDJAN', 'LAGUNES', 'CNI', '474789922', 'CARTE CM', '0787431901', '376.00', 'non', 'BO082408551.jpg', 'SIGN_BO082408551.png', '2024-10-03 11:28:34', 'Faizan'),
(9, 'AB010010003', 'AB01', 'ABENGOUROU', 'ABENGOUROU', 'ABENGOUROU', 'ABENGOUROU', 'BOAMAN ', 'ADONY LUCIEN MARTIAL ', '1973-10-12', 'BETTIE', 'BETTIE', 'ABENGOUROU', 'CNI', 'CI003268018', '', '0709868500', '14.22', 'non', 'AB014130164.jpg', 'SIGN_AB014130164.png', '2024-10-07 10:15:35', 'Faizan'),
(10, 'SO178121013', 'SO17', 'SOUBRE', 'DJEBOUNOUA', 'ABENGOUROU', 'ABENGOUROU', 'PATRICIA TOURE', 'ADONY LUCIEN MARTIAL ', '2002-02-08', 'COCODY', 'ABIDJAN', 'LAGUNES', 'CNI', 'CI8374999200', '', '44949944', '12.00', 'non', 'SO178121013.jpg', 'SIGN_SO178121013.png', '2024-10-08 11:31:05', 'Patricia Toure'),
(13, 'SO172718971', 'SO17', 'SOUBRE', 'DJEBOUNOUA', 'ABENGOUROU', 'JJJ', 'FADIKA', 'MALICK', '2002-02-08', 'COCODY', 'ABIDJAN', 'LAGUNE', 'CNI', 'CI8374999200', 'CARTE CMU', '0787431901', '18.00', 'oui', 'SO172718971.jpg', 'SIGN_SO172718971.png', '2024-10-09 07:44:06', 'Faizan'),
(14, 'YA186795521', 'YA18', 'YAMOUSSOUKRO', 'DQADQSD', 'SQDFQSFDQSF', 'SQFDSQDFQSF', 'QFQSDFQSDQG Q', 'GQ GQD', '2024-11-01', 'BASSAM', 'SDFDSQFSQF', 'QSFQSFQSF', 'PASSEPORT', 'SQDFQSDFQSF', 'GQDGQDGQD ', 'g  dqsgd gd', '0.12', '', 'YA186795521.jpg', 'SIGN_YA186795521.png', '2024-11-03 23:20:46', 'Faizan'),
(15, 'YA189842687', 'YA18', 'YAMOUSSOUKRO', 'SQFDQSDFQS', 'FQSDDF ', 'SDGFSDFHGSDFH', 'DFSGSDFG', 'SDFGSDGSDG', '2024-11-10', 'DQSFSQDFG', 'FQSFQSFQS', 'DFSGDSFGSDFG', 'PASSEPORT', 'SQDFQSDFQSF', 'SDSDFGSDGF', 'sdgsdffgsdgsd', '0.17', '', 'YA189842687.jpg', 'SIGN_YA189842687.png', '2024-11-03 23:33:27', 'Faizan'),
(16, 'TO124605736', 'TO12', 'TOULEPLEU', 'QSDSD', 'SQDGFQSDGQD', 'SDFGSDFGSDFG', 'DSFGSDGF', 'GSDFGSDFG', '2024-11-14', 'QSDFQSDF', 'SDFSDQF', 'GDFGDSFG', 'PERMIS DE CONDUIRE', 'SDGFSDFG', 'GSDFGSDF', 'sdfgsdfgsdfg', '566.00', '', 'TO124605736.jpg', 'SIGN_TO124605736.png', '2024-11-05 02:37:06', 'Faizan'),
(17, 'TO127386841', 'TO12', 'TOULEPLEU', 'SDFQSDF', 'QSFQSFQSF', 'QSDFQSFDQSDFQSF', 'GDSQGSDG', 'SDHGSDHSDFH', '2024-11-07', 'DQSFSQDFG', 'QSDFQSF', 'QSFQSFQSF', 'CNI', 'QSDFQSGQSD', 'HFSDHFDGH', 'fdshgfdh', '848.00', '', 'TO127386841.jpg', 'SIGN_TO127386841.png', '2024-11-05 04:46:46', 'Faizan'),
(18, 'YA183887602', 'YA18', 'YAMOUSSOUKRO', 'DFGDSFH', 'GHDFHGDFGH', 'FDHGDFHGDFGH', 'GHDFHDFHDF', 'GHDFHDFHD', '2024-11-07', 'FGDQSFG', 'FGHYFDHDFG', 'FDGHDF', 'CNI', 'FGHFDGHDF', 'FHGDFHDF', 'hgdfhgdfhg', '4884.00', '', 'YA183887602.jpg', 'SIGN_YA183887602.png', '2024-11-05 05:02:00', 'Faizan'),
(19, 'TO128051368', 'TO12', 'TOULEPLEU', 'DFQSF', 'DFGDSFG', 'DFGDSFG', 'DFSGSDG', 'DSFDSFG', '2024-11-09', 'DFDFG', 'SQFDQSDF', 'DSFGSDFG', 'PASSEPORT', 'SDFGSDFG', 'GDSGDSGFSDFG', 'sdfg', '545.00', '', 'TO128051368.jpg', 'SIGN_TO128051368.png', '2024-11-05 05:29:47', 'Faizan'),
(20, 'YA180969057', 'YA18', 'YAMOUSSOUKRO', 'DFGD', 'FGDSFGDSF', 'FGSDFGDSFG', 'SDFGDFSG', 'DSFGDSFG', '2024-11-08', 'ZFGDSGDS', 'DSFGDS', 'GDSFGDS', 'CNI', 'DSFGSDFG', 'SDFGDSFGSDGSDG', 'dsfgsdg', '7552.00', '', 'YA180969057.jpg', 'SIGN_YA180969057.png', '2024-11-05 06:27:45', 'Faizan'),
(21, 'YA184707182', 'YA18', 'YAMOUSSOUKRO', 'DQD', 'SDFG', 'DSGDSFGSD', 'FDGHFDH', 'DJDG', '2024-11-01', 'S<QDQSD', 'QDQS', 'HGFHDFH', 'CNI', 'DFHFDGH', 'GHJHGJGFHJ', 'gfjfgjgfj', '662.00', '', 'YA184707182.jpg', 'SIGN_YA184707182.png', '2024-11-05 06:42:57', 'Faizan'),
(22, '9955612', '', '', 'GDFSGFG', 'DFGHDFGHJ', 'GFDJGFJH', 'GFJFGJ', 'FGJFGJFG', '2024-11-08', 'DSFSDQF', 'FDGHDFGH', 'FGJFGJFG', 'PASSEPORT', 'FGJGFHJ', 'FGJFGJFGJ', 'dfgdsfg', '544.00', '', '9955612.jpg', 'SIGN_9955612.png', '2024-11-05 07:03:00', 'Faizan'),
(23, '3022694', '', '', 'SDDFGDQSG', 'SDGSDFG', 'SDFGSDG', 'SDGSD', 'GSDFGSDGF', '2024-11-07', 'GSDFGSDGSD', 'SDGSDG', 'SDGSDGSD', 'CNI', 'SDGSDG', 'GDSGDSFGSDG', 'sdgsdg', '58.00', '', '3022694.jpg', 'SIGN_3022694.png', '2024-11-05 07:03:00', 'Faizan'),
(24, '5082712', '', '', 'DSFSDF', 'GGSDGG', 'SDG', 'SDGFSDGSD', 'GSDGSDG', '2024-11-07', 'DSFGSDGDG', 'SDGSDF', 'DFGDSGDSGD', 'CNI', 'GSDFGSDG', 'SDGSD', 'dgdfsgsg', '548.00', '', '5082712.jpg', 'SIGN_5082712.png', '2024-11-05 07:05:06', 'Faizan'),
(25, '6215039', '', '', 'DQADQSD', 'RETYTREY', 'YRETYER', 'YERTYER', 'YERTYERY', '2024-11-06', 'ERYERYERYERY', 'RYERTY', 'YERYE', 'CNI', 'ERYERYER', 'ERYERY', 'eryerye', '8788.00', '', '6215039.jpg', 'SIGN_6215039.png', '2024-11-05 07:40:19', 'Faizan'),
(26, '2046506', '', '', '-UYYERT', 'TURTURTU', 'RTURTURTU', 'TRUTRURTU', 'TUTRU', '2024-11-07', 'BASSAM', 'UTYURTYU', 'RTURTU', 'CNI', 'TRURTURTURTUUT', 'TRUTYURTUURTU', 'rturturtu', '54545.00', '', '2046506.jpg', 'SIGN_2046506.png', '2024-11-05 07:40:19', 'Faizan'),
(27, 'TO129003151', 'TO12', 'TOULEPLEU', 'SQFDQSDFQS', 'SQFQSFQS', 'FQSF', 'SQFSQF', 'SQDFQS', '2024-11-09', 'FSQFSQF', 'SQDFSQ', 'SQFQSFSQF', 'CNI', 'SQFSQFSDF', 'FQSFQSFSQQS', 'fqsf', '65415.00', '', NULL, 'SIGN_TO129003151.png', '2024-11-05 08:51:55', 'Faizan'),
(28, 'YA183300527', 'YA18', 'YAMOUSSOUKRO', 'DSFDSQF', 'SQDFSQFD', 'QSFQSFS', 'FDSQFSQFQSF', 'QSFQS', '2024-11-13', 'QSFQSFQS', 'QSFQSFDQSF', 'FDQSDFQFQSDF', 'CNI', 'QSFQSFQSDFQS', 'DFQSFSQF', 'qsfqsdfqsdfqs', '8448.00', '', NULL, 'SIGN_YA183300527.png', '2024-11-05 19:46:45', 'Faizan'),
(29, 'TA100093618', 'TA10', 'TABOU', 'SDFGDSFG', 'DSGFDSFG', 'DSFGDSFG', 'DFGDSFG', 'DSFGDSFGSDFG', '2024-11-12', 'FDFDSG', 'DFGHDFHDFH', 'FDGHFDGH', 'PERMIS DE CONDUIRE', 'DSFGSDFH', 'GSDFHSFGDH', 'fgshfghfdghdfh', '6856.00', '', NULL, 'SIGN_TA100093618.png', '2024-11-05 19:48:06', 'Faizan'),
(30, 'TA100900545', 'TA10', 'TABOU', 'SDFGFSDHG', 'FDGHFDGH', 'FDGHFDGH', 'FDGHDFGH', 'DFHGDFHG', '2024-11-07', 'FDGFG', 'DFGHDFGH', 'HFGFDGHF', 'CNI', 'DHGDFGHFDGH', 'FGHFDGH', 'fdghfdghfgdh', '84.00', '', 'TA100900545.jpg', 'SIGN_TA100900545.png', '2024-11-05 19:50:22', 'Faizan'),
(31, 'TO120622992', 'TO12', 'TOULEPLEU', 'SDFQSD', 'QSDFQSDF', 'QSFSQDF', 'SDQFQSDFQSDF', 'QSDFQSDF', '2024-11-07', 'FQSDFQSDFQSDF', 'FQSDFQS', 'QSDFQSDF', 'CNI', 'SQDFSDF', 'QSDFQSDFSQDFSQDF', 'qsdfqsdf', '9889.00', '', 'TO120622992.jpg', 'SIGN_TO120622992.png', '2024-11-05 19:52:37', 'Faizan'),
(32, 'YA185252881', 'YA18', 'YAMOUSSOUKRO', 'GHFGHFDGH', 'FDGHFDG', 'GHFGHD', 'FGHFGH', 'FHGFDGH', '2024-11-10', 'FGDFSG', 'FDGHFHG', 'GHFDGHFDGH', 'CNI', 'FDGHFDGHFGDHFDGH', 'FDGHFDGHFDGHFDGH', 'fdhgfdgh', '5645545.00', '', NULL, 'SIGN_YA185252881.png', '2024-11-05 19:57:16', 'Faizan'),
(33, 'TO126308755', 'TO12', 'TOULEPLEU', 'DSFGSDFG', 'SDFGDSFG', 'DFGDSFG', 'SDFGSDFG', 'SDFGSDFG', '2024-11-08', 'SDFSQDF', 'DFSQSDGFF', 'SDFGDFSG', 'CNI', 'SDGFDSFG', 'SDFGSDFGDSG', 'dsfgsdfg', '654.00', '', NULL, 'SIGN_TO126308755.png', '2024-11-05 19:58:48', 'Faizan'),
(34, 'TA106755585', 'TA10', 'TABOU', 'DSFGSDFG', 'DGFDSGFDSFG', 'DSFGSDFG', 'DSFGSDGFSDFG', 'DSFGDFG', '2024-11-14', 'GFDSFG', 'DSFGSDFG', 'SDFGSDFGSDGF', 'CNI', 'DSFGSDFGSDFG', 'DSFGDSFG', 'gsdfgsdfg', '848.00', '', NULL, 'SIGN_TA106755585.png', '2024-11-05 20:03:17', 'Faizan'),
(35, 'YA183225328', 'YA18', 'YAMOUSSOUKRO', 'FGDSFG', 'GFHSDFGH', 'FDGHDFGH', 'DFGH', 'FHGDDFGHFH', '2024-11-08', 'FDGHFGDH', 'FGHFGH', 'GHFFGDH', 'CNI', 'DFHFDGH', 'FGHFDGH', 'fghdfghdfg', '65854.00', '', NULL, 'SIGN_YA183225328.png', '2024-11-05 20:06:34', 'Faizan'),
(36, 'YA182867847', 'YA18', 'YAMOUSSOUKRO', 'DFGDFSG', 'SDFGSDFG', 'SDGSDGDS', 'GDGDSGF', 'DSGSD', '2024-11-15', '-RTYI', 'SDFGSDGF', 'DSFGSDFG', 'CNI', 'DSFGDGF', 'GFDFGDSFGDS', 'gsdfg', '959.00', '', NULL, 'SIGN_YA182867847.png', '2024-11-05 20:08:32', 'Faizan'),
(37, 'TO121315482', 'TO12', 'TOULEPLEU', 'QSFDQSDF', 'QSFDSQDF', 'SQDFQSDF', 'SQDFSQD', 'FSQDFQSDF', '2024-11-08', 'SQDFDF', 'SDFSQDFS', 'SDFSFDQQSDF', 'CNI', 'SDFSQDF', 'SDFQSDFSQFD', 'sqfdqsdfqsfd', '554.00', '', 'TO121315482.jpg', 'SIGN_TO121315482.png', '2024-11-05 20:12:46', 'Faizan'),
(38, 'TO123404287', 'TO12', 'TOULEPLEU', 'FSQDGSDFG', 'SDFG', 'SDFDFGSHSDF', 'FDHGFDGHD', 'FGHGFDHDFGH', '2024-11-08', 'DSFQSF', 'TYFDGHDFGH', 'FGHFDGHGDFH', 'CNI', 'FDGHDGFH', 'HDFGHGFHD', 'fdhdfghfdghh', '484.00', '', NULL, 'SIGN_TO123404287.png', '2024-11-05 20:14:47', 'Faizan'),
(39, 'TO121167240', 'TO12', 'TOULEPLEU', 'QSDFQSD', 'QSFDF', 'SFDSFDSDF', 'SDFSQDF', 'SQDFSQF', '2024-11-08', 'DSFQSDF', 'FGGDSFG', 'SQDFQSDF', 'CNI', 'SFQQSF', 'QSFDSQD', 'fsqdf', '6787.00', '', 'TO121167240.jpg', 'SIGN_TO121167240.png', '2024-11-05 20:21:22', 'Faizan'),
(40, 'TO123534592', 'TO12', 'TOULEPLEU', 'FSQDGSDFG', 'SDFG', 'SDFDFGSHSDF', 'FDHGFDGHD', 'FGHGFDHDFGH', '2024-11-08', 'DSFQSF', 'TYFDGHDFGH', 'FGHFDGHGDFH', 'CNI', 'FDGHDGFH', 'HDFGHGFHD', 'fdhdfghfdghh', '484.00', '', NULL, 'SIGN_TO123534592.png', '2024-11-05 20:22:12', 'Faizan'),
(41, 'TO121949509', 'TO12', 'TOULEPLEU', 'SQFDQSDF', 'SQDFQSDFSQDF', 'SDFQSDF', 'SQDFSQDF', 'SQFDSQFD', '2024-11-05', 'SDFSQDF', 'FQSDFQSDF', 'SQFSQD', 'CNI', 'SQFDSQD', 'FSQDFQSDF', 'sdfsqdfqsdf', '66456.00', '', NULL, 'SIGN_TO121949509.png', '2024-11-05 20:22:12', 'Faizan'),
(42, 'YA181147767', 'YA18', 'YAMOUSSOUKRO', 'SDFGSDF', 'SDGSDG', 'DSFGSDFG', 'GSDFGSDFG', 'SDGFSDFG', '2024-11-01', 'FDSFGSDG', 'GSDGF', 'DSFGSDFGSDGF', 'CNI', 'GDSFGSDF', 'SDGDSFGDSGF', 'dsfgsdfgdsfg', '6645.00', '', 'YA181147767.jpg', 'SIGN_YA181147767.png', '2024-11-05 20:23:25', 'Faizan'),
(43, 'TA103909839', 'TA10', 'TABOU', 'FDSDF', 'DFHDFHD', 'FHDFGHDFH', 'DFGHDFH', 'DFHDFHG', '2024-11-22', 'SDFSDGSFD', 'DFGHDFGH', 'DFGHDFH', 'CNI', 'HGDFHFDHGDFGH', 'DFHDFGHDF', 'fdghdfghdf', '541545.00', '', NULL, 'SIGN_TA103909839.png', '2024-11-05 20:24:16', 'Faizan'),
(44, 'TO120807484', 'TO12', 'TOULEPLEU', 'DFGDFSG', 'DSGFSDGF', 'DSGFSDGF', 'DSGFSDFG', 'DSFGSDFG', '2024-11-07', 'DSGFSDG', 'DSFGSDFG', 'GDSFGDGG', 'CNI', 'DSGFDSFG', 'DSGFSDGF', 'dfgdsfg', '544.00', '', 'TO120807484.jpg', 'SIGN_TO120807484.png', '2024-11-05 20:27:39', 'Faizan'),
(45, 'YA188773404', 'YA18', 'YAMOUSSOUKRO', 'SDGSDG', 'SDGSDG', 'DSGFDSFG', 'GDFSDGFDSGF', 'SDFGSDG', '2024-11-06', 'DFGDSFG', 'SDGFSDFG', 'SDGDSG', 'CNI', 'SDGFSDGFGS', 'DSDFGSDGF', 'dsfgsdfg', '95954.00', '', 'YA188773404.jpg', 'SIGN_YA188773404.png', '2024-11-05 20:28:11', 'Faizan'),
(46, 'ME178305528', 'ME17', 'MEAGUI', 'FGDSFGSDFGSDGF', 'SDFGSDFG', 'GDSFGSDFG', 'GDFGDFSG', 'SDGF', '2024-11-13', 'DFGSDFG', 'DFGDFSG', 'DSFGSDFGDGFS', 'CNI', 'DGFSGSDFG', 'DFGFDGDSFG', 'dsfgfdsdfgfdsg', '6565484.00', '', 'ME178305528.jpg', 'SIGN_ME178305528.png', '2024-11-05 20:29:46', 'Faizan'),
(47, 'GA095766434', 'GA09', 'GAGNOA', 'SDGFSDGFG', 'DSFGDSFG', 'GDFSFGSD', 'FGSDGF', 'SDGFSDGF', '2024-10-30', 'QDSFGSDFGSDG', 'SDFGSDFG', 'DSGFDSFG', 'CNI', 'SDGFSD', 'SDGFSDFG', 'gfdsfggsd', '95489.00', '', 'GA095766434.jpg', 'SIGN_GA095766434.png', '2024-11-05 20:30:17', 'Faizan'),
(48, 'TO124392098', 'TO12', 'TOULEPLEU', 'GSDF', 'GFGHFDGH', 'FDGHDFGHF', 'HDGDFGHFDGH', 'DFGHDFGH', '2024-11-09', 'FQSDF', 'DFGHDFGH', 'DFGH', 'CNI', 'FDGHFDGHFDGH', 'DFGHFDGH', 'dfghdfgh', '45.00', '', 'TO124392098.jpg', 'SIGN_TO124392098.png', '2024-11-05 20:31:20', 'Faizan'),
(49, 'YA181024755', 'YA18', 'YAMOUSSOUKRO', 'QSFDQSFD', 'SDFQSDF', 'QSDFQSDFFSSFD', 'QSDFQSDF', 'QSFQSDFQSD', '2024-11-08', 'SQDFQSFFD', 'SDQFQSDF', 'FSQDQSDF', 'CNI', 'FSDFQQSDF', 'QSDFFDS', 'qsdfqsdf', '848.00', '', 'YA181024755.jpg', 'SIGN_YA181024755.png', '2024-11-05 20:31:43', 'Faizan'),
(50, 'YA187839047', 'YA18', 'YAMOUSSOUKRO', 'SFGDSDFG', 'GFDSFG', 'SDFGDSFGDSFG', 'SDFGSDFGS', 'DGFDSFGSDFG', '2024-11-09', 'DFBFDSG', 'DFSGDSFG', 'SDFGSDFG', 'CNI', 'DGFDSGF', 'DGFSSDFG', 'fgddsfgsdfg', '545454.00', '', 'YA187839047.jpg', 'SIGN_YA187839047.png', '2024-11-05 20:37:09', 'Faizan'),
(51, 'YA183948967', 'YA18', 'YAMOUSSOUKRO', 'SDGFSDG', 'SDGSDG', 'GDSGFSDFGSDG', 'DFSGDSGFFG', 'SDGSDGF', '2024-11-05', 'DFGDSFG', 'DFGSDFGSDFG', 'GDFSGS', 'CNI', 'DFGG', 'GDSDG', 'sgsdfgdfsg', '69786.00', '', 'YA183948967.jpg', 'SIGN_YA183948967.png', '2024-11-05 20:40:50', 'Faizan'),
(52, 'TO128913602', 'TO12', 'TOULEPLEU', 'AZDA', 'RERAZRAZ', 'AZRAZR', 'AZRAZ', 'AZRAZ', '2024-11-06', 'RAZREAZ', 'RAZRA', 'RAZRAR', 'CNI', 'RAZRAZR', 'RAZR', 'rzaazrazrazr', '56654.00', '', 'TO128913602.jpg', 'SIGN_TO128913602.png', '2024-11-05 20:55:53', 'Faizan'),
(53, 'TO129990809', 'TO12', 'TOULEPLEU', 'SDGSDG', 'GSDG', 'SDGSDGDS', 'GSDG', 'DSFGSDG', '2024-11-09', 'SDGSDGDS', 'FGDFSG', 'DSGSDG', 'CNI', 'SDG', 'SGSDG', 'sdfgsfgdsfggf', '84.00', '', 'TO129990809.jpg', 'SIGN_TO129990809.png', '2024-11-05 21:24:04', 'Faizan'),
(54, 'TO120837001', 'TO12', 'TOULEPLEU', 'T--TFVT', 'VGGF', 'FQSDFF', 'SDFQSDF', 'FDFGHDF', '2024-11-13', '_Gè_GY', 'FT-T', 'HFDGHDF', 'CNI', 'GDFGHDFHDF', '5484', 'fdg', '544848.00', '', 'TO120837001.jpg', 'SIGN_TO120837001.png', '2024-11-05 21:29:14', 'Faizan'),
(55, 'YA183973644', 'YA18', 'YAMOUSSOUKRO', 'DGDFG', 'SFGSDFG', 'DFGSDGSD', 'SDGSDGF', 'DSGDSGF', '2024-11-07', 'QDFFSF', 'DSFGD', 'SDGS', 'CNI', 'FGSDG', 'SDFGDSFG', 'dgdsfgdfhfdg', '54.00', '', 'YA183973644.jpg', 'SIGN_YA183973644.png', '2024-11-05 21:29:50', 'Faizan'),
(56, 'YA182882058', 'YA18', 'YAMOUSSOUKRO', 'DFGH', 'FHGFDH', 'FGHDFDGH', 'FDGH', 'FDHFDH', '2024-11-08', 'FHFDGH', 'FDHGFGH', 'HFFGH', 'CNI', 'FDGHDFHG', 'HDF', 'ghdfghfgdhfhdfg', '545.00', '', 'YA182882058.jpg', 'SIGN_YA182882058.png', '2024-11-05 21:32:52', 'Faizan'),
(57, 'TO121422389', 'TO12', 'TOULEPLEU', 'GFDFSG', 'GSDFGSDFG', 'FFDFSGSDFG', 'DFSGSDFGSDG', 'SDFG', '2024-11-01', 'DQSFSQDFG', 'SDGFDSG', 'SDFGDSGF', 'CNI', 'DSFGDSFG', 'DSFGSDGF', 'dsfgsdfgdsgf', '61615.00', '', 'TO121422389.jpg', 'SIGN_TO121422389.png', '2024-11-05 21:36:15', 'Faizan'),
(58, 'TO129344486', 'TO12', 'TOULEPLEU', 'FSDG', 'FDGH', 'DFGHFDGH', 'DFGHDF', 'HDFGHDFGH', '2024-11-17', 'HFHGFHG', 'DFGSDFH', 'DFGHHFG', 'CNI', 'GHFHG', 'FGHDFG', 'fdhgdfh', '52.00', '', 'TO129344486.jpg', 'SIGN_TO129344486.png', '2024-11-05 21:39:00', 'Faizan'),
(59, 'TO124904503', 'TO12', 'TOULEPLEU', 'DSGSDFG', 'SDGFDSG', 'DSGFDSFG', 'DSFG', 'DSGFSDFG', '2024-11-09', 'FGDSG', 'DGDSFG', 'DSFG', 'CNI', 'DFGDSFG', 'DFSGDSFGD', 'fsgfgd', '54.00', '', 'TO124904503.jpg', 'SIGN_TO124904503.png', '2024-11-05 21:39:00', 'Faizan');

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
-- AUTO_INCREMENT pour la table `tbl_events`
--
ALTER TABLE `tbl_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `tbl_producteurs`
--
ALTER TABLE `tbl_producteurs`
  MODIFY `producteur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

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
