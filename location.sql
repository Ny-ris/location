-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 03 juin 2024 à 21:08
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
-- Base de données : `location`
--

-- --------------------------------------------------------

--
-- Structure de la table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `is_mandatory` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `display_name`, `is_mandatory`) VALUES
(101, 'Nombre de chambres', '', 0),
(102, 'Surface', '', 0),
(103, 'Nombre de salles de bain', '', 0),
(104, 'Balcon', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `bail_types`
--

CREATE TABLE `bail_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `bail_types`
--

INSERT INTO `bail_types` (`id`, `type`) VALUES
(1, '06 mois');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `locataires`
--

CREATE TABLE `locataires` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postalcode` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `place_of_birth` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `idcard_number` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `locataires`
--

INSERT INTO `locataires` (`id`, `user_id`, `first_name`, `last_name`, `address`, `postalcode`, `country`, `city`, `email`, `birth_date`, `place_of_birth`, `nationality`, `phone_number`, `idcard_number`, `created_at`, `updated_at`) VALUES
(1, 2, 'John', 'Doe', '123 Main St', '12345', 'USA', 'New York', 'john.doe@example.com', '1990-01-01', 'New York', 'American', '+1 (123) 456-7890', '123456789', '2024-06-03 18:43:08', '2024-06-03 18:43:08');

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `locataire_id` bigint(20) UNSIGNED NOT NULL,
  `bail_type_id` bigint(20) UNSIGNED NOT NULL,
  `loyer` varchar(255) NOT NULL,
  `charges` varchar(255) NOT NULL,
  `preavis` varchar(255) NOT NULL,
  `date_signature_bail` date NOT NULL,
  `date_entree` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `locations`
--

INSERT INTO `locations` (`id`, `user_id`, `property_id`, `locataire_id`, `bail_type_id`, `loyer`, `charges`, `preavis`, `date_signature_bail`, `date_entree`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 1, '1000', '100', '3', '2024-06-01', '2024-07-01', '2024-06-03 11:00:00', '2024-06-03 11:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_01_14_105510_create_properties_table', 1),
(5, '2020_01_17_113324_create_locataires_table', 1),
(6, '2020_01_24_230706_create_property_types_table', 1),
(7, '2020_01_24_230742_add_type_column', 1),
(8, '2020_01_28_133926_create_bail_types_table', 1),
(9, '2020_01_28_140818_create_paiements_table', 1),
(10, '2020_01_29_160948_create_locations_table', 1),
(11, '2020_02_02_195209_create_attributes_table', 1),
(12, '2020_02_02_201947_create_property_type_attributes_table', 1),
(13, '2020_02_03_212930_add_location_column', 1);

-- --------------------------------------------------------

--
-- Structure de la table `paiements`
--

CREATE TABLE `paiements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `month` int(10) UNSIGNED NOT NULL,
  `year` int(10) UNSIGNED NOT NULL,
  `reception` tinyint(1) NOT NULL DEFAULT 0,
  `received_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `paiements`
--

INSERT INTO `paiements` (`id`, `user_id`, `location_id`, `month`, `year`, `reception`, `received_at`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 2024, 1, NULL, '2024-06-03 17:58:47', '2024-06-03 17:58:47');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `nb_rooms` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `furnished` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `property_type_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `properties`
--

INSERT INTO `properties` (`id`, `address`, `address2`, `city`, `postcode`, `country`, `nb_rooms`, `size`, `furnished`, `user_id`, `created_at`, `updated_at`, `property_type_id`) VALUES
(1, '123 Main St', 'Apt 4B', 'Springfield', '12345', 'USA', 3, 121, 1, 1, '2024-06-03 11:00:00', '2024-06-03 11:00:00', 2),
(2, 'Avenu', 'Rue_2345', 'Cotonou', '23333', 'benin', 4, 223, 1, 2, '2024-06-03 17:46:15', '2024-06-03 17:46:15', 2);

-- --------------------------------------------------------

--
-- Structure de la table `property_types`
--

CREATE TABLE `property_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `property_types`
--

INSERT INTO `property_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Appartement', NULL, NULL),
(2, 'Maison', NULL, NULL),
(3, 'Bureau', NULL, NULL),
(4, 'Commerce', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `property_type_attributes`
--

CREATE TABLE `property_type_attributes` (
  `property_type_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `property_type_attributes`
--

INSERT INTO `property_type_attributes` (`property_type_id`, `attribute_id`) VALUES
(1, 101);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `last_name`, `first_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'DAKO', 'Nyris', 'dako@gmail.com', NULL, '$2y$10$zM71W.VFsYKdkADabZoA.elj7F1cGGOtOEcQQV4nQEDdvR.iTo13S', NULL, '2024-06-01 14:28:29', '2024-06-01 14:28:29'),
(2, 'ZEbla', 'Dako', 'contact@sonama.bj', NULL, '$2y$10$MWSxgBtBKOisZh7cbALd3eTsydM0Dz7uaclAIEa00oTHauhLOjMti', NULL, '2024-06-03 07:49:36', '2024-06-03 07:49:36');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bail_types`
--
ALTER TABLE `bail_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `locataires`
--
ALTER TABLE `locataires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locataires_user_id_foreign` (`user_id`);

--
-- Index pour la table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locations_user_id_foreign` (`user_id`),
  ADD KEY `locations_property_id_foreign` (`property_id`),
  ADD KEY `locations_locataire_id_foreign` (`locataire_id`),
  ADD KEY `locations_bail_type_id_foreign` (`bail_type_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `paiements`
--
ALTER TABLE `paiements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paiements_user_id_foreign` (`user_id`),
  ADD KEY `paiements_location_id_foreign` (`location_id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `properties_user_id_foreign` (`user_id`),
  ADD KEY `properties_property_type_id_foreign` (`property_type_id`);

--
-- Index pour la table `property_types`
--
ALTER TABLE `property_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `property_type_attributes`
--
ALTER TABLE `property_type_attributes`
  ADD KEY `property_type_attributes_property_type_id_foreign` (`property_type_id`),
  ADD KEY `property_type_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT pour la table `bail_types`
--
ALTER TABLE `bail_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `locataires`
--
ALTER TABLE `locataires`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `paiements`
--
ALTER TABLE `paiements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `property_types`
--
ALTER TABLE `property_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `locataires`
--
ALTER TABLE `locataires`
  ADD CONSTRAINT `locataires_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_bail_type_id_foreign` FOREIGN KEY (`bail_type_id`) REFERENCES `bail_types` (`id`),
  ADD CONSTRAINT `locations_locataire_id_foreign` FOREIGN KEY (`locataire_id`) REFERENCES `locataires` (`id`),
  ADD CONSTRAINT `locations_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `locations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `paiements`
--
ALTER TABLE `paiements`
  ADD CONSTRAINT `paiements_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `paiements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `properties_property_type_id_foreign` FOREIGN KEY (`property_type_id`) REFERENCES `property_types` (`id`),
  ADD CONSTRAINT `properties_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property_type_attributes`
--
ALTER TABLE `property_type_attributes`
  ADD CONSTRAINT `property_type_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `property_type_attributes_property_type_id_foreign` FOREIGN KEY (`property_type_id`) REFERENCES `property_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
