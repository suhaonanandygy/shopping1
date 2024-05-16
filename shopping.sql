-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2024-05-15 17:31:37
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `shopping`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL COMMENT '管理员编号',
  `admin_account` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '管理员账号',
  `admin_password` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '管理员密码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_account`, `admin_password`) VALUES
(101, '10001', '1111'),
(102, '10002', '2222'),
(103, '10003', '3333');

-- --------------------------------------------------------

--
-- 表的结构 `business`
--

CREATE TABLE `business` (
  `business_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `business_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `business_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `business`
--

INSERT INTO `business` (`business_account`, `business_password`, `business_id`) VALUES
('11111', '111', 101),
('22222', '222', 102);

-- --------------------------------------------------------

--
-- 表的结构 `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL COMMENT '留言编号',
  `message_contents` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '留言内容',
  `message_date` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '留言日期',
  `message_uid` int(11) DEFAULT NULL COMMENT '留言用户编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `message`
--

INSERT INTO `message` (`message_id`, `message_contents`, `message_date`, `message_uid`) VALUES
(91, '宝贝质量很好，很喜欢！', '2023-12-15 21:45:30', 1);

-- --------------------------------------------------------

--
-- 表的结构 `operation_logs`
--

CREATE TABLE `operation_logs` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `operation_description` text COLLATE utf8_unicode_ci,
  `operation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

CREATE TABLE `order` (
  `order_id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '订单编号',
  `order_totalprice` double(8,2) DEFAULT NULL COMMENT '订单总价',
  `order_state` int(11) DEFAULT NULL COMMENT '订单状态：1未发货，2已发货，3已签收',
  `order_receiveaddr` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收货地址',
  `order_receivephone` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收货电话',
  `order_time` datetime DEFAULT NULL COMMENT '下单时间',
  `order_uid` int(11) DEFAULT NULL COMMENT '下单用户编号',
  `order_accepter` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `order`
--

INSERT INTO `order` (`order_id`, `order_totalprice`, `order_state`, `order_receiveaddr`, `order_receivephone`, `order_time`, `order_uid`, `order_accepter`) VALUES
('10691715749983', 98.00, 0, NULL, NULL, '2024-05-15 13:13:03', 9, NULL),
('11341715748367', 98.00, 0, NULL, NULL, '2024-05-15 12:46:07', 9, NULL),
('12461715751460', 9999.00, 1, '', '', '2024-05-15 13:37:40', 9, ''),
('30591715755882', 120.00, 1, '', '', '2024-05-15 14:51:22', 8, ''),
('60961715748321', 9999.00, 0, NULL, NULL, '2024-05-15 12:45:21', 9, NULL),
('66001715409390', 53.00, 3, '', '', '2024-05-11 14:36:30', 9, ''),
('69971715759552', 98.00, 1, '', '', '2024-05-15 15:52:32', 9, ''),
('72281715676092', 16100.00, 0, NULL, NULL, '2024-05-14 16:41:32', 9, NULL),
('82231715759575', 98.00, 1, '', '', '2024-05-15 15:52:55', 9, ''),
('82391702964545', 9999.00, 3, '', '', '2023-12-19 13:42:25', 9, ''),
('89391715751676', 266.00, 1, '', '', '2024-05-15 13:41:16', 9, ''),
('90491702703351', 520.00, 3, '华南理工大学', '1450044796@qq.com', '2023-12-16 13:09:11', 9, 'kk'),
('92941702816984', 150.00, 0, NULL, NULL, '2023-12-17 20:43:04', 9, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `orderitem`
--

CREATE TABLE `orderitem` (
  `orderitem_id` int(11) NOT NULL COMMENT '详单编号',
  `orderitem_count` int(11) DEFAULT NULL COMMENT '购买数量',
  `orderitem_unitprice` double(8,2) DEFAULT NULL COMMENT '商品单价',
  `orderitem_pid` int(11) DEFAULT NULL COMMENT '商品编号',
  `orderitem_oid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属订单编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `orderitem`
--

INSERT INTO `orderitem` (`orderitem_id`, `orderitem_count`, `orderitem_unitprice`, `orderitem_pid`, `orderitem_oid`) VALUES
(326, 1, 520.00, 404, '90491702703351'),
(327, 1, 150.00, 439, '92941702816984'),
(328, 1, 9999.00, 402, '82391702964545'),
(329, 1, 53.00, 407, '66001715409390'),
(330, 7, 2300.00, 415, '72281715676092'),
(331, 1, 9999.00, 402, '60961715748321'),
(332, 1, 98.00, 401, '11341715748367'),
(333, 1, 98.00, 401, '10691715749983'),
(334, 1, 9999.00, 402, '12461715751460'),
(335, 1, 266.00, 426, '89391715751676'),
(336, 1, 120.00, 424, '30591715755882'),
(337, 1, 98.00, 401, '69971715759552'),
(338, 1, 98.00, 401, '82231715759575');

--
-- 触发器 `orderitem`
--
DELIMITER $$
CREATE TRIGGER `add_orderitemPrice` BEFORE INSERT ON `orderitem` FOR EACH ROW SET new.orderitem_unitprice=(SELECT product_specialprice FROM product
WHERE product_id = new.orderitem_pid)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL COMMENT '商品编号',
  `product_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `product_originalprice` double(8,2) DEFAULT NULL COMMENT '商品原价',
  `product_specialprice` double(8,2) DEFAULT NULL COMMENT '商品优惠价',
  `product_image` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品图片',
  `product_popular` int(11) DEFAULT NULL COMMENT '商品是否热门',
  `product_date` datetime DEFAULT NULL COMMENT '商品上架日期',
  `product_sort` int(11) DEFAULT NULL COMMENT '商品所属分类',
  `click_count` int(11) DEFAULT NULL,
  `shopping_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_originalprice`, `product_specialprice`, `product_image`, `product_popular`, `product_date`, `product_sort`, `click_count`, `shopping_count`) VALUES
(401, '白毛衣', 198.00, 98.00, 'products/白毛衣.png', 1, '2023-12-14 10:02:11', 2211, 1987, 46),
(402, 'iPhone 15 Pro', 11999.00, 9999.00, 'products/iphone15.png', 1, '2023-12-14 10:03:41', 2231, 433, 0),
(404, '风衣', 521.00, 520.00, 'products/风衣.png', 0, '2023-12-14 11:07:16', 2211, 256, 9),
(405, '喇叭裤', 146.00, 99.00, 'products/喇叭裤.png', 0, '2023-12-14 11:08:40', 2212, 2666, 7),
(406, '女士短裤', 65.00, 55.00, 'products/短裤.png', 0, '2023-12-14 11:08:44', 2212, 6642, 8),
(407, '鲜鱿鱼', 55.00, 53.00, 'products/鲜鱿鱼.png', 0, '2023-12-14 11:08:47', 2221, 4561, 5),
(408, '小龙虾', 40.00, 38.00, 'products/小龙虾.png', 0, '2023-12-14 11:08:50', 2221, 4414, 7),
(409, '薯片', 5.00, 4.50, 'products/薯片.png', 0, '2023-12-14 11:08:52', 2222, 721, 44),
(410, '面包', 9.00, 8.00, 'products/面包.png', 0, '2023-12-14 11:08:56', 2222, 124, 22),
(411, 'HUAWEI P60', 7488.00, 7288.00, 'products/华为p60.png', 0, '2023-12-14 11:10:42', 2231, 862, 44),
(412, '小米14 pro', 5399.00, 5099.00, 'products/小米十四.png', 0, '2023-12-14 11:10:44', 2231, 113, 2),
(413, 'HUAWEI matebook 16', 6799.00, 6599.00, 'products/华为matebook14.png', 0, '2023-12-14 11:10:47', 2232, 15, 3),
(414, 'MacBook Pro', 12999.00, 11999.00, 'products/macpro.png', 0, '2023-12-14 11:10:50', 2232, 551, 1),
(415, '金项链', 2419.00, 2300.00, 'products/金项链.png', 0, '2023-12-14 11:11:18', 2241, 262, 31),
(416, '银项链', 1419.00, 1300.00, 'products/银项链.png', 0, '2023-12-14 11:11:21', 2241, 97, 5),
(417, '耳环', 169.00, 159.00, 'products/耳环.png', 0, '2023-12-14 11:11:23', 2242, 522, 12),
(418, '耳钉', 99.00, 89.00, 'products/耳钉0.png', 1, '2023-12-14 11:12:25', 2242, 122, 8),
(419, '去屑洗发水', 35.00, 30.00, 'products/去屑洗发水.png', 0, '2023-12-14 11:16:03', 2251, 3332, 9),
(420, '修护洗发水', 40.00, 35.00, 'products/修护洗发水.png', 0, '2023-12-14 11:16:22', 2251, 111, 8),
(421, '洗衣液', 30.00, 25.00, 'products/洗衣液.png', 0, '2023-12-14 11:16:13', 2252, 55, 6),
(422, '洗衣凝珠', 25.00, 20.00, 'products/洗衣凝珠.png', 0, '2023-12-14 11:17:16', 2252, 661, 6),
(423, '女士凉鞋', 150.00, 145.00, 'products/女士凉鞋.png', 0, '2023-12-14 11:21:37', 2261, 512, 7),
(424, '男士凉鞋', 135.00, 120.00, 'products/男士凉鞋.png', 0, '2022-12-14 11:22:43', 2261, 124, 1),
(425, '女士运动鞋', 288.00, 278.00, 'products/女士运动鞋.png', 0, '2023-12-14 11:23:42', 2262, 551, 4),
(426, '男士运动鞋', 278.00, 266.00, 'products/男士运动鞋0.png', 1, '2023-12-14 11:26:45', 2262, 6, 1),
(431, '999感冒灵', 28.80, 28.00, 'products/999.png', 1, '2023-12-16 13:50:35', 2302, 123, 12),
(432, '网络应用开发', 30.00, 27.00, 'products/111.png', 0, '2023-12-16 14:39:37', 2272, 906, 35),
(433, 'ipad', 5999.00, 4999.00, 'products/ipad.png', 1, '2023-12-16 15:03:11', 2232, 123, 63),
(434, '豆腐', 9.90, 9.90, 'products/豆腐.png', 0, '2023-12-16 15:45:24', 2221, 335, 52),
(435, '傲蝶眉笔', 29.90, 20.00, 'products/傲蝶眉笔.png', 1, '2023-12-16 15:46:14', 2281, 231, 44),
(436, '风干牛肉', 39.90, 35.00, 'products/风干牛肉.png', 0, '2023-12-16 15:46:58', 2222, 13, 52),
(437, '布洛芬释放胶囊', 25.00, 22.00, 'products/布洛芬胶囊.png', 0, '2023-12-16 15:47:37', 2302, 523, 42),
(438, '娃娃菜', 4.90, 4.00, 'products/娃娃菜.png', 0, '2023-12-16 15:48:34', 2221, 12, 1),
(439, '拉杆行李箱', 199.00, 150.00, 'products/拉杆行李箱.png', 1, '2023-12-16 15:49:06', 2292, 1, 1),
(440, '香奈儿口红', 399.00, 399.00, 'products/香奈儿口红.png', 1, '2023-12-16 15:50:30', 2282, 231, 2),
(441, '美妆蛋', 47.00, 47.00, 'products/美妆蛋.png', 1, '2023-12-16 15:51:12', 2281, 151, 4),
(442, '派尼美特包包', 400.00, 399.00, 'products/派尼美特包包.png', 1, '2023-12-16 15:52:13', 2291, 512, 3),
(443, '白衬衣', 63.00, 62.00, 'products/白衬衣.png', 1, '2023-12-16 16:14:03', 2211, 63, 6),
(444, '冲锋衣', 599.00, 599.00, 'products/冲锋衣.png', 1, '2023-12-16 16:14:34', 2211, 73, 9),
(445, '耳坠', 672.00, 670.00, 'products/耳坠.png', 1, '2023-12-16 16:15:04', 2242, 63, 7),
(446, '翡翠手镯', 1998.00, 1990.00, 'products/翡翠手镯.png', 1, '2023-12-16 16:16:55', 2303, 13, 0),
(447, '玉佩', 9899.00, 9899.00, 'products/玉佩.png', 1, '2023-12-16 16:19:11', 2303, 63, 4),
(448, '棉袜', 9.90, 5.90, 'products/棉袜.png', 1, '2023-12-16 16:20:37', 2212, 72, 1),
(449, '健胃消食片', 10.00, 9.90, 'products/健胃消食片.png', 0, '2023-12-16 16:40:50', 2301, 73, 2),
(450, '皮鞋', 459.00, 448.00, 'products/1/small_00.jpg', 0, '2024-05-11 14:52:33', 2262, 24, 13);

-- --------------------------------------------------------

--
-- 表的结构 `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `shoppingcart_id` int(11) NOT NULL COMMENT '购物车编号',
  `shoppingcart_pid` int(11) DEFAULT NULL COMMENT '购物车中商品编号',
  `shoppingcart_pname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '购物车中商品名称',
  `shoppingcart_pimage` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '购物车中商品图片',
  `shoppingcart_pprice` double(8,2) DEFAULT NULL COMMENT '购物车中商品价格',
  `shoppingcart_pcount` int(11) DEFAULT NULL COMMENT '购物车中商品数量',
  `shoppingcart_ptotal` double(8,2) DEFAULT NULL COMMENT '购物车中单项商品总价',
  `shoppingcart_uid` int(11) NOT NULL COMMENT '购物车所属用户编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `shoppingcart`
--

INSERT INTO `shoppingcart` (`shoppingcart_id`, `shoppingcart_pid`, `shoppingcart_pname`, `shoppingcart_pimage`, `shoppingcart_pprice`, `shoppingcart_pcount`, `shoppingcart_ptotal`, `shoppingcart_uid`) VALUES
(601, 401, '毛衣', 'products/毛衣.png', 98.00, 1, 98.00, 1);

--
-- 触发器 `shoppingcart`
--
DELIMITER $$
CREATE TRIGGER `add_shoppingcartProduct` BEFORE INSERT ON `shoppingcart` FOR EACH ROW SET new.shoppingcart_pname=(SELECT product_name FROM product
WHERE product_id = new.shoppingcart_pid), 
new.shoppingcart_pimage=(SELECT product_image FROM product
WHERE product_id = new.shoppingcart_pid),
new.shoppingcart_pprice=(SELECT product_specialprice FROM product
WHERE product_id = new.shoppingcart_pid),
new.shoppingcart_ptotal=new.shoppingcart_pcount*new.shoppingcart_pprice
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `sortfirst`
--

CREATE TABLE `sortfirst` (
  `sortfirst_id` int(11) NOT NULL COMMENT '商品一级分类编号',
  `sortfirst_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品一级分类名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sortfirst`
--

INSERT INTO `sortfirst` (`sortfirst_id`, `sortfirst_name`) VALUES
(2101, '服饰'),
(2102, '食品'),
(2103, '电子'),
(2104, '饰品'),
(2105, '洗护'),
(2106, '鞋靴'),
(2107, '图书'),
(2108, '美妆'),
(2109, '箱包'),
(2110, '医药');

-- --------------------------------------------------------

--
-- 表的结构 `sortsecond`
--

CREATE TABLE `sortsecond` (
  `sortsecond_id` int(11) NOT NULL COMMENT '商品二级分类编号',
  `sortsecond_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品二级分类名称',
  `sortsecond_sortfid` int(11) DEFAULT NULL COMMENT '商品所属一级分类'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sortsecond`
--

INSERT INTO `sortsecond` (`sortsecond_id`, `sortsecond_name`, `sortsecond_sortfid`) VALUES
(2211, '上装', 2101),
(2212, '下装', 2101),
(2221, '生鲜', 2102),
(2222, '零食', 2102),
(2231, '手机', 2103),
(2232, '电脑', 2103),
(2241, '项链', 2104),
(2242, '耳饰', 2104),
(2251, '洗发', 2105),
(2252, '洗衣', 2105),
(2261, '凉鞋', 2106),
(2262, '运动鞋', 2106),
(2271, '绘本', 2107),
(2272, '工具书', 2107),
(2281, '粉底', 2108),
(2282, '口红', 2108),
(2291, '双肩包', 2109),
(2292, '旅行箱', 2109),
(2301, '消化不良', 2110),
(2302, '抗菌消炎', 2110),
(2303, '首饰', 2104);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `user_password` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户密码',
  `user_realname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户真实姓名',
  `user_Email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户邮箱',
  `user_phone` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户电话',
  `user_address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户地址',
  `user_gender` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_password`, `user_realname`, `user_Email`, `user_phone`, `user_address`, `user_gender`) VALUES
(1, 'Sariel', '777', '齐七', '777@777', '77777', '7road', '男'),
(2, 'Evan', '666', '陆六', '666@666', '66666', '6road', '女'),
(3, 'Charlie', '555', '查理', '555@555', '55555', '5road', '女'),
(4, 'Alen', '123456', '靓女', '123456@Alen', '8008800', '510-4', '男'),
(5, 'Syy', '654321', '嘿嘿！', '654321@syy', '758927589', '510-3', '男'),
(6, 'Sjh', '123123', '老三', '123123@sjh', '274789448', '510-1', '女'),
(8, 'cc', '123', '九九', '321@qq.com', '123456', '510', '女'),
(9, 'kk', '123', '', '', '', '', '男'),
(10, 'hh', '123', '洋洋', '1319922@qq.com', '44445555', 'road9', '男'),
(11, 'yyy', '123', '小明', '1319922@qq.com', '77777777', 'road10', '男');

-- --------------------------------------------------------

--
-- 表的结构 `user_activity_logs`
--

CREATE TABLE `user_activity_logs` (
  `id` int(20) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activity_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activity_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `user_activity_logs`
--

INSERT INTO `user_activity_logs` (`id`, `user_name`, `activity_type`, `category`, `ip_address`, `activity_time`, `quantity`, `price`, `product_id`) VALUES
(1, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 06:43:20', NULL, NULL, NULL),
(2, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 07:01:49', NULL, NULL, NULL),
(3, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 07:20:21', NULL, NULL, NULL),
(4, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 08:07:40', NULL, NULL, NULL),
(5, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 08:12:58', NULL, NULL, NULL),
(6, 'kk', 'LOGOUT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 08:13:00', NULL, NULL, NULL),
(7, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 08:29:53', NULL, NULL, NULL),
(8, 'kk', 'LOGOUT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 08:41:53', NULL, NULL, NULL),
(9, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 10:34:42', NULL, NULL, NULL),
(10, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 12:18:01', NULL, NULL, NULL),
(11, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 12:24:48', NULL, NULL, NULL),
(12, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 12:26:25', NULL, NULL, NULL),
(13, 'kk', 'LOGOUT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 12:26:39', NULL, NULL, NULL),
(14, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 12:27:37', NULL, NULL, NULL),
(15, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 12:29:23', NULL, NULL, NULL),
(16, 'kk', 'LOGOUT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 12:29:24', NULL, NULL, NULL),
(17, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 12:32:11', NULL, NULL, NULL),
(18, 'kk', 'VISIT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-14 12:32:12', NULL, NULL, 401),
(19, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 04:02:00', NULL, NULL, NULL),
(20, 'kk', 'VISIT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 04:02:01', NULL, NULL, 402),
(21, 'kk', 'shoppingcar', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 04:02:03', 1, 9999, 402),
(22, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 04:45:13', NULL, NULL, NULL),
(23, 'kk', 'VISIT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 04:46:01', NULL, NULL, 401),
(24, 'kk', 'shoppingcar', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 04:46:03', 1, 98, 401),
(25, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 05:10:42', NULL, NULL, NULL),
(26, 'kk', 'VISIT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 05:10:45', NULL, NULL, 401),
(27, 'kk', 'shoppingcar', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 05:10:46', 1, 98, 401),
(28, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 05:37:34', NULL, NULL, NULL),
(29, 'kk', 'VISIT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 05:37:35', NULL, NULL, 402),
(30, 'kk', 'shoppingcar', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 05:37:36', 1, 9999, 402),
(31, 'kk', 'shoppingcar', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 05:37:42', 1, 9999, 402),
(32, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 05:41:01', NULL, NULL, NULL),
(33, 'kk', 'VISIT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 05:41:02', NULL, NULL, 426),
(34, 'kk', 'shoppingcar', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 05:41:03', 1, 266, 426),
(35, 'kk', 'shopping', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 05:41:19', 1, 266, 426),
(36, 'cc', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 06:50:30', NULL, NULL, NULL),
(37, 'cc', 'Search:鞋子', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 06:50:38', NULL, NULL, NULL),
(38, 'cc', 'Search:凉鞋', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 06:50:58', NULL, NULL, NULL),
(39, 'cc', 'Search:男士凉鞋', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 06:51:13', NULL, NULL, NULL),
(40, 'cc', 'VISIT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 06:51:14', NULL, NULL, 424),
(41, 'cc', 'shoppingcar', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 06:51:17', 1, 120, 424),
(42, 'cc', 'shopping', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 06:51:33', 1, 120, 424),
(43, 'cc', 'shopping', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 06:51:36', 1, 120, 424),
(44, 'cc', 'LOGOUT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 06:52:17', NULL, NULL, NULL),
(45, 'kk', 'LOGIN', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 07:52:01', NULL, NULL, NULL),
(46, 'kk', 'VISIT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 07:52:02', NULL, NULL, 401),
(47, 'kk', 'VISIT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 07:52:15', NULL, NULL, 401),
(48, 'kk', 'shoppingcar', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 07:52:28', 1, 98, 401),
(49, 'kk', 'shopping', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 07:52:34', 1, 98, 401),
(50, 'kk', 'VISIT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 07:52:52', NULL, NULL, 401),
(51, 'kk', 'shoppingcar', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 07:52:53', 1, 98, 401),
(52, 'kk', 'shopping', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 07:52:57', 1, 98, 401),
(53, 'kk', 'VISIT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 07:55:18', NULL, NULL, 401),
(54, 'kk', 'VISIT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 07:55:45', NULL, NULL, 402),
(55, 'kk', 'VISIT', '用户行为', '0:0:0:0:0:0:0:1', '2024-05-15 07:56:06', NULL, NULL, 402);

--
-- 转储表的索引
--

--
-- 表的索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`) USING BTREE;

--
-- 表的索引 `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`business_id`),
  ADD KEY `business_business_id_index` (`business_id`);

--
-- 表的索引 `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`) USING BTREE,
  ADD KEY `message_uid` (`message_uid`) USING BTREE;

--
-- 表的索引 `operation_logs`
--
ALTER TABLE `operation_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- 表的索引 `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`) USING BTREE,
  ADD KEY `order_uid` (`order_uid`) USING BTREE;

--
-- 表的索引 `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`orderitem_id`) USING BTREE,
  ADD KEY `orderitem_oid` (`orderitem_oid`) USING BTREE,
  ADD KEY `orderitem_pid` (`orderitem_pid`) USING BTREE;

--
-- 表的索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`) USING BTREE,
  ADD KEY `product_sort` (`product_sort`) USING BTREE;

--
-- 表的索引 `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`shoppingcart_id`) USING BTREE,
  ADD KEY `shoppingcart_uid` (`shoppingcart_uid`) USING BTREE,
  ADD KEY `shoppingcart_pid` (`shoppingcart_pid`) USING BTREE;

--
-- 表的索引 `sortfirst`
--
ALTER TABLE `sortfirst`
  ADD PRIMARY KEY (`sortfirst_id`) USING BTREE;

--
-- 表的索引 `sortsecond`
--
ALTER TABLE `sortsecond`
  ADD PRIMARY KEY (`sortsecond_id`) USING BTREE,
  ADD KEY `sortsecont_sortfid` (`sortsecond_sortfid`) USING BTREE;

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- 表的索引 `user_activity_logs`
--
ALTER TABLE `user_activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_name` (`user_name`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员编号', AUTO_INCREMENT=104;

--
-- 使用表AUTO_INCREMENT `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言编号', AUTO_INCREMENT=92;

--
-- 使用表AUTO_INCREMENT `operation_logs`
--
ALTER TABLE `operation_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `orderitem_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '详单编号', AUTO_INCREMENT=339;

--
-- 使用表AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品编号', AUTO_INCREMENT=451;

--
-- 使用表AUTO_INCREMENT `shoppingcart`
--
ALTER TABLE `shoppingcart`
  MODIFY `shoppingcart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车编号', AUTO_INCREMENT=610;

--
-- 使用表AUTO_INCREMENT `sortfirst`
--
ALTER TABLE `sortfirst`
  MODIFY `sortfirst_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品一级分类编号', AUTO_INCREMENT=2111;

--
-- 使用表AUTO_INCREMENT `sortsecond`
--
ALTER TABLE `sortsecond`
  MODIFY `sortsecond_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品二级分类编号', AUTO_INCREMENT=2304;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id', AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `user_activity_logs`
--
ALTER TABLE `user_activity_logs`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- 限制导出的表
--

--
-- 限制表 `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`message_uid`) REFERENCES `user` (`user_id`);

--
-- 限制表 `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`order_uid`) REFERENCES `user` (`user_id`);

--
-- 限制表 `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`orderitem_pid`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `orderitem_ibfk_3` FOREIGN KEY (`orderitem_oid`) REFERENCES `order` (`order_id`);

--
-- 限制表 `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_sort`) REFERENCES `sortsecond` (`sortsecond_id`);

--
-- 限制表 `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD CONSTRAINT `shoppingcart_ibfk_1` FOREIGN KEY (`shoppingcart_uid`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `shoppingcart_ibfk_2` FOREIGN KEY (`shoppingcart_pid`) REFERENCES `product` (`product_id`);

--
-- 限制表 `sortsecond`
--
ALTER TABLE `sortsecond`
  ADD CONSTRAINT `sortsecond_ibfk_1` FOREIGN KEY (`sortsecond_sortfid`) REFERENCES `sortfirst` (`sortfirst_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
