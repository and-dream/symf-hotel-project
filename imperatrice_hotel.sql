-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 06 sep. 2023 à 16:52
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `imperatrice_hotel`
--

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description_courte` varchar(255) NOT NULL,
  `description_longue` longtext NOT NULL,
  `photo` varchar(255) NOT NULL,
  `prix_journalier` int(11) NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`id`, `titre`, `description_courte`, `description_longue`, `photo`, `prix_journalier`, `date_enregistrement`) VALUES
(1, 'Chambre classique', 'Élégance intemporelle, lit king-size, vue sur la ville, salle de bain en marbre. L\'essence du confort parisien.', '<div>&nbsp;Plongez dans l\'élégance intemporelle de notre chambre classique. À l\'intérieur, vous trouverez un lit king-size somptueusement confortable, drapé de linge de haute qualité. La vue depuis votre fenêtre vous offre une perspective captivante sur la magnifique ville de Paris, où l\'histoire et la modernité se rencontrent. La salle de bains en marbre est un havre de tranquillité, équipée d\'une baignoire profonde et d\'une douche à effet pluie pour une expérience de détente absolue. Chaque détail a été pensé pour votre confort, des peignoirs moelleux aux produits de bain haut de gamme. La chambre classique incarne l\'essence du luxe parisien, avec une touche de charme unique.&nbsp;</div>', '1693987617-classique-4b5587dd51ee1155a790e9afda424880fc2717cb.jpg', 2300, '2023-09-06 10:06:57'),
(2, 'Chambre confort', 'Spacieuse, lit douillet, coin salon, minibar bien garni. Un refuge de luxe pour se détendre au cœur de Paris.', '<div>&nbsp;Bienvenue dans notre chambre confort, un espace conçu pour offrir un confort optimal au cœur de Paris. Le lit, d\'une douceur inégalée, est un véritable havre de repos après une journée de découvertes dans la ville lumière. Le coin salon spacieux est idéal pour vous détendre avec un bon livre ou un verre de vin. Un minibar soigneusement approvisionné est à votre disposition pour satisfaire vos envies gourmandes à tout moment. Les grandes fenêtres laissent entrer la lumière naturelle tout en vous offrant une vue agréable sur les environs. Vous pouvez vous attendre à une expérience de luxe, où chaque détail est pensé pour votre bien-être.&nbsp;</div>', '1693987896-confort-ccb5a40059ae30a64f7c22dda8c7787fc0e810cf.jpg', 2700, '2023-09-06 10:11:36'),
(3, 'Suite Royale', 'L\'apogée du luxe, salon privé, vue panoramique, baignoire spa, service de majordome. Une expérience incomparable à Paris.', '<div>&nbsp;Bienvenue dans l\'apogée du luxe à Paris - notre suite vous offre une expérience inégalée. Dès votre arrivée, vous serez accueilli par un salon privé exquis, où vous pourrez vous détendre en toute intimité. Les grandes baies vitrées vous offrent une vue panoramique à couper le souffle sur les monuments emblématiques de Paris, créant une toile de fond inoubliable pour votre séjour. La chambre principale est équipée d\'un lit king-size somptueux, et la salle de bains est une oasis de bien-être, avec une baignoire spa, une douche à jets et des produits de bain de luxe. Un service de majordome personnel est à votre disposition pour répondre à vos moindres besoins, que ce soit pour organiser des visites privées ou pour un service de chambre exceptionnel. La suite offre une expérience incomparable de raffinement et de grandeur à Paris.&nbsp;</div>', '1693987989-suite-31e2c359843d46d61b255f880b5da25074cc900f.jpg', 3590, '2023-09-06 10:13:09');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `chambre_id` int(11) NOT NULL,
  `date_arrivee` date NOT NULL,
  `date_depart` date NOT NULL,
  `prix_total` int(11) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230906094902', '2023-09-06 11:49:21', 12),
('DoctrineMigrations\\Version20230906095122', '2023-09-06 11:51:36', 9);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `ordre` int(11) NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `slider`
--

INSERT INTO `slider` (`id`, `photo`, `ordre`, `date_enregistrement`) VALUES
(1, '1694001173-slide-1-3ddcc62e789743e75a432d34a6cb27b491296f77.jpg', 1, '2023-09-06 10:13:34'),
(2, '1694001185-slide-2-0feebd793af4922d2730c2490ae1896ef92887fe.jpg', 2, '2023-09-06 10:13:42'),
(3, '1694001204-slide-3-99816550c3a21b31eab264b7e82467e1226b0a30.jpg', 3, '2023-09-06 10:13:57');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `pseudo` varchar(20) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `civilite` varchar(20) NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `pseudo`, `nom`, `prenom`, `civilite`, `date_enregistrement`) VALUES
(1, 'gloria@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$U.rtLvfCU8dpD5X5nMlaIuOtYlqyUAiqNwJcUQ8.Bruu1dq/pb4Ia', 'gloria', 'Damase', 'Gloria', 'femme', '2023-09-06 11:52:48');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6EEAA67D9B177F54` (`chambre_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_6EEAA67D9B177F54` FOREIGN KEY (`chambre_id`) REFERENCES `chambre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
