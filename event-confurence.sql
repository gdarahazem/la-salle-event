-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 05 sep. 2024 à 06:36
-- Version du serveur : 8.2.0
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `event-confurence`
--

-- --------------------------------------------------------

--
-- Structure de la table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
CREATE TABLE IF NOT EXISTS `amenities` (
                                           `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                           `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `phone` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `amenities`
--

INSERT INTO `amenities` (`id`, `name`, `email`, `phone`, `created_at`, `updated_at`, `deleted_at`) VALUES
                                                                                                       (1, 'photographe med', 'hazemgdaraa@gmail.com', '55851451', '2024-08-27 15:55:04', '2024-08-27 15:55:04', NULL),
                                                                                                       (2, 'dj Black', 'amalmdili199@gmail.com', '55851451', '2024-08-28 19:21:37', '2024-08-28 19:21:37', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `amenity_price`
--

DROP TABLE IF EXISTS `amenity_price`;
CREATE TABLE IF NOT EXISTS `amenity_price` (
                                               `price_id` int UNSIGNED NOT NULL,
                                               `amenity_id` int UNSIGNED NOT NULL,
                                               KEY `price_id_fk_384063` (`price_id`),
    KEY `amenity_id_fk_384063` (`amenity_id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
                                        `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                        `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `latitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `longitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `description` longtext COLLATE utf8mb4_unicode_ci,
    `event_date` date DEFAULT NULL,
    `price` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `events`
--

INSERT INTO `events` (`id`, `name`, `address`, `latitude`, `longitude`, `description`, `event_date`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
                                                                                                                                                            (1, 'test', 'Manar 2', '12', '15', 'test', NULL, '200', '2024-08-26 17:42:56', '2024-08-26 19:04:42', '2024-08-26 19:04:42'),
                                                                                                                                                            (2, 'test2', 'Menzeh', '15', '165', 'qsdqsd', NULL, '130', '2024-08-26 17:43:46', '2024-08-26 19:04:44', '2024-08-26 19:04:44'),
                                                                                                                                                            (3, 'Integration Day', 'Dar chabeen fehri', '55', '58', 'qsd', '2025-08-28', '120', '2024-08-26 18:28:43', '2024-09-03 09:46:15', NULL),
                                                                                                                                                            (4, 'La salle Event', 'Dar chabeen fehri', '10', '11', 'Learning day', '2025-05-14', '70', '2024-08-26 18:32:03', '2024-09-02 22:45:59', NULL),
                                                                                                                                                            (5, 'Esprit Event', 'Esprit Chargia 2', '36.853278', '10.1247869', 'Formation machine learning', '2025-08-31', '0', '2024-08-28 19:16:10', '2024-09-03 09:46:11', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
CREATE TABLE IF NOT EXISTS `faqs` (
                                      `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                      `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `answer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE IF NOT EXISTS `galleries` (
                                           `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                           `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
CREATE TABLE IF NOT EXISTS `hotels` (
                                        `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                        `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `description` longtext COLLATE utf8mb4_unicode_ci,
    `rating` int DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `address`, `description`, `rating`, `created_at`, `updated_at`, `deleted_at`) VALUES
    (1, 'chelton', 'manar 2', 'qsdsqdqsdsqd', 4, '2024-08-26 18:43:52', '2024-08-26 18:43:52', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
                                       `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                       `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `model_id` bigint UNSIGNED NOT NULL,
    `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `conversions_disk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `size` bigint UNSIGNED NOT NULL,
    `manipulations` json NOT NULL,
    `custom_properties` json NOT NULL,
    `responsive_images` json NOT NULL,
    `order_column` int UNSIGNED DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
    ) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
                                                                                                                                                                                                                                                                 (1, 'App\\Speaker', 1, '975a2dfd-7843-475e-a751-2403cb8029cd', 'photo', '1', '1.jpg', 'image/jpeg', 'public', 'public', 44376, '[]', '{\"generated_conversions\": {\"thumb\": true}}', '[]', 1, '2024-08-25 16:51:38', '2024-08-25 16:51:41'),
                                                                                                                                                                                                                                                                 (2, 'App\\Speaker', 2, '8a01cc36-e7f8-4cbb-ba1c-a16938e0a5b2', 'photo', '2', '2.jpg', 'image/jpeg', 'public', 'public', 49380, '[]', '{\"generated_conversions\": {\"thumb\": true}}', '[]', 2, '2024-08-25 16:51:41', '2024-08-25 16:51:41'),
                                                                                                                                                                                                                                                                 (3, 'App\\Speaker', 3, '5cc098e8-579a-463d-8793-bf67f70bec94', 'photo', '3', '3.jpg', 'image/jpeg', 'public', 'public', 14278, '[]', '{\"generated_conversions\": {\"thumb\": true}}', '[]', 3, '2024-08-25 16:51:41', '2024-08-25 16:51:41'),
                                                                                                                                                                                                                                                                 (4, 'App\\Speaker', 4, '407b7ec6-69eb-4ed4-a5e6-58a5a197ab59', 'photo', '4', '4.jpg', 'image/jpeg', 'public', 'public', 53251, '[]', '{\"generated_conversions\": {\"thumb\": true}}', '[]', 4, '2024-08-25 16:51:41', '2024-08-25 16:51:41'),
                                                                                                                                                                                                                                                                 (5, 'App\\Speaker', 5, '34eec445-28a1-441c-9332-787171e599bd', 'photo', '5', '5.jpg', 'image/jpeg', 'public', 'public', 30301, '[]', '[]', '[]', 5, '2024-08-25 16:51:42', '2024-08-25 16:51:42'),
                                                                                                                                                                                                                                                                 (6, 'App\\Venue', 1, '0dff0468-c1d7-44e4-8937-64c22c7162aa', 'photos', '66cccbd79a2f0_455608104_1726556281447434_1836884038228634885_n (1)', '66cccbd79a2f0_455608104_1726556281447434_1836884038228634885_n-(1).jpg', 'image/jpeg', 'public', 'public', 161229, '[]', '{\"generated_conversions\": {\"thumb\": true}}', '[]', 6, '2024-08-26 17:42:57', '2024-08-26 17:42:59'),
                                                                                                                                                                                                                                                                 (7, 'App\\Venue', 1, '175c22a8-add7-402f-b33c-797cf0b21ddb', 'photos', '66cccbd7be50b_455608104_1726556281447434_1836884038228634885_n', '66cccbd7be50b_455608104_1726556281447434_1836884038228634885_n.jpg', 'image/jpeg', 'public', 'public', 161229, '[]', '{\"generated_conversions\": {\"thumb\": true}}', '[]', 7, '2024-08-26 17:42:59', '2024-08-26 17:42:59'),
                                                                                                                                                                                                                                                                 (8, 'App\\Venue', 2, 'd76b33ab-67af-4bd6-b026-2e3ac179b35f', 'photos', '66ccccd7ccf14_Logo_ESPRIT_Ariana-removebg-preview', '66ccccd7ccf14_Logo_ESPRIT_Ariana-removebg-preview.png', 'image/png', 'public', 'public', 85165, '[]', '{\"generated_conversions\": {\"thumb\": true}}', '[]', 8, '2024-08-26 17:43:46', '2024-08-26 17:43:47'),
                                                                                                                                                                                                                                                                 (9, 'App\\Venue', 3, 'e531f47a-981c-4de1-b3c8-0f3c9bb11d87', 'photos', '66ccd743aaffa_Physical architecture', '66ccd743aaffa_Physical-architecture.png', 'image/png', 'public', 'public', 175355, '[]', '{\"generated_conversions\": {\"thumb\": true}}', '[]', 9, '2024-08-26 18:28:43', '2024-08-26 18:28:44'),
                                                                                                                                                                                                                                                                 (10, 'App\\Venue', 4, '9689712f-778a-44d8-99dd-956fa83a17c5', 'photos', '66ccd82e8b646_455608104_1726556281447434_1836884038228634885_n (1)', '66ccd82e8b646_455608104_1726556281447434_1836884038228634885_n-(1).jpg', 'image/jpeg', 'public', 'public', 161229, '[]', '{\"generated_conversions\": {\"thumb\": true}}', '[]', 10, '2024-08-26 18:32:03', '2024-08-26 18:32:04'),
                                                                                                                                                                                                                                                                 (11, 'App\\Hotel', 1, '582400e5-8e35-4f5b-87d5-f300c4384028', 'photo', '66ccdaeeaf9d5_hotel', '66ccdaeeaf9d5_hotel.jpeg', 'image/jpeg', 'public', 'public', 12153, '[]', '{\"generated_conversions\": {\"thumb\": true}}', '[]', 11, '2024-08-26 18:43:52', '2024-08-26 18:43:52'),
                                                                                                                                                                                                                                                                 (12, 'App\\Venue', 5, 'b26ff58d-3b80-4a7a-ac33-5698884b5bf0', 'photos', '66cf8520c2043_hotel', '66cf8520c2043_hotel.jpeg', 'image/jpeg', 'public', 'public', 12153, '[]', '{\"generated_conversions\": {\"thumb\": true}}', '[]', 12, '2024-08-28 19:16:11', '2024-08-28 19:16:13');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
                                            `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                            `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `batch` int NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
                                                          (1, '2014_10_12_100000_create_password_resets_table', 1),
                                                          (2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
                                                          (3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
                                                          (4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
                                                          (5, '2016_06_01_000004_create_oauth_clients_table', 1),
                                                          (6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
                                                          (7, '2019_09_24_000000_create_media_table', 1),
                                                          (8, '2019_09_24_000001_create_permissions_table', 1),
                                                          (9, '2019_09_24_000002_create_faqs_table', 1),
                                                          (10, '2019_09_24_000003_create_prices_table', 1),
                                                          (11, '2019_09_24_000004_create_users_table', 1),
                                                          (12, '2019_09_24_000005_create_amenities_table', 1),
                                                          (13, '2019_09_24_000006_create_settings_table', 1),
                                                          (14, '2019_09_24_000007_create_speakers_table', 1),
                                                          (15, '2019_09_24_000008_create_schedules_table', 1),
                                                          (16, '2019_09_24_000009_create_roles_table', 1),
                                                          (17, '2019_09_24_000010_create_venues_table', 1),
                                                          (18, '2019_09_24_000011_create_hotels_table', 1),
                                                          (19, '2019_09_24_000012_create_galleries_table', 1),
                                                          (20, '2019_09_24_000013_create_sponsors_table', 1),
                                                          (21, '2019_09_24_000014_create_amenity_price_pivot_table', 1),
                                                          (22, '2019_09_24_000015_create_role_user_pivot_table', 1),
                                                          (23, '2019_09_24_000016_create_permission_role_pivot_table', 1),
                                                          (24, '2019_09_24_000017_add_relationship_fields_to_schedules_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
                                                     `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `user_id` bigint UNSIGNED DEFAULT NULL,
    `client_id` bigint UNSIGNED NOT NULL,
    `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `scopes` text COLLATE utf8mb4_unicode_ci,
    `revoked` tinyint(1) NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    `expires_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `oauth_access_tokens_user_id_index` (`user_id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
                                                  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `user_id` bigint UNSIGNED NOT NULL,
    `client_id` bigint UNSIGNED NOT NULL,
    `scopes` text COLLATE utf8mb4_unicode_ci,
    `revoked` tinyint(1) NOT NULL,
    `expires_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `oauth_auth_codes_user_id_index` (`user_id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
                                               `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
                                               `user_id` bigint UNSIGNED DEFAULT NULL,
                                               `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
    `personal_access_client` tinyint(1) NOT NULL,
    `password_client` tinyint(1) NOT NULL,
    `revoked` tinyint(1) NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `oauth_clients_user_id_index` (`user_id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
                                                               `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
                                                               `client_id` bigint UNSIGNED NOT NULL,
                                                               `created_at` timestamp NULL DEFAULT NULL,
                                                               `updated_at` timestamp NULL DEFAULT NULL,
                                                               PRIMARY KEY (`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
                                                      `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `revoked` tinyint(1) NOT NULL,
    `expires_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
                                                 `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    KEY `password_resets_email_index` (`email`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
                                             `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                             `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
                                                                                        (1, 'user_management_access', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (2, 'permission_create', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (3, 'permission_edit', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (4, 'permission_show', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (5, 'permission_delete', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (6, 'permission_access', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (7, 'role_create', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (8, 'role_edit', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (9, 'role_show', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (10, 'role_delete', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (11, 'role_access', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (12, 'user_create', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (13, 'user_edit', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (14, 'user_show', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (15, 'user_delete', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (16, 'user_access', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (17, 'setting_create', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (18, 'setting_edit', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (19, 'setting_show', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (20, 'setting_delete', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (21, 'setting_access', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (22, 'speaker_create', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (23, 'speaker_edit', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (24, 'speaker_show', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (25, 'speaker_delete', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (26, 'speaker_access', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (27, 'schedule_create', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (28, 'schedule_edit', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (29, 'schedule_show', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (30, 'schedule_delete', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (31, 'schedule_access', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (32, 'venue_create', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (33, 'venue_edit', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (34, 'venue_show', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (35, 'venue_delete', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (36, 'venue_access', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (37, 'hotel_create', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (38, 'hotel_edit', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (39, 'hotel_show', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (40, 'hotel_delete', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (41, 'hotel_access', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (42, 'gallery_create', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (43, 'gallery_edit', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (44, 'gallery_show', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (45, 'gallery_delete', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (46, 'gallery_access', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (47, 'sponsor_create', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (48, 'sponsor_edit', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (49, 'sponsor_show', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (50, 'sponsor_delete', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (51, 'sponsor_access', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (52, 'faq_create', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (53, 'faq_edit', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (54, 'faq_show', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (55, 'faq_delete', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (56, 'faq_access', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (57, 'amenity_create', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (58, 'amenity_edit', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (59, 'amenity_show', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (60, 'amenity_delete', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (61, 'amenity_access', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (62, 'price_create', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (63, 'price_edit', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (64, 'price_show', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (65, 'price_delete', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                        (66, 'price_access', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
                                                 `role_id` int UNSIGNED NOT NULL,
                                                 `permission_id` int UNSIGNED NOT NULL,
                                                 KEY `role_id_fk_383833` (`role_id`),
    KEY `permission_id_fk_383833` (`permission_id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
                                                               (1, 1),
                                                               (1, 2),
                                                               (1, 3),
                                                               (1, 4),
                                                               (1, 5),
                                                               (1, 6),
                                                               (1, 7),
                                                               (1, 8),
                                                               (1, 9),
                                                               (1, 10),
                                                               (1, 11),
                                                               (1, 12),
                                                               (1, 13),
                                                               (1, 14),
                                                               (1, 15),
                                                               (1, 16),
                                                               (1, 17),
                                                               (1, 18),
                                                               (1, 19),
                                                               (1, 20),
                                                               (1, 21),
                                                               (1, 22),
                                                               (1, 23),
                                                               (1, 24),
                                                               (1, 25),
                                                               (1, 26),
                                                               (1, 27),
                                                               (1, 28),
                                                               (1, 29),
                                                               (1, 30),
                                                               (1, 31),
                                                               (1, 32),
                                                               (1, 33),
                                                               (1, 34),
                                                               (1, 35),
                                                               (1, 36),
                                                               (1, 37),
                                                               (1, 38),
                                                               (1, 39),
                                                               (1, 40),
                                                               (1, 41),
                                                               (1, 42),
                                                               (1, 43),
                                                               (1, 44),
                                                               (1, 45),
                                                               (1, 46),
                                                               (1, 47),
                                                               (1, 48),
                                                               (1, 49),
                                                               (1, 50),
                                                               (1, 51),
                                                               (1, 52),
                                                               (1, 53),
                                                               (1, 54),
                                                               (1, 55),
                                                               (1, 56),
                                                               (1, 57),
                                                               (1, 58),
                                                               (1, 59),
                                                               (1, 60),
                                                               (1, 61),
                                                               (1, 62),
                                                               (1, 63),
                                                               (1, 64),
                                                               (1, 65),
                                                               (1, 66),
                                                               (2, 17),
                                                               (2, 18),
                                                               (2, 19),
                                                               (2, 20),
                                                               (2, 21),
                                                               (2, 22),
                                                               (2, 23),
                                                               (2, 24),
                                                               (2, 25),
                                                               (2, 26),
                                                               (2, 27),
                                                               (2, 28),
                                                               (2, 29),
                                                               (2, 30),
                                                               (2, 31),
                                                               (2, 32),
                                                               (2, 33),
                                                               (2, 34),
                                                               (2, 35),
                                                               (2, 36),
                                                               (2, 37),
                                                               (2, 38),
                                                               (2, 39),
                                                               (2, 40),
                                                               (2, 41),
                                                               (2, 42),
                                                               (2, 43),
                                                               (2, 44),
                                                               (2, 45),
                                                               (2, 46),
                                                               (2, 47),
                                                               (2, 48),
                                                               (2, 49),
                                                               (2, 50),
                                                               (2, 51),
                                                               (2, 52),
                                                               (2, 53),
                                                               (2, 54),
                                                               (2, 55),
                                                               (2, 56),
                                                               (2, 57),
                                                               (2, 58),
                                                               (2, 59),
                                                               (2, 60),
                                                               (2, 61),
                                                               (2, 62),
                                                               (2, 63),
                                                               (2, 64),
                                                               (2, 65),
                                                               (2, 66);

-- --------------------------------------------------------

--
-- Structure de la table `prices`
--

DROP TABLE IF EXISTS `prices`;
CREATE TABLE IF NOT EXISTS `prices` (
                                        `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                        `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `price` decimal(15,2) NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
                                       `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                       `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
                                                                                  (1, 'Admin', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL),
                                                                                  (2, 'User', '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
                                           `user_id` int UNSIGNED NOT NULL,
                                           `role_id` int UNSIGNED NOT NULL,
                                           KEY `user_id_fk_383842` (`user_id`),
    KEY `role_id_fk_383842` (`role_id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
    (1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
CREATE TABLE IF NOT EXISTS `schedules` (
                                           `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                           `day_number` int NOT NULL,
                                           `start_time` time NOT NULL,
                                           `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    `deleted_at` timestamp NULL DEFAULT NULL,
    `speaker_id` int UNSIGNED DEFAULT NULL,
    `event_id` int DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `speaker_fk_383954` (`speaker_id`)
    ) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `schedules`
--

INSERT INTO `schedules` (`id`, `day_number`, `start_time`, `title`, `subtitle`, `created_at`, `updated_at`, `deleted_at`, `speaker_id`, `event_id`) VALUES
                                                                                                                                                        (1, 1, '20:45:20', 'introduction', 'introduction', '2024-08-26 18:45:40', '2024-09-02 22:47:02', NULL, 1, 4),
                                                                                                                                                        (2, 1, '20:58:06', 'test', 'test', '2024-08-26 18:58:26', '2024-09-02 22:46:56', NULL, NULL, 3),
                                                                                                                                                        (3, 1, '15:00:00', 'Machine learning introduction', 'Machine learning introduction', '2024-08-28 19:17:54', '2024-08-28 19:17:54', NULL, 1, 5),
                                                                                                                                                        (4, 2, '15:17:58', 'Practice day', 'Practice day', '2024-08-28 19:18:26', '2024-08-28 19:18:26', NULL, 5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
                                          `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                          `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `value` longtext COLLATE utf8mb4_unicode_ci,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
                                                                                            (1, 'title', 'Welcome to the Ultimate<br><span>Event Experience</span>', '2024-08-25 16:51:37', '2024-08-27 16:17:30', NULL),
                                                                                            (2, 'subtitle', 'Elevating Experiences: Your Premier Event Management Partner', '2024-08-25 16:51:37', '2024-08-27 16:18:52', NULL),
                                                                                            (3, 'youtube_link', 'https://www.youtube.com/watch?v=3MwMII8n1qM', '2024-08-25 16:51:37', '2024-08-27 19:58:53', NULL),
                                                                                            (4, 'about_description', 'LASALEVENT is your trusted partner in crafting unforgettable events. We specialize in delivering seamless event management solutions, tailored to your unique vision. From corporate conferences to private celebrations, we ensure every detail is perfected, making your event truly exceptional.', '2024-08-25 16:51:37', '2024-08-27 19:52:53', NULL),
                                                                                            (5, 'about_where', '123 Avenue de la République, La Marsa, 2078 Tunis, Tunisie', '2024-08-25 16:51:37', '2024-08-27 19:54:21', NULL),
                                                                                            (6, 'about_when', 'Monday to Wednesday<br>10-12 December', '2024-08-25 16:51:37', '2024-08-25 16:51:37', NULL),
                                                                                            (7, 'contact_address', 'amal@gmail.com', '2024-08-25 16:51:37', '2024-08-27 19:54:11', NULL),
                                                                                            (8, 'contact_phone', '+216 92 684 418', '2024-08-25 16:51:37', '2024-08-27 19:56:04', NULL),
                                                                                            (9, 'contact_email', 'amal@gmail.com', '2024-08-25 16:51:37', '2024-08-27 19:55:12', NULL),
                                                                                            (10, 'footer_description', 'In alias aperiam. Placeat tempore facere. Officiis voluptate ipsam vel eveniet est dolor et totam porro. Perspiciatis ad omnis fugit molestiae recusandae possimus. Aut consectetur id quis. In inventore consequatur ad voluptate cupiditate debitis accusamus repellat cumque.', '2024-08-25 16:51:37', '2024-08-25 16:51:37', NULL),
                                                                                            (11, 'footer_address', '123 Avenue de la République,<br> La Marsa, 2078 Tunis<br>, Tunisie', '2024-08-25 16:51:37', '2024-08-27 19:55:02', NULL),
                                                                                            (12, 'footer_twitter', '#', '2024-08-25 16:51:37', '2024-08-25 16:51:37', NULL),
                                                                                            (13, 'footer_facebook', '#', '2024-08-25 16:51:37', '2024-08-25 16:51:37', NULL),
                                                                                            (14, 'footer_instagram', '#', '2024-08-25 16:51:37', '2024-08-25 16:51:37', NULL),
                                                                                            (15, 'footer_googleplus', '#', '2024-08-25 16:51:37', '2024-08-25 16:51:37', NULL),
                                                                                            (16, 'footer_linkedin', '#', '2024-08-25 16:51:37', '2024-08-25 16:51:37', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `speakers`
--

DROP TABLE IF EXISTS `speakers`;
CREATE TABLE IF NOT EXISTS `speakers` (
                                          `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                          `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `description` longtext COLLATE utf8mb4_unicode_ci,
    `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `full_description` longtext COLLATE utf8mb4_unicode_ci,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `speakers`
--

INSERT INTO `speakers` (`id`, `name`, `description`, `twitter`, `facebook`, `linkedin`, `full_description`, `created_at`, `updated_at`, `deleted_at`) VALUES
                                                                                                                                                          (1, 'hazem1', 'Coach 4', '#', '#', '#', 'Coach 4 Coach 4 Coach 4', '2024-08-25 16:51:37', '2024-09-02 22:45:02', NULL),
                                                                                                                                                          (2, 'amal', 'Coach 3', '#', '#', '#', 'Coach 3 Coach 3', '2024-08-25 16:51:41', '2024-09-02 22:44:39', NULL),
                                                                                                                                                          (3, 'Hannen', 'Fugiat laborum et', '#', '#', '#', 'Qui molestiae dignissimos dolores. Vel omnis sunt ut perspiciatis impedit. Ut suscipit delectus dolorem recusandae soluta assumenda. Et tempora unde qui. Officia omnis consequuntur eligendi aut.', '2024-08-25 16:51:41', '2024-08-28 19:12:33', '2024-08-28 19:12:33'),
                                                                                                                                                          (4, 'Soulayma', 'Coach 2', '#', '#', '#', 'Coach 2 Coach 2', '2024-08-25 16:51:41', '2024-09-02 22:44:27', NULL),
                                                                                                                                                          (5, 'Samah', 'Coach1', '#', '#', '#', 'Coach1 Coach1', '2024-08-25 16:51:42', '2024-09-02 22:44:13', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
CREATE TABLE IF NOT EXISTS `sponsors` (
                                          `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                          `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
                                         `id` int NOT NULL AUTO_INCREMENT,
                                         `event_id` int NOT NULL,
                                         `user_name` varchar(255) NOT NULL,
    `user_email` varchar(255) NOT NULL,
    `user_phone` varchar(20) NOT NULL,
    `pay_ref` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `event_id` (`event_id`)
    ) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `tickets`
--

INSERT INTO `tickets` (`id`, `event_id`, `user_name`, `user_email`, `user_phone`, `pay_ref`, `created_at`, `updated_at`) VALUES
                                                                                                                             (1, 5, 'Amal', 'Amal@gmail.com', '55851451', '', '2024-09-03 10:06:25', '2024-09-03 10:06:25'),
                                                                                                                             (2, 5, 'amal2', 'amal2@gmail.com', '92684418', NULL, '2024-09-03 12:02:27', '2024-09-03 12:02:27');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
                                       `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                       `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email_verified_at` datetime DEFAULT NULL,
    `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `remember_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    `deleted_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
    (1, 'Admin', 'admin@admin.com', NULL, '$2y$10$7Xn/8bPJ89ypj0cIxwoH9OOXnbK/.9xrLfFh2G4LUSRkw6j7Agn0K', NULL, '2019-09-24 18:16:02', '2019-09-24 18:16:02', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
