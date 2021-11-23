-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 23 nov. 2021 à 16:47
-- Version du serveur : 5.7.33
-- Version de PHP : 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ansaka`
--

-- --------------------------------------------------------

--
-- Structure de la table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `languages`
--

INSERT INTO `languages` (`id`, `name`) VALUES
(1, 'Html5'),
(2, 'Css3'),
(3, 'Php'),
(4, 'JavaScript'),
(5, 'Symfony'),
(6, 'Jquery'),
(7, 'VueJs'),
(8, 'ReactJs'),
(9, 'WordPress');

-- --------------------------------------------------------

--
-- Structure de la table `maquettes`
--

CREATE TABLE `maquettes` (
  `id` int(11) NOT NULL,
  `image_maquette` varchar(255) DEFAULT NULL,
  `works_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `maquettes`
--

INSERT INTO `maquettes` (`id`, `image_maquette`, `works_id`) VALUES
(1, 'shot-maquette-svp-visio-1.png', 2),
(2, 'shot-maquette-svp-visio-2.png', 2),
(3, 'shot-maquette-svp-visio-3.png', 2),
(4, 'shot-maquette-naga-0.png', 1),
(5, 'shot-maquette-naga-1.png', 1),
(6, 'shot-maquette-naga-2.png', 1),
(7, 'shot-maquette-naga-3.png', 1),
(8, 'shot-maquette-naga-4.png', 1),
(9, 'shot-maquette-adopte-dechet-1.png', 3),
(10, 'shot-maquette-adopte-dechet-2.png', 3),
(11, 'shot-maquette-adopte-dechet-3.png', 3),
(12, 'shot-maquette-symfony-1.png', 4),
(13, 'shot-maquette-symfony-2.png', 4),
(14, 'shot-maquette-symfony-3.png', 4);

-- --------------------------------------------------------

--
-- Structure de la table `outils`
--

CREATE TABLE `outils` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `works_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `outils`
--

INSERT INTO `outils` (`id`, `name`, `works_id`) VALUES
(1, 'Figma', 1),
(2, 'Github', 1),
(3, 'VS Code', 1),
(4, 'Photoshop', 2),
(5, 'Adobe xD', 2),
(6, 'Adobe Premiere', 2),
(7, 'Adobe xD', 3),
(8, 'Github', 3),
(9, 'VS Code', 3),
(10, 'Github', 4),
(11, 'Illustrator', 4),
(12, 'After Effects', 4);

-- --------------------------------------------------------

--
-- Structure de la table `palettes`
--

CREATE TABLE `palettes` (
  `palettes_id` int(11) NOT NULL,
  `color` varchar(50) NOT NULL,
  `works_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `palettes`
--

INSERT INTO `palettes` (`palettes_id`, `color`, `works_id`) VALUES
(1, '#2E3B58', 1),
(2, '#F2F3F5', 1),
(3, '#0acf97', 1),
(4, '#fa5c7c', 1),
(5, '#3f80ea', 1),
(6, '#ffffff', 1),
(7, '#ff0', 1),
(8, '#080808', 1),
(9, '#000066', 2),
(10, '#FF0066', 2),
(11, '#FFFFFF', 2),
(12, '#000000', 2),
(13, 'F1CCAB', 3),
(14, '#544FBD', 3),
(15, '#000', 3),
(16, '#000', 4),
(17, '#753188', 4),
(18, '#148EFB', 4),
(19, '#2E4C6D', 4),
(20, '#FF7800', 4),
(21, '#71DFE7', 4),
(22, '#AE4CCF', 4),
(23, '#142F43', 4),
(24, '#C85C5C', 4);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `works`
--

CREATE TABLE `works` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `github_link` varchar(255) DEFAULT NULL,
  `web_link` varchar(255) DEFAULT NULL,
  `createdAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `works`
--

INSERT INTO `works` (`id`, `title`, `slug`, `image`, `content`, `github_link`, `web_link`, `createdAt`) VALUES
(1, 'Stock Manager', 'stock-manager', 'https://amahamoudou-dev.dawan.ovh/assets/img/shot-naga.png', 'Progiciel de gestion de stock', 'https://github.com/Boudj31/naga-stoock', '', '2020-11-02'),
(2, 'Svp-visio', 'svp-visio', 'https://amahamoudou-dev.dawan.ovh/assets/img/shot-svp-visio.png', 'Svp-visio est un site web d\'assistance de visioconférence qui aide à maîtriser les plateformes (Microsoft teams, Zoom, Big Blue Button, Go To Training).\r\n\r\nLe but du projet est d\'accompagner les entreprises à mieux organiser ses réunions à distance.', NULL, 'svp-visio.com', '2021-02-01'),
(3, 'Adopte un déchet', 'adopte-un-dechet', 'https://amahamoudou-dev.dawan.ovh/assets/img/shot-symfony-online.png', 'Adopte un déchet est un site de bourse au déchets (La Bourse des déchets est un service de publications d\'offres ou de demandes de matériaux, objets et équipements à la vente ou en don).', 'https://github.com/Boudj31/Adopte-un-dechet', NULL, '2021-01-25'),
(4, 'Symfony Online', 'symfony-online', 'https://amahamoudou-dev.dawan.ovh/assets/img/shot-symfony-online.png', 'Symfony online est un site e-learning basé sur le framework Symfony. Le but de ce projet est de permettre à tous utilisateurs d\'apprendre Symfony en lui donnant les bases et améliorer ses compétences.', 'https://github.com/Boudj31/symfonyOnline', NULL, '2021-05-30');

-- --------------------------------------------------------

--
-- Structure de la table `works_languages`
--

CREATE TABLE `works_languages` (
  `id` int(11) NOT NULL,
  `works_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `works_languages`
--

INSERT INTO `works_languages` (`id`, `works_id`, `languages_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 4),
(4, 1, 5),
(5, 1, 3),
(6, 2, 9),
(7, 2, 3),
(8, 3, 7),
(9, 3, 5),
(10, 3, 4),
(11, 3, 3),
(12, 3, 1),
(13, 3, 2),
(14, 4, 1),
(15, 4, 2),
(16, 4, 4),
(17, 4, 3),
(18, 4, 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `maquettes`
--
ALTER TABLE `maquettes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `maquettes_works_id_foreign` (`works_id`);

--
-- Index pour la table `outils`
--
ALTER TABLE `outils`
  ADD PRIMARY KEY (`id`),
  ADD KEY `outils_works_id_foreign` (`works_id`);

--
-- Index pour la table `palettes`
--
ALTER TABLE `palettes`
  ADD PRIMARY KEY (`palettes_id`),
  ADD KEY `palettes_works_id_foreign` (`works_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `works_languages`
--
ALTER TABLE `works_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `works_languages_works_id_foreign` (`works_id`),
  ADD KEY `works_languages_languages_id_foreign` (`languages_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `maquettes`
--
ALTER TABLE `maquettes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `outils`
--
ALTER TABLE `outils`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `palettes`
--
ALTER TABLE `palettes`
  MODIFY `palettes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `works`
--
ALTER TABLE `works`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `works_languages`
--
ALTER TABLE `works_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `maquettes`
--
ALTER TABLE `maquettes`
  ADD CONSTRAINT `maquettes_works_id_foreign` FOREIGN KEY (`works_id`) REFERENCES `works` (`id`);

--
-- Contraintes pour la table `outils`
--
ALTER TABLE `outils`
  ADD CONSTRAINT `outils_works_id_foreign` FOREIGN KEY (`works_id`) REFERENCES `works` (`id`);

--
-- Contraintes pour la table `palettes`
--
ALTER TABLE `palettes`
  ADD CONSTRAINT `palettes_works_id_foreign` FOREIGN KEY (`works_id`) REFERENCES `works` (`id`);

--
-- Contraintes pour la table `works_languages`
--
ALTER TABLE `works_languages`
  ADD CONSTRAINT `works_languages_languages_id_foreign` FOREIGN KEY (`languages_id`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `works_languages_works_id_foreign` FOREIGN KEY (`works_id`) REFERENCES `works` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
