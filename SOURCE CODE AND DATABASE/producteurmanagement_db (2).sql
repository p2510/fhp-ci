-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : dim. 13 oct. 2024 à 11:05
-- Version du serveur : 8.0.35
-- Version de PHP : 8.2.20

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
-- Structure de la table `tbl_invoice`
--

CREATE TABLE `tbl_invoice` (
  `invoice_id` int NOT NULL,
  `order_date` date NOT NULL,
  `subtotal` double NOT NULL,
  `discount` double NOT NULL,
  `sgst` float NOT NULL,
  `cgst` float NOT NULL,
  `total` double NOT NULL,
  `payment_type` tinytext NOT NULL,
  `due` double NOT NULL,
  `paid` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `barcode` varchar(200) NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `qty` int NOT NULL,
  `rate` double NOT NULL,
  `saleprice` double NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `pid` int NOT NULL,
  `barcode` varchar(1000) NOT NULL,
  `product` varchar(200) NOT NULL,
  `category` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `stock` int NOT NULL,
  `purchaseprice` float NOT NULL,
  `saleprice` float NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `producteur_id` int NOT NULL,
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
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `tbl_producteurs`
--

INSERT INTO `tbl_producteurs` (`producteur_id`, `producteur_code`, `secteur_code`, `secteur_name`, `departement`, `sous_prefecture`, `localite`, `nom`, `prenom`, `date_naissance`, `lieu_naissance`, `sous_pref_naissance`, `departement_naissance`, `type_piece_identite`, `numero_piece`, `autre_piece`, `contact_telephonique`, `superficie_totale`, `delegue_village`, `photo`, `signature`, `created_at`, `created_by`) VALUES
(2, 'ME178352505', 'ME17', 'MEAGUI', 'DJEBOUNOUA', 'YAKASSE FEYASSE', 'ARRAH', 'FADIKA', 'MALICK', '2002-02-08', 'ABJ', 'LAGUNES', 'ARRAH', 'CNI', 'CI33333229293', '', '44949944', 23.00, 'oui', 'ME178352505.jpg', 'SIGN_ME178352505.png', '2024-09-27 21:33:57', 'Faizan'),
(8, 'BO082408551', 'BO08', 'BONGOUANOU', 'DJEBOUNOUA', 'YAKASSE FEYASS', 'ARRAH', 'PATRICIA TOURE', 'MALICK', '2009-03-08', 'COCODY', 'ABIDJAN', 'LAGUNES', 'CNI', '474789922', 'CARTE CM', '0787431901', 376.00, 'non', 'BO082408551.jpg', 'SIGN_BO082408551.png', '2024-10-03 11:28:34', 'Faizan'),
(9, 'AB010010003', 'AB01', 'ABENGOUROU', 'ABENGOUROU', 'ABENGOUROU', 'ABENGOUROU', 'BOAMAN ', 'ADONY LUCIEN MARTIAL ', '1973-10-12', 'BETTIE', 'BETTIE', 'ABENGOUROU', 'CNI', 'CI003268018', '', '0709868500', 14.22, 'non', 'AB014130164.jpg', 'SIGN_AB014130164.png', '2024-10-07 10:15:35', 'Faizan'),
(10, 'SO178121013', 'SO17', 'SOUBRE', 'DJEBOUNOUA', 'ABENGOUROU', 'ABENGOUROU', 'PATRICIA TOURE', 'ADONY LUCIEN MARTIAL ', '2002-02-08', 'COCODY', 'ABIDJAN', 'LAGUNES', 'CNI', 'CI8374999200', '', '44949944', 12.00, 'non', 'SO178121013.jpg', 'SIGN_SO178121013.png', '2024-10-08 11:31:05', 'Patricia Toure'),
(12, 'ST163273487', 'ST16', 'SIKENSI-TIASSALE', 'DJEBOUNOUA', 'YAKASSE FEYASSE', 'ARRAH', 'PATRICIA TOURE', 'HHNNJ', '2002-02-08', 'COCODY', 'ABIDJAN', 'LAGUNE', 'CNI', 'CI8374999200', 'CARTE CM', '0787431901', 12.00, 'oui', 'ST163273487.jpg', 'SIGN_ST163273487.png', '2024-10-08 22:36:05', 'Faizan'),
(13, 'SO172718971', 'SO17', 'SOUBRE', 'DJEBOUNOUA', 'ABENGOUROU', 'JJJ', 'FADIKA', 'MALICK', '2002-02-08', 'COCODY', 'ABIDJAN', 'LAGUNE', 'CNI', 'CI8374999200', 'CARTE CMU', '0787431901', 18.00, 'oui', 'SO172718971.jpg', 'SIGN_SO172718971.png', '2024-10-09 07:44:06', 'Faizan');

-- --------------------------------------------------------

--
-- Structure de la table `tbl_secteurs`
--

CREATE TABLE `tbl_secteurs` (
  `secteur_id` int NOT NULL,
  `secteur_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `secteur_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `userid` int NOT NULL,
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `useremail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `userpassword` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `tbl_user`
--

INSERT INTO `tbl_user` (`userid`, `username`, `useremail`, `userpassword`, `role`) VALUES
(1, 'Faizan', 'faizan@gmail.com', '12345', 'Admin'),
(2, 'user', 'user@gmail.com', '123', 'User'),
(14, 'test', 'test@gmail.com', '123', 'User'),
(15, 'Benoit Kouame', 'benoit@fph-ci.com', '123456789.', 'Admin'),
(16, 'Malick Fadika', 'fadika@fph-ci.com', '123456.', 'Admin'),
(17, 'Patricia Toure', 'pat@fph-ci.com', '1235', 'Admin');

--
-- Index pour les tables déchargées
--

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
-- AUTO_INCREMENT pour la table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  MODIFY `invoice_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `tbl_invoice_details`
--
ALTER TABLE `tbl_invoice_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT pour la table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `pid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `tbl_producteurs`
--
ALTER TABLE `tbl_producteurs`
  MODIFY `producteur_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `tbl_secteurs`
--
ALTER TABLE `tbl_secteurs`
  MODIFY `secteur_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT pour la table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `userid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
