-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2024 at 08:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realestate`
--

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amenitis_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `amenitis_name`, `created_at`, `updated_at`) VALUES
(2, 'Cleaning Service', NULL, NULL),
(3, 'Swimming Pool', NULL, NULL),
(4, 'Pet Friendly', NULL, NULL),
(5, 'Air Conditioning', NULL, NULL),
(6, 'Dishwasher', NULL, NULL),
(7, 'Hardwood Flows', NULL, NULL),
(8, 'Refrigerator', NULL, NULL),
(9, 'Gym', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `category_name`, `category_slug`, `created_at`, `updated_at`) VALUES
(1, 'Real Estate', 'real-estate', NULL, NULL),
(2, 'Interior', 'interior', NULL, NULL),
(3, 'Tips and advice', 'tips-and-advice', NULL, NULL),
(4, 'Architecture', 'architecture', NULL, NULL),
(5, 'Home improvement', 'home-improvement', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blogcat_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_slug` varchar(255) DEFAULT NULL,
  `post_image` varchar(255) DEFAULT NULL,
  `short_desc` text DEFAULT NULL,
  `long_desc` text DEFAULT NULL,
  `post_tags` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `blogcat_id`, `user_id`, `post_title`, `post_slug`, `post_image`, `short_desc`, `long_desc`, `post_tags`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Cillum vel minus mol', 'cillum-vel-minus-mol', 'upload/post/1798601741252388.png', 'Lorem ipsum dolor sit amet consectetur adipisicing sed.', '<p>Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.</p>', 'Realestate,Home,Manage', '2024-05-09 12:44:46', NULL),
(2, 2, 1, 'Excepturi consequatu', 'excepturi-consequatu', 'upload/post/1798601801618580.png', 'Lorem ipsum dolor sit amet consectetur adipisicing sed.', '<p>Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.</p>', 'Realestate,Hospital,Collage,Institute', '2024-05-09 12:45:43', NULL),
(4, 5, 1, 'At adipisicing moles', 'at-adipisicing-moles', 'upload/post/1798646582313207.png', 'Lorem ipsum dolor sit amet consectetur adipisicing sed.', '<p>Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.</p>', 'Realestate,Pariatur In unde au', '2024-05-10 00:37:29', NULL),
(5, 1, 1, 'Maxime a nihil et au', 'maxime-a-nihil-et-au', 'upload/post/1798670125603314.jpeg', 'Lorem ipsum dolor sit amet consectetur adipisicing sed..', '<p>Lorem ipsum dolor sit amet consectetur adipisicing sed..Lorem ipsum dolor sit amet consectetur adipisicing sed..Lorem ipsum dolor sit amet consectetur adipisicing sed..Lorem ipsum dolor sit amet consectetur adipisicing sed..</p>', 'Realestate,Quia voluptatem dol', '2024-05-10 06:51:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'user_id',
  `receiver_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'agent_id',
  `msg` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `sender_id`, `receiver_id`, `msg`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, 'test message', '2024-05-16 03:42:59', '2024-05-16 03:42:59'),
(2, 3, 2, 'test', '2024-05-16 03:55:14', '2024-05-16 03:55:14'),
(3, 1, 2, '321654', '2024-05-19 12:08:36', '2024-05-19 12:08:36');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `parent_id`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 3, 5, NULL, 'This is nice Picture', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis nos trud exerc.', '2024-05-10 07:53:47', NULL),
(2, 3, 5, NULL, 'This is Nice Image', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis nos trud exerc.', '2024-05-10 07:55:06', NULL),
(3, 3, 5, 1, 'Thanks for nice comment', 'I Will Contact With you', '2024-05-10 10:37:53', NULL),
(4, 3, 5, 2, 'Thank You', 'I Will Contact With you', '2024-05-10 23:03:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `compares`
--

CREATE TABLE `compares` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `compares`
--

INSERT INTO `compares` (`id`, `user_id`, `property_id`, `created_at`, `updated_at`) VALUES
(4, 3, 9, '2024-05-04 21:30:23', NULL),
(5, 3, 10, '2024-05-04 21:30:24', NULL),
(6, 3, 12, '2024-05-04 21:30:25', NULL),
(7, 1, 9, '2024-05-17 01:36:10', NULL),
(8, 1, 10, '2024-05-17 01:36:13', NULL),
(9, 1, 12, '2024-05-17 01:36:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(11) NOT NULL,
  `facility_name` varchar(255) DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `property_id`, `facility_name`, `distance`, `created_at`, `updated_at`) VALUES
(26, 9, 'Railways', '1', '2024-05-02 00:34:13', '2024-05-02 00:34:13'),
(32, 12, 'Pharmacy', '1', '2024-05-02 05:32:25', '2024-05-02 05:32:25'),
(33, 12, 'Beach', '2', '2024-05-02 05:32:25', '2024-05-02 05:32:25'),
(34, 12, 'Bus Stop', '3', '2024-05-02 05:32:25', '2024-05-02 05:32:25'),
(35, 13, 'Pharmacy', '1', '2024-05-02 05:33:41', '2024-05-02 05:33:41'),
(36, 13, 'Beach', '2', '2024-05-02 05:33:41', '2024-05-02 05:33:41'),
(37, 13, 'Bus Stop', '3', '2024-05-02 05:33:41', '2024-05-02 05:33:41'),
(41, 15, 'Railways', '1', '2024-05-02 12:05:27', '2024-05-02 12:05:27'),
(42, 15, 'Entertainment', '2', '2024-05-02 12:05:27', '2024-05-02 12:05:27'),
(43, 15, 'Mall', '3', '2024-05-02 12:05:27', '2024-05-02 12:05:27'),
(44, 16, 'Pharmacy', '1', '2024-05-02 12:07:50', '2024-05-02 12:07:50'),
(45, 16, 'Entertainment', '2', '2024-05-02 12:07:50', '2024-05-02 12:07:50'),
(46, 10, 'Beach', '1', '2024-05-03 23:18:54', '2024-05-03 23:18:54'),
(47, 10, 'Bus Stop', '1', '2024-05-03 23:18:54', '2024-05-03 23:18:54'),
(48, 10, 'Hospital', '3', '2024-05-03 23:18:54', '2024-05-03 23:18:54'),
(49, 10, 'SuperMarket', '4', '2024-05-03 23:18:54', '2024-05-03 23:18:54'),
(50, 10, 'Pharmacy', '0.5', '2024-05-03 23:18:54', '2024-05-03 23:18:54'),
(51, 17, 'School', '1', '2024-05-07 21:54:42', '2024-05-07 21:54:42'),
(52, 17, 'SuperMarket', '2', '2024-05-07 21:54:42', '2024-05-07 21:54:42'),
(53, 17, 'Pharmacy', '3', '2024-05-07 21:54:42', '2024-05-07 21:54:42'),
(54, 17, 'Airport', '04', '2024-05-07 21:54:42', '2024-05-07 21:54:42'),
(55, 18, 'Entertainment', '1', '2024-05-17 00:42:18', '2024-05-17 00:42:18'),
(56, 18, 'School', '2', '2024-05-17 00:42:18', '2024-05-17 00:42:18'),
(57, 18, 'Airport', '5', '2024-05-17 00:42:18', '2024-05-17 00:42:18'),
(58, 18, 'Bus Stop', '3', '2024-05-17 00:42:18', '2024-05-17 00:42:18'),
(59, 19, 'School', '1', '2024-05-17 00:47:42', '2024-05-17 00:47:42'),
(60, 19, 'Entertainment', '2', '2024-05-17 00:47:42', '2024-05-17 00:47:42'),
(61, 19, 'Pharmacy', '3', '2024-05-17 00:47:42', '2024-05-17 00:47:42'),
(62, 20, 'School', '1', '2024-05-17 00:50:09', '2024-05-17 00:50:09'),
(63, 20, 'Beach', '2', '2024-05-17 00:50:09', '2024-05-17 00:50:09'),
(64, 20, 'Railways', '3', '2024-05-17 00:50:09', '2024-05-17 00:50:09'),
(65, 21, 'Hospital', '3', '2024-05-17 00:56:20', '2024-05-17 00:56:20'),
(66, 21, 'Airport', '5', '2024-05-17 00:56:20', '2024-05-17 00:56:20'),
(67, 21, 'Mall', '3', '2024-05-17 00:56:20', '2024-05-17 00:56:20'),
(68, 21, 'Beach', '4', '2024-05-17 00:56:20', '2024-05-17 00:56:20'),
(69, 22, 'School', '1', '2024-05-17 00:59:24', '2024-05-17 00:59:24'),
(70, 22, 'SuperMarket', '2', '2024-05-17 00:59:24', '2024-05-17 00:59:24'),
(71, 22, 'Entertainment', '3', '2024-05-17 00:59:24', '2024-05-17 00:59:24'),
(72, 22, 'Pharmacy', '4', '2024-05-17 00:59:24', '2024-05-17 00:59:24'),
(77, 23, 'Hospital', '2', '2024-05-17 03:24:56', '2024-05-17 03:24:56'),
(78, 23, 'Railways', '5', '2024-05-17 03:24:56', '2024-05-17 03:24:56'),
(79, 23, 'Bus Stop', '3', '2024-05-17 03:24:56', '2024-05-17 03:24:56'),
(80, 23, 'Beach', '4', '2024-05-17 03:24:56', '2024-05-17 03:24:56');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_04_25_054703_create_property_types_table', 2),
(6, '2024_04_25_140943_create_amenities_table', 3),
(7, '2024_04_26_160316_create_properties_table', 4),
(8, '2024_04_26_163130_create_multi_images_table', 4),
(9, '2024_04_26_163851_create_facilities_table', 4),
(10, '2024_05_02_105608_create_package_plans_table', 5),
(11, '2024_05_04_082311_create_wishlists_table', 6),
(12, '2024_05_05_013628_create_compares_table', 7),
(13, '2024_05_05_041927_create_property_messages_table', 8),
(14, '2024_05_07_064551_create_states_table', 9),
(15, '2024_05_09_041136_create_testimonials_table', 10),
(16, '2024_05_09_054010_create_blog_categories_table', 11),
(17, '2024_05_09_174353_create_blog_posts_table', 12),
(18, '2024_05_10_131434_create_comments_table', 13),
(19, '2024_05_11_062848_create_schedules_table', 14),
(20, '2024_05_12_155001_create_smtp_settings_table', 15),
(21, '2024_05_13_145348_create_site_settings_table', 16),
(22, '2024_05_14_031211_create_permission_tables', 17),
(23, '2024_05_16_063515_create_chat_messages_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 43),
(3, 'App\\Models\\User', 16);

-- --------------------------------------------------------

--
-- Table structure for table `multi_images`
--

CREATE TABLE `multi_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(11) NOT NULL,
  `photo_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multi_images`
--

INSERT INTO `multi_images` (`id`, `property_id`, `photo_name`, `created_at`, `updated_at`) VALUES
(26, 9, 'upload/multi_img/663333e5195f4.jpg', '2024-05-02 00:34:13', '2024-05-02 00:34:13'),
(27, 9, 'upload/multi_img/663333e51a2f6.jpg', '2024-05-02 00:34:13', '2024-05-02 00:34:13'),
(28, 10, 'upload/multi_img/6633340784144.jpg', '2024-05-02 00:34:47', '2024-05-02 00:34:47'),
(29, 10, 'upload/multi_img/6633340784ee4.jpg', '2024-05-02 00:34:47', '2024-05-02 00:34:47'),
(30, 12, 'upload/multi_img/663379c920ee3.jpg', '2024-05-02 05:32:25', '2024-05-02 05:32:25'),
(31, 12, 'upload/multi_img/663379c921cc5.jpg', '2024-05-02 05:32:25', '2024-05-02 05:32:25'),
(32, 13, 'upload/multi_img/66337a157dc72.jpg', '2024-05-02 05:33:41', '2024-05-02 05:33:41'),
(33, 13, 'upload/multi_img/66337a157f993.jpg', '2024-05-02 05:33:41', '2024-05-02 05:33:41'),
(36, 15, 'upload/multi_img/6633d5e7c362a.jpg', '2024-05-02 12:05:27', '2024-05-02 12:05:27'),
(37, 15, 'upload/multi_img/6633d5e7cadd8.jpg', '2024-05-02 12:05:27', '2024-05-02 12:05:27'),
(38, 16, 'upload/multi_img/6633d6768cd2b.jpg', '2024-05-02 12:07:50', '2024-05-02 12:07:50'),
(39, 16, 'upload/multi_img/6633d6768dea9.jpg', '2024-05-02 12:07:50', '2024-05-02 12:07:50'),
(40, 17, 'upload/multi_img/663af7826c925.jpg', '2024-05-07 21:54:42', '2024-05-07 21:54:42'),
(41, 17, 'upload/multi_img/663af7826d6ab.webp', '2024-05-07 21:54:42', '2024-05-07 21:54:42'),
(42, 17, 'upload/multi_img/6646f48e70c45.jpg', NULL, '2024-05-17 00:09:18'),
(43, 16, 'upload/multi_img/6646f5d2864c0.jpg', NULL, '2024-05-17 00:14:42'),
(44, 18, 'upload/multi_img/6646fc4abb501.jpg', '2024-05-17 00:42:18', '2024-05-17 00:42:18'),
(45, 18, 'upload/multi_img/6646fc4abc260.jpg', '2024-05-17 00:42:18', '2024-05-17 00:42:18'),
(46, 18, 'upload/multi_img/6646fc4abdfcb.jpg', '2024-05-17 00:42:18', '2024-05-17 00:42:18'),
(47, 18, 'upload/multi_img/6646fc4abe9be.jpg', '2024-05-17 00:42:18', '2024-05-17 00:42:18'),
(48, 19, 'upload/multi_img/6646fd8e3216b.jpg', '2024-05-17 00:47:42', '2024-05-17 00:47:42'),
(49, 19, 'upload/multi_img/6646fd8e33632.jpg', '2024-05-17 00:47:42', '2024-05-17 00:47:42'),
(50, 19, 'upload/multi_img/6646fd8e3412c.jpg', '2024-05-17 00:47:42', '2024-05-17 00:47:42'),
(51, 19, 'upload/multi_img/6646fd8e34c4a.jpg', '2024-05-17 00:47:42', '2024-05-17 00:47:42'),
(52, 20, 'upload/multi_img/6646fe218b063.jpg', '2024-05-17 00:50:09', '2024-05-17 00:50:09'),
(53, 20, 'upload/multi_img/6646fe218bc9d.jpg', '2024-05-17 00:50:09', '2024-05-17 00:50:09'),
(54, 20, 'upload/multi_img/6646fe218cc59.jpg', '2024-05-17 00:50:09', '2024-05-17 00:50:09'),
(55, 20, 'upload/multi_img/6646fe218d678.jpg', '2024-05-17 00:50:09', '2024-05-17 00:50:09'),
(56, 21, 'upload/multi_img/6646ff94a07ea.jpg', '2024-05-17 00:56:20', '2024-05-17 00:56:20'),
(57, 21, 'upload/multi_img/6646ff94a19f9.jpg', '2024-05-17 00:56:20', '2024-05-17 00:56:20'),
(58, 21, 'upload/multi_img/6646ff94a25b4.jpg', '2024-05-17 00:56:20', '2024-05-17 00:56:20'),
(59, 21, 'upload/multi_img/6646ff94a2edf.jpg', '2024-05-17 00:56:20', '2024-05-17 00:56:20'),
(60, 22, 'upload/multi_img/6647004c9345f.jpg', '2024-05-17 00:59:24', '2024-05-17 00:59:24'),
(61, 22, 'upload/multi_img/6647004c96681.jpg', '2024-05-17 00:59:24', '2024-05-17 00:59:24'),
(62, 22, 'upload/multi_img/6647004c9c28b.jpg', '2024-05-17 00:59:24', '2024-05-17 00:59:24'),
(63, 22, 'upload/multi_img/6647004c9d461.jpg', '2024-05-17 00:59:24', '2024-05-17 00:59:24'),
(64, 23, 'upload/multi_img/6647018c12fcc.jpg', '2024-05-17 01:04:44', '2024-05-17 01:04:44'),
(65, 23, 'upload/multi_img/6647018c16ac6.jpg', '2024-05-17 01:04:44', '2024-05-17 01:04:44'),
(66, 23, 'upload/multi_img/6647018c1b5b0.jpg', '2024-05-17 01:04:44', '2024-05-17 01:04:44'),
(67, 23, 'upload/multi_img/6647018c2127a.jpg', '2024-05-17 01:04:44', '2024-05-17 01:04:44');

-- --------------------------------------------------------

--
-- Table structure for table `package_plans`
--

CREATE TABLE `package_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_name` varchar(255) DEFAULT NULL,
  `package_credits` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `package_amount` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_plans`
--

INSERT INTO `package_plans` (`id`, `user_id`, `package_name`, `package_credits`, `invoice`, `package_amount`, `created_at`, `updated_at`) VALUES
(1, 2, 'Business', '3', 'ERS31409728', '20', '2024-05-02 11:56:08', NULL),
(2, 2, 'Professional', '10', 'ERS18175973', '50', '2024-05-02 23:01:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'type.menu', 'web', 'type', '2024-05-13 23:16:36', '2024-05-13 23:16:36'),
(2, 'all.type', 'web', 'type', '2024-05-13 23:17:11', '2024-05-13 23:17:11'),
(3, 'add.type', 'web', 'type', '2024-05-13 23:17:42', '2024-05-13 23:17:42'),
(4, 'edit.type', 'web', 'type', '2024-05-13 23:17:59', '2024-05-13 23:17:59'),
(5, 'delete.type', 'web', 'type', '2024-05-13 23:18:14', '2024-05-13 23:18:14'),
(7, 'state.menu', 'web', 'state', '2024-05-13 23:47:30', '2024-05-13 23:47:30'),
(8, 'state.all', 'web', 'state', '2024-05-14 02:47:01', '2024-05-14 02:47:01'),
(9, 'state.add', 'web', 'state', '2024-05-14 02:47:01', '2024-05-14 02:47:01'),
(10, 'State.delete', 'web', 'state', '2024-05-14 09:16:11', '2024-05-14 09:16:11'),
(11, 'All.property', 'web', 'property', '2024-05-14 09:16:48', '2024-05-14 09:16:48'),
(12, 'add.property', 'web', 'property', '2024-05-14 09:17:04', '2024-05-14 09:17:04'),
(13, 'edit.property', 'web', 'property', '2024-05-14 09:17:18', '2024-05-14 09:17:18'),
(14, 'delete.property', 'web', 'property', '2024-05-14 09:17:38', '2024-05-14 09:17:57'),
(15, 'all.amenities', 'web', 'amenities', '2024-05-14 09:18:18', '2024-05-14 09:18:18'),
(16, 'add.amenities', 'web', 'amenities', '2024-05-14 09:18:31', '2024-05-14 09:18:31'),
(17, 'edit.amenities', 'web', 'amenities', '2024-05-14 09:19:08', '2024-05-14 09:19:08'),
(18, 'delete.amenities', 'web', 'amenities', '2024-05-14 09:19:18', '2024-05-14 09:19:18'),
(19, 'agent.menu', 'web', 'agent', '2024-05-14 09:55:05', '2024-05-14 09:55:05'),
(20, 'add.agent', 'web', 'agent', '2024-05-14 09:55:26', '2024-05-14 09:55:26'),
(21, 'edit.agent', 'web', 'agent', '2024-05-14 09:55:42', '2024-05-14 09:55:42'),
(22, 'delete.agent', 'web', 'agent', '2024-05-14 09:55:52', '2024-05-14 09:55:52'),
(23, 'category.menu', 'web', 'category', '2024-05-14 09:56:44', '2024-05-14 09:56:44'),
(24, 'add.category', 'web', 'category', '2024-05-14 09:57:08', '2024-05-14 09:57:08'),
(25, 'edit.category', 'web', 'category', '2024-05-14 09:57:20', '2024-05-14 09:57:20'),
(26, 'delete.category', 'web', 'category', '2024-05-14 09:57:31', '2024-05-14 09:57:31'),
(27, 'comment.menu', 'web', 'comment', '2024-05-14 09:58:05', '2024-05-14 09:58:05'),
(28, 'add.comment', 'web', 'comment', '2024-05-14 09:58:22', '2024-05-14 09:58:22'),
(29, 'edit.comment', 'web', 'comment', '2024-05-14 09:58:32', '2024-05-14 09:58:32'),
(30, 'delete.comment', 'web', 'comment', '2024-05-14 09:58:43', '2024-05-14 09:58:43'),
(31, 'history.menu', 'web', 'history', '2024-05-14 09:59:05', '2024-05-14 09:59:05'),
(32, 'add.history', 'web', 'history', '2024-05-14 09:59:40', '2024-05-14 09:59:40'),
(33, 'edit.history', 'web', 'history', '2024-05-14 09:59:51', '2024-05-14 09:59:51'),
(34, 'delete.history', 'web', 'history', '2024-05-14 10:00:03', '2024-05-14 10:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ptype_id` varchar(255) NOT NULL,
  `amemities_id` varchar(255) NOT NULL,
  `property_name` varchar(255) NOT NULL,
  `property_slug` varchar(255) NOT NULL,
  `property_code` varchar(255) NOT NULL,
  `property_status` varchar(255) NOT NULL,
  `lowest_price` varchar(255) DEFAULT NULL,
  `max_price` varchar(255) DEFAULT NULL,
  `property_thambnail` varchar(255) DEFAULT NULL,
  `short_desc` text DEFAULT NULL,
  `long_desc` text DEFAULT NULL,
  `bedrooms` varchar(255) DEFAULT NULL,
  `bathrooms` varchar(255) DEFAULT NULL,
  `garage` varchar(255) DEFAULT NULL,
  `garage_size` varchar(255) DEFAULT NULL,
  `property_size` varchar(255) DEFAULT NULL,
  `property_video` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `neighborhood` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `hot` varchar(255) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `ptype_id`, `amemities_id`, `property_name`, `property_slug`, `property_code`, `property_status`, `lowest_price`, `max_price`, `property_thambnail`, `short_desc`, `long_desc`, `bedrooms`, `bathrooms`, `garage`, `garage_size`, `property_size`, `property_video`, `address`, `city`, `state`, `postal_code`, `neighborhood`, `latitude`, `longitude`, `featured`, `hot`, `agent_id`, `status`, `created_at`, `updated_at`) VALUES
(9, '1', 'Cleaning Service,Swimming Pool,Pet Friendly,Air Conditioning', 'Contemporary Apartment', 'contemporary apartment', 'PC001', 'rent', '481', '348', 'upload/property_thambnail/1797921600273658.jpg', 'Villa on Grand Avenue', '<p>Lorem ipsum dolor sit amet consectetur adipisicing sed do eiusmod tempor incididunt</p>\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing sed do eiusmod tempor incididunt</p>\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing sed do eiusmod tempor incididunt</p>', '4', '4', '5', '2', '4524', 'https://www.youtube.com/embed/Zuwc0PUASjY?si=xJ9cQU1luQHJudmB', 'Dhaka Mirpur', 'Dhaka', '2', '1542', NULL, 'Eius eaque in placea', 'Optio voluptas proi', NULL, '1', NULL, '1', '2024-05-02 00:34:13', '2024-05-17 02:34:01'),
(10, '1', 'Cleaning Service,Swimming Pool,Pet Friendly,Air Conditioning', 'Villa on Grand Avenue', 'villa on grand avenue', 'PC002', 'buy', '5000', '10000', 'upload/property_thambnail/1797921636360073.jpg', 'Villa on Grand Avenue', '<div>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.&nbsp;</p>\r\n</div>\r\n<div>&nbsp;</div>', '4', '4', '4', '4', '45', 'https://www.youtube.com/embed/Zuwc0PUASjY?si=xJ9cQU1luQHJudmB', 'Dhaka Mirpur', 'Dhaka', '1', '1542', NULL, '22.356852', '91.783180', '1', NULL, 2, '1', '2024-05-02 00:34:47', '2024-05-17 22:05:36'),
(12, '1', 'Cleaning Service,Swimming Pool,Pet Friendly,Air Conditioning', 'Luxury Villa With Pool', 'luxury villa with pool', 'PC003', 'buy', '5000', '10000', 'upload/property_thambnail/1797940361427404.jpg', 'Villa on Grand Avenue', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galle</p>', '4', '4', '2', '3', '12747', 'https://www.youtube.com/embed/Zuwc0PUASjY?si=xJ9cQU1luQHJudmB', 'USA', 'USA', '5', '21454', NULL, '22.356852', '91.783180', '1', NULL, 2, '1', '2024-05-02 05:32:25', '2024-05-17 09:50:41'),
(13, '1', 'Cleaning Service', 'Luxury Villa With Pool', 'luxury villa with pool', 'PC004', 'buy', '871', '141', 'upload/property_thambnail/1797940441498695.jpg', 'Villa on Grand Avenue', '<h4><a href=\"property-details.html\">Villa on Grand Avenue</a></h4>', '4', '4', '2', '3', '12747', '7455', 'USA', 'USA', '3', '21454', NULL, '45745', '452875', NULL, '1', 2, '1', '2024-05-02 05:33:41', '2024-05-07 23:19:53'),
(15, '2', 'Cleaning Service', 'Contemporary Apartment', 'contemporary apartment', 'PC006', 'rent', '867', '603', 'upload/property_thambnail/1797965089613582.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.&nbsp;</p>', '4', '4', '2', '2', '544', 'https://www.youtube.com/embed/Zuwc0PUASjY?si=xJ9cQU1luQHJudmB', 'Dhaka Mirpur', 'Dhaka', '4', '265', NULL, '22.356852', '91.783180', NULL, '1', 2, '1', '2024-05-02 12:05:27', '2024-05-07 23:15:06'),
(16, '2', 'Cleaning Service', 'Luxury Villa With Pool', 'luxury villa with pool', 'PC007', 'buy', '449', '834', 'upload/property_thambnail/1797965239335614.jpg', 'Lorem Ipsum is simply dummy', '<h4>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.&nbsp;</h4>', '4', '4', '2', '2', '5524', 'https://www.youtube.com/embed/Zuwc0PUASjY?si=xJ9cQU1luQHJudmB', 'Dhaka Mirpur', 'Dhaka', '1', '2543', NULL, '22.356852', '91.783180', NULL, NULL, 2, '1', '2024-05-02 12:07:50', '2024-05-07 23:19:17'),
(17, '2', 'Cleaning Service', 'New State', 'new state', 'PC008', 'rent', '449', '834', 'upload/property_thambnail/1798455146492989.jpg', 'labore dolore magna aliqua enim.', '<p>Lorem ipsum dolor sit amet consectetur adipisicing sed do eiusmod tempor incididunt</p>\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing sed do eiusmod tempor incididunt</p>\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing sed do eiusmod tempor incididunt</p>', '4', '2', '4', '5', '365', 'https://www.youtube.com/embed/Zuwc0PUASjY?si=xJ9cQU1luQHJudmB', 'Gulshan', 'Dhaka', '3', '1542', NULL, '22.356852', '91.783180', NULL, '1', 12, '1', '2024-05-07 21:54:42', '2024-05-07 23:13:40'),
(18, '3', 'Cleaning Service', 'The Citizen Apartment', 'the citizen apartment', 'PC009', 'buy', '5000', '10000', 'upload/property_thambnail/1799281152620940.jpg', 'Lorem ipsum dolor sit amet consectetur adipisicing sed do.', '<p>Lorem ipsum dolor sit amet consectetur adipisicing sed do eiusmod tempor incididunt<br>labore dolore magna aliqua enim.Lorem ipsum dolor sit amet consectetur adipisicing sed do eiusmod tempor incididunt<br>labore dolore magna aliqua enim.Lorem ipsum dolor sit amet consectetur adipisicing sed do eiusmod tempor incididunt<br>labore dolore magna aliqua enim.</p>', '4', '4', '2', '2', '4558', 'https://www.youtube.com/embed/Zuwc0PUASjY?si=xJ9cQU1luQHJudmB', 'Dhaka Mirpur', 'Dhaka', '5', '1542', NULL, '22.356852', '91.783180', NULL, '1', 2, '1', '2024-05-17 00:42:18', '2024-05-17 00:43:43'),
(19, '3', 'Cleaning Service', 'The Citizen Apartment', 'the citizen apartment', 'PC010', 'rent', '5000', '10000', 'upload/property_thambnail/1799281403171850.jpg', 'Villa on Grand Avenue', '<p>Lorem ipsum dolor sit amet consectetur adipisicing sed eiusm tempor incididunt labore dolore magna aliqua enim minim veniam quis nostrud exercitation laboris nisi ut aliquip ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur occaecat</p>\r\n<p>Lorem ipsum dolor sit amet&nbsp; pariatur occaecat.</p>', '4', '4', '2', '2', '4558', 'https://www.youtube.com/embed/Zuwc0PUASjY?si=xJ9cQU1luQHJudmB', 'Dhaka Mirpur', 'Dhaka', '5', '1542', NULL, '22.356852', '91.783180', NULL, '1', 2, '1', '2024-05-17 00:47:42', '2024-05-17 03:24:12'),
(20, '3', 'Cleaning Service', 'The Citizen Apartment', 'the citizen apartment', 'PC011', 'buy', '5000', '10000', 'upload/property_thambnail/1799281557661962.jpg', 'Lorem ipsum dolor sit amet consectetur adipisicing sed .', '<p>Lorem ipsum dolor sit amet consectetur adipisicing sed eiusm tempor incididunt labore dolore magna aliqua enim minim veniam quis nostrud exercitation laboris nisi ut aliquip ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur occaecat</p>\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing sed eiusm tempor incididunt labore dolore magna aliqua enim minim veniam quis nostrud exercitation laboris nisi ut aliquip ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur occaecat</p>', '4', '4', '2', '2', '4558', 'https://www.youtube.com/embed/Zuwc0PUASjY?si=xJ9cQU1luQHJudmB', 'USA', 'USA', '3', '1542', NULL, '22.356852', '91.783180', NULL, '1', 12, '1', '2024-05-17 00:50:09', NULL),
(21, '4', 'Cleaning Service', 'Communal land', 'communal land', 'PC012', 'rent', '5000', '10000', 'upload/property_thambnail/1799281946786113.jpg', 'Lorem ipsum dolor sit amet consectetur', '<p>Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.</p>', '4', '4', '2', '2', '4558', 'https://www.youtube.com/embed/Zuwc0PUASjY?si=xJ9cQU1luQHJudmB', 'USA', 'USA', '4', '1542', NULL, '22.356852', '91.783180', NULL, '1', 2, '1', '2024-05-17 00:56:20', '2024-05-17 03:22:20'),
(22, '4', 'Cleaning Service,Swimming Pool,Pet Friendly,Air Conditioning', 'The Citizen Apartment', 'the citizen apartment', 'PC013', 'rent', '5000', '10000', 'upload/property_thambnail/1799282139668163.jpg', 'Lorem ipsum dolor sit amet', '<p>Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.</p>', '4', '4', '2', '2', '404', 'https://www.youtube.com/embed/Zuwc0PUASjY?si=xJ9cQU1luQHJudmB', 'USA', 'USA', '2', '1542', NULL, '22.356852', '91.783180', '1', NULL, 2, '1', '2024-05-17 00:59:24', '2024-05-17 03:26:45'),
(23, '5', 'Cleaning Service,Swimming Pool,Pet Friendly,Air Conditioning', 'The Citizen Apartment', 'the citizen apartment', 'PC014', 'buy', '5000', '10000', 'upload/property_thambnail/1799282474683313.jpg', 'Lorem ipsum dolor sit amet', '<p>Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.Lorem ipsum dolor sit amet consectetur adipisicing sed.</p>', '4', '4', '1', '1', '404', 'https://www.youtube.com/embed/Zuwc0PUASjY?si=xJ9cQU1luQHJudmB', 'Chittagong', 'Chittagong', '2', '1542', NULL, '22.356852', '91.783180', NULL, '1', 12, '1', '2024-05-17 01:04:44', '2024-05-17 03:25:42');

-- --------------------------------------------------------

--
-- Table structure for table `property_messages`
--

CREATE TABLE `property_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `agent_id` varchar(255) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `msg_name` varchar(255) DEFAULT NULL,
  `msg_email` varchar(255) DEFAULT NULL,
  `msg_phone` varchar(255) DEFAULT NULL,
  `msg` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_messages`
--

INSERT INTO `property_messages` (`id`, `user_id`, `agent_id`, `property_id`, `msg_name`, `msg_email`, `msg_phone`, `msg`, `created_at`, `updated_at`) VALUES
(1, 3, '2', 12, 'User', 'user@gmail.com', '01556', 'I Need Your Phone Number', '2024-05-05 06:33:06', NULL),
(2, 3, NULL, 9, 'User', 'user@gmail.com', '01556', 'Plz call me as soon as', '2024-05-05 06:37:47', NULL),
(3, 10, '2', 12, 'Demo1', 'demo1@gmail.com', '+654 45', 'Plz Give me Your Number', '2024-05-05 09:59:27', NULL),
(4, 3, '2', NULL, 'User', 'user@gmail.com', '01556', 'Plz Give Me My Book', '2024-05-06 00:33:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_types`
--

CREATE TABLE `property_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `type_icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_types`
--

INSERT INTO `property_types` (`id`, `type_name`, `type_icon`, `created_at`, `updated_at`) VALUES
(1, 'Apartment', 'icon-1', NULL, NULL),
(2, 'Office', 'icon-2', NULL, NULL),
(3, 'Properties', 'icon-3', NULL, '2024-05-17 00:39:19'),
(4, 'Communal land', 'icon-4', NULL, '2024-05-17 00:51:16'),
(5, 'Residential', 'icon-5', NULL, '2024-05-17 00:51:58'),
(6, 'Building Code', 'icon-06', NULL, '2024-05-16 23:54:10'),
(7, 'Industrial', 'icon-7', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'SuperAdmin', 'web', '2024-05-14 08:53:14', '2024-05-14 08:53:14'),
(2, 'Manager', 'web', '2024-05-14 08:53:26', '2024-05-14 08:53:26'),
(3, 'Admin', 'web', '2024-05-14 08:53:34', '2024-05-14 08:53:34'),
(4, 'Sales', 'web', '2024-05-14 08:54:15', '2024-05-14 08:54:15');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(4, 1),
(4, 2),
(5, 1),
(7, 1),
(7, 2),
(7, 3),
(8, 1),
(8, 2),
(8, 3),
(9, 1),
(9, 3),
(10, 1),
(10, 3),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(31, 4),
(32, 1),
(32, 4),
(33, 1),
(33, 4),
(34, 1),
(34, 4);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `agent_id` varchar(255) DEFAULT NULL,
  `tour_date` varchar(255) DEFAULT NULL,
  `tour_time` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `user_id`, `property_id`, `agent_id`, `tour_date`, `tour_time`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 9, NULL, '05/01/2024', '7am', 'I want to visit Your Company', '1', '2024-05-11 09:10:06', NULL),
(2, 2, 12, '2', '05/01/2024', '10pm', 'Hello I\'m going To Dhaka Yesterday', '1', '2024-05-11 09:40:52', '2024-05-12 12:24:10'),
(3, 2, 9, NULL, '05/09/2024', '8pm', 'Hello I\'m going To Dhaka Yesterday', '1', '2024-05-12 09:33:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `support_phone` varchar(255) DEFAULT NULL,
  `company_address` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `logo`, `support_phone`, `company_address`, `email`, `facebook`, `twitter`, `copyright`, `created_at`, `updated_at`) VALUES
(1, 'upload/logo/1798953407124403.png', '+01826722535', 'Discover St, New York, NY 10012, Bangladesh', 'support@easylearningbd.com', 'https://www.youtube.com/watch?v=Hrd5GA6QaQw', 'https://www.twitter.com/', 'Realshed © 2024 All Right Reserved By DeveloperPutul', NULL, '2024-05-19 08:56:33');

-- --------------------------------------------------------

--
-- Table structure for table `smtp_settings`
--

CREATE TABLE `smtp_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mailer` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `port` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `encryption` varchar(255) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smtp_settings`
--

INSERT INTO `smtp_settings` (`id`, `mailer`, `host`, `port`, `username`, `password`, `encryption`, `from_address`, `created_at`, `updated_at`) VALUES
(1, 'smtp', 'sandbox.smtp.mailtrap.io', '1234', '988c9704f791e5', '46dad6d8da8939', 'tls', 'supporto@easylearningbd.com', NULL, '2024-05-13 00:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `state_name` varchar(255) NOT NULL,
  `state_img` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `state_name`, `state_img`, `created_at`, `updated_at`) VALUES
(1, 'MotiJheel', 'upload/state/1798452712045537.jpg', NULL, '2024-05-08 02:55:21'),
(2, 'Kawran Bazar', 'upload/state/1798472214926793.jpg', NULL, '2024-05-08 02:26:00'),
(3, 'Paltan', 'upload/state/1798451273046243.jpg', NULL, NULL),
(4, 'Banani', 'upload/state/1798451292628783.jpg', NULL, NULL),
(5, 'Gulshan', 'upload/state/1798451306584102.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `position`, `image`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Putul Tongchangya', 'CEO', 'upload/testimonial/1798550597323783.jpeg', 'Our goal each day is to ensure that our residents’ needs are not only met but exceeded. To make that happen we are committed to provid ing an environment in which residents can enjoy.', NULL, '2024-05-17 01:37:45'),
(2, 'Herry', 'Manager', 'upload/testimonial/1798549191169910.jpg', 'Our goal each day is to ensure that our residents’ needs are not only met but exceeded. To make that happen we are committed to provid ing an environment in which residents can enjoy.', NULL, NULL),
(3, 'Jack', 'ASM', 'upload/testimonial/1798549220422358.jpeg', 'Our goal each day is to ensure that our residents’ needs are not only met but exceeded. To make that happen we are committed to provid ing an environment in which residents can enjoy.', NULL, NULL),
(4, 'Tonny', 'DM', 'upload/testimonial/1798549256906617.jpeg', 'Our goal each day is to ensure that our residents’ needs are not only met but exceeded. To make that happen we are committed to provid ing an environment in which residents can enjoy.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` enum('admin','agent','user') NOT NULL DEFAULT 'user',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `credit` varchar(255) DEFAULT '0',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `photo`, `phone`, `address`, `role`, `status`, `credit`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin@gmail.com', NULL, '$2y$10$hvrRb59hw1wfwiXKDMDxseKpj2dsD6xyLbmQ9Ofhf36y5tfMivoJ2', '202404221743avatar-1.png', '01554', 'USA', 'admin', 'active', '0', NULL, NULL, '2024-05-15 08:37:55'),
(2, 'Agent', 'Agent', 'agent@gmail.com', NULL, '$2y$10$ni6/J6c30.tpj58W5M7dL.Mu89ikiBMGrlU5peKlsql/6G2./lzUK', '2024050603481600w-z2je8yhKAGE.webp', '662-686-3981', '4820 Rafe Lane Dhaka', 'agent', 'active', '17', NULL, NULL, '2024-05-05 21:48:28'),
(3, 'User', 'user', 'user@gmail.com', NULL, '$2y$10$OHMlNRtewWJgXEjaGQbmoOjNpKfwMSg.PW9DqORtNbR/UBs1hBKK6', '202405130801.ljjl.jpg', '01556', 'UK', 'user', 'active', '0', NULL, NULL, '2024-05-13 02:01:28'),
(5, 'Celestino Klocko', NULL, 'hailee83@example.net', '2024-04-20 23:42:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/0022bb?text=nihil', '463-331-4374', '34274 Hermann Hills Apt. 221\nRusselchester, NM 04434', 'user', 'active', '0', '9ArpYHk5ZP', '2024-04-20 23:42:36', '2024-04-20 23:42:36'),
(6, 'Miss Delia Mohr', NULL, 'bonnie.witting@example.com', '2024-04-20 23:42:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/007700?text=consequatur', '1-478-842-3891', '3528 Oberbrunner Causeway Apt. 685\nHeidenreichville, FL 31890-2038', 'agent', '', '0', 'ZrZfMOTdiR', '2024-04-20 23:42:36', '2024-05-04 22:14:11'),
(9, 'Demo', NULL, 'demo@gmail.com', NULL, '$2y$10$r3nGICInkCkOmkRvXnsl/uZJefc4P4LacBZS.1fc4SO.w3Zwd0VWW', NULL, NULL, NULL, 'user', 'active', '0', NULL, '2024-04-20 23:57:09', '2024-04-20 23:57:09'),
(10, 'Demo1', NULL, 'demo1@gmail.com', NULL, '$2y$10$rvprhK1oX2KF/0BH/lC3tO.DmXWl/ZbCcL1.NOdfIONh7bu40o7R6', NULL, NULL, NULL, 'user', 'active', '0', NULL, '2024-04-24 00:55:14', '2024-04-24 00:56:57'),
(12, 'Mazrar Group', NULL, 'mazrar@gmail.com', NULL, '$2y$10$lN4MrnGyw4UvicUaGYDhcu2fgunQbo1dQiVc4uIxyJxIXo4Uj7TS2', '202405060350optimized_large_thumb_stage (1).jpg', '01826722534', 'Dhaka Mirpur', 'agent', 'active', '0', NULL, NULL, '2024-05-05 21:50:04'),
(16, 'Putul', 'Putul', 'Putul@gmail.com', NULL, '$2y$10$Ze1mmtYSvyTXRlhP3fblFO3JJ1lOQiCfxHPswuxJBHx1s.bbUz.d6', NULL, '+01826722534', 'Chittagong, Oxygen', 'admin', 'active', '0', NULL, '2024-05-15 05:36:08', '2024-05-15 05:36:08'),
(43, 'demo', 'demo', 'demo01@gmail.com', NULL, '$2y$10$bx/CXTgSvEsFgS76KMayUef4gFMD8.0wfPs8CwdOTTwlRK0iSeROa', NULL, '+1 (295) 471-3529', 'Dhaka Mirpur', 'admin', 'active', '0', NULL, '2024-05-15 08:57:15', '2024-05-15 08:57:15');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `property_id`, `created_at`, `updated_at`) VALUES
(1, 1, 9, '2024-05-04 08:34:32', NULL),
(2, 1, 10, '2024-05-04 08:34:51', NULL),
(3, 1, 12, '2024-05-04 08:34:58', NULL),
(8, 3, 10, '2024-05-04 11:51:03', NULL),
(9, 3, 12, '2024-05-04 11:51:05', NULL),
(10, 12, 12, '2024-05-05 22:46:45', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compares`
--
ALTER TABLE `compares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `multi_images`
--
ALTER TABLE `multi_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_plans`
--
ALTER TABLE `package_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_messages`
--
ALTER TABLE `property_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_types`
--
ALTER TABLE `property_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smtp_settings`
--
ALTER TABLE `smtp_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `compares`
--
ALTER TABLE `compares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `multi_images`
--
ALTER TABLE `multi_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `package_plans`
--
ALTER TABLE `package_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `property_messages`
--
ALTER TABLE `property_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `property_types`
--
ALTER TABLE `property_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `smtp_settings`
--
ALTER TABLE `smtp_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
