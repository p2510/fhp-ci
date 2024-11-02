-- -------------------------------------------------------------
-- TablePlus 6.1.8(574)
--
-- https://tableplus.com/
--
-- Database: producteurmanagement_db
-- Generation Time: 2024-10-21 00:18:10.4110
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `tbl_events` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_type` varchar(255) DEFAULT NULL,
  `event_description` varchar(255) DEFAULT NULL,
  `event_source_IP` varchar(255) DEFAULT NULL,
  `event_source_UA` varchar(255) DEFAULT NULL,
  `event_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `actor_id` int DEFAULT NULL,
  `actor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tbl_producteurs` (
  `producteur_id` int NOT NULL AUTO_INCREMENT,
  `producteur_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `secteur_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secteur_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `departement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sous_prefecture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `localite` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `lieu_naissance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sous_pref_naissance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `departement_naissance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type_piece_identite` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `numero_piece` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `autre_piece` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_telephonique` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `superficie_totale` decimal(10,2) NOT NULL,
  `delegue_village` enum('oui','non') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `signature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`producteur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tbl_secteurs` (
  `secteur_id` int NOT NULL AUTO_INCREMENT,
  `secteur_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `secteur_name` varchar(255) NOT NULL,
  PRIMARY KEY (`secteur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tbl_user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `useremail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `userpassword` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `tbl_events` (`event_id`, `event_type`, `event_description`, `event_source_IP`, `event_source_UA`, `event_status`, `created_at`, `actor_id`, `actor_name`, `subject_type`, `subject_id`, `subject_name`) VALUES
(1, 'Consultation', 'Michel a consulté la liste des secteurs', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-21 00:06:44', 19, 'Michel', 'Secteur', NULL, 'N/A'),
(2, 'Consultation', 'Michel a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-21 00:06:46', 19, 'Michel', 'Producteur', NULL, 'N/A'),
(3, 'Consultation', 'Michel a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-21 00:06:49', 19, 'Michel', 'Producteur', NULL, 'N/A'),
(4, 'Génération Carte', 'Michel a généré la carte du producteur N°9 - BOAMAN  ADONY LUCIEN MARTIAL ', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-21 00:06:58', 19, 'Michel', 'Producteur', 9, 'BOAMAN  ADONY LUCIEN MARTIAL '),
(5, 'Consultation', 'Michel a consulté la liste des producteurs', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-21 00:09:05', 19, 'Michel', 'Producteur', NULL, 'N/A'),
(6, 'Consultation', 'Michel a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-21 00:09:41', 19, 'Michel', 'Producteur', NULL, 'N/A'),
(7, 'Consultation', 'Michel a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-21 00:09:50', 19, 'Michel', 'Producteur', NULL, 'N/A'),
(8, 'Consultation', 'Michel a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-21 00:09:57', 19, 'Michel', 'Producteur', NULL, 'N/A'),
(9, 'Consultation', 'Michel a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-21 00:10:45', 19, 'Michel', 'Producteur', NULL, 'N/A'),
(10, 'Consultation', 'Michel a consulté le producteur N°2 - FADIKA MALICK', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-21 00:10:54', 19, 'Michel', 'Producteur', 2, 'FADIKA MALICK'),
(11, 'Génération Fiche', 'Michel a généré la fiche du producteur N°2 - FADIKA MALICK', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-21 00:10:59', 19, 'Michel', 'Producteur', 2, 'FADIKA MALICK'),
(12, 'Consultation', 'Michel a consulté la liste des délégués', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15', 'Succès', '2024-10-21 00:11:32', 19, 'Michel', 'Producteur', NULL, 'N/A');

INSERT INTO `tbl_producteurs` (`producteur_id`, `producteur_code`, `secteur_code`, `secteur_name`, `departement`, `sous_prefecture`, `localite`, `nom`, `prenom`, `date_naissance`, `lieu_naissance`, `sous_pref_naissance`, `departement_naissance`, `type_piece_identite`, `numero_piece`, `autre_piece`, `contact_telephonique`, `superficie_totale`, `delegue_village`, `photo`, `signature`, `created_at`, `created_by`) VALUES
(2, 'ME178352505', 'ME17', 'MEAGUI', 'DJEBOUNOUA', 'YAKASSE FEYASSE', 'ARRAH', 'FADIKA', 'MALICK', '2002-02-08', 'ABJ', 'LAGUNES', 'ARRAH', 'CNI', 'CI33333229293', '', '44949944', 23.00, 'oui', 'ME178352505.jpg', 'SIGN_ME178352505.png', '2024-09-27 21:33:57', 'Faizan'),
(8, 'BO082408551', 'BO08', 'BONGOUANOU', 'DJEBOUNOUA', 'YAKASSE FEYASS', 'ARRAH', 'PATRICIA TOURE', 'MALICK', '2009-03-08', 'COCODY', 'ABIDJAN', 'LAGUNES', 'CNI', '474789922', 'CARTE CM', '0787431901', 376.00, 'non', 'BO082408551.jpg', 'SIGN_BO082408551.png', '2024-10-03 11:28:34', 'Faizan'),
(9, 'AB010010003', 'AB01', 'ABENGOUROU', 'ABENGOUROU', 'ABENGOUROU', 'ABENGOUROU', 'BOAMAN ', 'ADONY LUCIEN MARTIAL ', '1973-10-12', 'BETTIE', 'BETTIE', 'ABENGOUROU', 'CNI', 'CI003268018', '', '0709868500', 14.22, 'non', 'AB014130164.jpg', NULL, '2024-10-07 10:15:35', 'Faizan'),
(10, 'SO178121013', 'SO17', 'SOUBRE', 'DJEBOUNOUA', 'ABENGOUROU', 'ABENGOUROU', 'PATRICIA TOURE', 'ADONY LUCIEN MARTIAL ', '2002-02-08', 'COCODY', 'ABIDJAN', 'LAGUNES', 'CNI', 'CI8374999200', '', '44949944', 12.00, 'non', NULL, 'SIGN_SO178121013.png', '2024-10-08 11:31:05', 'Patricia Toure'),
(12, 'ST163273487', 'ST16', 'SIKENSI-TIASSALE', 'DJEBOUNOUA', 'YAKASSE FEYASSE', 'ARRAH', 'PATRICIA TOURE', 'HHNNJ', '2002-02-08', 'COCODY', 'ABIDJAN', 'LAGUNE', 'CNI', 'CI8374999200', 'CARTE CM', '0787431901', 12.00, 'oui', NULL, 'SIGN_ST163273487.png', '2024-10-08 22:36:05', 'Faizan'),
(13, 'SO172718971', 'SO17', 'SOUBRE', 'DJEBOUNOUA', 'ABENGOUROU', 'JJJ', 'FADIKA', 'MALICK', '2002-02-08', 'COCODY', 'ABIDJAN', 'LAGUNE', 'CNI', 'CI8374999200', 'CARTE CMU', '0787431901', 18.00, 'oui', 'SO172718971.jpg', 'SIGN_SO172718971.png', '2024-10-09 07:44:06', 'Faizan');

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

INSERT INTO `tbl_user` (`userid`, `username`, `useremail`, `userpassword`, `role`) VALUES
(1, 'Faizan', 'faizan@gmail.com', '12345', 'Admin'),
(15, 'Benoit Kouame', 'benoit@fph-ci.com', '123456789.', 'Admin'),
(16, 'Malick Fadika', 'fadika@fph-ci.com', '123456.', 'Admin'),
(17, 'Patricia Toure', 'pat@fph-ci.com', '1235', 'Admin'),
(19, 'Michel', 'michel.test@gmail.com', 'bruh', 'Admin');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;