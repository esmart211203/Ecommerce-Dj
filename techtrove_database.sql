-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 10, 2024 lúc 04:31 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `techtrove_database`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add category', 1, 'add_category'),
(2, 'Can change category', 1, 'change_category'),
(3, 'Can delete category', 1, 'delete_category'),
(4, 'Can view category', 1, 'view_category'),
(5, 'Can add order', 2, 'add_order'),
(6, 'Can change order', 2, 'change_order'),
(7, 'Can delete order', 2, 'delete_order'),
(8, 'Can view order', 2, 'view_order'),
(9, 'Can add product', 3, 'add_product'),
(10, 'Can change product', 3, 'change_product'),
(11, 'Can delete product', 3, 'delete_product'),
(12, 'Can view product', 3, 'view_product'),
(13, 'Can add order item', 4, 'add_orderitem'),
(14, 'Can change order item', 4, 'change_orderitem'),
(15, 'Can delete order item', 4, 'delete_orderitem'),
(16, 'Can view order item', 4, 'view_orderitem'),
(17, 'Can add cart item', 5, 'add_cartitem'),
(18, 'Can change cart item', 5, 'change_cartitem'),
(19, 'Can delete cart item', 5, 'delete_cartitem'),
(20, 'Can view cart item', 5, 'view_cartitem'),
(21, 'Can add profile', 6, 'add_profile'),
(22, 'Can change profile', 6, 'change_profile'),
(23, 'Can delete profile', 6, 'delete_profile'),
(24, 'Can view profile', 6, 'view_profile'),
(25, 'Can add payment_vn pay', 7, 'add_payment_vnpay'),
(26, 'Can change payment_vn pay', 7, 'change_payment_vnpay'),
(27, 'Can delete payment_vn pay', 7, 'delete_payment_vnpay'),
(28, 'Can view payment_vn pay', 7, 'view_payment_vnpay'),
(29, 'Can add discount', 8, 'add_discount'),
(30, 'Can change discount', 8, 'change_discount'),
(31, 'Can delete discount', 8, 'delete_discount'),
(32, 'Can view discount', 8, 'view_discount'),
(33, 'Can add product images', 9, 'add_productimages'),
(34, 'Can change product images', 9, 'change_productimages'),
(35, 'Can delete product images', 9, 'delete_productimages'),
(36, 'Can view product images', 9, 'view_productimages'),
(37, 'Can add attribute', 10, 'add_attribute'),
(38, 'Can change attribute', 10, 'change_attribute'),
(39, 'Can delete attribute', 10, 'delete_attribute'),
(40, 'Can view attribute', 10, 'view_attribute'),
(41, 'Can add product attribute', 11, 'add_productattribute'),
(42, 'Can change product attribute', 11, 'change_productattribute'),
(43, 'Can delete product attribute', 11, 'delete_productattribute'),
(44, 'Can view product attribute', 11, 'view_productattribute'),
(45, 'Can add wishlist item', 12, 'add_wishlistitem'),
(46, 'Can change wishlist item', 12, 'change_wishlistitem'),
(47, 'Can delete wishlist item', 12, 'delete_wishlistitem'),
(48, 'Can view wishlist item', 12, 'view_wishlistitem'),
(49, 'Can add product rating', 13, 'add_productrating'),
(50, 'Can change product rating', 13, 'change_productrating'),
(51, 'Can delete product rating', 13, 'delete_productrating'),
(52, 'Can view product rating', 13, 'view_productrating'),
(53, 'Can add log entry', 14, 'add_logentry'),
(54, 'Can change log entry', 14, 'change_logentry'),
(55, 'Can delete log entry', 14, 'delete_logentry'),
(56, 'Can view log entry', 14, 'view_logentry'),
(57, 'Can add permission', 15, 'add_permission'),
(58, 'Can change permission', 15, 'change_permission'),
(59, 'Can delete permission', 15, 'delete_permission'),
(60, 'Can view permission', 15, 'view_permission'),
(61, 'Can add group', 16, 'add_group'),
(62, 'Can change group', 16, 'change_group'),
(63, 'Can delete group', 16, 'delete_group'),
(64, 'Can view group', 16, 'view_group'),
(65, 'Can add user', 17, 'add_user'),
(66, 'Can change user', 17, 'change_user'),
(67, 'Can delete user', 17, 'delete_user'),
(68, 'Can view user', 17, 'view_user'),
(69, 'Can add content type', 18, 'add_contenttype'),
(70, 'Can change content type', 18, 'change_contenttype'),
(71, 'Can delete content type', 18, 'delete_contenttype'),
(72, 'Can view content type', 18, 'view_contenttype'),
(73, 'Can add session', 19, 'add_session'),
(74, 'Can change session', 19, 'change_session'),
(75, 'Can delete session', 19, 'delete_session'),
(76, 'Can view session', 19, 'view_session'),
(77, 'Can add classification', 20, 'add_classification'),
(78, 'Can change classification', 20, 'change_classification'),
(79, 'Can delete classification', 20, 'delete_classification'),
(80, 'Can view classification', 20, 'view_classification');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$VU3zxodlMrFWdd6yEEaxeN$TuLLyt2yHAw1dHP1p7vipnD4MXJlFI4TSnvhEmxTeV8=', '2024-10-09 14:00:18.355423', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2024-06-09 06:17:34.986938'),
(2, 'pbkdf2_sha256$720000$rz6pHpPC5FKCBIsyNqfaI8$NDBkdGynaH1W+hH5KVcAV8DavqVaRdA58U6f7bJ6Fbk=', '2024-06-24 11:56:06.007643', 0, 'vu', '', '', 'vu@gmail.com', 0, 1, '2024-06-24 11:50:11.318039'),
(3, 'pbkdf2_sha256$720000$SY83DlSEizuQkoKFwuc6jQ$gsb2QrGlA4gJ4tBIKLIy5otEijtGTyWSkywpNK+VjBs=', '2024-10-09 15:22:23.498686', 0, 'demo', '', '', 'demouse21r@gmail.com', 0, 1, '2024-10-09 15:22:22.614058');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(14, 'admin', 'logentry'),
(16, 'auth', 'group'),
(15, 'auth', 'permission'),
(17, 'auth', 'user'),
(18, 'contenttypes', 'contenttype'),
(19, 'sessions', 'session'),
(10, 'wsite', 'attribute'),
(5, 'wsite', 'cartitem'),
(1, 'wsite', 'category'),
(20, 'wsite', 'classification'),
(8, 'wsite', 'discount'),
(2, 'wsite', 'order'),
(4, 'wsite', 'orderitem'),
(7, 'wsite', 'payment_vnpay'),
(3, 'wsite', 'product'),
(11, 'wsite', 'productattribute'),
(9, 'wsite', 'productimages'),
(13, 'wsite', 'productrating'),
(6, 'wsite', 'profile'),
(12, 'wsite', 'wishlistitem');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-06-09 06:17:03.929406'),
(2, 'auth', '0001_initial', '2024-06-09 06:17:04.375490'),
(3, 'admin', '0001_initial', '2024-06-09 06:17:04.471016'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-06-09 06:17:04.475950'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-09 06:17:04.478938'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-06-09 06:17:04.528547'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-06-09 06:17:04.573951'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-06-09 06:17:04.621980'),
(9, 'auth', '0004_alter_user_username_opts', '2024-06-09 06:17:04.629033'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-06-09 06:17:04.669425'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-06-09 06:17:04.671541'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-06-09 06:17:04.681792'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-06-09 06:17:04.692901'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-06-09 06:17:04.700879'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-06-09 06:17:04.749437'),
(16, 'auth', '0011_update_proxy_permissions', '2024-06-09 06:17:04.760251'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-06-09 06:17:04.782186'),
(18, 'sessions', '0001_initial', '2024-06-09 06:17:04.809831'),
(19, 'wsite', '0001_initial', '2024-06-09 06:17:05.090580'),
(20, 'wsite', '0002_category_description', '2024-06-09 06:17:05.099548'),
(21, 'wsite', '0003_alter_product_price', '2024-06-09 06:17:05.137234'),
(22, 'wsite', '0004_profile', '2024-06-09 06:17:05.225162'),
(23, 'wsite', '0005_profile_full_name', '2024-06-09 06:17:05.236452'),
(24, 'wsite', '0006_order_note', '2024-06-09 06:17:05.259818'),
(25, 'wsite', '0007_order_more_info', '2024-06-09 06:17:05.275769'),
(26, 'wsite', '0008_payment_vnpay', '2024-06-09 06:17:05.284797'),
(27, 'wsite', '0009_discount', '2024-06-09 06:17:05.292767'),
(28, 'wsite', '0010_order_payment_method', '2024-06-09 06:17:05.304948'),
(29, 'wsite', '0011_remove_product_image_product_quantity_in_stock_and_more', '2024-06-09 06:17:05.419637'),
(30, 'wsite', '0012_attribute_cartitem_updated_at_category_updated_at_and_more', '2024-06-09 06:17:05.595209'),
(31, 'wsite', '0013_attribute_category', '2024-06-09 06:17:05.647409'),
(32, 'wsite', '0014_favorite', '2024-06-09 06:17:05.752381'),
(33, 'wsite', '0015_rename_favorite_wishlistitem', '2024-06-09 06:17:05.773317'),
(34, 'wsite', '0016_productrating', '2024-06-09 06:17:05.877018'),
(35, 'wsite', '0017_productrating_created_at', '2024-06-09 06:17:05.889983'),
(36, 'wsite', '0018_productrating_description', '2024-06-09 06:17:05.901934'),
(37, 'wsite', '0019_rename_description_productrating_comment', '2024-06-09 06:17:05.912761'),
(38, 'wsite', '0020_classification', '2024-10-09 14:42:15.809068');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('44kx837ehlnb2bdqm6773su1sgj96s44', '.eJxVjMsOwiAQRf-FtSFMeQgu3fcbyDBDpWogKe3K-O_apAvd3nPOfYmI21ri1vMSZxYXAeL0uyWkR6474DvWW5PU6rrMSe6KPGiXY-P8vB7u30HBXr61tuAQyBtjLKjJ86AgaMtmIKazQ5OcYg1IISvPIYPnZJ3y5NRk0QTx_gC9STc3:1sGBsg:xfRz2s2Mw1fUD3dlMItVjajmvd-XZC2QenY8uwNEtEQ', '2024-06-23 06:18:18.642209'),
('4fctnrili7jmgs6okufeb59fdfnggwqp', '.eJxVjMsOwiAQRf-FtSFMeQgu3fcbyDBDpWogKe3K-O_apAvd3nPOfYmI21ri1vMSZxYXAeL0uyWkR6474DvWW5PU6rrMSe6KPGiXY-P8vB7u30HBXr61tuAQyBtjLKjJ86AgaMtmIKazQ5OcYg1IISvPIYPnZJ3y5NRk0QTx_gC9STc3:1sLiVr:4IA67h1Dq-UAb9sZ48SuzMZyeAQCBYs7KfKXxRZpVXc', '2024-07-08 12:09:35.300632'),
('bj5jsox85apd85njztnca6wadiietokt', '.eJxVjDEOwyAQBP9CHSHDAcYp0_sN6I7DwUmEJWNXUf4eLLlIim1mZ_ctAu5bDntNa5hZXAWIyy8jjM9UjoIfWO6LjEvZ1pnkocizrXJcOL1up_t3kLHmto4KVA8IoIyzE0XWTg9gYWCrmTxM6Byjp558il3D2qQWr0zsNFktPl_OVjdl:1syYW7:2MWp24o0JQFsAa5iNrH8EOhKv-GdhOJF7ZrfOSZSOPo', '2024-10-23 15:22:23.501026'),
('qzys0kayg00qxhfgkcw1tfy83isqz6a2', '.eJxVjMsOwiAQRf-FtSFMeQgu3fcbyDBDpWogKe3K-O_apAvd3nPOfYmI21ri1vMSZxYXAeL0uyWkR6474DvWW5PU6rrMSe6KPGiXY-P8vB7u30HBXr61tuAQyBtjLKjJ86AgaMtmIKazQ5OcYg1IISvPIYPnZJ3y5NRk0QTx_gC9STc3:1syXEg:9LaCOjEAuo0Wat4R0vofGbd3Czdi6IfBKhFHNdAx6NY', '2024-10-23 14:00:18.357161'),
('vkotujxgr8o1mlmsamq89rwn55ns37bq', '.eJxVjMsOwiAQRf-FtSFMeQgu3fcbyDBDpWogKe3K-O_apAvd3nPOfYmI21ri1vMSZxYXAeL0uyWkR6474DvWW5PU6rrMSe6KPGiXY-P8vB7u30HBXr61tuAQyBtjLKjJ86AgaMtmIKazQ5OcYg1IISvPIYPnZJ3y5NRk0QTx_gC9STc3:1sGaFo:lmTld2BgE0l5_OuWE5UGxuSS2sHQ75o72MlOLIDlJmM', '2024-06-24 08:19:48.717460'),
('w4hp8kwvnwz01a5b7yjbuui1fgex0l6n', '.eJxVjMsOwiAQRf-FtSFMeQgu3fcbyDBDpWogKe3K-O_apAvd3nPOfYmI21ri1vMSZxYXAeL0uyWkR6474DvWW5PU6rrMSe6KPGiXY-P8vB7u30HBXr61tuAQyBtjLKjJ86AgaMtmIKazQ5OcYg1IISvPIYPnZJ3y5NRk0QTx_gC9STc3:1sLkPq:xp59FIUfREpuLwFhxJagnAkBTG7YsWFIFF_CXhujdcE', '2024-07-08 14:11:30.345195');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wsite_attribute`
--

CREATE TABLE `wsite_attribute` (
  `id` bigint(20) NOT NULL,
  `att_name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `wsite_attribute`
--

INSERT INTO `wsite_attribute` (`id`, `att_name`, `created_at`, `updated_at`, `category_id`) VALUES
(9, 'CPU', '2024-06-09 14:19:54.813134', '2024-06-09 14:19:54.813134', 3),
(10, 'RAM', '2024-06-09 14:20:01.345447', '2024-06-09 14:20:01.345447', 3),
(11, 'Ổ cứng', '2024-06-09 14:20:09.558218', '2024-06-09 14:20:09.558218', 3),
(12, 'Màn hình', '2024-06-09 14:20:15.862724', '2024-06-09 14:20:15.862724', 3),
(13, 'Cổng giao tiếp', '2024-06-09 14:20:22.252258', '2024-06-09 14:20:22.252258', 3),
(14, 'Bàn phím', '2024-06-09 14:20:29.249226', '2024-06-09 14:20:29.249226', 3),
(15, 'Trọng lượng', '2024-06-09 14:20:41.689681', '2024-06-09 14:20:41.689681', 3),
(16, 'Thương hiệu', '2024-06-10 09:57:53.083444', '2024-06-10 09:57:53.083444', 4),
(17, 'Bảo hành', '2024-06-10 09:58:03.178204', '2024-06-10 09:58:03.178204', 4),
(18, 'Màu sắc', '2024-06-10 09:58:10.699843', '2024-06-10 09:58:28.595466', 4),
(19, 'Dây', '2024-06-10 09:58:21.697266', '2024-06-10 09:58:21.697266', 4),
(20, 'Keycap', '2024-06-10 10:52:58.094450', '2024-06-10 10:53:04.032493', 5),
(21, 'Tình Trạng', '2024-06-10 10:53:11.850479', '2024-06-10 10:53:11.850479', 5),
(22, 'Kích thước', '2024-06-10 10:53:18.974608', '2024-06-10 10:53:18.974608', 5),
(23, 'Trọng lượng', '2024-06-10 10:53:27.551062', '2024-06-10 10:53:27.551062', 5),
(24, 'Pin', '2024-06-10 10:53:34.238456', '2024-06-10 10:53:34.238456', 5),
(25, 'Led', '2024-06-10 11:09:34.613647', '2024-06-10 11:09:34.613647', 6),
(26, 'Cảm biến', '2024-06-10 11:09:47.909646', '2024-06-10 11:09:47.909646', 6),
(27, 'Trọng lượng', '2024-06-10 11:09:56.702109', '2024-06-10 11:09:56.702109', 6),
(28, 'Kích thước', '2024-06-10 11:10:08.285145', '2024-06-10 11:10:08.286141', 6),
(29, 'Hãng sản xuất', '2024-06-10 11:21:48.572233', '2024-06-10 11:24:14.591595', 7),
(30, 'Chất liệu', '2024-06-10 11:21:57.316787', '2024-06-10 11:22:12.200474', 7),
(31, 'Góc nằm max', '2024-06-10 11:22:06.807275', '2024-06-10 11:22:06.807275', 7),
(32, 'Chất liệu khung', '2024-06-10 11:22:19.329698', '2024-06-10 11:22:19.329698', 7),
(33, 'Model', '2024-06-10 11:22:36.192029', '2024-06-10 11:24:06.086036', 7),
(34, 'Thương hiệu', '2024-06-11 15:44:51.505483', '2024-06-11 15:44:51.505483', 8),
(35, 'Bảo hành', '2024-06-11 15:44:59.733115', '2024-06-11 15:44:59.733115', 8),
(36, 'Kích thước', '2024-06-11 15:45:22.105381', '2024-06-11 15:45:22.105381', 8),
(37, 'Tản nhiệt', '2024-06-11 15:45:32.685650', '2024-06-11 15:45:32.685650', 8),
(38, 'Bộ nhớ', '2024-06-11 15:45:40.656249', '2024-06-11 15:45:40.656249', 8),
(39, 'Màu', '2024-06-11 15:55:32.083957', '2024-06-11 15:55:32.083957', 9),
(40, 'Dung lượng lưu trữ', '2024-06-11 15:55:41.022354', '2024-06-11 15:55:41.022354', 9),
(41, 'Kích thước và trọng lượng	', '2024-06-11 15:55:52.436929', '2024-06-11 15:55:52.436929', 9),
(42, 'Chip', '2024-06-11 15:56:05.620571', '2024-06-11 15:56:05.620571', 9),
(43, 'Thẻ SIM	', '2024-06-11 15:56:20.571111', '2024-06-11 15:56:20.572112', 9),
(44, 'Công suất sạc	', '2024-06-11 16:16:25.498259', '2024-06-11 16:16:25.498259', 10),
(45, 'Cổng sạc ra	', '2024-06-11 16:16:35.945503', '2024-06-11 16:16:35.945503', 10),
(46, 'Số cổng	', '2024-06-11 16:16:45.794342', '2024-06-11 16:16:45.794342', 10),
(47, 'Tính năng khác	', '2024-06-11 16:16:54.388216', '2024-06-11 16:16:54.389217', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wsite_cartitem`
--

CREATE TABLE `wsite_cartitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wsite_category`
--

CREATE TABLE `wsite_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `wsite_category`
--

INSERT INTO `wsite_category` (`id`, `name`, `image`, `featured`, `created_at`, `description`, `updated_at`) VALUES
(3, 'LapTop', 'category/laptop_IcjDvRw.webp', 1, '2024-06-09 14:19:27.865396', 'Danh Mục LapTop', '2024-06-09 14:19:27.865396'),
(4, 'Tai Nge', 'category/hs35_v2_artboard01_aa_80b3106cd5654c1e89d113d784994e3c_grande_KZSjaAk.webp', 1, '2024-06-10 09:57:25.882984', 'Danh Mục Tai Nge', '2024-06-10 09:57:35.066481'),
(5, 'Bàn Phím', 'category/ek98_pro_proto__5__a05b4255ca454f1884f13ebafdd06d8e_grande_Bgrtj2I.webp', 0, '2024-06-10 10:52:33.865518', 'Danh Mục Bàn Phím', '2024-06-10 10:52:33.865518'),
(6, 'Chuột', 'category/g502x-plus-gallery-2-white_69229c9ba5534ad5bfae7d827037a28f_365394a31b6342e494_0sELlb1.webp', 1, '2024-06-10 11:09:04.389674', 'Danh mục Chuột', '2024-06-10 11:09:04.389674'),
(7, 'Ghế Gaming', 'category/522_egc234r___5_27d195f6a51b4c7a83e01929d90f27cb_grande_vzre2AG.webp', 1, '2024-06-10 11:21:36.624423', 'Danh mục ghế', '2024-06-10 11:21:36.624423'),
(8, 'VGA - Card', 'category/unnamed_1.webp', 1, '2024-06-10 16:30:30.247322', 'Danh mục VGA - Card.', '2024-06-10 16:30:30.247322'),
(9, 'Điện thoại', 'category/unnamed_Ii41cDa.webp', 1, '2024-06-10 16:31:49.932354', 'Danh mục Điện thoại.', '2024-06-10 16:33:16.785281'),
(10, 'Phụ Kiện', 'category/hub_3in1_70336_cf84025cf1884ea4ac30c92c7506540d_grande_zgTb5ic.webp', 1, '2024-06-10 16:32:48.152046', 'Danh mục Phụ Kiện.', '2024-06-10 16:33:13.132518');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wsite_classification`
--

CREATE TABLE `wsite_classification` (
  `id` bigint(20) NOT NULL,
  `classify` varchar(50) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `product_rating_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `wsite_classification`
--

INSERT INTO `wsite_classification` (`id`, `classify`, `created_at`, `product_rating_id`) VALUES
(7, '0', '2024-10-10 14:21:10.373223', 23),
(8, 'positive', '2024-10-10 14:26:50.635529', 24);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wsite_discount`
--

CREATE TABLE `wsite_discount` (
  `id` bigint(20) NOT NULL,
  `code` varchar(200) DEFAULT NULL,
  `discount_value` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `wsite_discount`
--

INSERT INTO `wsite_discount` (`id`, `code`, `discount_value`, `quantity`, `created_at`, `updated_at`) VALUES
(2, 'VN50', 50, 6, '2024-06-10 09:34:08.523702', '2024-06-24 13:02:33.800867'),
(4, 'VN20', 20, 100, '2024-06-24 10:48:34.838309', '2024-06-24 10:59:38.095867'),
(5, 'VN15', 15, 98, '2024-06-24 10:48:48.304414', '2024-06-24 12:12:49.691610'),
(6, 'VN30', 30, 97, '2024-06-24 10:49:14.254356', '2024-10-09 15:01:43.315746');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wsite_order`
--

CREATE TABLE `wsite_order` (
  `id` bigint(20) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `more_info` varchar(255) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `wsite_order`
--

INSERT INTO `wsite_order` (`id`, `total_amount`, `status`, `full_name`, `address`, `phone`, `created_at`, `user_id`, `note`, `more_info`, `payment_method`, `updated_at`) VALUES
(39, 1290.00, 'Completed', 'Đỗ Xuân Trọng', 'Go Vap, haha, hahah', '0989748659', '2024-10-09 15:05:37.164479', 1, 'hahah', '', 'direct', '2024-10-09 15:05:51.751576'),
(40, 1450.00, 'Completed', 'aaa', 'Go Vap, dsadsa, sadsa', '0989748659', '2024-10-09 15:09:41.323843', 1, 'ádsad', '', 'direct', '2024-10-09 15:09:46.257262'),
(41, 4790.00, 'Completed', 'Đỗ Xuân Trọng', 'Go Vap, dsad, ádsa', '0989748659', '2024-10-09 15:10:17.078622', 1, 'sadsad', '', 'direct', '2024-10-09 15:10:24.190147'),
(42, 2350.00, 'Completed', 'Đỗ Xuân Trọng', 'Go Vap, sad, ádasd', '0989748659', '2024-10-09 15:15:56.913395', 1, '', '', 'direct', '2024-10-09 15:16:01.080955'),
(43, 320.00, 'Completed', 'Đỗ Xuân Trọng', 'Go Vap, ád, dsadsad', '0989748659', '2024-10-09 15:22:35.734999', 3, 'ádsad', '', 'direct', '2024-10-09 15:22:42.161617'),
(44, 34890.00, 'Completed', 'Đỗ Xuân Trọng', 'Go Vap, dsadsad, ádsadsa', '0989748659', '2024-10-09 15:36:18.847704', 1, '', '', 'direct', '2024-10-09 15:36:23.425548'),
(45, 62070.00, 'Completed', 'Đỗ Xuân Trọng', 'Go Vap, ádsa, sadsad', '0989748659', '2024-10-09 15:38:24.871826', 1, '', '', 'direct', '2024-10-09 15:38:29.609580'),
(46, 10050.00, 'Completed', 'Đỗ Xuân Trọng1', 'Go Vap, ádas, sdasd', '0989748659', '2024-10-10 10:24:42.115858', 1, '', '', 'direct', '2024-10-10 10:24:50.024376'),
(47, 335435.00, 'Completed', 'Đỗ Xuân Trọng', 'Go Vap, ád, đá', '0989748659', '2024-10-10 14:18:21.172045', 1, 'ádas', '', 'direct', '2024-10-10 14:18:33.708081');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wsite_orderitem`
--

CREATE TABLE `wsite_orderitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `price` decimal(10,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `wsite_orderitem`
--

INSERT INTO `wsite_orderitem` (`id`, `quantity`, `price`, `created_at`, `order_id`, `product_id`, `updated_at`) VALUES
(70, 1, 1290.00, '2024-10-09 15:05:37.165600', 39, 24, '2024-10-09 15:05:37.166162'),
(71, 1, 1450.00, '2024-10-09 15:09:41.325544', 40, 14, '2024-10-09 15:09:41.327515'),
(72, 1, 4790.00, '2024-10-09 15:10:17.080363', 41, 18, '2024-10-09 15:10:17.082321'),
(73, 1, 750.00, '2024-10-09 15:15:56.914059', 42, 48, '2024-10-09 15:15:56.915765'),
(74, 1, 1190.00, '2024-10-09 15:15:56.918414', 42, 49, '2024-10-09 15:15:56.918974'),
(75, 1, 90.00, '2024-10-09 15:15:56.920140', 42, 50, '2024-10-09 15:15:56.920645'),
(76, 1, 320.00, '2024-10-09 15:15:56.921299', 42, 51, '2024-10-09 15:15:56.921803'),
(77, 1, 320.00, '2024-10-09 15:22:35.736729', 43, 51, '2024-10-09 15:22:35.738541'),
(78, 1, 34890.00, '2024-10-09 15:36:18.850086', 44, 42, '2024-10-09 15:36:18.852176'),
(79, 1, 16090.00, '2024-10-09 15:38:24.873347', 45, 43, '2024-10-09 15:38:24.876149'),
(80, 1, 26990.00, '2024-10-09 15:38:24.878450', 45, 44, '2024-10-09 15:38:24.879631'),
(81, 1, 18990.00, '2024-10-09 15:38:24.883794', 45, 45, '2024-10-09 15:38:24.884451'),
(82, 1, 1290.00, '2024-10-10 10:24:42.116172', 46, 21, '2024-10-10 10:24:42.119000'),
(83, 1, 1690.00, '2024-10-10 10:24:42.124745', 46, 22, '2024-10-10 10:24:42.124745'),
(84, 1, 4290.00, '2024-10-10 10:24:42.134204', 46, 23, '2024-10-10 10:24:42.134204'),
(85, 1, 1290.00, '2024-10-10 10:24:42.138720', 46, 24, '2024-10-10 10:24:42.139253'),
(86, 1, 1490.00, '2024-10-10 10:24:42.140778', 46, 26, '2024-10-10 10:24:42.140778'),
(87, 1, 19000.00, '2024-10-10 14:18:21.172045', 47, 8, '2024-10-10 14:18:21.179871'),
(88, 1, 25000.00, '2024-10-10 14:18:21.179871', 47, 9, '2024-10-10 14:18:21.179871'),
(89, 3, 18000.00, '2024-10-10 14:18:21.188546', 47, 10, '2024-10-10 14:18:21.188546'),
(90, 1, 63000.00, '2024-10-10 14:18:21.196662', 47, 11, '2024-10-10 14:18:21.196662'),
(91, 1, 63000.00, '2024-10-10 14:18:21.196662', 47, 12, '2024-10-10 14:18:21.196662'),
(92, 1, 990.00, '2024-10-10 14:18:21.204656', 47, 13, '2024-10-10 14:18:21.205264'),
(93, 1, 1450.00, '2024-10-10 14:18:21.205264', 47, 14, '2024-10-10 14:18:21.205264'),
(94, 1, 1450.00, '2024-10-10 14:18:21.212506', 47, 15, '2024-10-10 14:18:21.212506'),
(95, 1, 950.00, '2024-10-10 14:18:21.212506', 47, 16, '2024-10-10 14:18:21.212506'),
(96, 1, 28990.00, '2024-10-10 14:18:21.212506', 47, 19, '2024-10-10 14:18:21.220510'),
(97, 1, 4790.00, '2024-10-10 14:18:21.220510', 47, 18, '2024-10-10 14:18:21.220510'),
(98, 1, 3795.00, '2024-10-10 14:18:21.220510', 47, 17, '2024-10-10 14:18:21.220510'),
(99, 1, 48590.00, '2024-10-10 14:18:21.228865', 47, 20, '2024-10-10 14:18:21.229233'),
(100, 1, 1290.00, '2024-10-10 14:18:21.229233', 47, 21, '2024-10-10 14:18:21.229233'),
(101, 1, 1690.00, '2024-10-10 14:18:21.229233', 47, 22, '2024-10-10 14:18:21.229233'),
(102, 1, 1490.00, '2024-10-10 14:18:21.237335', 47, 26, '2024-10-10 14:18:21.237335'),
(103, 1, 1290.00, '2024-10-10 14:18:21.237335', 47, 24, '2024-10-10 14:18:21.237335'),
(104, 1, 4290.00, '2024-10-10 14:18:21.237335', 47, 23, '2024-10-10 14:18:21.237335'),
(105, 1, 3290.00, '2024-10-10 14:18:21.245392', 47, 27, '2024-10-10 14:18:21.245392'),
(106, 1, 550.00, '2024-10-10 14:18:21.245392', 47, 28, '2024-10-10 14:18:21.245392'),
(107, 1, 3290.00, '2024-10-10 14:18:21.252989', 47, 29, '2024-10-10 14:18:21.253217'),
(108, 1, 1550.00, '2024-10-10 14:18:21.253217', 47, 32, '2024-10-10 14:18:21.253217'),
(109, 1, 950.00, '2024-10-10 14:18:21.253217', 47, 31, '2024-10-10 14:18:21.253217'),
(110, 1, 750.00, '2024-10-10 14:18:21.261228', 47, 30, '2024-10-10 14:18:21.262741');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wsite_payment_vnpay`
--

CREATE TABLE `wsite_payment_vnpay` (
  `id` bigint(20) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `order_desc` varchar(200) DEFAULT NULL,
  `vnp_TransactionNo` varchar(200) DEFAULT NULL,
  `vnp_ResponseCode` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `wsite_payment_vnpay`
--

INSERT INTO `wsite_payment_vnpay` (`id`, `order_id`, `amount`, `order_desc`, `vnp_TransactionNo`, `vnp_ResponseCode`) VALUES
(1, 2147483647, 96000000, 'Thanh toan don hang thoi gian: 2024-06-24 18:51:04', '14476172', '00'),
(2, 2147483647, 960000000, 'Thanh toan don hang thoi gian: 2024-06-24 18:52:38', '14476173', '24'),
(3, 2147483647, 630000, 'Thanh toan don hang thoi gian: 2024-06-24 18:54:33', '14476177', '00'),
(4, 2147483647, 10000, 'Thanh toan don hang thoi gian: 2024-06-24 18:56:29', '14476182', '00'),
(5, 2147483647, 10000, 'Thanh toan don hang thoi gian: 2024-06-24 19:12:50', '14476202', '00'),
(6, 2147483647, 10000, 'Thanh toan don hang thoi gian: 2024-06-24 19:43:38', '14476241', '00'),
(7, 2147483647, 10000, 'Thanh toan don hang thoi gian: 2024-06-24 20:02:35', '14476262', '00'),
(8, 2147483647, 10000, 'Thanh toan don hang thoi gian: 2024-06-24 20:14:34', '14476275', '00'),
(9, 2147483647, 10000, 'Thanh toan don hang thoi gian: 2024-06-24 20:16:30', '14476278', '00'),
(10, 2147483647, 10000, 'Thanh toan don hang thoi gian: 2024-06-24 20:19:06', '14476282', '00'),
(11, 2147483647, 10000, 'Thanh toan don hang thoi gian: 2024-06-24 20:19:06', '14476282', '00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wsite_product`
--

CREATE TABLE `wsite_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `price` double NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `wsite_product`
--

INSERT INTO `wsite_product` (`id`, `name`, `description`, `price`, `featured`, `created_at`, `category_id`, `quantity_in_stock`, `updated_at`) VALUES
(8, 'Laptop ASUS Vivobook 14 OLED A1405ZA KM264W', 'Thông tin sản phẩm', 19000, 1, '2024-06-09 14:22:12.264535', 3, 145, '2024-10-10 14:18:21.179871'),
(9, 'Laptop ASUS Zenbook 14 OLED UX3405MA PP152W', 'Thông tin sản phẩm', 25000, 1, '2024-06-09 14:31:55.259552', 3, 271, '2024-10-10 14:18:21.188546'),
(10, 'Laptop ASUS Zenbook 14 OLED UM3402YA KM405W', 'Thông tin sản phẩm', 18000, 1, '2024-06-09 14:33:55.931843', 3, 2, '2024-10-10 14:18:21.188546'),
(11, 'Laptop ASUS Zenbook Duo OLED UX8406MA PZ142W', 'Thông tin sản phẩm', 63000, 1, '2024-06-09 14:35:15.206819', 3, 25, '2024-10-10 14:18:21.196662'),
(12, 'Laptop ASUS ProArt Studiobook Pro 16 OLED W7600Z3A L2048W', 'Thông tin sản phẩm', 63000, 1, '2024-06-09 14:37:05.917158', 3, 10, '2024-10-10 14:18:21.196662'),
(13, 'Tai nghe Corsair HS35 V2 Carbon OD 10651CD', 'Thông Tin Sản Phẩm', 990, 1, '2024-06-10 10:00:00.385164', 4, 98, '2024-10-10 14:18:21.205264'),
(14, 'Tai nghe Không dây Logitech Zone 300 Hồng', 'Thông tin sản phẩm', 1450, 1, '2024-06-10 10:01:31.945496', 4, 26, '2024-10-10 14:18:21.205264'),
(15, 'Tai nghe Không dây Logitech Zone 300 Trắng', 'Thông tin sản phẩm', 1450, 1, '2024-06-10 10:04:46.112076', 4, 29, '2024-10-10 14:18:21.212506'),
(16, 'Tai nghe E-Dra EH494W White 16TC9201', 'Thông tin sản phẩm', 950, 1, '2024-06-10 10:39:27.910541', 4, 29, '2024-10-10 14:18:21.212506'),
(17, 'Tai nghe Razer Hammerhead True Wireless HyperSpeed (Playstation)', 'Thông tin sản phẩm', 3795, 1, '2024-06-10 10:40:48.980191', 4, 9, '2024-10-10 14:18:21.220510'),
(18, 'Tai nghe Steelseries Arctis Nova 7 Dragon Edition', 'Thông tin sản phẩm', 4790, 1, '2024-06-10 10:43:27.088388', 4, 18, '2024-10-10 14:18:21.220510'),
(19, 'Laptop ASUS Vivobook S 16 OLED S5606MA MX051W', 'Thông tin sản phẩm', 28990, 1, '2024-06-10 10:45:46.724390', 3, 13, '2024-10-10 14:18:21.220510'),
(20, 'Macbook Pro 14 M2 Pro 10CPU 16GPU 16GB 512GB Silver - MPHH3SA/A', 'Thông tin sản phẩm', 48590, 1, '2024-06-10 10:47:51.977366', 3, 8, '2024-10-10 14:18:21.229233'),
(21, 'Bàn phím DareU Không dây EK98 Pro RGB Trắng Dream Switch', 'Thông tin sản phẩm', 1290, 1, '2024-06-10 10:54:23.727615', 5, 28, '2024-10-10 14:18:21.229233'),
(22, 'Bàn phím cơ AKKO 3108 RF Dragon Ball Z Goku Akko V3 ', 'Thông tin sản phẩm', 1690, 1, '2024-06-10 10:55:33.527276', 5, 28, '2024-10-10 14:18:21.229233'),
(23, 'Bàn phím Logitech G Pro X 60 Light Speed Black', 'Thông tin sản phẩm', 4290, 1, '2024-06-10 10:58:13.333172', 5, 28, '2024-10-10 14:18:21.245392'),
(24, 'Bàn phím Logitech không dây Wave Keys Ergonomic Trắng', 'Thông tin sản phẩm', 1290, 1, '2024-06-10 11:00:17.922838', 5, 27, '2024-10-10 14:18:21.237335'),
(26, 'Bàn phím cơ AKKO 3108 RF World Tour Tokyo Akko V3 Cream Yellow switch', 'Thông tin sản phẩm', 1490, 1, '2024-06-10 11:03:20.327617', 5, 28, '2024-10-10 14:18:21.237335'),
(27, 'Chuột Logitech G502 X Plus LightSpeed White', 'Thông tin sản phẩm', 3290, 1, '2024-06-10 11:10:53.454491', 6, 29, '2024-10-10 14:18:21.245392'),
(28, 'Chuột Logitech POP with Emoji Button Blast Yellow', 'Thông tin sản phẩm', 550, 1, '2024-06-10 11:12:00.467914', 6, 29, '2024-10-10 14:18:21.245392'),
(29, 'Chuột Logitech G Pro X Superlight 2 Magenta', 'Thông tin sản phẩm', 3290, 1, '2024-06-10 11:13:36.308155', 6, 29, '2024-10-10 14:18:21.253217'),
(30, 'Chuột Logitech G304 Wireless White', 'Thông tin sản phẩm', 750, 1, '2024-06-10 11:15:01.465164', 6, 29, '2024-10-10 14:18:21.263373'),
(31, 'Chuột Logitech G502 Hero Gaming', 'Thông tin sản phẩm', 950, 1, '2024-06-10 11:17:44.303504', 6, 29, '2024-10-10 14:18:21.253217'),
(32, 'Chuột Logitech MX Anywhere 3S Rose', 'Thông tin sản phẩm', 1550, 1, '2024-06-10 11:19:22.641520', 6, 29, '2024-10-10 14:18:21.253217'),
(33, 'Ghế Gaming E-Dra Dignity EGC234 Red', 'Thông tin sản phẩm', 1690, 1, '2024-06-10 11:23:21.720817', 7, 30, '2024-06-10 11:23:21.720817'),
(34, 'Ghế Cougar Ranger Pro Sofa Gaming', 'Thông tin sản phẩm', 7890, 1, '2024-06-10 11:27:22.265213', 7, 30, '2024-06-10 11:27:22.265213'),
(35, 'Ghế Gaming E-Dra Dignity EGC234 Black', 'Thông tin sản phẩm', 1690, 1, '2024-06-10 11:29:43.001351', 7, 30, '2024-06-10 11:29:43.001351'),
(36, 'Ghế Cougar NxSys Aero', 'Thông tin sản phẩm', 10490, 1, '2024-06-10 11:31:18.254707', 7, 30, '2024-06-10 11:31:18.254707'),
(37, 'Card màn hình ASUS Dual GeForce RTX 3050 8GB GDDR6 (90YV0GH7-M0NA00)', 'Thông tin sản phẩm', 6049, 1, '2024-06-11 15:46:13.330625', 8, 30, '2024-06-11 15:46:13.330625'),
(38, 'Card màn hình GIGABYTE GeForce GT 1030 2GB GDDR5 OC (GV-N1030OC-2GI)', 'Thông tin sản phẩm', 2420, 1, '2024-06-11 15:48:16.079604', 8, 30, '2024-06-11 15:48:16.079604'),
(39, 'Card màn hình MSI GeForce RTX 4070 Ti SUPRIM X 12GB', 'Thông tin sản phẩm', 27490, 1, '2024-06-11 15:50:32.003731', 8, 30, '2024-06-11 15:50:32.003731'),
(40, 'Card màn hình ASUS GeForce RTX 4080 SUPER 16GB GDDR6X Noctua OC Edition (RTX4080S-O16G-NOCTUA)', 'Thông tin sản phẩm', 37990, 1, '2024-06-11 15:51:59.673926', 8, 30, '2024-06-11 15:51:59.673926'),
(41, 'Card màn hình ASUS Dual Radeon RX 7600 V2 OC Edition 8GB GDDR6 (DUAL-RX7600-O8G-V2)', 'Thông tin sản phẩm', 7690, 1, '2024-06-11 15:53:48.833396', 8, 15, '2024-06-11 15:53:48.833396'),
(42, 'iPhone 15 Pro Max 256GB - Chính hãng VN/A', 'Thông tin sản phẩm', 34890, 1, '2024-06-11 15:58:02.851484', 9, 9, '2024-10-09 15:36:18.854847'),
(43, 'iPhone 14 128GB - Chính hãng VN/A', 'Thông tin sản phẩm', 16090, 1, '2024-06-11 15:59:38.363256', 9, 29, '2024-10-09 15:38:24.876757'),
(44, 'Samsung Galaxy S23 Ultra 12GB 512GB', 'Thông tin sản phẩm', 26990, 1, '2024-06-11 16:03:33.278137', 9, 29, '2024-10-09 15:38:24.882217'),
(45, 'Samsung Galaxy Z Flip5 8GB 256GB', 'Thông tin sản phẩm', 18990, 1, '2024-06-11 16:05:42.008058', 9, 49, '2024-10-09 15:38:24.885652'),
(46, 'Điện thoại Xiaomi Redmi Note 13 Pro 8GB/128GB', 'Thông tin sản phẩm', 6590, 1, '2024-06-11 16:12:30.869230', 9, 50, '2024-06-11 16:12:30.869230'),
(47, 'Điện thoại Masstel Fami 50 4G ', 'Thông tin sản phẩm', 600, 1, '2024-06-11 16:14:36.037339', 9, 100, '2024-06-11 16:14:36.037339'),
(48, 'Sạc nhanh Ugreen Robot CD361 35314 cổng USB-C và USB-A GaN 65W (Tím)', 'Thông tin sản phẩm', 750, 1, '2024-06-11 16:17:27.966363', 10, 59, '2024-10-09 15:15:56.917408'),
(49, 'Cổng chuyển đổi USB C Ugreen 10 in 1 CM498 15601', 'Thông tin sản phẩm', 1190, 1, '2024-06-11 16:18:29.378552', 10, 29, '2024-10-09 15:15:56.919562'),
(50, 'Cáp Ugreen Type-C to Type-C 60W 1M US264 60518 0 Xem đánh giá', 'Thông tin sản phẩm', 90, 1, '2024-06-11 16:19:57.908474', 10, 99, '2024-10-09 15:15:56.920721'),
(51, 'Phụ kiện UGreen Mini DP to DVI converter cable 1.5M White (MD102 -10443)', 'Thông tin sản phẩm', 320, 1, '2024-06-11 16:20:53.453758', 10, 28, '2024-10-09 15:22:35.739792'),
(53, 'Laptop Dell Vostro 3530 V5I5267W1 Gray', 'Thông tin sản phẩm', 14990, 1, '2024-06-24 15:06:15.541822', 3, 12, '2024-06-24 15:06:15.541822');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wsite_productattribute`
--

CREATE TABLE `wsite_productattribute` (
  `id` bigint(20) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `attribute_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `wsite_productattribute`
--

INSERT INTO `wsite_productattribute` (`id`, `value`, `created_at`, `updated_at`, `attribute_id`, `product_id`) VALUES
(9, '	Intel® Core™ i5-12500H Processor 2.5 GHz (18M Cache, up to 4.5 GHz, 4P+8E cores)', '2024-06-09 14:22:56.219758', '2024-06-09 14:22:56.219758', 9, 8),
(10, '16GB (8GB Onboard + 8GB Sodimm) DDR4 3200MHz ', '2024-06-09 14:22:56.220643', '2024-06-09 14:22:56.220643', 10, 8),
(11, '	512GB M.2 NVMe™ PCIe® 3.0 SSD (1 slot, support M.2 2280 PCIe 3.0x4)', '2024-06-09 14:22:56.221646', '2024-06-09 14:22:56.221646', 11, 8),
(12, '14\" 2.8K (2880 x 1800) OLED 16:10, 90Hz 0.2ms, 600nits, 100% DCI-P3, Glossy display, Screen-to-body ratio: 86%, PANTONE Validated, VESA CERTIFIED Display HDR True Black 600', '2024-06-09 14:22:56.223119', '2024-06-09 14:22:56.223119', 12, 8),
(13, '1x USB 3.2 Gen 1 Type-C support power delivery 2x USB 3.2 Gen 1 Type-A 1x USB 2.0 Type-A 1x HDMI 1.4 1x 3.5mm Combo Audio Jack 1x DC-in', '2024-06-09 14:22:56.223923', '2024-06-09 14:22:56.223923', 13, 8),
(14, 'Chiclet Keyboard', '2024-06-09 14:22:56.224806', '2024-06-09 14:22:56.224806', 14, 8),
(15, '	1.6 kg', '2024-06-09 14:22:56.225469', '2024-06-09 14:22:56.225469', 15, 8),
(16, 'Intel® Core™ Ultra 7 Processor 155H 1.4 GHz (24MB Cache, up to 4.8 GHz, 16 cores, 22 Threads); Intel® AI Boost NPU', '2024-06-09 14:32:41.354046', '2024-06-09 14:32:41.354046', 9, 9),
(17, '32GB LPDDR5X on board Dual-channel (Không nâng cấp)', '2024-06-09 14:32:41.355047', '2024-06-09 14:32:41.355047', 10, 9),
(18, '1TB M.2 NVMe™ PCIe® 4.0 SSD', '2024-06-09 14:32:41.356048', '2024-06-09 14:32:41.356048', 11, 9),
(19, '14.0-inch 3K (2880 x 1800) OLED 16:10, LED Backlit, 0.2ms, 120Hz, 400nits, 600nits HDR peak brightness, 100% DCI-P3, Glossy display, Tỷ lệ màn hình trên thân máy 87%', '2024-06-09 14:32:41.357967', '2024-06-09 14:32:41.357967', 12, 9),
(20, '1x USB 3.2 Gen 1 Type-A 2x Thunderbolt™ 4 supports display / power delivery 1x HDMI 2.1 TMDS 1x 3.5mm Combo Audio Jack', '2024-06-09 14:32:41.358830', '2024-06-09 14:32:41.358830', 13, 9),
(21, 'Support NumberPad Backlit Chiclet Keyboard', '2024-06-09 14:32:41.359225', '2024-06-09 14:32:41.359225', 14, 9),
(22, '1.20 kg', '2024-06-09 14:32:41.360231', '2024-06-09 14:32:41.361230', 15, 9),
(23, 'AMD Ryzen™ 5 7530U Mobile Processor 2.0GHz (6-core/12-thread, 16MB cache, up to 4.5 GHz max boost)', '2024-06-09 14:34:24.677141', '2024-06-09 14:34:24.677141', 9, 10),
(24, '16GB LPDDR4X on board (Không nâng cấp)', '2024-06-09 14:34:24.678141', '2024-06-09 14:34:24.678141', 10, 10),
(25, '512GB M.2 NVMe™ PCIe® 3.0 SSD', '2024-06-09 14:34:24.679135', '2024-06-09 14:34:24.679135', 11, 10),
(26, '14-inch 2.8K (2880 x 1800) OLED 16:10 aspect ratio, 90Hz refresh rate, 600nits peak brightness, 100% DCI-P3 color gamut, VESA CERTIFIED Display HDR True Black 600, 1.07 billion colors, Glossy display, Screen-to-body ratio: 90％', '2024-06-09 14:34:24.681138', '2024-06-09 14:34:24.681138', 12, 10),
(27, '1x USB 3.2 Gen 2 Type-A 2x USB 3.2 Gen 2 Type-C support display / power delivery 1x HDMI 2.1 TMDS 1x 3.5mm Combo Audio Jack Micro SD card reader', '2024-06-09 14:34:24.682750', '2024-06-09 14:34:24.682750', 13, 10),
(28, '	Backlit Chiclet Keyboard', '2024-06-09 14:34:24.683761', '2024-06-09 14:34:24.683761', 14, 10),
(29, '1.39 kg', '2024-06-09 14:34:24.683761', '2024-06-09 14:34:24.683761', 15, 10),
(30, 'Intel® Core™ Ultra 9 Processor 185H 2.3 GHz (24MB Cache, up to 5.1 GHz, 16 cores, 22 Threads); Intel® AI Boost NPU', '2024-06-09 14:35:48.361627', '2024-06-09 14:35:48.361627', 9, 11),
(31, '32GB LPDDR5X Onboard (Không nâng cấp)', '2024-06-09 14:35:48.362620', '2024-06-09 14:35:48.362620', 10, 11),
(32, '1TB M.2 NVMe™ PCIe® 4.0 SSD (Không nâng cấp)', '2024-06-09 14:35:48.364624', '2024-06-09 14:35:48.364624', 11, 11),
(33, '2x 14.0\" 3K (2880 x 1800) OLED 16:10 , 0.2ms response time, 120Hz, 400nits, 500nits HDR peak brightness, 100% DCI-P3, VESA CERTIFIED Display HDR True Black 500, 1.07 billion colors, PANTONE Validated, Glossy display, giảm 70% ánh sáng xanh, Touch screen, ', '2024-06-09 14:35:48.365993', '2024-06-09 14:35:48.365993', 12, 11),
(34, '	1x USB 3.2 Thế hệ 1 Loại A 2x Thunderbolt™ 4 hỗ trợ màn hình / power delivery 1x HDMI 2.1 TMDS 1x Giắc Âm thanh Kết hợp 3,5 mm', '2024-06-09 14:35:48.367198', '2024-06-09 14:35:48.367198', 13, 11),
(35, 'Bàn phím Mềm, Hành trình phím 1,4mm, Chuột cảm ứng chính xác', '2024-06-09 14:35:48.368520', '2024-06-09 14:35:48.368520', 14, 11),
(36, '	1.65 kg (Bàn phím: 0.3kg)', '2024-06-09 14:35:48.369277', '2024-06-09 14:35:48.369277', 15, 11),
(37, 'Intel Core i9-12900H 2.5GHz up to 5.0GHz 24MB', '2024-06-09 14:37:44.381624', '2024-06-09 14:37:44.381624', 9, 12),
(38, '32GB (32GB x 1) DDR5 4800MHz (2x SO-DIMM socket, up to 64GB SDRAM)', '2024-06-09 14:37:44.382625', '2024-06-09 14:37:44.382625', 10, 12),
(39, '1TB M.2 NVMe™ PCIe® 4.0 Performance SSD (2 slots M.2 2280 PCIe 4.0x4)', '2024-06-09 14:37:44.383624', '2024-06-09 14:37:44.383624', 11, 12),
(40, '16” 4K (3840 x 2400) OLED 16:10, 0.2ms response time, 550nits, 100% DCI-P3, PANTONE Validated, Glossy display, 70% less harmful blue light', '2024-06-09 14:37:44.384624', '2024-06-09 14:37:44.384624', 12, 12),
(41, '2x Thunderbolt™ 4 supports display / power delivery 2x USB 3.2 Gen 2 Type-A 1x HDMI 2.1 1x 3.5mm Combo Audio Jack 1x RJ45 Gigabit Ethernet 1x DC-in FingerPrint', '2024-06-09 14:37:44.385625', '2024-06-09 14:37:44.385625', 13, 12),
(42, 'Backlit Chiclet Keyboard with Num-key', '2024-06-09 14:37:44.386255', '2024-06-09 14:37:44.386255', 14, 12),
(43, '	2.4 kg', '2024-06-09 14:37:44.386979', '2024-06-09 14:37:44.386979', 15, 12),
(44, 'Corsair', '2024-06-10 10:00:18.555388', '2024-06-10 10:00:18.555388', 16, 13),
(45, '24 Tháng', '2024-06-10 10:00:18.557388', '2024-06-10 10:00:18.557388', 17, 13),
(46, 'Đen', '2024-06-10 10:00:18.558389', '2024-06-10 10:00:18.558389', 18, 13),
(47, '	Dài 1,8m', '2024-06-10 10:00:18.560393', '2024-06-10 10:00:18.560393', 19, 13),
(48, 'Logitech Zone', '2024-06-10 10:02:11.460705', '2024-06-10 10:02:11.460705', 16, 14),
(49, '12 Tháng', '2024-06-10 10:02:11.461706', '2024-06-10 10:02:11.461706', 17, 14),
(50, 'Hồng', '2024-06-10 10:02:11.463133', '2024-06-10 10:02:11.463133', 18, 14),
(51, 'Phiên bản Tai nghe Bluetooth: 5.3 Khoảng cách hoạt động: lên tới 30 m 4Đường ngắm của trường mở. Phạm vi không dây có thể thay đổi tùy theo môi trường vận hành và thiết lập máy tính.', '2024-06-10 10:02:11.464577', '2024-06-10 10:02:11.464577', 19, 14),
(52, 'Logitech Zone ', '2024-06-10 10:05:10.905551', '2024-06-10 10:05:10.905551', 16, 15),
(53, '12 Tháng', '2024-06-10 10:05:10.906552', '2024-06-10 10:05:10.906552', 17, 15),
(54, 'Trắng', '2024-06-10 10:05:10.907561', '2024-06-10 10:05:10.907561', 18, 15),
(55, 'Phiên bản Tai nghe Bluetooth: 5.3 Khoảng cách hoạt động: lên tới 30 m 4Đường ngắm của trường mở. Phạm vi không dây có thể thay đổi tùy theo môi trường vận hành và thiết lập máy tính.', '2024-06-10 10:05:10.909552', '2024-06-10 10:05:10.909552', 19, 15),
(56, 'E-Dra', '2024-06-10 10:39:54.963011', '2024-06-10 10:39:54.963011', 16, 16),
(57, '12 Tháng', '2024-06-10 10:39:54.965010', '2024-06-10 10:39:54.965010', 17, 16),
(58, 'Trắng', '2024-06-10 10:39:54.966010', '2024-06-10 10:39:54.966010', 18, 16),
(59, '	 2.4Ghz / Bluetooth 5.0 / Có dây Sạc pin qua cổng Type-C trên tai nghe', '2024-06-10 10:39:54.967011', '2024-06-10 10:39:54.967011', 19, 16),
(60, ' Razer', '2024-06-10 10:41:27.274181', '2024-06-10 10:41:27.274181', 16, 17),
(61, '24 Tháng', '2024-06-10 10:41:27.275174', '2024-06-10 10:41:27.275174', 17, 17),
(62, 'Trắng,Đen', '2024-06-10 10:41:27.276175', '2024-06-10 10:41:27.276175', 18, 17),
(63, '	Hộp sạc Cáp sạc USB-C (chiều dài 0.5m) 6 cặp mút tai bằng silicon (SmoothComfort + SecureSeal S/M/L) 1 cặp mút cao cấp Comply (M)', '2024-06-10 10:41:27.278175', '2024-06-10 10:41:27.278175', 19, 17),
(64, 'Steelseries ', '2024-06-10 10:44:08.791262', '2024-06-10 10:44:08.791262', 16, 18),
(65, '12 Tháng', '2024-06-10 10:44:08.792269', '2024-06-10 10:44:08.792269', 17, 18),
(66, 'Đen, Đỏ', '2024-06-10 10:44:08.793269', '2024-06-10 10:44:08.793269', 18, 18),
(67, 'ClearCast Gen 2 Khử tiếng ồn 2 chiều', '2024-06-10 10:44:08.794263', '2024-06-10 10:44:08.794263', 19, 18),
(68, 'Intel® Core™ Ultra 7 Processor 155H 1.4 GHz (24MB Cache, up to 4.8 GHz, 16 cores, 22 Threads); Intel® AI Boost NPU', '2024-06-10 10:46:12.701474', '2024-06-10 10:46:12.701474', 9, 19),
(69, '16GB LPDDR5X Onboard 7467Mhz', '2024-06-10 10:46:12.703477', '2024-06-10 10:46:12.703477', 10, 19),
(70, '512GB M.2 NVMe™ PCIe® 4.0 SSD', '2024-06-10 10:46:12.705477', '2024-06-10 10:46:12.705477', 11, 19),
(71, '16\" 3.2K (3200 x 2000) OLED 16:10 aspect ratio, 120Hz refresh rate, 600nits HDR peak brightness, 100% DCI-P3 color gamut, Gamut mapping, Contrast ratio 1,000,000:1, VESA CERTIFIED Display HDR True Black 600, 1.07 billion colors, Glossy display, 70% less h', '2024-06-10 10:46:12.707476', '2024-06-10 10:46:12.707476', 12, 19),
(72, '2x Thunderbolt™ 4 supports display / power delivery 2x USB 3.2 Gen 1 Type-A 1x HDMI 2.1 TMDS 1x 3.5mm Combo Audio Jack Micro SD card reader Micro SD card reader', '2024-06-10 10:46:12.708476', '2024-06-10 10:46:12.708476', 13, 19),
(73, 'Backlit Chiclet Keyboard 1-Zone RGB without Num-key With Copilot key', '2024-06-10 10:46:12.709476', '2024-06-10 10:46:12.709476', 14, 19),
(74, '1.5 kg', '2024-06-10 10:46:12.710476', '2024-06-10 10:46:12.710476', 15, 19),
(75, 'M2 PRO 10CPU 16GPU', '2024-06-10 10:48:20.566514', '2024-06-10 10:48:20.566514', 9, 20),
(76, '16GB', '2024-06-10 10:48:20.568512', '2024-06-10 10:48:20.568512', 10, 20),
(77, 'SSD 512GB', '2024-06-10 10:48:20.569512', '2024-06-10 10:48:20.569512', 11, 20),
(78, '14-inch Liquid Retina XDR display', '2024-06-10 10:48:20.570511', '2024-06-10 10:48:20.570511', 12, 20),
(79, 'MagSafe 3, 3x Thunderbolt 4, HDMI, SDXC Card, Jack 3.5mm', '2024-06-10 10:48:20.571513', '2024-06-10 10:48:20.571513', 13, 20),
(80, 'Magic Keyboard & Touch ID', '2024-06-10 10:48:20.572515', '2024-06-10 10:48:20.572515', 14, 20),
(81, '1.60 kg', '2024-06-10 10:48:20.574513', '2024-06-10 10:48:20.575514', 15, 20),
(82, 'Cherry profile; PBT Double-Shot', '2024-06-10 10:54:40.528814', '2024-06-10 10:54:40.528814', 20, 21),
(83, 'Mới 100% - Fullbox', '2024-06-10 10:54:40.529820', '2024-06-10 10:54:40.529820', 21, 21),
(84, '392 x 150 x 40mm', '2024-06-10 10:54:40.531813', '2024-06-10 10:54:40.531813', 22, 21),
(85, '925g', '2024-06-10 10:54:40.531813', '2024-06-10 10:54:40.531813', 23, 21),
(86, '4000 mAh', '2024-06-10 10:54:40.532821', '2024-06-10 10:54:40.532821', 24, 21),
(87, 'PBT Dye-Subbed, OEM profile', '2024-06-10 10:56:04.847963', '2024-06-10 10:56:04.847963', 20, 22),
(88, 'Like new 99%', '2024-06-10 10:56:04.848962', '2024-06-10 10:56:04.848962', 21, 22),
(89, '440 x 140 x 41mm', '2024-06-10 10:56:04.849962', '2024-06-10 10:56:04.849962', 22, 22),
(90, '~ 1.2 kg', '2024-06-10 10:56:04.851964', '2024-06-10 10:56:04.851964', 23, 22),
(91, '100%', '2024-06-10 10:56:04.852964', '2024-06-10 10:56:04.852964', 24, 22),
(92, 'Cherry profile; PBT Double-Shot', '2024-06-10 10:59:10.523880', '2024-06-10 10:59:10.524890', 20, 23),
(93, 'Mới 100% - Fullbox', '2024-06-10 10:59:10.525889', '2024-06-10 10:59:10.525889', 21, 23),
(94, 'Chiều cao: 34 mm  Chiều rộng: 352 mm  Chiều dày: 150 mm', '2024-06-10 10:59:10.527883', '2024-06-10 10:59:10.527883', 22, 23),
(95, '1.25kg', '2024-06-10 10:59:10.529886', '2024-06-10 10:59:10.529886', 23, 23),
(96, '100%', '2024-06-10 10:59:10.532884', '2024-06-10 10:59:10.532884', 24, 23),
(97, 'Fullsize', '2024-06-10 11:00:55.185302', '2024-06-10 11:00:55.185302', 20, 24),
(98, 'Mới 100% - Fullbox', '2024-06-10 11:00:55.186294', '2024-06-10 11:00:55.186294', 21, 24),
(99, '392 x 150 x 40mm', '2024-06-10 11:00:55.187300', '2024-06-10 11:00:55.187300', 22, 24),
(100, '750 g', '2024-06-10 11:00:55.188295', '2024-06-10 11:00:55.188295', 23, 24),
(101, '2 x AAA (đi kèm)', '2024-06-10 11:00:55.189302', '2024-06-10 11:00:55.189302', 24, 24),
(107, 'Akko Switch V3 ( Cream Yellow / Cream Blue )', '2024-06-10 11:03:39.354235', '2024-06-10 11:03:39.354235', 20, 26),
(108, 'Mới 100% - Fullbox', '2024-06-10 11:03:39.356236', '2024-06-10 11:03:39.356236', 21, 26),
(109, '440 x 140 x 41mm', '2024-06-10 11:03:39.357236', '2024-06-10 11:03:39.357236', 22, 26),
(110, '~ 1.2 kg', '2024-06-10 11:03:39.358236', '2024-06-10 11:03:39.358236', 23, 26),
(111, '4000 mAh', '2024-06-10 11:03:39.359236', '2024-06-10 11:03:39.359236', 24, 26),
(112, 'Chiếu sáng RGB 8 vùng', '2024-06-10 11:11:11.310365', '2024-06-10 11:11:11.310365', 25, 27),
(113, 'HERO 25K', '2024-06-10 11:11:11.311364', '2024-06-10 11:11:11.311364', 26, 27),
(114, '106 g', '2024-06-10 11:11:11.313369', '2024-06-10 11:11:11.313369', 27, 27),
(115, '131,4 mm x 41,1 mm x 79,2 mm', '2024-06-10 11:11:11.315366', '2024-06-10 11:11:11.315366', 28, 27),
(116, 'RGB', '2024-06-10 11:12:31.388122', '2024-06-10 11:12:31.389122', 25, 28),
(117, 'Theo dõi quang học có độ chính xác cao của Logitech', '2024-06-10 11:12:31.389720', '2024-06-10 11:12:31.389720', 26, 28),
(118, '82 gram', '2024-06-10 11:12:31.390706', '2024-06-10 11:12:31.390706', 27, 28),
(119, '104,8 x 59,4 x 35,2 mm', '2024-06-10 11:12:31.392710', '2024-06-10 11:12:31.392710', 28, 28),
(120, 'RGB', '2024-06-10 11:14:05.527808', '2024-06-10 11:14:05.527808', 25, 29),
(121, 'HERO 2', '2024-06-10 11:14:05.529808', '2024-06-10 11:14:05.529808', 26, 29),
(122, '< 63 g', '2024-06-10 11:14:05.530806', '2024-06-10 11:14:05.530806', 27, 29),
(123, 'Chiều cao: 125,0 mm  Chiều rộng: 63,5 mm  Chiều dày: 40,0 mm  Trọng lượng: 60 g', '2024-06-10 11:14:05.532807', '2024-06-10 11:14:05.532807', 28, 29),
(124, 'Chiếu sáng RGB 8 vùng', '2024-06-10 11:15:16.645335', '2024-06-10 11:15:16.645335', 25, 30),
(125, 'HERO', '2024-06-10 11:15:16.646336', '2024-06-10 11:15:16.646336', 26, 30),
(126, '99g', '2024-06-10 11:15:16.648335', '2024-06-10 11:15:16.648335', 27, 30),
(127, '116.6 x 62.15 x 38.2 ( mm ) ( Dài x Rộng x Cao )', '2024-06-10 11:15:16.649337', '2024-06-10 11:15:16.649337', 28, 30),
(128, 'RGB', '2024-06-10 11:18:08.593836', '2024-06-10 11:18:08.593836', 25, 31),
(129, 'HERO', '2024-06-10 11:18:08.595841', '2024-06-10 11:18:08.595841', 26, 31),
(130, '121 g', '2024-06-10 11:18:08.597838', '2024-06-10 11:18:08.597838', 27, 31),
(131, '132 x 75 x 40 mm ', '2024-06-10 11:18:08.598852', '2024-06-10 11:18:08.598852', 28, 31),
(132, 'RGB', '2024-06-10 11:19:47.014539', '2024-06-10 11:19:47.014539', 25, 32),
(133, 'Cảm biến Darkfield', '2024-06-10 11:19:47.015539', '2024-06-10 11:19:47.015539', 26, 32),
(134, '99g ', '2024-06-10 11:19:47.016532', '2024-06-10 11:19:47.016532', 27, 32),
(135, '10.05 x 6.5 x 3.44 cm', '2024-06-10 11:19:47.017532', '2024-06-10 11:19:47.017532', 28, 32),
(136, 'E-Dra', '2024-06-10 11:23:47.000761', '2024-06-10 11:23:47.000761', 29, 33),
(137, 'da PU', '2024-06-10 11:23:47.002760', '2024-06-10 11:23:47.002760', 30, 33),
(138, '150 độ', '2024-06-10 11:23:47.003761', '2024-06-10 11:23:47.003761', 31, 33),
(139, 'Khung, chân nhựa', '2024-06-10 11:23:47.004761', '2024-06-10 11:23:47.004761', 32, 33),
(140, 'E-Dra Yummy EGC234 Black', '2024-06-10 11:23:47.005761', '2024-06-10 11:23:47.005761', 33, 33),
(141, 'Cougar', '2024-06-10 11:28:14.707909', '2024-06-10 11:28:14.707909', 29, 34),
(142, 'Da PVC cao cấp thoáng khí', '2024-06-10 11:28:14.708910', '2024-06-10 11:28:14.708910', 30, 34),
(143, 'Góc ngã lưng 95° - 160°', '2024-06-10 11:28:14.709910', '2024-06-10 11:28:14.709910', 31, 34),
(144, 'Da PVC cao cấp thoáng khí', '2024-06-10 11:28:14.710909', '2024-06-10 11:28:14.710909', 32, 34),
(145, 'Cougar Ranger Pro Sofa Gaming', '2024-06-10 11:28:14.711910', '2024-06-10 11:28:14.711910', 33, 34),
(146, 'E-Dra', '2024-06-10 11:30:02.453747', '2024-06-10 11:30:02.453747', 29, 35),
(147, 'da PU', '2024-06-10 11:30:02.454740', '2024-06-10 11:30:02.454740', 30, 35),
(148, '150 độ', '2024-06-10 11:30:02.455742', '2024-06-10 11:30:02.455742', 31, 35),
(149, 'Khung, chân nhựa', '2024-06-10 11:30:02.457741', '2024-06-10 11:30:02.457741', 32, 35),
(150, 'E-Dra Yummy EGC234 Black', '2024-06-10 11:30:02.458741', '2024-06-10 11:30:02.458741', 33, 35),
(151, 'Ghế Cougar NxSys Aero', '2024-06-10 11:31:54.092809', '2024-06-10 11:31:54.092809', 29, 36),
(152, 'Da PVC thoáng khí, tựa lưng phối khí', '2024-06-10 11:31:54.093810', '2024-06-10 11:31:54.093810', 30, 36),
(153, '150 độ', '2024-06-10 11:31:54.094809', '2024-06-10 11:31:54.094809', 31, 36),
(154, 'Da PVC thoáng khí, tựa lưng phối khí', '2024-06-10 11:31:54.095809', '2024-06-10 11:31:54.095809', 32, 36),
(155, 'Ghế Cougar NxSys Aero', '2024-06-10 11:31:54.096810', '2024-06-10 11:31:54.096810', 33, 36),
(156, 'ASUS', '2024-06-11 15:46:38.651289', '2024-06-11 15:46:38.651289', 34, 37),
(157, '36 tháng', '2024-06-11 15:46:38.652289', '2024-06-11 15:46:38.652289', 35, 37),
(158, '200 x 123 x 38 mm', '2024-06-11 15:46:38.652289', '2024-06-11 15:46:38.652289', 36, 37),
(159, 'Tản nhiệt 2 quạt', '2024-06-11 15:46:38.653817', '2024-06-11 15:46:38.653817', 37, 37),
(160, '8GB GDDR6 ( 14 Gbps / 128-bit )', '2024-06-11 15:46:38.654661', '2024-06-11 15:46:38.654661', 38, 37),
(161, 'GIGABYTE', '2024-06-11 15:48:44.570948', '2024-06-11 15:48:44.570948', 34, 38),
(162, '36 tháng', '2024-06-11 15:48:44.571947', '2024-06-11 15:48:44.571947', 35, 38),
(163, '16.7 x 11.1 x 2.6 cm', '2024-06-11 15:48:44.571947', '2024-06-11 15:48:44.572947', 36, 38),
(164, 'Tản nhiệt 1 quạt', '2024-06-11 15:48:44.572947', '2024-06-11 15:48:44.572947', 37, 38),
(165, '2GB GDDR5 ( 6008MHz / 64-bit )', '2024-06-11 15:48:44.573947', '2024-06-11 15:48:44.573947', 38, 38),
(166, 'MSI', '2024-06-11 15:51:05.322363', '2024-06-11 15:51:05.322363', 34, 39),
(167, '36 tháng', '2024-06-11 15:51:05.324365', '2024-06-11 15:51:05.324365', 35, 39),
(168, '338 x 142 x 73 mm', '2024-06-11 15:51:05.327363', '2024-06-11 15:51:05.327363', 36, 39),
(169, 'Tản nhiệt 2 quạt', '2024-06-11 15:51:05.327363', '2024-06-11 15:51:05.328364', 37, 39),
(170, '12GB GDDR6X', '2024-06-11 15:51:05.328364', '2024-06-11 15:51:05.328364', 38, 39),
(171, 'ASUS ', '2024-06-11 15:52:30.071801', '2024-06-11 15:52:30.071801', 34, 40),
(172, '36 tháng', '2024-06-11 15:52:30.072802', '2024-06-11 15:52:30.072802', 35, 40),
(173, '310 x 144.8 x 87.5 mm 12.2 x 5.7 x 3.45 inches', '2024-06-11 15:52:30.073802', '2024-06-11 15:52:30.073802', 36, 40),
(174, 'Tản nhiệt 4 quạt', '2024-06-11 15:52:30.075804', '2024-06-11 15:52:30.075804', 37, 40),
(175, '16GB GDDR6X', '2024-06-11 15:52:30.076803', '2024-06-11 15:52:30.076803', 38, 40),
(176, 'ASUS ', '2024-06-11 15:54:19.083002', '2024-06-11 15:54:19.083002', 34, 41),
(177, '12 Tháng', '2024-06-11 15:54:19.084003', '2024-06-11 15:54:19.084003', 35, 41),
(178, '205 x 128 x 49 mm (8.1 x 5.0 x 1.9 inch)', '2024-06-11 15:54:19.085003', '2024-06-11 15:54:19.085003', 36, 41),
(179, 'Tản nhiệt 2 quạt', '2024-06-11 15:54:19.087007', '2024-06-11 15:54:19.087007', 37, 41),
(180, 'Dung lượng: 8GB Loại: GDDR6 Tốc độ: 18 Gbps Giao thức: 128-bit', '2024-06-11 15:54:19.088003', '2024-06-11 15:54:19.088003', 38, 41),
(181, 'Titan Trắng', '2024-06-11 15:58:34.221148', '2024-06-11 15:58:34.221148', 39, 42),
(182, '256GB', '2024-06-11 15:58:34.223150', '2024-06-11 15:58:34.223150', 40, 42),
(183, 'Dài: 159,9 mm Rộng: 76,7 mm Dày: 8,25 mm Trọng Lượng: 221 gram', '2024-06-11 15:58:34.224152', '2024-06-11 15:58:34.224152', 41, 42),
(184, '	Chip A17 Pro CPU 6 lõi mới với 2 lõi hiệu năng và 4 lõi tiết kiệm điện GPU 6 lõi mới Neural Engine 16 lõi mới', '2024-06-11 15:58:34.226151', '2024-06-11 15:58:34.226151', 42, 42),
(185, 'SIM kép (SIM Nano và eSIM) Hỗ trợ hai eSIM', '2024-06-11 15:58:34.227151', '2024-06-11 15:58:34.227151', 43, 42),
(186, 'Blue,Purple,Black', '2024-06-11 16:01:16.048983', '2024-06-11 16:01:16.048983', 39, 43),
(187, '128 GB', '2024-06-11 16:01:16.050985', '2024-06-11 16:01:16.050985', 40, 43),
(188, '6.1 inches  2532 x 1170 pixels', '2024-06-11 16:01:16.051983', '2024-06-11 16:01:16.051983', 41, 43),
(189, 'Apple A15 Bionic', '2024-06-11 16:01:16.052992', '2024-06-11 16:01:16.052992', 42, 43),
(190, 'Nano SIM, eSIM', '2024-06-11 16:01:16.053984', '2024-06-11 16:01:16.053984', 43, 43),
(191, 'Trắng, Xanh, Tím, Đen', '2024-06-11 16:04:17.887645', '2024-06-11 16:04:17.887645', 39, 44),
(192, '256GB, 512GB, 1TB', '2024-06-11 16:04:17.890644', '2024-06-11 16:04:17.890644', 40, 44),
(193, '6.8 inches', '2024-06-11 16:04:17.891645', '2024-06-11 16:04:17.891645', 41, 44),
(194, 'Chip Snapdragon 8 Gen 2 (4nm)', '2024-06-11 16:04:17.893682', '2024-06-11 16:04:17.893682', 42, 44),
(195, '2 Sim', '2024-06-11 16:04:17.894672', '2024-06-11 16:04:17.894672', 43, 44),
(196, 'Xanh Bạc Hà', '2024-06-11 16:06:37.333888', '2024-06-11 16:06:37.333888', 39, 45),
(197, 'Lưu trữ: 256GB Bộ nhớ đệm: 8GB Không hỗ trợ thẻ nhớ', '2024-06-11 16:06:37.335350', '2024-06-11 16:06:37.335350', 40, 45),
(198, 'Kích thước mở: 165.1 x 71.9 x 6.9mm Kích thước gập: 85.1 x 71.9 x 15.1mm Trọng lượng: 187g', '2024-06-11 16:06:37.335997', '2024-06-11 16:06:37.335997', 41, 45),
(199, 'Loại CPU: 8 nhân Tốc độ CPU: 1 nhân 3.36 GHz, 4 nhân 2.8 GHz & 3 nhân 2 GHz', '2024-06-11 16:06:37.337000', '2024-06-11 16:06:37.337000', 42, 45),
(200, '2 Sim', '2024-06-11 16:06:37.339001', '2024-06-11 16:06:37.339001', 43, 45),
(201, 'Xanh lá , Đen ,Tím', '2024-06-11 16:13:18.335919', '2024-06-11 16:13:18.335919', 39, 46),
(202, '8GB/128GB', '2024-06-11 16:13:18.337920', '2024-06-11 16:13:18.337920', 40, 46),
(203, 'Dài 161.1 mm - Ngang 74.95 mm - Dày 7.98 mm - Nặng 188 g', '2024-06-11 16:13:18.338921', '2024-06-11 16:13:18.338921', 41, 46),
(204, ' Mali-G57 MC2', '2024-06-11 16:13:18.339921', '2024-06-11 16:13:18.339921', 42, 46),
(205, ' 2 Nano SIM (SIM 2 chung khe thẻ nhớ)', '2024-06-11 16:13:18.340920', '2024-06-11 16:13:18.340920', 43, 46),
(206, 'Xanh , Đen', '2024-06-11 16:15:22.357510', '2024-06-11 16:15:22.357510', 39, 47),
(207, '128 MB', '2024-06-11 16:15:22.359510', '2024-06-11 16:15:22.359510', 40, 47),
(208, 'Dài 126 mm - Ngang 57 mm - Dày 15.2 mm - Nặng 141 g', '2024-06-11 16:15:22.361512', '2024-06-11 16:15:22.361512', 41, 47),
(209, 'Unisoc T107', '2024-06-11 16:15:22.362785', '2024-06-11 16:15:22.362785', 42, 47),
(210, ' 2 Nano SIM', '2024-06-11 16:15:22.363556', '2024-06-11 16:15:22.363556', 43, 47),
(211, 'Tổng công suất 65W', '2024-06-11 16:17:46.624180', '2024-06-11 16:17:46.624180', 44, 48),
(212, 'USB-C1 Output: 5.0V 3.0A/9.0V 3.0A/12.0V 3.0A/15.0V 3.0A/20.0V 3.25A/3.3-21.0V 3.0A 65.0W Max  USB-C2 Output: 5.0V 3.0A/9.0V 3.0A/12.0V 2.5A/15.0V 2.0A/20.0V 1.5A/3.3-11.0V 2.7A 30.0W Max  USB-A Output: 5.0V 3.0A/9.0V 2.0A/12.0V 1.5A/10.0V 2.25A 22.5W Max', '2024-06-11 16:17:46.625181', '2024-06-11 16:17:46.625181', 45, 48),
(213, '	3', '2024-06-11 16:17:46.627181', '2024-06-11 16:17:46.627181', 46, 48),
(214, '	Màn hình LED hiển thị biểu cảm Công nghệ sạc GaN an toàn Bảo vệ ngắn mạch Bảo vệ quá tải, quá nhiệt, quá áp', '2024-06-11 16:17:46.629182', '2024-06-11 16:17:46.629182', 47, 48),
(215, '	USB C', '2024-06-11 16:18:55.272082', '2024-06-11 16:18:55.272082', 44, 49),
(216, 'Đầu ra: 3*USB 3.0 A 1 HDMI 1 VGA 1 RJ45 1 SD/TF+ 1 Âm thanh 3.5mm 1 PD', '2024-06-11 16:18:55.273082', '2024-06-11 16:18:55.273082', 45, 49),
(217, '1', '2024-06-11 16:18:55.275081', '2024-06-11 16:18:55.275081', 46, 49),
(218, 'Đa năng', '2024-06-11 16:18:55.275903', '2024-06-11 16:18:55.275903', 47, 49),
(219, 'USB-C', '2024-06-11 16:20:12.759147', '2024-06-11 16:20:12.759147', 44, 50),
(220, 'USB-C', '2024-06-11 16:20:12.760150', '2024-06-11 16:20:12.760150', 45, 50),
(221, '1', '2024-06-11 16:20:12.760660', '2024-06-11 16:20:12.760660', 46, 50),
(222, 'Bảo hành chính hãng 18 tháng.  Cáp USB Type C to USB Type C sạc và truyền dữ liệu Hỗ trợ sạc nhanh dòng 3A Hỗ trợ sạc nhanh Quick Charge 3.0 và bộ nguồn tối đa PD60W Tốc độ truyền dữ liệu lên tới 1Gbps/30s truyền tải nhanh chóng những file dữ liệu Vật liệ', '2024-06-11 16:20:12.761663', '2024-06-11 16:20:12.761663', 47, 50),
(223, 'USB-C', '2024-06-11 16:21:15.747186', '2024-06-11 16:21:15.747186', 44, 51),
(224, 'USB-C', '2024-06-11 16:21:15.749180', '2024-06-11 16:21:15.749180', 45, 51),
(225, '1', '2024-06-11 16:21:15.750180', '2024-06-11 16:21:15.750180', 46, 51),
(226, '- Nhà sản xuất : UGreen  - Tình Trạng : Mới 100%   - Bảo hành : 18 tháng', '2024-06-11 16:21:15.751181', '2024-06-11 16:21:15.751181', 47, 51),
(231, 'Intel Core i5-1335U (3.4GHz~ 4.6GHz) 10 Cores 12 Threads, 12 MB Cache', '2024-06-24 15:07:06.494886', '2024-06-24 15:07:06.494886', 9, 53),
(232, '8GB (8x1) DDR4 2666MHz (2x SO-DIMM socket, up to 16GB SDRAM)', '2024-06-24 15:07:06.495886', '2024-06-24 15:07:06.495886', 10, 53),
(233, '	256GB SSD M.2 PCIE', '2024-06-24 15:07:06.496889', '2024-06-24 15:07:06.496889', 11, 53),
(234, '15.6 Inch FHD (1920 x 1080), 120Hz, WVA,  Anti-glare, 250 nits', '2024-06-24 15:07:06.497887', '2024-06-24 15:07:06.497887', 12, 53),
(235, '1 x USB 3.2 Gen 1 port 1 x USB 2.0 port 1 x USB 3.2 Gen 1 Type-Cport 1 x Universal audio  1 x HDMI 1.4  1 x RJ45 Ethernet 1 x Power-adapter', '2024-06-24 15:07:06.498887', '2024-06-24 15:07:06.498887', 13, 53),
(236, 'Chiclet Keyboard', '2024-06-24 15:07:06.500891', '2024-06-24 15:07:06.500891', 14, 53),
(237, '1.66 kg', '2024-06-24 15:07:06.501888', '2024-06-24 15:07:06.501888', 15, 53);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wsite_productimages`
--

CREATE TABLE `wsite_productimages` (
  `id` bigint(20) NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `wsite_productimages`
--

INSERT INTO `wsite_productimages` (`id`, `image_url`, `created_at`, `product_id`, `updated_at`) VALUES
(15, 'product/laptop.webp', '2024-06-09 14:22:12.267727', 8, '2024-06-09 14:22:12.267727'),
(16, 'product/vivobook_14_oled_x1405v_product_photo_1s_cool_silver_11_1__1__33a6e39a5ca64f548_H5cyyOF.webp', '2024-06-09 14:22:12.270074', 8, '2024-06-09 14:22:12.270074'),
(17, 'product/vobook_14_oled_x1405v_m1405y_cool_silver_black_keyboard_05_fingerprint_49d517d2_dQqd55P.webp', '2024-06-09 14:22:12.272074', 8, '2024-06-09 14:22:12.272074'),
(18, 'product/vobook_14_oled_x1405v_m1405y_cool_silver_black_keyboard_07_fingerprint_22ac6f3f_N9tkcJu.webp', '2024-06-09 14:22:12.273896', 8, '2024-06-09 14:22:12.273896'),
(19, 'product/vobook_14_oled_x1405v_m1405y_cool_silver_black_keyboard_12_fingerprint_1e559609_gxj8KHi.webp', '2024-06-09 14:22:12.275647', 8, '2024-06-09 14:22:12.275647'),
(20, 'product/ava_85f0a13f59c24412a311436fd2b3efc7_grande.webp', '2024-06-09 14:31:55.263550', 9, '2024-06-09 14:31:55.263550'),
(21, 'product/zenbook_14_oled_ux3405ma_ponder_blue_product_photo_04_724e045d0e084f9185e7fa8ec_fIjUnSx.webp', '2024-06-09 14:31:55.266551', 9, '2024-06-09 14:31:55.266551'),
(22, 'product/zenbook_14_oled_ux3405ma_ponder_blue_product_photo_05_045be7b3388d4b6b881888c25_thMzGVn.webp', '2024-06-09 14:31:55.270552', 9, '2024-06-09 14:31:55.270552'),
(23, 'product/zenbook_14_oled_ux3405ma_ponder_blue_product_photo_06_68a490e141264e3cabf374587_7mGoV0V.webp', '2024-06-09 14:31:55.273553', 9, '2024-06-09 14:31:55.273553'),
(24, 'product/zenbook_14_oled_ux3405ma_ponder_blue_product_photo_09_1c100583fa324485b1c1ca332_bPvXnUd.webp', '2024-06-09 14:31:55.276553', 9, '2024-06-09 14:31:55.276553'),
(25, 'product/sus-zenbook-14-oled-um3402ya-km405w_2_580325784ffc45288367ae73e43bd895_2c52455c_Vv97SeK.webp', '2024-06-09 14:33:55.934186', 10, '2024-06-09 14:33:55.934186'),
(26, 'product/sus-zenbook-14-oled-um3402ya-km405w_3_a8c0d92a8a71459a8df462ec5281288d_c4dd22213_0W2rr1r.png', '2024-06-09 14:33:55.937182', 10, '2024-06-09 14:33:55.937182'),
(27, 'product/sus-zenbook-14-oled-um3402ya-km405w_4_c1a84fe950fd426abf6c133581cccde0_0ff334f07_tDdIT40.png', '2024-06-09 14:33:55.939450', 10, '2024-06-09 14:33:55.939450'),
(28, 'product/tuf-dash-f15-fx517ze-hn888w-i7-12650h_f8676e0c735c41e196857170e0c74152_d334bd13_ZyV4FGk.webp', '2024-06-09 14:33:55.941451', 10, '2024-06-09 14:33:55.941451'),
(29, 'product/um3402ya-km405w_76e67c0074d744718702784cd113f4aa_grande.webp', '2024-06-09 14:33:55.942451', 10, '2024-06-09 14:33:55.942451'),
(30, 'product/sus-zenbook-14-oled-um3402ya-km405w_3_a8c0d92a8a71459a8df462ec5281288d_c4dd22213_oqrGVd8.png', '2024-06-09 14:35:15.209819', 11, '2024-06-09 14:35:15.209819'),
(31, 'product/sus-zenbook-14-oled-um3402ya-km405w_4_c1a84fe950fd426abf6c133581cccde0_0ff334f07_PzC4RGD.png', '2024-06-09 14:35:15.211820', 11, '2024-06-09 14:35:15.211820'),
(32, 'product/us-zenbook-duo-oled-ux8406ma-pz307w_1_fb9426a5bbe4414d8b06fb7f2abb445f_f449a6fde_P1K7dbE.png', '2024-06-09 14:35:15.213823', 11, '2024-06-09 14:35:15.213823'),
(33, 'product/us-zenbook-duo-oled-ux8406ma-pz307w_2_d5c079025f074dbd94b457ad53695f63_c0320095_u2pUWmi.webp', '2024-06-09 14:35:15.216659', 11, '2024-06-09 14:35:15.216659'),
(34, 'product/ux8406ma-pz142w_new_1_323777fbd2ea4f788f45c1165ed81427_grande.webp', '2024-06-09 14:35:15.218295', 11, '2024-06-09 14:35:15.218295'),
(35, 'product/diobook-pro-16-oled-w7600z3a-l2048w-1_acda9b80ce8b4d50ae41cb6d4b28eced_0ab4e3ba_aRveFah.webp', '2024-06-09 14:37:05.920156', 12, '2024-06-09 14:37:05.920156'),
(36, 'product/diobook-pro-16-oled-w7600z3a-l2048w-2_508bb1962f1043c78f040f9e4d8d500d_480dfcfc_TKjYm6d.webp', '2024-06-09 14:37:05.921156', 12, '2024-06-09 14:37:05.921156'),
(37, 'product/diobook-pro-16-oled-w7600z3a-l2048w-3_0955733e045e40a681899bfa5e82ce65_bbb963de_RqonPT0.webp', '2024-06-09 14:37:05.924163', 12, '2024-06-09 14:37:05.924163'),
(38, 'product/diobook-pro-16-oled-w7600z3a-l2048w-4_d22fbb4e566d41b78a477fa99d1de551_503b92ea_ixI3ZVN.webp', '2024-06-09 14:37:05.926157', 12, '2024-06-09 14:37:05.926157'),
(39, 'product/stu_8ce0829977154583a7ab6d1d0c90eb14_grande.webp', '2024-06-09 14:37:05.928490', 12, '2024-06-09 14:37:05.928490'),
(40, 'product/hs35_v2_artboard01_aa_80b3106cd5654c1e89d113d784994e3c_grande.webp', '2024-06-10 10:00:00.387165', 13, '2024-06-10 10:00:00.387165'),
(41, 'product/hs35_v2_artboard01_aa_80b3106cd5654c1e89d113d784994e3c_grande_KZSjaAk.webp', '2024-06-10 10:00:00.391167', 13, '2024-06-10 10:00:00.391167'),
(42, 'product/hs35_v2_black_render_06_5c962dc7a40449aa856b8990da541505_grande.webp', '2024-06-10 10:00:00.393312', 13, '2024-06-10 10:00:00.393312'),
(43, 'product/hs35_v2_black_render_07_71a0ec1c09b14101a77d8f541092a38e_grande.webp', '2024-06-10 10:00:00.395404', 13, '2024-06-10 10:00:00.395404'),
(44, 'product/hs35_v2_black_render_08_334f3bb826ff4c5c9f18b3a85ebc0f03_grande.webp', '2024-06-10 10:00:00.397634', 13, '2024-06-10 10:00:00.397634'),
(45, 'product/6v4zxrgg_a0841638919a4bfab523ba6fd5ccf3f7_grande.webp', '2024-06-10 10:01:31.947512', 14, '2024-06-10 10:01:31.948514'),
(46, 'product/miuu6wlj_83ddce337da840b28fc3acfa309d513b_grande.webp', '2024-06-10 10:01:31.950513', 14, '2024-06-10 10:01:31.950513'),
(47, 'product/ouobem3n_a43fe67c0f3e483ebde7943cb9284d29_grande.webp', '2024-06-10 10:01:31.953020', 14, '2024-06-10 10:01:31.953020'),
(48, 'product/sucupuge_392c1218db254d21bc7f90df8421197c_grande.webp', '2024-06-10 10:01:31.955013', 14, '2024-06-10 10:01:31.955013'),
(49, 'product/2sg6ufv5_d334c48efd3b4549a486ce64869779e3_grande.webp', '2024-06-10 10:04:46.115074', 15, '2024-06-10 10:04:46.115074'),
(50, 'product/4jxbb45y_87f0de98c32145589694b3204fdfa0ea_grande.webp', '2024-06-10 10:04:46.117762', 15, '2024-06-10 10:04:46.117762'),
(51, 'product/o21ntxf1_d70572c8b2cd4922b5318e6499cf179b_grande.webp', '2024-06-10 10:04:46.119867', 15, '2024-06-10 10:04:46.119867'),
(52, 'product/p7gpeiuj_912e294d9a87426fb49deb8686bb2916_grande.webp', '2024-06-10 10:04:46.121868', 15, '2024-06-10 10:04:46.121868'),
(53, 'product/gearvn-tai-nghe-e-dra-eh494w-white-1_46cdca3aaf3b448bbccc0d74c6d72782_603b4458b_sd6guAZ.webp', '2024-06-10 10:39:27.913542', 16, '2024-06-10 10:39:27.913542'),
(54, 'product/gearvn-tai-nghe-e-dra-eh494w-white-2_def7fee9b9d04e48a6638ee79d672c94_8517c1e11_qsO7Fdf.webp', '2024-06-10 10:39:27.916546', 16, '2024-06-10 10:39:27.916546'),
(55, 'product/hammerhead_hyperspeed_playstation__2022__render_01_12dca4b75e99423ebc6a62a53b0f_OqKdt7R.webp', '2024-06-10 10:40:48.984186', 17, '2024-06-10 10:40:48.984186'),
(56, 'product/hammerhead_hyperspeed_playstation__2022__render_03_917eb422b45241e28161be182ecc_KsfH9kW.webp', '2024-06-10 10:40:48.986187', 17, '2024-06-10 10:40:48.986187'),
(57, 'product/hammerhead_hyperspeed_playstation__2022__render_05_0676f19a06c44379a33f51111946_a3pPh4Z.webp', '2024-06-10 10:40:48.988188', 17, '2024-06-10 10:40:48.988188'),
(58, 'product/r_hce_hc8_9447197114398_221015-hammerhead-hyperspeed-ps-v2-1500x1000-1_f23bb3ef_Ifu1lE4.webp', '2024-06-10 10:40:48.990187', 17, '2024-06-10 10:40:48.990187'),
(59, 'product/_edition_pdp_img_buy_01.webp', '2024-06-10 10:43:27.091386', 18, '2024-06-10 10:43:27.091386'),
(60, 'product/_edition_pdp_img_buy_02.webp', '2024-06-10 10:43:27.093387', 18, '2024-06-10 10:43:27.093387'),
(61, 'product/_edition_pdp_img_buy_03.webp', '2024-06-10 10:43:27.095387', 18, '2024-06-10 10:43:27.095387'),
(62, 'product/_edition_pdp_img_buy_04.webp', '2024-06-10 10:43:27.096387', 18, '2024-06-10 10:43:27.096387'),
(63, 'product/s-vivobook-s-16-oled-s5606ma-mx051w_0_075da8498daf4093b32f27312f486e35_22c77e39_SRrb7zQ.webp', '2024-06-10 10:45:46.728393', 19, '2024-06-10 10:45:46.729394'),
(64, 'product/s-vivobook-s-16-oled-s5606ma-mx051w_1_b0f568af3bfe48c399c99a9ae7e3d0f8_8ea43a50_mUDkA0P.webp', '2024-06-10 10:45:46.731391', 19, '2024-06-10 10:45:46.731391'),
(65, 'product/s-vivobook-s-16-oled-s5606ma-mx051w_2_6fab4271f27c45e5bd24a9f2c6c069ed_61cf80fb_tWdTjdM.webp', '2024-06-10 10:45:46.734393', 19, '2024-06-10 10:45:46.734393'),
(66, 'product/vivobook_14_oled_x1405v_product_photo_1s_cool_silver_11_1__1__33a6e39a5ca64f548_0Wv4eJe.webp', '2024-06-10 10:45:46.736393', 19, '2024-06-10 10:45:46.736393'),
(67, 'product/u-16gpu-16gb-512gb-silver-mphh3sa-a-1_87cecf4aadae4c0aa6d5b6aad5b75396_55741b99_GEoc3C0.webp', '2024-06-10 10:47:51.979367', 20, '2024-06-10 10:47:51.979367'),
(68, 'product/u-16gpu-16gb-512gb-silver-mphh3sa-a-2_3d459fa64f614b829d9308de0ae6d3fe_5a34f8ad_M5YcoHI.webp', '2024-06-10 10:47:51.982368', 20, '2024-06-10 10:47:51.982368'),
(69, 'product/u-16gpu-16gb-512gb-silver-mphh3sa-a-4_e7807be07b974599a8950f81b10af355_cc8f7ced_eiOSI1p.webp', '2024-06-10 10:47:51.984372', 20, '2024-06-10 10:47:51.984372'),
(70, 'product/u-16gpu-16gb-512gb-silver-mphh3sa-a-5_31037fd9a6d140acb5cf206d9966aaf6_8e0f7548_Dukn6c9.webp', '2024-06-10 10:47:51.988370', 20, '2024-06-10 10:47:51.988370'),
(71, 'product/ek98_pro_proto__1__5db65e5ebe4a47c7abc80be6b3c8d211_grande.webp', '2024-06-10 10:54:23.730616', 21, '2024-06-10 10:54:23.730616'),
(72, 'product/ek98_pro_proto_-_02_79a27becab984a3ab9c1bcdb39350c57_grande.webp', '2024-06-10 10:54:23.732614', 21, '2024-06-10 10:54:23.732614'),
(73, 'product/ek98_pro_proto__2__aee441f064994704b4d3e21e4272e3d2_grande.webp', '2024-06-10 10:54:23.734616', 21, '2024-06-10 10:54:23.734616'),
(74, 'product/ek98_pro_proto__5__a05b4255ca454f1884f13ebafdd06d8e_grande.webp', '2024-06-10 10:54:23.736616', 21, '2024-06-10 10:54:23.736616'),
(75, 'product/6h7u0hmo_ec6dbe0b23e04d7db1aa8605cf9f5484_grande.webp', '2024-06-10 10:55:33.531276', 22, '2024-06-10 10:55:33.531276'),
(76, 'product/jtsywzgr_b9a676e501b04436aaa02d0e2f45e81e_grande.webp', '2024-06-10 10:55:33.533278', 22, '2024-06-10 10:55:33.533278'),
(77, 'product/koo2cvwk_bfb952d2a1424083ab1cc63b41be7bab_grande.webp', '2024-06-10 10:55:33.535279', 22, '2024-06-10 10:55:33.535279'),
(78, 'product/xbrt86pm_4234c73cd7044171b12645fd083c655f_grande.webp', '2024-06-10 10:55:33.538280', 22, '2024-06-10 10:55:33.538280'),
(79, 'product/5mcsgas4_32ac8fe0d75c469292dab3e5a70e9ca6_grande.webp', '2024-06-10 10:58:13.336171', 23, '2024-06-10 10:58:13.336171'),
(80, 'product/9beeg1nb_5d816c94d9a346f3b608e9ea5dec0d56_grande.webp', '2024-06-10 10:58:13.339170', 23, '2024-06-10 10:58:13.339170'),
(81, 'product/kg4q63c8_3d213a19620243cbb94fe4012621f395_grande.webp', '2024-06-10 10:58:13.341173', 23, '2024-06-10 10:58:13.341173'),
(82, 'product/d2wkrzdd_5d4fea85e93a454e8a77625cbd4c7f8f_grande.webp', '2024-06-10 11:00:17.925834', 24, '2024-06-10 11:00:17.925834'),
(83, 'product/ijlzwpto_8f331c337ac94628b42d753803f31946_grande.webp', '2024-06-10 11:00:17.927834', 24, '2024-06-10 11:00:17.928835'),
(84, 'product/kqk6q5xc_2f14ec861bf54e96ab870e30b819380a_grande.webp', '2024-06-10 11:00:17.930839', 24, '2024-06-10 11:00:17.930839'),
(88, 'product/ban-phim-co-akko-3108-rf-world-tour-tokyo-01_f66b333528d44f3c87bbf649cdf39e6c_grande.webp', '2024-06-10 11:03:20.330611', 26, '2024-06-10 11:03:20.330611'),
(89, 'product/ban-phim-co-akko-3108-rf-world-tour-tokyo-02_34fec85b4a434915bfe61fe80bb2528c_grande.webp', '2024-06-10 11:03:20.332613', 26, '2024-06-10 11:03:20.332613'),
(90, 'product/ban-phim-co-akko-3108-rf-world-tour-tokyo-03_6fd19e5b754d48408fcb15507c2213f3_grande.webp', '2024-06-10 11:03:20.334614', 26, '2024-06-10 11:03:20.334614'),
(91, 'product/g502x-plus-gallery-2-white_69229c9ba5534ad5bfae7d827037a28f_365394a31b6342e494_0sELlb1.webp', '2024-06-10 11:10:53.456491', 27, '2024-06-10 11:10:53.456491'),
(92, 'product/g502x-plus-gallery-2-white_69229c9ba5534ad5bfae7d827037a28f_365394a31b6342e4949_XsIZAm0.webp', '2024-06-10 11:10:53.459492', 27, '2024-06-10 11:10:53.459492'),
(93, 'product/gitech-g502-x-plus-lightspeed-white-3_a86f524774564f479085f04c0f2d1aa8_eb74cb5d_iYcFVLc.webp', '2024-06-10 11:10:53.462498', 27, '2024-06-10 11:10:53.462498'),
(94, 'product/gitech-g502-x-plus-lightspeed-white-4_0ef5e503aac946288ad0a1c4d446f112_b13cc6c8_S8idk1W.webp', '2024-06-10 11:10:53.465494', 27, '2024-06-10 11:10:53.465494'),
(95, 'product/-pop-with-emoji-button-blast-yellow-2_7cde64282ca548a4bdf3b703db0ceb86_ef04d30e_quuDjuV.webp', '2024-06-10 11:12:00.470914', 28, '2024-06-10 11:12:00.470914'),
(96, 'product/-pop-with-emoji-button-blast-yellow-4_a64b7acc469548779d2cb45db65a3d12_dae20ff9_z4S34Aw.webp', '2024-06-10 11:12:00.472914', 28, '2024-06-10 11:12:00.472914'),
(97, 'product/-pop-with-emoji-button-blast-yellow-5_84484dec47524920839993525922a847_62fa7076_3V5xB9e.webp', '2024-06-10 11:12:00.474915', 28, '2024-06-10 11:12:00.474915'),
(98, 'product/thumbchuot_3_db7d820b3ea740a9af02d3874b2b6668_edd19d53cdf84eda80025c6cb20bb375_grande.webp', '2024-06-10 11:12:00.476916', 28, '2024-06-10 11:12:00.476916'),
(99, 'product/6_cc9e6a9210494554aed0ed8cbb6f8a5a_grande.webp', '2024-06-10 11:13:36.311153', 29, '2024-06-10 11:13:36.311153'),
(100, 'product/7_d8b8b4ab4ad14b049c4e64ba3ea395c6_grande.webp', '2024-06-10 11:13:36.313153', 29, '2024-06-10 11:13:36.313153'),
(101, 'product/8_e5a2d429ad874de4ab2171ab05c91e1d_grande.webp', '2024-06-10 11:13:36.315155', 29, '2024-06-10 11:13:36.315155'),
(102, 'product/10_7899fa26926b4cf2a3c476ca82f965a0_grande.webp', '2024-06-10 11:13:36.317155', 29, '2024-06-10 11:13:36.317155'),
(103, 'product/ch-g304-lightspeed-wireless-white-777_4f35661f87af49b2b7f9a0870a174ea7_b6fb9848_nCSKsir.webp', '2024-06-10 11:15:01.467156', 30, '2024-06-10 11:15:01.467156'),
(104, 'product/h-g304-lightspeed-wireless-white-1000_e28318985b5049099c4e8381695e810f_782b9a44_79xeUEO.webp', '2024-06-10 11:15:01.470156', 30, '2024-06-10 11:15:01.470156'),
(105, 'product/tech-g304-lightspeed-wireless-white-1_d499fe3d15bc4ae886df0acdb130f08f_455a23a1_m2jXIRY.webp', '2024-06-10 11:15:01.472157', 30, '2024-06-10 11:15:01.472157'),
(106, 'product/avatar_84b7b3e44966416897cc4a9179da4596_b27d8f25218b4ece9a049706b0d10463_grande.webp', '2024-06-10 11:17:44.306515', 31, '2024-06-10 11:17:44.306515'),
(107, 'product/chu-g502-hero_96906d38c4234bc2a88b4cc4b21640ff_9cd8babe578141cf91424aa026f53d2e_grande.webp', '2024-06-10 11:17:44.309505', 31, '2024-06-10 11:17:44.309505'),
(108, 'product/gearvn_logitech_g502hero_cdd967f8c51f4c4eb475006c46d883b2_grande.webp', '2024-06-10 11:17:44.311505', 31, '2024-06-10 11:17:44.311505'),
(109, 'product/mx-anywhere-3s-mouse-3qtr-back-rose_f7975ce678cc4d64985a52720ab1df73_grande.webp', '2024-06-10 11:19:22.644518', 32, '2024-06-10 11:19:22.644518'),
(110, 'product/mx-anywhere-3s-mouse-side-left-rose_ef6aa5ceb1f643f187a197fd074847b7_grande.png', '2024-06-10 11:19:22.646519', 32, '2024-06-10 11:19:22.646519'),
(111, 'product/mx-anywhere-3s-mouse-top-view-rose_4d2c04ed515543028a7ea100a3f4e8b1_grande.png', '2024-06-10 11:19:22.648519', 32, '2024-06-10 11:19:22.648519'),
(112, 'product/522_egc234r___5_27d195f6a51b4c7a83e01929d90f27cb_grande.webp', '2024-06-10 11:23:21.723823', 33, '2024-06-10 11:23:21.723823'),
(113, 'product/522_egc234r___5_27d195f6a51b4c7a83e01929d90f27cb_grande_vzre2AG.webp', '2024-06-10 11:23:21.726819', 33, '2024-06-10 11:23:21.726819'),
(114, 'product/z5491466558207_c248020a657a009c6dc8ca54a3847a52_08a00d5377044c3c9066a7fbf7c5d08_yrxmEle.webp', '2024-06-10 11:23:21.728818', 33, '2024-06-10 11:23:21.728818'),
(115, 'product/z5491466558207_c248020a657a009c6dc8ca54a3847a52_08a00d5377044c3c9066a7fbf7c5d088_grande.webp', '2024-06-10 11:23:21.731819', 33, '2024-06-10 11:23:21.731819'),
(116, 'product/z5491466558209_338ce023fd7a1990245260c812591509_f777b20b93684159887218c0cb281b83_grande.webp', '2024-06-10 11:23:21.733819', 33, '2024-06-10 11:23:21.733819'),
(117, 'product/rangerpro-03_88a129bb875e41f494101214bda004b4_grande_1.webp', '2024-06-10 11:27:22.268214', 34, '2024-06-10 11:27:22.268214'),
(118, 'product/rangerpro-05_f5a2577aaaf24be1b9cf44f6443b8cc2_grande.webp', '2024-06-10 11:27:22.270213', 34, '2024-06-10 11:27:22.270213'),
(119, 'product/521_egc234b___4_c9f3274cf6a14ade8cbafdc596d2ee15_grande_1.webp', '2024-06-10 11:29:43.004352', 35, '2024-06-10 11:29:43.004352'),
(120, 'product/z5491466387132_32ad25df31ad39bcc60ddb599e8c01b4_ed628f3223a14135bd77857ead21f2e9_grande.webp', '2024-06-10 11:29:43.007345', 35, '2024-06-10 11:29:43.007345'),
(121, 'product/z5491466411534_5a261b3a865e3440d21780bbd8b434b6_efb0599e239a4dd89c8afce8035c6682_grande.webp', '2024-06-10 11:29:43.009345', 35, '2024-06-10 11:29:43.009345'),
(122, 'product/nxsysaero-01_935fdb31700741718316efba45c13ee3_grande.webp', '2024-06-10 11:31:18.257710', 36, '2024-06-10 11:31:18.257710'),
(123, 'product/nxsysaero-04_74158b95d3234b0cad488d4fe4ba1b99_grande.webp', '2024-06-10 11:31:18.259709', 36, '2024-06-10 11:31:18.259709'),
(124, 'product/nxsysaero-08_f201dba8ea99427b93af801c3646950f_grande.webp', '2024-06-10 11:31:18.261709', 36, '2024-06-10 11:31:18.261709'),
(125, 'product/vga1.webp', '2024-06-11 15:46:13.333627', 37, '2024-06-11 15:46:13.333627'),
(126, 'product/vga2.webp', '2024-06-11 15:48:16.081603', 38, '2024-06-11 15:48:16.081603'),
(127, 'product/vga2_2.webp', '2024-06-11 15:48:16.083603', 38, '2024-06-11 15:48:16.083603'),
(128, 'product/vga2_22.webp', '2024-06-11 15:48:16.085620', 38, '2024-06-11 15:48:16.085620'),
(129, 'product/vga2_32.webp', '2024-06-11 15:48:16.087409', 38, '2024-06-11 15:48:16.087409'),
(130, 'product/01_7940fd72e403431289984a8231facaa5_1ff23405f7784519af16eb7253b9e572_grande.webp', '2024-06-11 15:50:32.005726', 39, '2024-06-11 15:50:32.005726'),
(131, 'product/02_3957bc64805d4a979587de32e0cb6a3c_f64c643aca534313b461799b03ee3e30_grande.webp', '2024-06-11 15:50:32.007991', 39, '2024-06-11 15:50:32.007991'),
(132, 'product/04_7daff7faae2a427f8369742a18042028_6d776dae73884a8184e32be7a1917f02_grande.webp', '2024-06-11 15:50:32.009989', 39, '2024-06-11 15:50:32.009989'),
(133, 'product/rtx_4070_ti_suprim_x_12gb_7da93fa1b08f4050b5907b6f20512339_grande.webp', '2024-06-11 15:50:32.012698', 39, '2024-06-11 15:50:32.012698'),
(134, 'product/fwebp__15__7ff7d20ad94344e581ffdadaffb7b48c_grande.webp', '2024-06-11 15:51:59.676924', 40, '2024-06-11 15:51:59.676924'),
(135, 'product/fwebp__16__6891a9d225924b00b2c5a03fbaaed898_grande.webp', '2024-06-11 15:51:59.679924', 40, '2024-06-11 15:51:59.679924'),
(136, 'product/fwebp__17__446c839067774dafbcdd76c6e9211857_grande.webp', '2024-06-11 15:51:59.683073', 40, '2024-06-11 15:51:59.683073'),
(137, 'product/fwebp__19__6235585db01644968ebec5468a927b76_grande.webp', '2024-06-11 15:51:59.685072', 40, '2024-06-11 15:51:59.685072'),
(138, 'product/fwebp__2__306081d7b47444a9b30c89811223ea6f_grande.webp', '2024-06-11 15:53:48.835399', 41, '2024-06-11 15:53:48.835399'),
(139, 'product/fwebp__3__494cc9da4d24421792cfd26b2e4fc198_grande.webp', '2024-06-11 15:53:48.837766', 41, '2024-06-11 15:53:48.837766'),
(140, 'product/fwebp__6__cfffcef0dbca441ea89fe16191bf7368_grande.webp', '2024-06-11 15:53:48.840026', 41, '2024-06-11 15:53:48.840026'),
(141, 'product/fwebp__16__6891a9d225924b00b2c5a03fbaaed898_grande_mdGmJvB.webp', '2024-06-11 15:53:48.842027', 41, '2024-06-11 15:53:48.842027'),
(142, 'product/230913060918-iphone-15-pro-max-natural.png', '2024-06-11 15:58:02.854047', 42, '2024-06-11 15:58:02.854047'),
(143, 'product/231209051811-iphone-15-pro-max-512gb.jpg', '2024-06-11 15:58:02.856048', 42, '2024-06-11 15:58:02.856048'),
(144, 'product/231209051812-iphone-15-pro-max-512gb.jpg', '2024-06-11 15:58:02.859059', 42, '2024-06-11 15:58:02.859059'),
(145, 'product/231209051814-iphone-15-pro-max-512gb.jpg', '2024-06-11 15:58:02.861048', 42, '2024-06-11 15:58:02.861048'),
(146, 'product/231209051816-iphone-15-pro-max-512gb1.jpg', '2024-06-11 15:58:02.862049', 42, '2024-06-11 15:58:02.862049'),
(147, 'product/220908104247-iphone-14-128gb.jpg', '2024-06-11 15:59:38.365258', 43, '2024-06-11 15:59:38.365258'),
(148, 'product/220908104247-iphone-14-128gb1.jpg', '2024-06-11 15:59:38.367224', 43, '2024-06-11 15:59:38.367224'),
(149, 'product/220908104247-iphone-14-128gb3.jpg', '2024-06-11 15:59:38.369214', 43, '2024-06-11 15:59:38.369214'),
(150, 'product/230623042710-iphone-14-128g-blue-minh-tuan-mobile.png', '2024-06-11 15:59:38.371345', 43, '2024-06-11 15:59:38.371345'),
(151, 'product/230214033800-samsung-galaxy-s23-ultra-thumbnail-tim.jpg', '2024-06-11 16:03:33.280137', 44, '2024-06-11 16:03:33.280137'),
(152, 'product/240530054147-sm-s918bzeqxxv.webp', '2024-06-11 16:03:33.282386', 44, '2024-06-11 16:03:33.282386'),
(153, 'product/240530054147-sm-s918bzeqxxv2.webp', '2024-06-11 16:03:33.284606', 44, '2024-06-11 16:03:33.284606'),
(154, 'product/240530054148-sm-s918bzeqxxv.webp', '2024-06-11 16:03:33.286430', 44, '2024-06-11 16:03:33.286430'),
(155, 'product/unnamed_Ii41cDa.webp', '2024-06-11 16:03:33.288431', 44, '2024-06-11 16:03:33.288431'),
(156, 'product/240113053818-sm-f731blgaxxv.jpg', '2024-06-11 16:05:42.010058', 45, '2024-06-11 16:05:42.010058'),
(157, 'product/240113053818-sm-f731blgaxxv1.jpg', '2024-06-11 16:05:42.012312', 45, '2024-06-11 16:05:42.012312'),
(158, 'product/240113053818-sm-f731blgaxxv2.jpg', '2024-06-11 16:05:42.012975', 45, '2024-06-11 16:05:42.013989'),
(159, 'product/ss-galaxy-zflip5-xanh-minhtuanmobile-230726111538.png', '2024-06-11 16:05:42.015981', 45, '2024-06-11 16:05:42.015981'),
(160, 'product/redmi-note-13-pro-xanh-la-1.jpg', '2024-06-11 16:12:30.873335', 46, '2024-06-11 16:12:30.873335'),
(161, 'product/vi-vn-xiaomi-redmi-note-13-pro-slider--1.jpg', '2024-06-11 16:12:30.875342', 46, '2024-06-11 16:12:30.875342'),
(162, 'product/xiaomi-redmi-note-13-pro-den-1-2.jpg', '2024-06-11 16:12:30.877344', 46, '2024-06-11 16:12:30.877344'),
(163, 'product/xiaomi-redmi-note-13-pro-tim-1-1.jpg', '2024-06-11 16:12:30.879719', 46, '2024-06-11 16:12:30.879719'),
(164, 'product/fami-50-black-1.jpg', '2024-06-11 16:14:36.040340', 47, '2024-06-11 16:14:36.040340'),
(165, 'product/fami-50-blue-1.jpg', '2024-06-11 16:14:36.042271', 47, '2024-06-11 16:14:36.042271'),
(166, 'product/fami-50-tong-quan-1020x570.jpg', '2024-06-11 16:14:36.044344', 47, '2024-06-11 16:14:36.044344'),
(167, 'product/z5464343694812_5f926d20733e29e849891db4f505b089__1__e2dd824605b04c448f5b3d658be_EoT4Qhx.webp', '2024-06-11 16:17:27.969351', 48, '2024-06-11 16:17:27.969351'),
(168, 'product/z5464419270593_bf1bebf2e7153df2db1c526b1dee9145_500e091841a84e9dae3ffb864fde7af8_grande.webp', '2024-06-11 16:17:27.972352', 48, '2024-06-11 16:17:27.972352'),
(169, 'product/z5452856118886_b105e7d5d5fc57fff4f2a46e55f3cb0d_a6ad1105c1414dbd8a64609f9b0e5278_grande.webp', '2024-06-11 16:18:29.381554', 49, '2024-06-11 16:18:29.381554'),
(170, 'product/z5452856414585_0d4281d2f859a044929792dc9378c976_cc90adc86dcd455a8f326bfdab736962_grande.webp', '2024-06-11 16:18:29.384553', 49, '2024-06-11 16:18:29.384553'),
(171, 'product/286-sac-nhanh-dong-3a-kha-nang-tuong-thich-rong-loi-dong-nguyen-chat-2_e85d0fd8_692M0pz.webp', '2024-06-11 16:19:57.910482', 50, '2024-06-11 16:19:57.910482'),
(172, 'product/md102_8117004ed2d84c80b05d1c7298739661_grande.webp', '2024-06-11 16:20:53.455758', 51, '2024-06-11 16:20:53.456752'),
(174, 'product/vostro-3530_7a36c45673a54b8cb130f07130d1af0d_grande.webp', '2024-06-24 15:06:15.543823', 53, '2024-06-24 15:06:15.543823');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wsite_productrating`
--

CREATE TABLE `wsite_productrating` (
  `id` bigint(20) NOT NULL,
  `rating_value` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `wsite_productrating`
--

INSERT INTO `wsite_productrating` (`id`, `rating_value`, `author_id`, `product_id`, `created_at`, `comment`) VALUES
(23, 5, 1, 9, '2024-10-10 14:21:10.083915', 'san pham tot'),
(24, 5, 1, 10, '2024-10-10 14:26:50.356256', 'san pham tot');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wsite_profile`
--

CREATE TABLE `wsite_profile` (
  `id` bigint(20) NOT NULL,
  `sex` varchar(3) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `wsite_profile`
--

INSERT INTO `wsite_profile` (`id`, `sex`, `phone`, `birthday`, `user_id`, `full_name`) VALUES
(1, 'Nam', '0872835671', '2009-02-06', 1, 'Nguyễn Huy Vũ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wsite_wishlistitem`
--

CREATE TABLE `wsite_wishlistitem` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `wsite_wishlistitem`
--

INSERT INTO `wsite_wishlistitem` (`id`, `created_at`, `product_id`, `user_id`) VALUES
(3, '2024-06-09 14:56:55.528169', 8, 1),
(4, '2024-06-09 14:57:16.210685', 9, 1),
(5, '2024-06-10 11:26:23.156566', 33, 1),
(6, '2024-06-10 18:30:35.581328', 21, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `wsite_attribute`
--
ALTER TABLE `wsite_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wsite_attribute_category_id_e9e4e09d_fk_wsite_category_id` (`category_id`);

--
-- Chỉ mục cho bảng `wsite_cartitem`
--
ALTER TABLE `wsite_cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wsite_cartitem_user_id_f55c615f_fk_auth_user_id` (`user_id`),
  ADD KEY `wsite_cartitem_product_id_f7c91622_fk_wsite_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `wsite_category`
--
ALTER TABLE `wsite_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wsite_classification`
--
ALTER TABLE `wsite_classification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_rating_id` (`product_rating_id`);

--
-- Chỉ mục cho bảng `wsite_discount`
--
ALTER TABLE `wsite_discount`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wsite_order`
--
ALTER TABLE `wsite_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wsite_order_user_id_f6e6c15b_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `wsite_orderitem`
--
ALTER TABLE `wsite_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wsite_orderitem_order_id_915600ba_fk_wsite_order_id` (`order_id`),
  ADD KEY `wsite_orderitem_product_id_f61e810b_fk_wsite_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `wsite_payment_vnpay`
--
ALTER TABLE `wsite_payment_vnpay`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wsite_product`
--
ALTER TABLE `wsite_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wsite_product_category_id_1ac8016c_fk_wsite_category_id` (`category_id`);

--
-- Chỉ mục cho bảng `wsite_productattribute`
--
ALTER TABLE `wsite_productattribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wsite_productattribu_attribute_id_301d1376_fk_wsite_att` (`attribute_id`),
  ADD KEY `wsite_productattribute_product_id_6cfc110e_fk_wsite_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `wsite_productimages`
--
ALTER TABLE `wsite_productimages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wsite_productimages_product_id_4f5be9c9_fk_wsite_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `wsite_productrating`
--
ALTER TABLE `wsite_productrating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wsite_productrating_author_id_6ecb4395_fk_auth_user_id` (`author_id`),
  ADD KEY `wsite_productrating_product_id_6d1c0f74_fk_wsite_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `wsite_profile`
--
ALTER TABLE `wsite_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `wsite_wishlistitem`
--
ALTER TABLE `wsite_wishlistitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wsite_favorite_product_id_87601953_fk_wsite_product_id` (`product_id`),
  ADD KEY `wsite_favorite_user_id_a1475398_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `wsite_attribute`
--
ALTER TABLE `wsite_attribute`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `wsite_cartitem`
--
ALTER TABLE `wsite_cartitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT cho bảng `wsite_category`
--
ALTER TABLE `wsite_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `wsite_classification`
--
ALTER TABLE `wsite_classification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `wsite_discount`
--
ALTER TABLE `wsite_discount`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `wsite_order`
--
ALTER TABLE `wsite_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `wsite_orderitem`
--
ALTER TABLE `wsite_orderitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT cho bảng `wsite_payment_vnpay`
--
ALTER TABLE `wsite_payment_vnpay`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `wsite_product`
--
ALTER TABLE `wsite_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `wsite_productattribute`
--
ALTER TABLE `wsite_productattribute`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT cho bảng `wsite_productimages`
--
ALTER TABLE `wsite_productimages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT cho bảng `wsite_productrating`
--
ALTER TABLE `wsite_productrating`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `wsite_profile`
--
ALTER TABLE `wsite_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `wsite_wishlistitem`
--
ALTER TABLE `wsite_wishlistitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `wsite_attribute`
--
ALTER TABLE `wsite_attribute`
  ADD CONSTRAINT `wsite_attribute_category_id_e9e4e09d_fk_wsite_category_id` FOREIGN KEY (`category_id`) REFERENCES `wsite_category` (`id`);

--
-- Các ràng buộc cho bảng `wsite_cartitem`
--
ALTER TABLE `wsite_cartitem`
  ADD CONSTRAINT `wsite_cartitem_product_id_f7c91622_fk_wsite_product_id` FOREIGN KEY (`product_id`) REFERENCES `wsite_product` (`id`),
  ADD CONSTRAINT `wsite_cartitem_user_id_f55c615f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `wsite_classification`
--
ALTER TABLE `wsite_classification`
  ADD CONSTRAINT `wsite_classification_product_rating_id_2f214ec6_fk_wsite_pro` FOREIGN KEY (`product_rating_id`) REFERENCES `wsite_productrating` (`id`);

--
-- Các ràng buộc cho bảng `wsite_order`
--
ALTER TABLE `wsite_order`
  ADD CONSTRAINT `wsite_order_user_id_f6e6c15b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `wsite_orderitem`
--
ALTER TABLE `wsite_orderitem`
  ADD CONSTRAINT `wsite_orderitem_order_id_915600ba_fk_wsite_order_id` FOREIGN KEY (`order_id`) REFERENCES `wsite_order` (`id`),
  ADD CONSTRAINT `wsite_orderitem_product_id_f61e810b_fk_wsite_product_id` FOREIGN KEY (`product_id`) REFERENCES `wsite_product` (`id`);

--
-- Các ràng buộc cho bảng `wsite_product`
--
ALTER TABLE `wsite_product`
  ADD CONSTRAINT `wsite_product_category_id_1ac8016c_fk_wsite_category_id` FOREIGN KEY (`category_id`) REFERENCES `wsite_category` (`id`);

--
-- Các ràng buộc cho bảng `wsite_productattribute`
--
ALTER TABLE `wsite_productattribute`
  ADD CONSTRAINT `wsite_productattribu_attribute_id_301d1376_fk_wsite_att` FOREIGN KEY (`attribute_id`) REFERENCES `wsite_attribute` (`id`),
  ADD CONSTRAINT `wsite_productattribute_product_id_6cfc110e_fk_wsite_product_id` FOREIGN KEY (`product_id`) REFERENCES `wsite_product` (`id`);

--
-- Các ràng buộc cho bảng `wsite_productimages`
--
ALTER TABLE `wsite_productimages`
  ADD CONSTRAINT `wsite_productimages_product_id_4f5be9c9_fk_wsite_product_id` FOREIGN KEY (`product_id`) REFERENCES `wsite_product` (`id`);

--
-- Các ràng buộc cho bảng `wsite_productrating`
--
ALTER TABLE `wsite_productrating`
  ADD CONSTRAINT `wsite_productrating_author_id_6ecb4395_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `wsite_productrating_product_id_6d1c0f74_fk_wsite_product_id` FOREIGN KEY (`product_id`) REFERENCES `wsite_product` (`id`);

--
-- Các ràng buộc cho bảng `wsite_profile`
--
ALTER TABLE `wsite_profile`
  ADD CONSTRAINT `wsite_profile_user_id_c27433b2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `wsite_wishlistitem`
--
ALTER TABLE `wsite_wishlistitem`
  ADD CONSTRAINT `wsite_favorite_product_id_87601953_fk_wsite_product_id` FOREIGN KEY (`product_id`) REFERENCES `wsite_product` (`id`),
  ADD CONSTRAINT `wsite_favorite_user_id_a1475398_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
