-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 29 oct. 2020 à 04:42
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `wordpress`
--

-- --------------------------------------------------------

--
-- Structure de la table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Un commentateur WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-10-19 09:22:36', '2020-10-19 07:22:36', 'Bonjour, ceci est un commentaire.\nPour débuter avec la modération, la modification et la suppression de commentaires, veuillez visiter l’écran des Commentaires dans le Tableau de bord.\nLes avatars des personnes qui commentent arrivent depuis <a href=\"https://gravatar.com\">Gravatar</a>.', 0, 'post-trashed', '', 'comment', 0, 0),
(2, 16, 'Ouss', 'diarraousmane37@gmail.com', 'http://localhost/cloud-campus/wordpress', '::1', '2020-10-21 15:43:29', '2020-10-21 13:43:29', '4 championship !', 0, '1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', 'comment', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=MyISAM AUTO_INCREMENT=300 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/cloud-campus/wordpress', 'yes'),
(2, 'home', 'http://localhost/cloud-campus/wordpress', 'yes'),
(3, 'blogname', 'portfolio', 'yes'),
(4, 'blogdescription', 'Un site utilisant WordPress', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'diarraousmane37@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '2', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'G\\hi', 'yes'),
(25, 'links_updated_date_format', 'j F Y G\\hi', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%category%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:172:{s:8:\"infos/?$\";s:29:\"index.php?post_type=infos_cpt\";s:38:\"infos/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?post_type=infos_cpt&feed=$matches[1]\";s:33:\"infos/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?post_type=infos_cpt&feed=$matches[1]\";s:25:\"infos/page/([0-9]{1,})/?$\";s:47:\"index.php?post_type=infos_cpt&paged=$matches[1]\";s:12:\"commerces/?$\";s:33:\"index.php?post_type=commerces_cpt\";s:42:\"commerces/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_type=commerces_cpt&feed=$matches[1]\";s:37:\"commerces/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_type=commerces_cpt&feed=$matches[1]\";s:29:\"commerces/page/([0-9]{1,})/?$\";s:51:\"index.php?post_type=commerces_cpt&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:46:\"infos/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?infos=$matches[1]&feed=$matches[2]\";s:41:\"infos/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?infos=$matches[1]&feed=$matches[2]\";s:22:\"infos/([^/]+)/embed/?$\";s:38:\"index.php?infos=$matches[1]&embed=true\";s:34:\"infos/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?infos=$matches[1]&paged=$matches[2]\";s:16:\"infos/([^/]+)/?$\";s:27:\"index.php?infos=$matches[1]\";s:39:\"infos/[^/]+/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:49:\"infos/[^/]+/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:69:\"infos/[^/]+/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"infos/[^/]+/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"infos/[^/]+/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:45:\"infos/[^/]+/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:30:\"infos/([^/]+)/([^/]+)/embed/?$\";s:60:\"index.php?infos=$matches[1]&infos_cpt=$matches[2]&embed=true\";s:34:\"infos/([^/]+)/([^/]+)/trackback/?$\";s:54:\"index.php?infos=$matches[1]&infos_cpt=$matches[2]&tb=1\";s:54:\"infos/([^/]+)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?infos=$matches[1]&infos_cpt=$matches[2]&feed=$matches[3]\";s:49:\"infos/([^/]+)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?infos=$matches[1]&infos_cpt=$matches[2]&feed=$matches[3]\";s:42:\"infos/([^/]+)/([^/]+)/page/?([0-9]{1,})/?$\";s:67:\"index.php?infos=$matches[1]&infos_cpt=$matches[2]&paged=$matches[3]\";s:49:\"infos/([^/]+)/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?infos=$matches[1]&infos_cpt=$matches[2]&cpage=$matches[3]\";s:38:\"infos/([^/]+)/([^/]+)(?:/([0-9]+))?/?$\";s:66:\"index.php?infos=$matches[1]&infos_cpt=$matches[2]&page=$matches[3]\";s:28:\"infos/[^/]+/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:38:\"infos/[^/]+/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:58:\"infos/[^/]+/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:53:\"infos/[^/]+/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:53:\"infos/[^/]+/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:34:\"infos/[^/]+/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:41:\"infos/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?infos=$matches[1]&cpage=$matches[2]\";s:50:\"commerces/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?commerces=$matches[1]&feed=$matches[2]\";s:45:\"commerces/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?commerces=$matches[1]&feed=$matches[2]\";s:26:\"commerces/([^/]+)/embed/?$\";s:42:\"index.php?commerces=$matches[1]&embed=true\";s:38:\"commerces/([^/]+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?commerces=$matches[1]&paged=$matches[2]\";s:20:\"commerces/([^/]+)/?$\";s:31:\"index.php?commerces=$matches[1]\";s:43:\"commerces/[^/]+/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:53:\"commerces/[^/]+/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:73:\"commerces/[^/]+/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:68:\"commerces/[^/]+/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:68:\"commerces/[^/]+/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:49:\"commerces/[^/]+/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:34:\"commerces/([^/]+)/([^/]+)/embed/?$\";s:68:\"index.php?commerces=$matches[1]&commerces_cpt=$matches[2]&embed=true\";s:38:\"commerces/([^/]+)/([^/]+)/trackback/?$\";s:62:\"index.php?commerces=$matches[1]&commerces_cpt=$matches[2]&tb=1\";s:58:\"commerces/([^/]+)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:74:\"index.php?commerces=$matches[1]&commerces_cpt=$matches[2]&feed=$matches[3]\";s:53:\"commerces/([^/]+)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:74:\"index.php?commerces=$matches[1]&commerces_cpt=$matches[2]&feed=$matches[3]\";s:46:\"commerces/([^/]+)/([^/]+)/page/?([0-9]{1,})/?$\";s:75:\"index.php?commerces=$matches[1]&commerces_cpt=$matches[2]&paged=$matches[3]\";s:53:\"commerces/([^/]+)/([^/]+)/comment-page-([0-9]{1,})/?$\";s:75:\"index.php?commerces=$matches[1]&commerces_cpt=$matches[2]&cpage=$matches[3]\";s:42:\"commerces/([^/]+)/([^/]+)(?:/([0-9]+))?/?$\";s:74:\"index.php?commerces=$matches[1]&commerces_cpt=$matches[2]&page=$matches[3]\";s:32:\"commerces/[^/]+/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:42:\"commerces/[^/]+/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:62:\"commerces/[^/]+/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"commerces/[^/]+/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"commerces/[^/]+/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:38:\"commerces/[^/]+/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:45:\"commerces/([^/]+)/comment-page-([0-9]{1,})/?$\";s:49:\"index.php?commerces=$matches[1]&cpage=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:34:\"slides/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"slides/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"slides/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"slides/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"slides/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"slides/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"slides/([^/]+)/embed/?$\";s:39:\"index.php?slides=$matches[1]&embed=true\";s:27:\"slides/([^/]+)/trackback/?$\";s:33:\"index.php?slides=$matches[1]&tb=1\";s:35:\"slides/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?slides=$matches[1]&paged=$matches[2]\";s:42:\"slides/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?slides=$matches[1]&cpage=$matches[2]\";s:31:\"slides/([^/]+)(?:/([0-9]+))?/?$\";s:45:\"index.php?slides=$matches[1]&page=$matches[2]\";s:23:\"slides/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"slides/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"slides/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"slides/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"slides/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"slides/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:31:\".+?/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:41:\".+?/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:61:\".+?/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\".+?/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\".+?/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:37:\".+?/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:22:\"(.+?)/([^/]+)/embed/?$\";s:63:\"index.php?category_name=$matches[1]&name=$matches[2]&embed=true\";s:26:\"(.+?)/([^/]+)/trackback/?$\";s:57:\"index.php?category_name=$matches[1]&name=$matches[2]&tb=1\";s:46:\"(.+?)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]\";s:41:\"(.+?)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]\";s:34:\"(.+?)/([^/]+)/page/?([0-9]{1,})/?$\";s:70:\"index.php?category_name=$matches[1]&name=$matches[2]&paged=$matches[3]\";s:41:\"(.+?)/([^/]+)/comment-page-([0-9]{1,})/?$\";s:70:\"index.php?category_name=$matches[1]&name=$matches[2]&cpage=$matches[3]\";s:30:\"(.+?)/([^/]+)(?:/([0-9]+))?/?$\";s:69:\"index.php?category_name=$matches[1]&name=$matches[2]&page=$matches[3]\";s:20:\".+?/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:30:\".+?/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:50:\".+?/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:45:\".+?/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:45:\".+?/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:26:\".+?/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:38:\"(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:33:\"(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:14:\"(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:26:\"(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:33:\"(.+?)/comment-page-([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&cpage=$matches[2]\";s:8:\"(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:33:\"classic-editor/classic-editor.php\";i:1;s:36:\"contact-form-7/wp-contact-form-7.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'coolness', 'yes'),
(41, 'stylesheet', 'coolness', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '48748', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'posts', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:3:{i:1;a:0:{}i:2;a:4:{s:5:\"title\";s:12:\"text accueil\";s:4:\"text\";s:249:\"<img class=\"float-lg-2 mr-lg-3 img-fluid alignnone wp-image-26 size-large\" src=\"http://localhost/cloud-campus/wordpress/wp-content/uploads/2020/10/Gintama-Wallpaper-1024x679.jpg\" alt=\"\" width=\"1024\" height=\"679\" />\r\n\r\nToujours du blabla hahahahahaha\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:0:{}', 'no'),
(80, 'timezone_string', 'Europe/Paris', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '0', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '10', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1618644156', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'initial_db_version', '48748', 'yes'),
(96, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(97, 'fresh_site', '0', 'yes'),
(98, 'WPLANG', 'fr_FR', 'yes'),
(99, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:12:\"texteaccueil\";a:1:{i:0;s:6:\"text-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(105, 'cron', 'a:7:{i:1603786956;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1603826556;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1603869756;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1603869764;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1603869765;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1604388156;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(106, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'recovery_keys', 'a:0:{}', 'yes'),
(120, 'theme_mods_twentytwenty', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1603186897;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}}}}', 'yes'),
(293, '_site_transient_timeout_php_check_472f71d2a071d463a95f84346288dc89', '1604390705', 'no'),
(294, '_site_transient_php_check_472f71d2a071d463a95f84346288dc89', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(170, '_transient_health-check-site-status-result', '{\"good\":10,\"recommended\":10,\"critical\":0}', 'yes'),
(147, 'finished_updating_comment_type', '1', 'yes'),
(181, 'theme_switched', '', 'yes'),
(291, '_site_transient_timeout_theme_roots', '1603787704', 'no'),
(292, '_site_transient_theme_roots', 'a:4:{s:8:\"coolness\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";}', 'no'),
(134, 'can_compress_scripts', '1', 'no'),
(195, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(235, 'category_children', 'a:0:{}', 'yes'),
(201, '_site_transient_timeout_browser_3a39a1d66137823f367d0482940bd7b8', '1603872003', 'no'),
(202, '_site_transient_browser_3a39a1d66137823f367d0482940bd7b8', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"86.0.4240.111\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(246, 'wpcf7', 'a:2:{s:7:\"version\";s:3:\"5.3\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1603359204;s:7:\"version\";s:3:\"5.3\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}', 'yes'),
(215, 'recovery_mode_email_last_sent', '1603362149', 'yes'),
(250, 'infos_children', 'a:0:{}', 'yes'),
(275, 'commerces_children', 'a:0:{}', 'yes'),
(297, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.5.1.zip\";s:6:\"locale\";s:5:\"fr_FR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.5.1.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.5.1\";s:7:\"version\";s:5:\"5.5.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1603785908;s:15:\"version_checked\";s:5:\"5.5.1\";s:12:\"translations\";a:1:{i:0;a:7:{s:4:\"type\";s:4:\"core\";s:4:\"slug\";s:7:\"default\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"5.5.1\";s:7:\"updated\";s:19:\"2020-10-26 21:56:06\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.5.1/fr_FR.zip\";s:10:\"autoupdate\";b:1;}}}', 'no'),
(298, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1603785909;s:7:\"checked\";a:4:{s:8:\"coolness\";s:0:\"\";s:14:\"twentynineteen\";s:3:\"1.7\";s:15:\"twentyseventeen\";s:3:\"2.4\";s:12:\"twentytwenty\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:3:{s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"1.7\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.1.7.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentyseventeen\";a:6:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.4\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.4.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.5.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:12:\"translations\";a:0:{}}', 'no'),
(299, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1603785909;s:7:\"checked\";a:5:{s:19:\"akismet/akismet.php\";s:5:\"4.1.6\";s:33:\"classic-editor/classic-editor.php\";s:3:\"1.6\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:3:\"5.3\";s:9:\"hello.php\";s:5:\"1.7.2\";s:27:\"woocommerce/woocommerce.php\";s:5:\"4.6.0\";}s:8:\"response\";a:2:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.7\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.7.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.5.1\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:25:\"w.org/plugins/woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:5:\"4.6.1\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/woocommerce.4.6.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-256x256.png?rev=2366418\";s:2:\"1x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-128x128.png?rev=2366418\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=2366418\";s:2:\"1x\";s:66:\"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=2366418\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.5.1\";s:12:\"requires_php\";s:3:\"7.0\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:3:{s:33:\"classic-editor/classic-editor.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:28:\"w.org/plugins/classic-editor\";s:4:\"slug\";s:14:\"classic-editor\";s:6:\"plugin\";s:33:\"classic-editor/classic-editor.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/classic-editor/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/classic-editor.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-256x256.png?rev=1998671\";s:2:\"1x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-128x128.png?rev=1998671\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/classic-editor/assets/banner-1544x500.png?rev=1998671\";s:2:\"1x\";s:69:\"https://ps.w.org/classic-editor/assets/banner-772x250.png?rev=1998676\";}s:11:\"banners_rtl\";a:0:{}}s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:3:\"5.3\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/contact-form-7.5.3.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:67:\"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=2279696\";s:2:\"1x\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";s:3:\"svg\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901\";s:2:\"1x\";s:68:\"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(179, 'current_theme', 'coolness', 'yes'),
(180, 'theme_mods_coolness', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:14:\"menu-principal\";i:3;s:15:\"menu-secondaire\";i:4;}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(161, 'recently_activated', 'a:0:{}', 'yes');

-- --------------------------------------------------------

--
-- Structure de la table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(4, 8, '_wp_attached_file', '2020/10/gentles_dev_full_colo_final-scaled-e1603197113612.jpg'),
(5, 8, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1734;s:6:\"height\";i:1213;s:4:\"file\";s:61:\"2020/10/gentles_dev_full_colo_final-scaled-e1603197113612.jpg\";s:5:\"sizes\";a:6:{s:6:\"medium\";a:4:{s:4:\"file\";s:61:\"gentles_dev_full_colo_final-scaled-e1603197113612-300x210.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:210;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:62:\"gentles_dev_full_colo_final-scaled-e1603197113612-1024x716.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:716;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:61:\"gentles_dev_full_colo_final-scaled-e1603197113612-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:61:\"gentles_dev_full_colo_final-scaled-e1603197113612-768x537.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:537;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:63:\"gentles_dev_full_colo_final-scaled-e1603197113612-1536x1074.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1074;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:41:\"gentles_dev_full_colo_final-2048x1449.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1449;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:31:\"gentles_dev_full_colo_final.jpg\";}'),
(6, 8, '_edit_lock', '1603197182:1'),
(7, 9, '_edit_lock', '1603197089:1'),
(8, 8, '_edit_last', '1'),
(9, 8, '_wp_attachment_backup_sizes', 'a:13:{s:9:\"full-orig\";a:3:{s:5:\"width\";i:2560;s:6:\"height\";i:1812;s:4:\"file\";s:38:\"gentles_dev_full_colo_final-scaled.jpg\";}s:14:\"thumbnail-orig\";a:4:{s:4:\"file\";s:39:\"gentles_dev_full_colo_final-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"medium-orig\";a:4:{s:4:\"file\";s:39:\"gentles_dev_full_colo_final-300x212.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:212;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"medium_large-orig\";a:4:{s:4:\"file\";s:39:\"gentles_dev_full_colo_final-768x543.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:543;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"large-orig\";a:4:{s:4:\"file\";s:40:\"gentles_dev_full_colo_final-1024x725.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:725;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"1536x1536-orig\";a:4:{s:4:\"file\";s:41:\"gentles_dev_full_colo_final-1536x1087.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1087;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"2048x2048-orig\";a:4:{s:4:\"file\";s:41:\"gentles_dev_full_colo_final-2048x1449.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1449;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:18:\"full-1603197113612\";a:3:{s:5:\"width\";i:1734;s:6:\"height\";i:1811;s:4:\"file\";s:53:\"gentles_dev_full_colo_final-scaled-e1603197071534.jpg\";}s:23:\"thumbnail-1603197113612\";a:4:{s:4:\"file\";s:61:\"gentles_dev_full_colo_final-scaled-e1603197071534-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:20:\"medium-1603197113612\";a:4:{s:4:\"file\";s:61:\"gentles_dev_full_colo_final-scaled-e1603197071534-287x300.jpg\";s:5:\"width\";i:287;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:26:\"medium_large-1603197113612\";a:4:{s:4:\"file\";s:61:\"gentles_dev_full_colo_final-scaled-e1603197071534-768x802.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:802;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:19:\"large-1603197113612\";a:4:{s:4:\"file\";s:62:\"gentles_dev_full_colo_final-scaled-e1603197071534-980x1024.jpg\";s:5:\"width\";i:980;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:23:\"1536x1536-1603197113612\";a:4:{s:4:\"file\";s:63:\"gentles_dev_full_colo_final-scaled-e1603197071534-1471x1536.jpg\";s:5:\"width\";i:1471;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";}}'),
(10, 10, '_wp_attached_file', '2020/10/cropped-gentles_dev_full_colo_final-scaled-e1603197113612.jpg'),
(11, 10, '_wp_attachment_context', 'site-icon'),
(12, 10, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:69:\"2020/10/cropped-gentles_dev_full_colo_final-scaled-e1603197113612.jpg\";s:5:\"sizes\";a:6:{s:6:\"medium\";a:4:{s:4:\"file\";s:69:\"cropped-gentles_dev_full_colo_final-scaled-e1603197113612-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:69:\"cropped-gentles_dev_full_colo_final-scaled-e1603197113612-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:69:\"cropped-gentles_dev_full_colo_final-scaled-e1603197113612-270x270.jpg\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:69:\"cropped-gentles_dev_full_colo_final-scaled-e1603197113612-192x192.jpg\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:69:\"cropped-gentles_dev_full_colo_final-scaled-e1603197113612-180x180.jpg\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:67:\"cropped-gentles_dev_full_colo_final-scaled-e1603197113612-32x32.jpg\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(13, 9, '_customize_restore_dismissed', '1'),
(14, 11, '_wp_trash_meta_status', 'publish'),
(15, 11, '_wp_trash_meta_time', '1603197198'),
(16, 12, '_edit_last', '1'),
(17, 12, '_edit_lock', '1603202740:1'),
(21, 14, '_edit_lock', '1603205013:1'),
(20, 14, '_edit_last', '1'),
(25, 16, '_edit_lock', '1603356106:1'),
(24, 16, '_edit_last', '1'),
(28, 18, '_wp_attached_file', '2020/10/Basketball-Wallpaper-2.jpg'),
(29, 18, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1600;s:6:\"height\";i:1000;s:4:\"file\";s:34:\"2020/10/Basketball-Wallpaper-2.jpg\";s:5:\"sizes\";a:5:{s:6:\"medium\";a:4:{s:4:\"file\";s:34:\"Basketball-Wallpaper-2-300x188.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:188;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:35:\"Basketball-Wallpaper-2-1024x640.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:640;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:34:\"Basketball-Wallpaper-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:34:\"Basketball-Wallpaper-2-768x480.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:480;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:35:\"Basketball-Wallpaper-2-1536x960.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:960;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(30, 16, '_thumbnail_id', '18'),
(33, 19, '_wp_attached_file', '2020/10/1527342-gintama-wallpaper.jpg'),
(34, 19, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:37:\"2020/10/1527342-gintama-wallpaper.jpg\";s:5:\"sizes\";a:5:{s:6:\"medium\";a:4:{s:4:\"file\";s:37:\"1527342-gintama-wallpaper-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:38:\"1527342-gintama-wallpaper-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:37:\"1527342-gintama-wallpaper-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:37:\"1527342-gintama-wallpaper-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:38:\"1527342-gintama-wallpaper-1536x864.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:864;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(35, 14, '_thumbnail_id', '19'),
(39, 20, '_wp_attached_file', '2020/10/ONE-PIECE-LUFFY-WALLPAPER-josh015.jpg'),
(38, 1, '_edit_lock', '1603198234:1'),
(40, 20, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1366;s:6:\"height\";i:768;s:4:\"file\";s:45:\"2020/10/ONE-PIECE-LUFFY-WALLPAPER-josh015.jpg\";s:5:\"sizes\";a:4:{s:6:\"medium\";a:4:{s:4:\"file\";s:45:\"ONE-PIECE-LUFFY-WALLPAPER-josh015-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:46:\"ONE-PIECE-LUFFY-WALLPAPER-josh015-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:45:\"ONE-PIECE-LUFFY-WALLPAPER-josh015-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:45:\"ONE-PIECE-LUFFY-WALLPAPER-josh015-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(41, 12, '_thumbnail_id', '20'),
(44, 1, '_wp_trash_meta_status', 'publish'),
(45, 1, '_wp_trash_meta_time', '1603203567'),
(46, 1, '_wp_desired_post_slug', 'bonjour-tout-le-monde'),
(47, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:\"1\";}'),
(50, 22, '_menu_item_type', 'taxonomy'),
(51, 22, '_menu_item_menu_item_parent', '0'),
(52, 22, '_menu_item_object_id', '2'),
(53, 22, '_menu_item_object', 'category'),
(54, 22, '_menu_item_target', ''),
(55, 22, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(56, 22, '_menu_item_xfn', ''),
(57, 22, '_menu_item_url', ''),
(58, 22, '_menu_item_orphaned', '1603205234'),
(59, 23, '_menu_item_type', 'taxonomy'),
(60, 23, '_menu_item_menu_item_parent', '0'),
(61, 23, '_menu_item_object_id', '2'),
(62, 23, '_menu_item_object', 'category'),
(63, 23, '_menu_item_target', ''),
(64, 23, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(65, 23, '_menu_item_xfn', ''),
(66, 23, '_menu_item_url', ''),
(68, 24, '_menu_item_type', 'post_type'),
(69, 24, '_menu_item_menu_item_parent', '0'),
(70, 24, '_menu_item_object_id', '2'),
(71, 24, '_menu_item_object', 'page'),
(72, 24, '_menu_item_target', ''),
(73, 24, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(74, 24, '_menu_item_xfn', ''),
(75, 24, '_menu_item_url', ''),
(77, 25, '_menu_item_type', 'post_type'),
(78, 25, '_menu_item_menu_item_parent', '0'),
(79, 25, '_menu_item_object_id', '16'),
(80, 25, '_menu_item_object', 'post'),
(81, 25, '_menu_item_target', ''),
(82, 25, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(83, 25, '_menu_item_xfn', ''),
(84, 25, '_menu_item_url', ''),
(86, 26, '_wp_attached_file', '2020/10/Gintama-Wallpaper.jpg'),
(87, 26, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1274;s:4:\"file\";s:29:\"2020/10/Gintama-Wallpaper.jpg\";s:5:\"sizes\";a:5:{s:6:\"medium\";a:4:{s:4:\"file\";s:29:\"Gintama-Wallpaper-300x199.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:30:\"Gintama-Wallpaper-1024x679.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:679;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:29:\"Gintama-Wallpaper-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:29:\"Gintama-Wallpaper-768x510.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:31:\"Gintama-Wallpaper-1536x1019.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1019;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(88, 16, 'meta-description', 'article description'),
(92, 27, '_edit_lock', '1603356119:1'),
(91, 27, '_edit_last', '1'),
(93, 27, '_thumbnail_id', '26'),
(97, 29, '_edit_lock', '1603357275:1'),
(96, 29, '_edit_last', '1'),
(98, 29, '_wp_page_template', 'mapage.php'),
(99, 31, '_form', '<label> Your name\n    [text* your-name] </label>\n\n<label> Your email\n    [email* your-email] </label>\n\n<label> Objet\n    [text* your-subject] </label>\n\n<label> Your message (optional)\n    [textarea your-message] </label>\n\n[submit \"Submit\"]'),
(100, 31, '_mail', 'a:8:{s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:41:\"[_site_title] <diarraousmane37@gmail.com>\";s:4:\"body\";s:185:\"De : [your-name] <[your-email]>\nObjet : [your-subject]\n\nCorps du message :\n[your-message]\n\n-- \nCet e-mail a été envoyé via le formulaire de contact de [_site_title] ([_site_url])\";s:9:\"recipient\";s:19:\"[_site_admin_email]\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(101, 31, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:41:\"[_site_title] <diarraousmane37@gmail.com>\";s:4:\"body\";s:127:\"Corps du message :\n[your-message]\n\n-- \nCet e-mail a été envoyé via le formulaire de contact de [_site_title] ([_site_url])\";s:9:\"recipient\";s:12:\"[your-email]\";s:18:\"additional_headers\";s:29:\"Reply-To: [_site_admin_email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(102, 31, '_messages', 'a:8:{s:12:\"mail_sent_ok\";s:45:\"Merci pour votre message. Il a été envoyé.\";s:12:\"mail_sent_ng\";s:102:\"Une erreur s’est produite lors de l’envoi de votre message. Veuillez essayer à nouveau plus tard.\";s:16:\"validation_error\";s:88:\"Un ou plusieurs champs contiennent une erreur. Veuillez vérifier et essayer à nouveau.\";s:4:\"spam\";s:102:\"Une erreur s’est produite lors de l’envoi de votre message. Veuillez essayer à nouveau plus tard.\";s:12:\"accept_terms\";s:77:\"Vous devez accepter les termes et conditions avant d’envoyer votre message.\";s:16:\"invalid_required\";s:25:\"Ce champ est obligatoire.\";s:16:\"invalid_too_long\";s:23:\"Le champ est trop long.\";s:17:\"invalid_too_short\";s:24:\"Le champ est trop court.\";}'),
(103, 31, '_additional_settings', NULL),
(104, 31, '_locale', 'fr_FR'),
(105, 32, '_edit_last', '1'),
(106, 32, '_edit_lock', '1603363175:1'),
(107, 33, '_edit_last', '1'),
(108, 33, '_thumbnail_id', '20'),
(109, 33, '_edit_lock', '1603363504:1'),
(110, 34, '_edit_last', '1'),
(111, 34, '_edit_lock', '1603364423:1'),
(112, 34, '_thumbnail_id', '19'),
(113, 35, '_edit_last', '1'),
(114, 35, '_edit_lock', '1603363677:1'),
(115, 35, '_thumbnail_id', '8'),
(116, 34, '_wp_trash_meta_status', 'publish'),
(117, 34, '_wp_trash_meta_time', '1603364572'),
(118, 34, '_wp_desired_post_slug', 'gint'),
(119, 32, '_wp_trash_meta_status', 'draft'),
(120, 32, '_wp_trash_meta_time', '1603364576'),
(121, 32, '_wp_desired_post_slug', ''),
(122, 36, '_edit_last', '1'),
(123, 36, '_edit_lock', '1603370696:1'),
(124, 36, '_thumbnail_id', '18'),
(125, 38, '_edit_last', '1'),
(126, 38, '_edit_lock', '1603381448:1'),
(127, 39, '_wp_attached_file', '2020/10/windows10-fond-ecran-wallpaper-14.jpeg'),
(128, 39, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:46:\"2020/10/windows10-fond-ecran-wallpaper-14.jpeg\";s:5:\"sizes\";a:5:{s:6:\"medium\";a:4:{s:4:\"file\";s:46:\"windows10-fond-ecran-wallpaper-14-300x169.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:47:\"windows10-fond-ecran-wallpaper-14-1024x576.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:46:\"windows10-fond-ecran-wallpaper-14-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:46:\"windows10-fond-ecran-wallpaper-14-768x432.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:47:\"windows10-fond-ecran-wallpaper-14-1536x864.jpeg\";s:5:\"width\";i:1536;s:6:\"height\";i:864;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(129, 38, '_thumbnail_id', '39'),
(130, 40, '_menu_item_type', 'taxonomy'),
(131, 40, '_menu_item_menu_item_parent', '0'),
(132, 40, '_menu_item_object_id', '6'),
(133, 40, '_menu_item_object', 'infos'),
(134, 40, '_menu_item_target', ''),
(135, 40, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(136, 40, '_menu_item_xfn', ''),
(137, 40, '_menu_item_url', ''),
(139, 41, '_menu_item_type', 'post_type'),
(140, 41, '_menu_item_menu_item_parent', '0'),
(141, 41, '_menu_item_object_id', '29'),
(142, 41, '_menu_item_object', 'page'),
(143, 41, '_menu_item_target', ''),
(144, 41, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(145, 41, '_menu_item_xfn', ''),
(146, 41, '_menu_item_url', ''),
(204, 49, '_edit_last', '1'),
(148, 42, '_menu_item_type', 'post_type'),
(149, 42, '_menu_item_menu_item_parent', '41'),
(150, 42, '_menu_item_object_id', '2'),
(151, 42, '_menu_item_object', 'page'),
(152, 42, '_menu_item_target', ''),
(153, 42, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(154, 42, '_menu_item_xfn', ''),
(155, 42, '_menu_item_url', ''),
(203, 48, '_edit_lock', '1603448517:1'),
(157, 43, '_menu_item_type', 'post_type'),
(158, 43, '_menu_item_menu_item_parent', '23'),
(159, 43, '_menu_item_object_id', '16'),
(160, 43, '_menu_item_object', 'post'),
(161, 43, '_menu_item_target', ''),
(162, 43, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(163, 43, '_menu_item_xfn', ''),
(164, 43, '_menu_item_url', ''),
(208, 50, '_edit_last', '1'),
(166, 44, '_menu_item_type', 'post_type'),
(167, 44, '_menu_item_menu_item_parent', '23'),
(168, 44, '_menu_item_object_id', '14'),
(169, 44, '_menu_item_object', 'post'),
(170, 44, '_menu_item_target', ''),
(171, 44, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(172, 44, '_menu_item_xfn', ''),
(173, 44, '_menu_item_url', ''),
(207, 49, 'longitude', '2.438741'),
(175, 45, '_menu_item_type', 'post_type'),
(176, 45, '_menu_item_menu_item_parent', '23'),
(177, 45, '_menu_item_object_id', '27'),
(178, 45, '_menu_item_object', 'post'),
(179, 45, '_menu_item_target', ''),
(180, 45, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(181, 45, '_menu_item_xfn', ''),
(182, 45, '_menu_item_url', ''),
(205, 49, '_edit_lock', '1603448960:1'),
(184, 46, '_menu_item_type', 'post_type'),
(185, 46, '_menu_item_menu_item_parent', '23'),
(186, 46, '_menu_item_object_id', '12'),
(187, 46, '_menu_item_object', 'post'),
(188, 46, '_menu_item_target', ''),
(189, 46, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(190, 46, '_menu_item_xfn', ''),
(191, 46, '_menu_item_url', ''),
(206, 49, 'latitude', '48.866835 '),
(193, 47, '_menu_item_type', 'post_type'),
(194, 47, '_menu_item_menu_item_parent', '42'),
(195, 47, '_menu_item_object_id', '38'),
(196, 47, '_menu_item_object', 'infos_cpt'),
(197, 47, '_menu_item_target', ''),
(198, 47, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(199, 47, '_menu_item_xfn', ''),
(200, 47, '_menu_item_url', ''),
(202, 48, '_edit_last', '1'),
(209, 50, '_edit_lock', '1603449031:1'),
(210, 50, 'longitude', '2.348447'),
(211, 50, 'latitude', '48.861640'),
(212, 51, '_edit_last', '1'),
(213, 51, '_edit_lock', '1603449221:1'),
(214, 51, 'latitude', '48.856438'),
(215, 51, 'longitude', '2.319335');

-- --------------------------------------------------------

--
-- Structure de la table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-10-19 09:22:36', '2020-10-19 07:22:36', '<!-- wp:paragraph -->\n<p>Bienvenue sur WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis commencez à écrire !</p>\n<!-- /wp:paragraph -->', 'Bonjour tout le monde !', '', 'trash', 'open', 'open', '', 'bonjour-tout-le-monde__trashed', '', '', '2020-10-20 16:19:27', '2020-10-20 14:19:27', '', 0, 'http://localhost/cloud-campus/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2020-10-19 09:22:36', '2020-10-19 07:22:36', '<!-- wp:paragraph -->\n<p>Ceci est une page d’exemple. C’est différent d’un article de blog parce qu’elle restera au même endroit et apparaîtra dans la navigation de votre site (dans la plupart des thèmes). La plupart des gens commencent par une page « À propos » qui les présente aux visiteurs du site. Cela pourrait ressembler à quelque chose comme cela :</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Bonjour ! Je suis un mécanicien qui aspire à devenir acteur, et voici mon site. J’habite à Bordeaux, j’ai un super chien baptisé Russell, et j’aime la vodka (ainsi qu’être surpris par la pluie soudaine lors de longues balades sur la plage au coucher du soleil).</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...ou quelque chose comme cela :</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>La société 123 Machin Truc a été créée en 1971, et n’a cessé de proposer au public des machins-trucs de qualité depuis lors. Située à Saint-Remy-en-Bouzemont-Saint-Genest-et-Isson, 123 Machin Truc emploie 2 000 personnes, et fabrique toutes sortes de bidules supers pour la communauté bouzemontoise.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>En tant que nouvel utilisateur ou utilisatrice de WordPress, vous devriez vous rendre sur <a href=\"http://localhost/cloud-campus/wordpress/wp-admin/\">votre tableau de bord</a> pour supprimer cette page et créer de nouvelles pages pour votre contenu. Amusez-vous bien !</p>\n<!-- /wp:paragraph -->', 'Page d’exemple', '', 'publish', 'closed', 'open', '', 'page-d-exemple', '', '', '2020-10-19 09:22:36', '2020-10-19 07:22:36', '', 0, 'http://localhost/cloud-campus/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2020-10-19 09:22:36', '2020-10-19 07:22:36', '<!-- wp:heading --><h2>Qui sommes-nous ?</h2><!-- /wp:heading --><!-- wp:paragraph --><p>L’adresse de notre site Web est : http://localhost/cloud-campus/wordpress.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Utilisation des données personnelles collectées</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Commentaires</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Quand vous laissez un commentaire sur notre site web, les données inscrites dans le formulaire de commentaire, mais aussi votre adresse IP et l’agent utilisateur de votre navigateur sont collectés pour nous aider à la détection des commentaires indésirables.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Une chaîne anonymisée créée à partir de votre adresse de messagerie (également appelée hash) peut être envoyée au service Gravatar pour vérifier si vous utilisez ce dernier. Les clauses de confidentialité du service Gravatar sont disponibles ici : https://automattic.com/privacy/. Après validation de votre commentaire, votre photo de profil sera visible publiquement à coté de votre commentaire.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Médias</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Si vous êtes un utilisateur ou une utilisatrice enregistré·e et que vous téléversez des images sur le site web, nous vous conseillons d’éviter de téléverser des images contenant des données EXIF de coordonnées GPS. Les visiteurs de votre site web peuvent télécharger et extraire des données de localisation depuis ces images.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Formulaires de contact</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Si vous déposez un commentaire sur notre site, il vous sera proposé d’enregistrer votre nom, adresse de messagerie et site web dans des cookies. C’est uniquement pour votre confort afin de ne pas avoir à saisir ces informations si vous déposez un autre commentaire plus tard. Ces cookies expirent au bout d’un an.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si vous vous rendez sur la page de connexion, un cookie temporaire sera créé afin de déterminer si votre navigateur accepte les cookies. Il ne contient pas de données personnelles et sera supprimé automatiquement à la fermeture de votre navigateur.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Lorsque vous vous connecterez, nous mettrons en place un certain nombre de cookies pour enregistrer vos informations de connexion et vos préférences d’écran. La durée de vie d’un cookie de connexion est de deux jours, celle d’un cookie d’option d’écran est d’un an. Si vous cochez « Se souvenir de moi », votre cookie de connexion sera conservé pendant deux semaines. Si vous vous déconnectez de votre compte, le cookie de connexion sera effacé.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>En modifiant ou en publiant une publication, un cookie supplémentaire sera enregistré dans votre navigateur. Ce cookie ne comprend aucune donnée personnelle. Il indique simplement l’ID de la publication que vous venez de modifier. Il expire au bout d’un jour.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contenu embarqué depuis d’autres sites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Les articles de ce site peuvent inclure des contenus intégrés (par exemple des vidéos, images, articles…). Le contenu intégré depuis d’autres sites se comporte de la même manière que si le visiteur se rendait sur cet autre site.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Ces sites web pourraient collecter des données sur vous, utiliser des cookies, embarquer des outils de suivis tiers, suivre vos interactions avec ces contenus embarqués si vous disposez d’un compte connecté sur leur site web.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Statistiques et mesures d’audience</h3><!-- /wp:heading --><!-- wp:heading --><h2>Utilisation et transmission de vos données personnelles</h2><!-- /wp:heading --><!-- wp:heading --><h2>Durées de stockage de vos données</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Si vous laissez un commentaire, le commentaire et ses métadonnées sont conservés indéfiniment. Cela permet de reconnaître et approuver automatiquement les commentaires suivants au lieu de les laisser dans la file de modération.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Pour les utilisateurs et utilisatrices qui s’inscrivent sur notre site (si cela est possible), nous stockons également les données personnelles indiquées dans leur profil. Tous les utilisateurs et utilisatrices peuvent voir, modifier ou supprimer leurs informations personnelles à tout moment (à l’exception de leur nom d’utilisateur·ice). Les gestionnaires du site peuvent aussi voir et modifier ces informations.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Les droits que vous avez sur vos données</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Si vous avez un compte ou si vous avez laissé des commentaires sur le site, vous pouvez demander à recevoir un fichier contenant toutes les données personnelles que nous possédons à votre sujet, incluant celles que vous nous avez fournies. Vous pouvez également demander la suppression des données personnelles vous concernant. Cela ne prend pas en compte les données stockées à des fins administratives, légales ou pour des raisons de sécurité.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Transmission de vos données personnelles</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Les commentaires des visiteurs peuvent être vérifiés à l’aide d’un service automatisé de détection des commentaires indésirables.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Informations de contact</h2><!-- /wp:heading --><!-- wp:heading --><h2>Informations supplémentaires</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comment nous protégeons vos données</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Procédures mises en œuvre en cas de fuite de données</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Les services tiers qui nous transmettent des données</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Opérations de marketing automatisé et/ou de profilage réalisées à l’aide des données personnelles</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Affichage des informations liées aux secteurs soumis à des régulations spécifiques</h3><!-- /wp:heading -->', 'Politique de confidentialité', '', 'draft', 'closed', 'open', '', 'politique-de-confidentialite', '', '', '2020-10-19 09:22:36', '2020-10-19 07:22:36', '', 0, 'http://localhost/cloud-campus/wordpress/?page_id=3', 0, 'page', '', 0),
(8, 1, '2020-10-20 14:28:17', '2020-10-20 12:28:17', '', 'gentles_dev_full_colo_final', '', 'inherit', 'open', 'closed', '', 'gentles_dev_full_colo_final', '', '', '2020-10-20 14:31:57', '2020-10-20 12:31:57', '', 0, 'http://localhost/cloud-campus/wordpress/wp-content/uploads/2020/10/gentles_dev_full_colo_final.jpg', 0, 'attachment', 'image/jpeg', 0),
(9, 1, '2020-10-20 14:28:30', '0000-00-00 00:00:00', '{\n    \"blogdescription\": {\n        \"value\": \"D\\u00e9couvrez moi!\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-10-20 12:28:30\"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', '9125abbc-d8da-47e7-a838-8af316f2d3a0', '', '', '2020-10-20 14:28:30', '0000-00-00 00:00:00', '', 0, 'http://localhost/cloud-campus/wordpress/?p=9', 0, 'customize_changeset', '', 0),
(10, 1, '2020-10-20 14:33:13', '2020-10-20 12:33:13', 'http://localhost/cloud-campus/wordpress/wp-content/uploads/2020/10/cropped-gentles_dev_full_colo_final-scaled-e1603197113612.jpg', 'cropped-gentles_dev_full_colo_final-scaled-e1603197113612.jpg', '', 'inherit', 'open', 'closed', '', 'cropped-gentles_dev_full_colo_final-scaled-e1603197113612-jpg', '', '', '2020-10-20 14:33:13', '2020-10-20 12:33:13', '', 0, 'http://localhost/cloud-campus/wordpress/wp-content/uploads/2020/10/cropped-gentles_dev_full_colo_final-scaled-e1603197113612.jpg', 0, 'attachment', 'image/jpeg', 0),
(11, 1, '2020-10-20 14:33:18', '2020-10-20 12:33:18', '{\n    \"site_icon\": {\n        \"value\": 10,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-10-20 12:33:18\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '0fd765b0-3c66-4d1e-9734-9807cc709414', '', '', '2020-10-20 14:33:18', '2020-10-20 12:33:18', '', 0, 'http://localhost/cloud-campus/wordpress/non-classe/0fd765b0-3c66-4d1e-9734-9807cc709414/', 0, 'customize_changeset', '', 0),
(12, 1, '2020-10-20 14:48:24', '2020-10-20 12:48:24', 'Une zone de texte est elle un zone de texte? Blalalallalllslsjgf', 'La nouveauté des zones de textes', 'Une zone de texte est elle', 'publish', 'open', 'open', '', 'la-nouveaute-des-zones-de-textes', '', '', '2020-10-20 14:53:21', '2020-10-20 12:53:21', '', 0, 'http://localhost/cloud-campus/wordpress/?p=12', 0, 'post', '', 0),
(13, 1, '2020-10-20 14:48:24', '2020-10-20 12:48:24', 'Une zone de texte est elle un zone de texte? Blalalallalllslsjgf', 'La nouveauté des zones de textes', 'Une zone de texte est elle', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2020-10-20 14:48:24', '2020-10-20 12:48:24', '', 12, 'http://localhost/cloud-campus/wordpress/non-classe/12-revision-v1/', 0, 'revision', '', 0),
(14, 1, '2020-10-20 14:49:02', '2020-10-20 12:49:02', 'HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA fyujdrfuytfszosdgqd', 'Toujours plus haut', 'HAHAHAHAHAHAHAH', 'publish', 'open', 'open', '', 'toujours-plus-haut', '', '', '2020-10-20 16:25:22', '2020-10-20 14:25:22', '', 0, 'http://localhost/cloud-campus/wordpress/?p=14', 0, 'post', '', 0),
(15, 1, '2020-10-20 14:49:02', '2020-10-20 12:49:02', 'HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA fyujdrfuytfszosdgqd', 'Toujours plus haut', 'HAHAHAHAHAHAHAH', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2020-10-20 14:49:02', '2020-10-20 12:49:02', '', 14, 'http://localhost/cloud-campus/wordpress/non-classe/14-revision-v1/', 0, 'revision', '', 0),
(16, 1, '2020-10-20 14:50:20', '2020-10-20 12:50:20', 'Je tenais a écrire cet article car je le trouve vraiment complet et précis surtout à la manière d\'écrire sans mettre de virgule ni de ponctuation', 'Alors pour commencer', 'Je tenais a écrire cet article car...', 'publish', 'open', 'open', '', 'alors-pour-commencer', '', '', '2020-10-21 15:14:50', '2020-10-21 13:14:50', '', 0, 'http://localhost/cloud-campus/wordpress/?p=16', 0, 'post', '', 1),
(17, 1, '2020-10-20 14:50:20', '2020-10-20 12:50:20', 'Je tenais a écrire cet article car je le trouve vraiment complet et précis surtout à la manière d\'écrire sans mettre de virgule ni de ponctuation', 'Alors pour commencer', 'Je tenais a écrire cet article car...', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2020-10-20 14:50:20', '2020-10-20 12:50:20', '', 16, 'http://localhost/cloud-campus/wordpress/non-classe/16-revision-v1/', 0, 'revision', '', 0),
(18, 1, '2020-10-20 14:52:00', '2020-10-20 12:52:00', '', 'Basketball-Wallpaper-2', '', 'inherit', 'open', 'closed', '', 'basketball-wallpaper-2', '', '', '2020-10-20 14:52:00', '2020-10-20 12:52:00', '', 16, 'http://localhost/cloud-campus/wordpress/wp-content/uploads/2020/10/Basketball-Wallpaper-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(19, 1, '2020-10-20 14:52:34', '2020-10-20 12:52:34', '', '1527342-gintama-wallpaper', '', 'inherit', 'open', 'closed', '', '1527342-gintama-wallpaper', '', '', '2020-10-20 14:52:34', '2020-10-20 12:52:34', '', 14, 'http://localhost/cloud-campus/wordpress/wp-content/uploads/2020/10/1527342-gintama-wallpaper.jpg', 0, 'attachment', 'image/jpeg', 0),
(20, 1, '2020-10-20 14:53:16', '2020-10-20 12:53:16', '', 'ONE-PIECE-LUFFY-WALLPAPER-josh015', 'dzdd', 'inherit', 'open', 'closed', '', 'one-piece-luffy-wallpaper-josh015', '', '', '2020-10-22 12:47:18', '2020-10-22 10:47:18', '', 12, 'http://localhost/cloud-campus/wordpress/wp-content/uploads/2020/10/ONE-PIECE-LUFFY-WALLPAPER-josh015.jpg', 0, 'attachment', 'image/jpeg', 0),
(21, 1, '2020-10-20 16:19:27', '2020-10-20 14:19:27', '<!-- wp:paragraph -->\n<p>Bienvenue sur WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis commencez à écrire !</p>\n<!-- /wp:paragraph -->', 'Bonjour tout le monde !', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2020-10-20 16:19:27', '2020-10-20 14:19:27', '', 1, 'http://localhost/cloud-campus/wordpress/non-classe/1-revision-v1/', 0, 'revision', '', 0),
(22, 1, '2020-10-20 16:47:14', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-10-20 16:47:14', '0000-00-00 00:00:00', '', 0, 'http://localhost/cloud-campus/wordpress/?p=22', 1, 'nav_menu_item', '', 0),
(23, 1, '2020-10-20 16:47:52', '2020-10-20 14:47:52', ' ', '', '', 'publish', 'closed', 'closed', '', '23', '', '', '2020-10-23 11:00:57', '2020-10-23 09:00:57', '', 0, 'http://localhost/cloud-campus/wordpress/?p=23', 1, 'nav_menu_item', '', 0),
(24, 1, '2020-10-20 16:48:14', '2020-10-20 14:48:14', ' ', '', '', 'publish', 'closed', 'closed', '', '24', '', '', '2020-10-20 16:52:02', '2020-10-20 14:52:02', '', 0, 'http://localhost/cloud-campus/wordpress/?p=24', 1, 'nav_menu_item', '', 0),
(25, 1, '2020-10-20 16:52:02', '2020-10-20 14:52:02', ' ', '', '', 'publish', 'closed', 'closed', '', '25', '', '', '2020-10-20 16:52:02', '2020-10-20 14:52:02', '', 0, 'http://localhost/cloud-campus/wordpress/?p=25', 2, 'nav_menu_item', '', 0),
(26, 1, '2020-10-21 12:32:37', '2020-10-21 10:32:37', '', 'Gintama-Wallpaper', '', 'inherit', 'open', 'closed', '', 'gintama-wallpaper', '', '', '2020-10-21 12:32:37', '2020-10-21 10:32:37', '', 0, 'http://localhost/cloud-campus/wordpress/wp-content/uploads/2020/10/Gintama-Wallpaper.jpg', 0, 'attachment', 'image/jpeg', 0),
(27, 1, '2020-10-22 10:33:55', '2020-10-22 08:33:55', 'rfgrergrfgfdfd', 'Blalalll', 'tojrs', 'publish', 'open', 'open', '', 'blalalll', '', '', '2020-10-22 10:33:55', '2020-10-22 08:33:55', '', 0, 'http://localhost/cloud-campus/wordpress/?p=27', 0, 'post', '', 0),
(28, 1, '2020-10-22 10:33:55', '2020-10-22 08:33:55', 'rfgrergrfgfdfd', 'Blalalll', 'tojrs', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2020-10-22 10:33:55', '2020-10-22 08:33:55', '', 27, 'http://localhost/cloud-campus/wordpress/non-classe/27-revision-v1/', 0, 'revision', '', 0),
(29, 1, '2020-10-22 11:00:48', '2020-10-22 09:00:48', '', 'Plan du site', '', 'publish', 'closed', 'closed', '', 'plan-du-site', '', '', '2020-10-22 11:00:48', '2020-10-22 09:00:48', '', 0, 'http://localhost/cloud-campus/wordpress/?page_id=29', 0, 'page', '', 0),
(30, 1, '2020-10-22 11:00:48', '2020-10-22 09:00:48', '', 'Plan du site', '', 'inherit', 'closed', 'closed', '', '29-revision-v1', '', '', '2020-10-22 11:00:48', '2020-10-22 09:00:48', '', 29, 'http://localhost/cloud-campus/wordpress/non-classe/29-revision-v1/', 0, 'revision', '', 0),
(31, 1, '2020-10-22 11:33:24', '2020-10-22 09:33:24', '<label> Your name\n    [text* your-name] </label>\n\n<label> Your email\n    [email* your-email] </label>\n\n<label> Objet\n    [text* your-subject] </label>\n\n<label> Your message (optional)\n    [textarea your-message] </label>\n\n[submit \"Submit\"]\n[_site_title] \"[your-subject]\"\n[_site_title] <diarraousmane37@gmail.com>\nDe : [your-name] <[your-email]>\nObjet : [your-subject]\n\nCorps du message :\n[your-message]\n\n-- \nCet e-mail a été envoyé via le formulaire de contact de [_site_title] ([_site_url])\n[_site_admin_email]\nReply-To: [your-email]\n\n0\n0\n\n[_site_title] \"[your-subject]\"\n[_site_title] <diarraousmane37@gmail.com>\nCorps du message :\n[your-message]\n\n-- \nCet e-mail a été envoyé via le formulaire de contact de [_site_title] ([_site_url])\n[your-email]\nReply-To: [_site_admin_email]\n\n0\n0\nMerci pour votre message. Il a été envoyé.\nUne erreur s’est produite lors de l’envoi de votre message. Veuillez essayer à nouveau plus tard.\nUn ou plusieurs champs contiennent une erreur. Veuillez vérifier et essayer à nouveau.\nUne erreur s’est produite lors de l’envoi de votre message. Veuillez essayer à nouveau plus tard.\nVous devez accepter les termes et conditions avant d’envoyer votre message.\nCe champ est obligatoire.\nLe champ est trop long.\nLe champ est trop court.', 'Formulaire de contact 1', '', 'publish', 'closed', 'closed', '', 'formulaire-de-contact-1', '', '', '2020-10-22 11:33:24', '2020-10-22 09:33:24', '', 0, 'http://localhost/cloud-campus/wordpress/?post_type=wpcf7_contact_form&p=31', 0, 'wpcf7_contact_form', '', 0),
(32, 1, '2020-10-22 13:02:56', '2020-10-22 11:02:56', '', 'titre', '', 'trash', 'closed', 'closed', '', '__trashed', '', '', '2020-10-22 13:02:56', '2020-10-22 11:02:56', '', 0, 'http://localhost/cloud-campus/wordpress/?post_type=slides&#038;p=32', 0, 'slides', '', 0),
(33, 1, '2020-10-22 12:47:25', '2020-10-22 10:47:25', '', 'onee piece', '', 'publish', 'closed', 'closed', '', 'onee-piece', '', '', '2020-10-22 12:47:25', '2020-10-22 10:47:25', '', 0, 'http://localhost/cloud-campus/wordpress/?post_type=slides&#038;p=33', 0, 'slides', '', 0),
(34, 1, '2020-10-22 12:47:39', '2020-10-22 10:47:39', '', 'gint', '', 'trash', 'closed', 'closed', '', 'gint__trashed', '', '', '2020-10-22 13:02:52', '2020-10-22 11:02:52', '', 0, 'http://localhost/cloud-campus/wordpress/?post_type=slides&#038;p=34', 0, 'slides', '', 0),
(35, 1, '2020-10-22 12:47:52', '2020-10-22 10:47:52', '', 'gent', '', 'publish', 'closed', 'closed', '', 'gent', '', '', '2020-10-22 12:47:52', '2020-10-22 10:47:52', '', 0, 'http://localhost/cloud-campus/wordpress/?post_type=slides&#038;p=35', 0, 'slides', '', 0),
(36, 1, '2020-10-22 13:07:30', '2020-10-22 11:07:30', '', 'sfddsdf', '', 'publish', 'closed', 'closed', '', 'sfddsdf', '', '', '2020-10-22 13:07:30', '2020-10-22 11:07:30', '', 0, 'http://localhost/cloud-campus/wordpress/?post_type=slides&#038;p=36', 0, 'slides', '', 0),
(37, 1, '2020-10-22 14:47:19', '2020-10-22 12:47:19', '', 'sfddsdf', '', 'inherit', 'closed', 'closed', '', '36-autosave-v1', '', '', '2020-10-22 14:47:19', '2020-10-22 12:47:19', '', 36, 'http://localhost/cloud-campus/wordpress/non-classe/36-autosave-v1/', 0, 'revision', '', 0),
(38, 1, '2020-10-22 14:48:50', '2020-10-22 12:48:50', 'sfgftgfdf', 'post cph', '', 'publish', 'closed', 'closed', '', 'post-cph', '', '', '2020-10-22 14:49:52', '2020-10-22 12:49:52', '', 0, 'http://localhost/cloud-campus/wordpress/?post_type=infos_cpt&#038;p=38', 0, 'infos_cpt', '', 0),
(39, 1, '2020-10-22 14:48:45', '2020-10-22 12:48:45', '', 'windows10-fond-ecran-wallpaper-14', '', 'inherit', 'open', 'closed', '', 'windows10-fond-ecran-wallpaper-14', '', '', '2020-10-22 14:48:45', '2020-10-22 12:48:45', '', 38, 'http://localhost/cloud-campus/wordpress/wp-content/uploads/2020/10/windows10-fond-ecran-wallpaper-14.jpeg', 0, 'attachment', 'image/jpeg', 0),
(40, 1, '2020-10-22 14:50:18', '2020-10-22 12:50:18', ' ', '', '', 'publish', 'closed', 'closed', '', '40', '', '', '2020-10-23 11:00:57', '2020-10-23 09:00:57', '', 0, 'http://localhost/cloud-campus/wordpress/?p=40', 6, 'nav_menu_item', '', 0),
(41, 1, '2020-10-23 11:00:57', '2020-10-23 09:00:57', ' ', '', '', 'publish', 'closed', 'closed', '', '41', '', '', '2020-10-23 11:00:57', '2020-10-23 09:00:57', '', 0, 'http://localhost/cloud-campus/wordpress/?p=41', 7, 'nav_menu_item', '', 0),
(42, 1, '2020-10-23 11:00:57', '2020-10-23 09:00:57', ' ', '', '', 'publish', 'closed', 'closed', '', '42', '', '', '2020-10-23 11:00:57', '2020-10-23 09:00:57', '', 0, 'http://localhost/cloud-campus/wordpress/?p=42', 8, 'nav_menu_item', '', 0),
(43, 1, '2020-10-23 11:00:57', '2020-10-23 09:00:57', ' ', '', '', 'publish', 'closed', 'closed', '', '43', '', '', '2020-10-23 11:00:57', '2020-10-23 09:00:57', '', 0, 'http://localhost/cloud-campus/wordpress/?p=43', 2, 'nav_menu_item', '', 0),
(44, 1, '2020-10-23 11:00:57', '2020-10-23 09:00:57', ' ', '', '', 'publish', 'closed', 'closed', '', '44', '', '', '2020-10-23 11:00:57', '2020-10-23 09:00:57', '', 0, 'http://localhost/cloud-campus/wordpress/?p=44', 3, 'nav_menu_item', '', 0),
(45, 1, '2020-10-23 11:00:57', '2020-10-23 09:00:57', ' ', '', '', 'publish', 'closed', 'closed', '', '45', '', '', '2020-10-23 11:00:57', '2020-10-23 09:00:57', '', 0, 'http://localhost/cloud-campus/wordpress/?p=45', 5, 'nav_menu_item', '', 0),
(46, 1, '2020-10-23 11:00:57', '2020-10-23 09:00:57', ' ', '', '', 'publish', 'closed', 'closed', '', '46', '', '', '2020-10-23 11:00:57', '2020-10-23 09:00:57', '', 0, 'http://localhost/cloud-campus/wordpress/?p=46', 4, 'nav_menu_item', '', 0),
(47, 1, '2020-10-23 11:00:57', '2020-10-23 09:00:57', ' ', '', '', 'publish', 'closed', 'closed', '', '47', '', '', '2020-10-23 11:00:57', '2020-10-23 09:00:57', '', 0, 'http://localhost/cloud-campus/wordpress/?p=47', 9, 'nav_menu_item', '', 0),
(48, 1, '2020-10-23 12:21:57', '0000-00-00 00:00:00', '', 'toilettage canin', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-10-23 12:21:57', '2020-10-23 10:21:57', '', 0, 'http://localhost/cloud-campus/wordpress/?post_type=commerces_cpt&#038;p=48', 0, 'commerces_cpt', '', 0),
(49, 1, '2020-10-23 12:31:40', '2020-10-23 10:31:40', 'gfrvvresdfrf', 'toilettage canin', '', 'publish', 'closed', 'closed', '', 'toilettage-canin', '', '', '2020-10-23 12:31:40', '2020-10-23 10:31:40', '', 0, 'http://localhost/cloud-campus/wordpress/?post_type=commerces_cpt&#038;p=49', 0, 'commerces_cpt', '', 0),
(50, 1, '2020-10-23 12:32:41', '2020-10-23 10:32:41', 'jdsfgdg', 'blaldj', '', 'publish', 'closed', 'closed', '', 'blaldj', '', '', '2020-10-23 12:32:41', '2020-10-23 10:32:41', '', 0, 'http://localhost/cloud-campus/wordpress/?post_type=commerces_cpt&#038;p=50', 0, 'commerces_cpt', '', 0),
(51, 1, '2020-10-23 12:33:35', '2020-10-23 10:33:35', 'wcfdvfdvdfv', 'fvvvvvf', '', 'publish', 'closed', 'closed', '', 'fvvvvvf', '', '', '2020-10-23 12:33:35', '2020-10-23 10:33:35', '', 0, 'http://localhost/cloud-campus/wordpress/?post_type=commerces_cpt&#038;p=51', 0, 'commerces_cpt', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
CREATE TABLE IF NOT EXISTS `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Non classé', 'non-classe', 0),
(2, 'Actualités', 'actualites', 0),
(3, 'Menu principal', 'menu-principal', 0),
(4, 'Menu secondaire', 'menu-secondaire', 0),
(5, 'Blog', 'blog', 0),
(6, 'cqsklj 1', 'cqsklj-1', 0),
(7, '75', '75', 0),
(8, '94', '94', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(23, 3, 0),
(12, 2, 0),
(14, 2, 0),
(16, 2, 0),
(24, 4, 0),
(25, 4, 0),
(38, 6, 0),
(27, 5, 0),
(40, 3, 0),
(43, 3, 0),
(44, 3, 0),
(46, 3, 0),
(45, 3, 0),
(41, 3, 0),
(42, 3, 0),
(47, 3, 0),
(49, 7, 0),
(50, 7, 0),
(51, 8, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'category', 'desc cat', 0, 3),
(3, 3, 'nav_menu', '', 0, 9),
(4, 4, 'nav_menu', '', 0, 2),
(5, 5, 'category', '', 0, 1),
(6, 6, 'infos', '', 0, 1),
(7, 7, 'commerces', '', 0, 2),
(8, 8, 'commerces', '', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'Ouss'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'text_widget_custom_html'),
(15, 1, 'show_welcome_panel', '1'),
(18, 1, 'session_tokens', 'a:2:{s:64:\"8c9fb241912c50dd80c022f9a3a4c32774670778c7ee665a53dfaf2356d29b19\";a:4:{s:10:\"expiration\";i:1603527481;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36\";s:5:\"login\";i:1603354681;}s:64:\"f965d7bfdd406ee78cb6147d107088c85ee202048e42a2c1a8e734b0f7a6f544\";a:4:{s:10:\"expiration\";i:1603616387;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36\";s:5:\"login\";i:1603443587;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(19, 1, 'closedpostboxes_dashboard', 'a:0:{}'),
(20, 1, 'metaboxhidden_dashboard', 'a:4:{i:0;s:19:\"dashboard_right_now\";i:1;s:18:\"dashboard_activity\";i:2;s:21:\"dashboard_quick_press\";i:3;s:17:\"dashboard_primary\";}'),
(21, 1, 'closedpostboxes_post', 'a:0:{}'),
(22, 1, 'metaboxhidden_post', 'a:0:{}'),
(23, 1, 'wp_user-settings', 'libraryContent=browse&posts_list_mode=list&editor=tinymce&advImgDetails=show'),
(24, 1, 'wp_user-settings-time', '1603356238'),
(25, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(26, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}'),
(27, 1, 'nav_menu_recently_edited', '3'),
(32, 1, 'meta-box-order_commerces_cpt', 'a:3:{s:4:\"side\";s:22:\"submitdiv,commercesdiv\";s:6:\"normal\";s:18:\"postcustom,slugdiv\";s:8:\"advanced\";s:0:\"\";}'),
(33, 1, 'screen_layout_commerces_cpt', '2'),
(28, 1, 'closedpostboxes_slides', 'a:0:{}'),
(29, 1, 'metaboxhidden_slides', 'a:1:{i:0;s:7:\"slugdiv\";}'),
(30, 1, 'meta-box-order_slides', 'a:3:{s:4:\"side\";s:9:\"submitdiv\";s:6:\"normal\";s:7:\"slugdiv\";s:8:\"advanced\";s:0:\"\";}'),
(31, 1, 'screen_layout_slides', '2');

-- --------------------------------------------------------

--
-- Structure de la table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'Ouss', '$P$BviDtOhRMKtyuJl3pEj2VH5ghIKyis1', 'ouss', 'diarraousmane37@gmail.com', 'http://localhost/cloud-campus/wordpress', '2020-10-19 07:22:36', '', 0, 'Ouss');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
