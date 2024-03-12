-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 12 mars 2024 à 17:03
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gf-logia`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nomsent` text DEFAULT NULL,
  `nomres` text DEFAULT NULL,
  `emailp` text DEFAULT NULL,
  `emailres` text DEFAULT NULL,
  `faxres` text DEFAULT NULL,
  `faxent` text DEFAULT NULL,
  `_prenoms` text DEFAULT NULL,
  `_noms` text DEFAULT NULL,
  `cellp` text DEFAULT NULL,
  `cellresp` text DEFAULT NULL,
  `telent` text DEFAULT NULL,
  `telresp` text DEFAULT NULL,
  `datesc` text DEFAULT NULL,
  `addent` text DEFAULT NULL,
  `villeent` text DEFAULT NULL,
  `provent` text DEFAULT NULL,
  `paysent` text DEFAULT NULL,
  `zipent` text DEFAULT NULL,
  `addp` text DEFAULT NULL,
  `villep` text DEFAULT NULL,
  `provp` text DEFAULT NULL,
  `paysp` text DEFAULT NULL,
  `zipp` text DEFAULT NULL,
  `tauxhc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nomsent`, `nomres`, `emailp`, `emailres`, `faxres`, `faxent`, `_prenoms`, `_noms`, `cellp`, `cellresp`, `telent`, `telresp`, `datesc`, `addent`, `villeent`, `provent`, `paysent`, `zipent`, `addp`, `villep`, `provp`, `paysp`, `zipp`, `tauxhc`) VALUES
(1, 'GuillaumeFoisy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `comptable`
--

CREATE TABLE `comptable` (
  `id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `depot` int(11) DEFAULT NULL,
  `chequemis` int(11) DEFAULT NULL,
  `soldebank` int(11) DEFAULT NULL,
  `montantrepporter` int(11) DEFAULT NULL,
  `diffdebitcredit` int(11) DEFAULT NULL,
  `tpspercu` int(11) DEFAULT NULL,
  `tvqpercu` int(11) DEFAULT NULL,
  `tpspaye` int(11) DEFAULT NULL,
  `tvqpaye` int(11) DEFAULT NULL,
  `revenue` int(11) DEFAULT NULL,
  `compterecevoir` int(11) DEFAULT NULL,
  `compteapayer` int(11) DEFAULT NULL,
  `totaldepense` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `totalrevenue` int(11) DEFAULT NULL,
  `montamorr` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `comptable`
--

INSERT INTO `comptable` (`id`, `description`, `no`, `depot`, `chequemis`, `soldebank`, `montantrepporter`, `diffdebitcredit`, `tpspercu`, `tvqpercu`, `tpspaye`, `tvqpaye`, `revenue`, `compterecevoir`, `compteapayer`, `totaldepense`, `timestamp`, `totalrevenue`, `montamorr`, `total`) VALUES
(1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `comptavariable`
--

CREATE TABLE `comptavariable` (
  `id` int(11) NOT NULL,
  `taux_tps` int(11) DEFAULT NULL,
  `taux_tvq` int(11) DEFAULT NULL,
  `nomcomm` text DEFAULT NULL,
  `totaltpspaye` int(11) DEFAULT NULL,
  `totaltvqpaye` int(11) DEFAULT NULL,
  `totaltpsarec` int(11) DEFAULT NULL,
  `totaltvqarec` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `comptavariable`
--

INSERT INTO `comptavariable` (`id`, `taux_tps`, `taux_tvq`, `nomcomm`, `totaltpspaye`, `totaltvqpaye`, `totaltpsarec`, `totaltvqarec`) VALUES
(1, NULL, NULL, NULL, 45, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `flotte`
--

CREATE TABLE `flotte` (
  `id` int(11) NOT NULL,
  `serie` text DEFAULT NULL,
  `annee` text DEFAULT NULL,
  `make` text DEFAULT NULL,
  `model` text DEFAULT NULL,
  `km` text DEFAULT NULL,
  `hrs` text DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ecm` text DEFAULT NULL,
  `imatri` text DEFAULT NULL,
  `fing` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `nexinspq` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `nexmai` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `noment` text DEFAULT NULL,
  `unit` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `flotte`
--

INSERT INTO `flotte` (`id`, `serie`, `annee`, `make`, `model`, `km`, `hrs`, `date`, `ecm`, `imatri`, `fing`, `nexinspq`, `nexmai`, `noment`, `unit`) VALUES
(1, 'Fake1', '2002', 'Ford', 'F-250', '20000', '2500', '0000-00-00 00:00:00', '111', 'FAKE', NULL, NULL, NULL, 'GuillaumeFoisy', '6'),
(2, 'Fake2', '2003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8');

-- --------------------------------------------------------

--
-- Structure de la table `inventaire`
--

CREATE TABLE `inventaire` (
  `id` int(11) NOT NULL,
  `nopiece` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `quantiter` int(11) DEFAULT NULL,
  `quantiterstock` int(11) DEFAULT NULL,
  `buyprice1` int(11) DEFAULT NULL,
  `fourn1` text DEFAULT NULL,
  `buyprice2` int(11) DEFAULT NULL,
  `fourn2` text DEFAULT NULL,
  `sellprice` int(11) DEFAULT NULL,
  `nolocation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `inventaire`
--

INSERT INTO `inventaire` (`id`, `nopiece`, `description`, `quantiter`, `quantiterstock`, `buyprice1`, `fourn1`, `buyprice2`, `fourn2`, `sellprice`, `nolocation`) VALUES
(1, '35000', 'Bolt 1/2x2inch  NF grade8 ', 30, 40, 100, 'FAKE1', 105, 'FAKE2', 250, 'a/4 - 1/2');

-- --------------------------------------------------------

--
-- Structure de la table `invwo`
--

CREATE TABLE `invwo` (
  `id` int(11) NOT NULL,
  `quant` int(11) DEFAULT NULL,
  `nopic` text DEFAULT NULL,
  `descp` text DEFAULT NULL,
  `wo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `invwo`
--

INSERT INTO `invwo` (`id`, `quant`, `nopic`, `descp`, `wo`) VALUES
(1, 5, '25', 'petit tyrap', 'engine');

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `username` text DEFAULT NULL,
  `jobname` text DEFAULT NULL,
  `jobinfo` text DEFAULT NULL,
  `jobrepport` text DEFAULT NULL,
  `wo` text DEFAULT NULL,
  `inspectionsheet` text DEFAULT NULL,
  `pstatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `job`
--

INSERT INTO `job` (`id`, `username`, `jobname`, `jobinfo`, `jobrepport`, `wo`, `inspectionsheet`, `pstatus`) VALUES
(13, 'gfoisy', 'engine swap', 'testing one thirty two', 'ZZZZZZZZZZZZZZZZZZZZZZZZZZZZ', 'engine', NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `id` int(11) NOT NULL,
  `notename` text DEFAULT NULL,
  `wo` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `serie` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`id`, `notename`, `wo`, `content`, `serie`) VALUES
(1, 'test', 'engine', 'heya this is a test!', 'Fake1');

-- --------------------------------------------------------

--
-- Structure de la table `punch`
--

CREATE TABLE `punch` (
  `id` int(11) NOT NULL,
  `wo` text DEFAULT NULL,
  `jobname` text DEFAULT NULL,
  `username` text DEFAULT NULL,
  `punchin` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `punchout` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `username`
--

CREATE TABLE `username` (
  `id` int(11) NOT NULL,
  `username` text DEFAULT NULL,
  `nom` text DEFAULT NULL,
  `prenom` text DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `tel` text DEFAULT NULL,
  `cell` text DEFAULT NULL,
  `addc` text DEFAULT NULL,
  `permis` text DEFAULT NULL,
  `liscence` text DEFAULT NULL,
  `pep` text DEFAULT NULL,
  `saaq` text DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `embauche` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `city` text DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `pays` text DEFAULT NULL,
  `zip` text DEFAULT NULL,
  `email1` text DEFAULT NULL,
  `email2` text DEFAULT NULL,
  `tauxhr` int(11) DEFAULT NULL,
  `datesortie` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `username`
--

INSERT INTO `username` (`id`, `username`, `nom`, `prenom`, `age`, `tel`, `cell`, `addc`, `permis`, `liscence`, `pep`, `saaq`, `date`, `embauche`, `city`, `province`, `pays`, `zip`, `email1`, `email2`, `tauxhr`, `datesortie`) VALUES
(1, 'gfoisy', 'Foisy', 'Guillaume', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `workorder`
--

CREATE TABLE `workorder` (
  `id` int(11) NOT NULL,
  `wo` text DEFAULT NULL,
  `serie` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `workorder`
--

INSERT INTO `workorder` (`id`, `wo`, `serie`, `status`) VALUES
(12, 'engine', 'Fake1', 1),
(13, 'brake', 'Fake1', 1),
(14, 'haha', 'Fake2', 1),
(15, 'test1', 'Fake2', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comptable`
--
ALTER TABLE `comptable`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comptavariable`
--
ALTER TABLE `comptavariable`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `flotte`
--
ALTER TABLE `flotte`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `inventaire`
--
ALTER TABLE `inventaire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `invwo`
--
ALTER TABLE `invwo`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `punch`
--
ALTER TABLE `punch`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `username`
--
ALTER TABLE `username`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `workorder`
--
ALTER TABLE `workorder`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `comptable`
--
ALTER TABLE `comptable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `comptavariable`
--
ALTER TABLE `comptavariable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `flotte`
--
ALTER TABLE `flotte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `inventaire`
--
ALTER TABLE `inventaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `invwo`
--
ALTER TABLE `invwo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `punch`
--
ALTER TABLE `punch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `username`
--
ALTER TABLE `username`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `workorder`
--
ALTER TABLE `workorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
