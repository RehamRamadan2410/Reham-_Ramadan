-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220519.4c1c1fcc18
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2022 at 07:58 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nti_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `street` varchar(512) NOT NULL,
  `building` varchar(64) NOT NULL,
  `floor` varchar(20) NOT NULL,
  `flat` varchar(20) NOT NULL,
  `notes` varchar(512) DEFAULT '1',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(32) NOT NULL,
  `name_ar` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=> active\r\n0=> non active',
  `image` varchar(64) NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name_en`, `name_ar`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 'samsung', 'سامسونج', 1, 'sumsung.png', '2022-05-26 23:12:01', NULL),
(2, 'Dell', 'ديل', 1, 'dell.png', '2022-05-26 23:12:01', NULL),
(3, 'lenovo', 'لينوفو', 1, 'lenovo.png', '2022-05-26 23:12:01', NULL),
(4, 'apple', 'ابل', 1, 'apple.png', '2022-05-26 23:12:01', NULL),
(5, 'lg', 'lg', 1, 'lg.png', '2022-05-26 23:12:01', NULL),
(6, 'HP', 'hp', 1, 'HP.png', '2022-05-26 23:12:01', NULL),
(7, 'Asus', 'asus', 1, 'asus.png', '2022-05-26 23:12:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(32) NOT NULL,
  `name_ar` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=> active\r\n0=> not active',
  `image` varchar(64) NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_en`, `name_ar`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 'electronics', 'الكترونيات', 1, 'default.png', '2022-05-26 18:10:37', NULL),
(2, 'kitchen', 'مطبخ', 1, 'default.png', '2022-05-26 18:10:37', NULL),
(3, 'supermarket', 'سوبر ماركت', 1, 'default.png', '2022-05-26 18:11:11', NULL),
(4, 'fashion', 'ازياء', 1, 'default.png', '2022-05-26 18:11:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(20) NOT NULL,
  `name_ar` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1=>\r\n0=>not active',
  `longtitude` varchar(20) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `distance` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `complains_replies`
--

CREATE TABLE `complains_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `reply_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complains_replies`
--

INSERT INTO `complains_replies` (`id`, `message`, `user_id`, `reply_id`, `created_at`, `updated_at`) VALUES
(1, 'اشتريت منتج غلط', 0, NULL, '2022-05-20 21:47:56', NULL),
(2, 'تالبعغغعهخحك', 0, NULL, '2022-05-20 21:52:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number_ofusage_per_user` tinyint(1) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1=>active\r\n0=>not active',
  `discount` varchar(20) NOT NULL,
  `discount_type` varchar(32) NOT NULL,
  `max_discount_value` varchar(20) NOT NULL,
  `start_data_time` timestamp NULL DEFAULT NULL,
  `end_data_time` timestamp NULL DEFAULT NULL,
  `min_order_price` decimal(7,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `favs`
--

CREATE TABLE `favs` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(32) NOT NULL,
  `title_en` varchar(32) NOT NULL,
  `image` varchar(64) NOT NULL DEFAULT 'default.png',
  `discount` varchar(20) NOT NULL,
  `discount_type` varchar(32) NOT NULL,
  `start_data_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_data_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(32) NOT NULL,
  `total_price` decimal(7,2) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1=>active\r\n0=>not active',
  `payment_method` varchar(20) NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `address_id` bigint(20) UNSIGNED NOT NULL,
  `deliver_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(512) NOT NULL,
  `name_en` varchar(512) NOT NULL,
  `details_en` mediumtext NOT NULL,
  `details_ar` mediumtext NOT NULL,
  `price` decimal(7,2) UNSIGNED NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `code` varchar(20) NOT NULL COMMENT '1-.active\r\n',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1-> active\r\n0->non active',
  `image` varchar(64) NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name_ar`, `name_en`, `details_en`, `details_ar`, `price`, `quantity`, `code`, `status`, `image`, `subcategory_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'laptops', 'لابتوب', '\'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\\r\\n\\r\\n\',', ' \'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام \\\"هنا يوجد محتوى نصي، هنا يوجد محتوى نصي\\\" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال \\\"lorem ipsum\\\" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.', '10000.00', 6, '67788', 1, 'dell.jpg', 1, 1, '2022-05-26 23:22:10', NULL),
(2, 'sum-50', 'sum-50', '\'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '\'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام \\\"هنا يوجد محتوى نصي، هنا يوجد محتوى نصي\\\" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال \\\"lorem ipsum\\\" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها', '50000.00', 1, '673490', 0, 'a50.jpg', 3, 1, '2022-05-26 23:29:57', NULL),
(3, 'tv 55 inch', 'tv 55 inch', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n', 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام \"هنا يوجد محتوى نصي، هنا يوجد محتوى نصي\" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال \"lorem ipsum\" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.\r\n\r\n', '10000.00', 1, '55525', 1, 'tv55.jpg', 5, 1, '2022-05-26 23:13:16', NULL),
(4, 'MacBook PRo', 'MacBook PRo', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n', 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام \"هنا يوجد محتوى نصي، هنا يوجد محتوى نصي\" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال \"lorem ipsum\" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.\r\n\r\n', '20000.00', 5, '54724', 1, 'mac.jpg', 1, 4, '2022-05-26 23:30:40', NULL),
(5, 's21', 's21', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n', 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام \"هنا يوجد محتوى نصي، هنا يوجد محتوى نصي\" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال \"lorem ipsum\" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.\r\n\r\n', '15000.00', 10, '125213', 1, 's21.jpg', 3, 1, '2022-05-26 23:57:52', NULL),
(6, 'iphone 13', 'iphone 13', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n', 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام \"هنا يوجد محتوى نصي، هنا يوجد محتوى نصي\" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال \"lorem ipsum\" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.\r\n\r\n', '25000.00', 20, '12525', 1, 'iphone13.jpg', 3, 4, '2022-05-26 23:40:40', NULL),
(7, 'Reno 6', 'Reno 6', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n', 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام \"هنا يوجد محتوى نصي، هنا يوجد محتوى نصي\" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال \"lorem ipsum\" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.\r\n\r\n', '10000.00', 5, '4444', 1, 'reno.jpg', 3, 3, '0000-00-00 00:00:00', NULL),
(8, 'Chepsi', 'Chepsi', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n', 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام \"هنا يوجد محتوى نصي، هنا يوجد محتوى نصي\" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال \"lorem ipsum\" في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.\r\n\r\n', '10.00', 0, '4247', 1, 'chepsi.jpg', 4, NULL, '2022-05-27 02:07:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_offers`
--

CREATE TABLE `products_offers` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `offer_id` bigint(20) UNSIGNED NOT NULL,
  `price_after_discount` decimal(7,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products_orders`
--

CREATE TABLE `products_orders` (
  `price` decimal(7,2) NOT NULL,
  `quantity` tinyint(3) NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products_specs`
--

CREATE TABLE `products_specs` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `specs_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_specs`
--

INSERT INTO `products_specs` (`product_id`, `specs_id`, `value`) VALUES
(4, 1, 'china'),
(4, 2, 'black'),
(4, 5, '64gb'),
(4, 6, '0.4kg'),
(6, 1, 'egypt'),
(6, 2, 'blue'),
(6, 6, '0.3kg');

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_details`
-- (See below for the actual view)
--
CREATE TABLE `product_details` (
`id` bigint(20) unsigned
,`name_ar` varchar(512)
,`name_en` varchar(512)
,`details_en` mediumtext
,`details_ar` mediumtext
,`price` decimal(7,2) unsigned
,`quantity` tinyint(3) unsigned
,`code` varchar(20)
,`status` tinyint(1)
,`image` varchar(64)
,`subcategory_id` bigint(20) unsigned
,`brand_id` bigint(20) unsigned
,`created_at` timestamp
,`updated_at` timestamp
,`subcategories_name_en` varchar(32)
,`categories_name_en` varchar(32)
,`brands_name_en` varchar(32)
,`category_id` bigint(20) unsigned
,`review_count` bigint(21)
,`reviews_ avg` int(4)
);

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(512) NOT NULL,
  `name_ar` varchar(512) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1=>active\r\n0=>not active',
  `longtitude` varchar(20) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `distance` varchar(20) NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rate` tinyint(1) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL COMMENT 'Available rate from\r\n0:5',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`user_id`, `product_id`, `rate`, `comment`, `created_at`, `updated_at`) VALUES
(8, 1, 5, 'good', '2022-05-28 22:43:04', NULL),
(9, 5, 3, 'not bad', '2022-05-28 22:34:19', NULL),
(10, 1, 4, 'bad', '2022-05-28 22:36:26', NULL),
(10, 4, 4, 'good', '2022-05-28 22:44:59', NULL),
(10, 6, 5, 'very-good', '2022-05-28 22:31:56', NULL),
(12, 1, 1, 'good', '2022-05-28 22:34:19', NULL),
(12, 4, 2, 'bad', '2022-05-28 22:31:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `specs`
--

CREATE TABLE `specs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specs`
--

INSERT INTO `specs` (`id`, `name`) VALUES
(1, 'made_in'),
(2, 'color'),
(3, 'width'),
(4, 'ram'),
(5, 'storage'),
(6, 'weight');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(32) NOT NULL,
  `name_ar` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=> active\r\n0=> not active',
  `image` varchar(64) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name_en`, `name_ar`, `status`, `image`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'laptops', 'لابتوبات', 1, '', 1, '2022-05-26 18:57:28', NULL),
(2, 'cheese', 'جبن', 1, '', 3, '2022-05-26 18:57:28', NULL),
(3, 'mobiles', 'موبيلات', 1, '', 1, '2022-05-26 19:01:06', NULL),
(4, 'chepsi', 'شيبسي', 1, '', 3, '2022-05-26 19:02:04', NULL),
(5, 'TV', 'تليفزيونات', 1, '', 1, '2022-05-26 19:06:10', NULL),
(6, 'Make up', 'مكياج', 1, '', 4, '2022-05-26 19:06:10', NULL),
(7, 'desktop', 'كمبيوتر', 1, '', 1, '2022-05-26 19:07:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `email` varchar(320) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `code` int(5) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('m','f') NOT NULL COMMENT 'm=>male\r\nf=>female',
  `image` varchar(64) NOT NULL DEFAULT '`default.png`',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `code`, `birthdate`, `gender`, `image`, `email_verified_at`, `phone_verified_at`, `created_at`, `updated_at`) VALUES
(5, 'reham', 'ramadan', 'rehamramdan@gmail.com', '01234567844', '$2y$10$OvBdKpcYWjc9RTQvafC1ae42fre0auwRjme61cnmtv0jKktuvY4f.', 437038, NULL, 'f', '`default.png`', NULL, NULL, '2022-05-24 18:56:03', NULL),
(6, 'reham', 'ramadan', 'rehamradan@gmail.com', '01236667844', '$2y$10$l1vnAFlkoya845FM/jjLWe2jyQifu9SdJuMLH4k7cHWsr0Q3ZVABK', 541390, NULL, 'f', '`default.png`', NULL, NULL, '2022-05-24 18:59:23', NULL),
(7, 'reham', 'ramadan', 'rehmradan@gmail.com', '01236967844', '$2y$10$SVaVKWpd0AUP5NvnvrStUO5TZ99lc9cJe9EmFwDiUX9dSEGRlqwOC', 232377, NULL, 'f', '`default.png`', NULL, NULL, '2022-05-24 19:01:01', NULL),
(8, 'reham', 'ramdan', 'rehmradan23@gmail.com', '01236967845', '$2y$10$W638jv7GTs29r9OuteDqP.F012WeXwhNsekTGZ3qC8xBqt7P0fug6', 304386, NULL, 'f', '`default.png`', NULL, NULL, '2022-05-24 19:11:17', NULL),
(9, 'reham', 'ramadan', 'rehradan@gmail.com', '01236997844', '$2y$10$grb5GYGwUVDdEvj5WABouOiZaMSGhBkNlK.3R49pftWdF1qGBNFGy', 591310, NULL, 'f', '`default.png`', NULL, NULL, '2022-05-24 21:15:01', NULL),
(10, 'Eyad', 'Ahmed', 'ramadan51@gmail.com', '01252657803', '$2y$10$/15DKaLv0CQof31CyJtJHOVXe5KW0loOHL2R2S2pVLOjcWlOJDVA6', 268485, NULL, 'm', '`default.png`', NULL, NULL, '2022-05-24 21:57:21', NULL),
(11, 'reham', 'ramadan', 'reham.ramadan2410@gmail.com', '01285265803', '$2y$10$ozaTylI7Nh2ROFIfrzoOw.3Q9/Xlxke3PjZuUwKuBECq93vsuUTiu', 569908, NULL, 'f', '`default.png`', '2022-05-24 23:18:35', NULL, '2022-05-24 22:04:42', '2022-05-25 21:11:36'),
(12, 'rody', 'Ahmed', 'rodie51@gmail.com', '01285265805', '$2y$10$nrzTvOo.afNakZQyJMWpKeoIbSaHabiJBbf5hGGKpXmVqO0XpqPzO', 744455, NULL, 'f', '6291213763d80.jpeg', '2022-05-25 21:31:14', NULL, '2022-05-25 21:19:32', '2022-05-27 19:06:31');

-- --------------------------------------------------------

--
-- Structure for view `product_details`
--
DROP TABLE IF EXISTS `product_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_details`  AS SELECT `products`.`id` AS `id`, `products`.`name_ar` AS `name_ar`, `products`.`name_en` AS `name_en`, `products`.`details_en` AS `details_en`, `products`.`details_ar` AS `details_ar`, `products`.`price` AS `price`, `products`.`quantity` AS `quantity`, `products`.`code` AS `code`, `products`.`status` AS `status`, `products`.`image` AS `image`, `products`.`subcategory_id` AS `subcategory_id`, `products`.`brand_id` AS `brand_id`, `products`.`created_at` AS `created_at`, `products`.`updated_at` AS `updated_at`, `subcategories`.`name_en` AS `subcategories_name_en`, `categories`.`name_en` AS `categories_name_en`, `brands`.`name_en` AS `brands_name_en`, `categories`.`id` AS `category_id`, count(`reviews`.`product_id`) AS `review_count`, round(if(avg(`reviews`.`rate`) is null,0,`reviews`.`rate`),0) AS `reviews_ avg` FROM ((((`products` left join `brands` on(`brands`.`id` = `products`.`brand_id`)) left join `subcategories` on(`subcategories`.`id` = `products`.`subcategory_id`)) left join `categories` on(`categories`.`id` = `subcategories`.`category_id`)) left join `reviews` on(`reviews`.`product_id` = `products`.`id`)) GROUP BY `products`.`id` ORDER BY `products`.`name_en` ASC, `products`.`price` ASC  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `region_id` (`region_id`),
  ADD KEY `addresses_users` (`user_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `carts_products` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complains_replies`
--
ALTER TABLE `complains_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reply_id` (`reply_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `favs`
--
ALTER TABLE `favs`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `favs_products_fk` (`product_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `orders_coupons` (`coupon_id`),
  ADD KEY `orders_addresses` (`address_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `products_subcategories_fk` (`subcategory_id`),
  ADD KEY `products_brands_fk` (`brand_id`);

--
-- Indexes for table `products_offers`
--
ALTER TABLE `products_offers`
  ADD PRIMARY KEY (`product_id`,`offer_id`),
  ADD KEY `offer_id` (`offer_id`);

--
-- Indexes for table `products_orders`
--
ALTER TABLE `products_orders`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products_specs`
--
ALTER TABLE `products_specs`
  ADD PRIMARY KEY (`product_id`,`specs_id`),
  ADD KEY `specs_id` (`specs_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `city_id` (`city_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `reviews_products` (`product_id`);

--
-- Indexes for table `specs`
--
ALTER TABLE `specs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_categories_fk` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complains_replies`
--
ALTER TABLE `complains_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specs`
--
ALTER TABLE `specs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_regions` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`),
  ADD CONSTRAINT `addresses_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `carts_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `complains_replies`
--
ALTER TABLE `complains_replies`
  ADD CONSTRAINT `complains_replies_ibfk_1` FOREIGN KEY (`reply_id`) REFERENCES `complains_replies` (`id`),
  ADD CONSTRAINT `complains_replies_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `favs`
--
ALTER TABLE `favs`
  ADD CONSTRAINT `favs_products_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `favs_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_addresses` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `orders_coupons` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brands_fk` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_subcategories_fk` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`);

--
-- Constraints for table `products_offers`
--
ALTER TABLE `products_offers`
  ADD CONSTRAINT `products_offers_ibfk_1` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`),
  ADD CONSTRAINT `products_offers_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products_orders`
--
ALTER TABLE `products_orders`
  ADD CONSTRAINT `products_orders_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `products_orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products_specs`
--
ALTER TABLE `products_specs`
  ADD CONSTRAINT `products_specs_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `products_specs_ibfk_2` FOREIGN KEY (`specs_id`) REFERENCES `specs` (`id`);

--
-- Constraints for table `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `regions_cities` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `reviews_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_categories_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



