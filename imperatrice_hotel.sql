-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 11 sep. 2023 à 14:09
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
(1, 'Chambre classique', 'Élégance intemporelle, lit king-size, vue sur la ville, salle de bain en marbre. L\'essence du confort parisien.', '<div>Plongez dans l\'élégance intemporelle de notre chambre classique. À l\'intérieur, vous trouverez un lit king-size somptueusement confortable, drapé de linge de haute qualité. La vue depuis votre fenêtre vous offre une perspective captivante sur la magnifique ville de Paris, où l\'histoire et la modernité se rencontrent. La salle de bains en marbre est un havre de tranquillité, équipée d\'une baignoire profonde et d\'une douche à effet pluie pour une expérience de détente absolue. Chaque détail a été pensé pour votre confort, des peignoirs moelleux aux produits de bain haut de gamme. La chambre classique incarne l\'essence du luxe parisien, avec une touche de charme unique.&nbsp;</div>', '1694071727-classique-21328ba8847c96786acc757741046cbb6b2b0522.jpg', 2300, '2023-09-06 10:06:57'),
(2, 'Chambre confort', 'Spacieuse, lit douillet, coin salon, minibar bien garni. Un refuge de luxe pour se détendre au cœur de Paris.', '<div>&nbsp;Bienvenue dans notre chambre confort, un espace conçu pour offrir un confort optimal au cœur de Paris. Le lit, d\'une douceur inégalée, est un véritable havre de repos après une journée de découvertes dans la ville lumière. Le coin salon spacieux est idéal pour vous détendre avec un bon livre ou un verre de vin. Un minibar soigneusement approvisionné est à votre disposition pour satisfaire vos envies gourmandes à tout moment. Les grandes fenêtres laissent entrer la lumière naturelle tout en vous offrant une vue agréable sur les environs. Vous pouvez vous attendre à une expérience de luxe, où chaque détail est pensé pour votre bien-être.&nbsp;</div>', '1694071737-confort-6ff122b4d9bda0e49dae2174d1b1d52c405a3958.jpg', 2700, '2023-09-06 10:11:36'),
(3, 'Suite Royale', 'L\'apogée du luxe, salon privé, vue panoramique, baignoire spa, service de majordome. Une expérience incomparable à Paris.', '<div>&nbsp;Bienvenue dans l\'apogée du luxe à Paris - notre suite vous offre une expérience inégalée. Dès votre arrivée, vous serez accueilli par un salon privé exquis, où vous pourrez vous détendre en toute intimité. Les grandes baies vitrées vous offrent une vue panoramique à couper le souffle sur les monuments emblématiques de Paris, créant une toile de fond inoubliable pour votre séjour. La chambre principale est équipée d\'un lit king-size somptueux, et la salle de bains est une oasis de bien-être, avec une baignoire spa, une douche à jets et des produits de bain de luxe. Un service de majordome personnel est à votre disposition pour répondre à vos moindres besoins, que ce soit pour organiser des visites privées ou pour un service de chambre exceptionnel. La suite offre une expérience incomparable de raffinement et de grandeur à Paris.&nbsp;</div>', '1694071746-suite-822670a256f447e8ba53215d22131d704176f25b.jpg', 3590, '2023-09-06 10:13:09');

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

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `chambre_id`, `date_arrivee`, `date_depart`, `prix_total`, `prenom`, `nom`, `telephone`, `email`, `date_enregistrement`) VALUES
(1, 3, '2023-09-20', '2023-09-30', 32310, 'gloria', 'damase', '0257885122', 'gloria@mail.com', '2023-09-07 15:45:12'),
(2, 1, '2023-11-20', '2023-11-30', 23000, 'Enzo', 'Massé', '06 25 28 41 87', 'enzo.massé@gmail.com', '2023-09-08 15:09:21'),
(3, 2, '2023-09-25', '2023-09-30', 13500, 'Edmée', 'Niel', '06 87 96 45 12', 'e.niel@gmail.com', '2023-09-08 15:19:56');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `date_enregistrement` datetime NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `author`, `content`, `date_enregistrement`, `category`) VALUES
(1, 'Andrea', 'Une parenthèse hors du temps dans le sublime spa. Je recommande vivement !', '2023-09-08 10:16:14', 'spa'),
(2, 'Iseult', 'Nous avons réservé pour la Saint Sylvestre. Cadre somptueux. Repas raffiné. Nous ne regrettons pas notre choix.', '2023-09-08 15:22:19', 'restaurant'),
(3, 'Tim C.', 'Une pause pour le tea time avec une sélection de pâtisserie incroyable ! Je reviendrais.', '2023-09-08 15:23:31', 'restaurant'),
(4, 'Laulau', 'Je suis venue avec ma meilleure pour une après-midi au spa. La masseuse a des mains de fée !!!', '2023-09-08 15:24:27', 'spa'),
(5, 'Héloise', 'Un magnifique hôtel pour se ressourcer grâce au spa et proche des sites touristiques parisiens.', '2023-09-08 15:25:26', 'hotel'),
(6, 'Céleste', 'J\'adore ce palace ! En plein centre de Paris, une décoration magnifique, chaque détail est bien pensé.', '2023-09-08 15:27:21', 'hotel');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `message` longtext NOT NULL
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
('DoctrineMigrations\\Version20230908080107', '2023-09-08 10:01:18', 26);

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
(1, '1694070904-slide-1-4b8ba6c7adc7588a722e26d9bc172b9a27a75e29.jpg', 1, '2023-09-06 10:13:34'),
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
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
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
