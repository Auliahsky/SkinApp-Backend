-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2021 at 03:17 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_skinapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_cart`
--

CREATE TABLE `tb_cart` (
  `id_crprod` int(11) NOT NULL,
  `nm_crprod` varchar(100) NOT NULL,
  `merk_crprod` varchar(100) NOT NULL,
  `quantity_crprod` int(2) NOT NULL,
  `hrg_crprod` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_cart`
--

INSERT INTO `tb_cart` (`id_crprod`, `nm_crprod`, `merk_crprod`, `quantity_crprod`, `hrg_crprod`, `total`) VALUES
(1, 'North', 'Oriflame', 2, '5000', '10000'),
(2, 'FoundationSPF20_Oriflame', 'Oriflame', 1, '199000', '199000');

-- --------------------------------------------------------

--
-- Table structure for table `tb_myorderpage`
--

CREATE TABLE `tb_myorderpage` (
  `id_order` int(11) NOT NULL,
  `alm_order` varchar(100) NOT NULL,
  `gb_order` varchar(100) NOT NULL,
  `color_order` varchar(100) NOT NULL,
  `size_order` varchar(50) NOT NULL,
  `quantity_order` varchar(50) NOT NULL,
  `hrga_order` varchar(100) NOT NULL,
  `order_id` int(100) NOT NULL,
  `order_time` datetime NOT NULL,
  `order_payment` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_prod`
--

CREATE TABLE `tb_prod` (
  `id_prod` int(11) NOT NULL,
  `nm_prod` varchar(50) NOT NULL,
  `detail_prod` text NOT NULL,
  `hrg_prod` varchar(50) NOT NULL,
  `gb_prod` varchar(200) NOT NULL,
  `merk_prod` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_prod`
--

INSERT INTO `tb_prod` (`id_prod`, `nm_prod`, `detail_prod`, `hrg_prod`, `gb_prod`, `merk_prod`) VALUES
(1, 'FoundationSPF20_Oriflame', 'Foundation ringan dengan coverage medium untuk kulit tampak berseri alami, terasa sejuk, nyaman terhidrasi.', '199000', 'https://ecs7.tokopedia.net/img/cache/700/product-1/2018/12/23/4957205/4957205_4e317dc0-5c89-4816-84c1-77c00dad879a_579_579.jpg', 'Oriflame'),
(2, 'FacePowder_Oriflame', 'Colourbox face powder hadir dalam dua warna dengan formula untuk rasa nyaman tidak kering. Membantu menjaga dari kilap!', '34900', 'https://ecs7.tokopedia.net/img/cache/700/VqbcmM/2020/10/21/c14c830e-8aa7-4f9a-b647-72065acde809.jpg\r\n', 'Oriflame'),
(3, 'TheOnePowder_Oriflame', 'The ONE adalah merek kosmetik fungsional yang menjawab semua keinginan Anda akan warna-warna terkini, inovasi, inspirasi, dan saran-saran ahli. ', '209000', 'https://theregaldiaries.files.wordpress.com/2016/02/ca23xiwuyaaqyy.jpg?w=640', 'Oriflame'),
(4, 'NovAgeSerum_Oriflame', 'Serum berperforma andal dengan kebaikan ekstrak silk tree dan InstantGlow Complex. Merawat kehalusan kulit, membuatnya tampak berkilau.', '525000', 'https://ecs7.tokopedia.net/img/cache/700/product-1/2019/2/24/3216052/3216052_e860f9f8-7773-4281-a2c3-31f0dd120c41_337_337.jpg', 'Oriflame'),
(5, 'HydratingDayCream_Oriflame', 'Krim yang menghidrasi, menjadikan kulit terasa lembut, kenyal dan segar. Dengan paduan bahan alami khas Swedia, red algae dan brown algae.', '229000', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAAxx8izeC9lyCVeDUiUnH7vP6kAUlhDy9MA&usqp=CAU', 'Oriflame'),
(6, 'PureSkinToner_Oriflame', 'Toner penyegar yang mengangkat jejak akhir kotoran setelah pembersih. Dengan formulasi ekstrak pomegranate alami dan Detect Technology.', '125000', 'https://image.femaledaily.com/dyn/640/images/prod-pics/502041272070a4ae7e02be86f7d1b98a.jpg', 'Oriflame'),
(7, 'CleansingAloeVera_Oriflame', 'Busa pembersih ringan dengan ekstrak aloe vera yang menyegarkan.', '94900', 'https://media.karousell.com/media/photos/products/2018/02/19/love_nature_cleansing_gel_aloe_vera_by_oriflame_1519035236_89e3c833.jpg', 'Oriflame'),
(8, 'FoamingCleanser_Oriflame', 'Pembersih busa dengan tekstur krim yang membersihkan dengan lembut dan membantu menyamarkan bintik hitam untuk membantu mengungkap rona wajah.', '149000', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0zwaWQ7KepdCcF859WjHdWdTTw3sSYw7ofg&usqp=CAU\r\n', 'Oriflame'),
(9, 'MenFaceWash_Oriflame', 'Sabun dan scrub pembersih wajah menyegarkan dengan kebaikan Polar White Complex yang membersihkan kulit secara mendalam dan mengangkat kotoran.', '99900', 'https://images-na.ssl-images-amazon.com/images/I/613-ixLJxEL._SL1200_.jpg', 'Oriflame'),
(10, 'CleanserPapaya_Oriflame', 'Pembersih dengan aroma buah tropis dan ekstrak pepaya yang menyegarkan – pembersih yang membantu memberikan kesegaran.', '39900', 'https://id-test-11.slatic.net/p/0f1359b05560ad4eae6a336f693cf635.jpg', 'Oriflame'),
(11, 'Masker_Oriflame', 'Bukan cuma kita yg bisa stress, kulit juga bisa lho. Aku rekomendasiin nih masker yg bisa bikin kulit fresh tanpa repot, tanpa perlu waktu lama.', '25000', 'https://media.karousell.com/media/photos/products/2019/09/02/masker_wajah_oriflame_1567373507_0b658df3_progressive.jpg', 'Oriflame'),
(12, 'HairXMasker_Oriflame', 'Masker rambut kaya nutrisi, diformulasikan khusus untuk merawat dan menjaga kesegaran rambut yang rusak dan menjaga kesegaran kulit kepala.', '169000', 'https://ecs7.tokopedia.net/img/cache/700/product-1/2018/12/12/4989967/4989967_9553ddc4-d380-4362-8ce9-5bb74c79bb83_1080_1080.jpg', 'Oriflame'),
(13, 'LovingCareLotion_Oriflame', 'Lotion lembut yang menutrisi untuk digunakan Anda sekeluarga. Formula pH seimbang yang lembut menutrisi kulit agar tidak mudah kering.', '159000', 'https://4.imimg.com/data4/NW/HQ/ANDROID-67570862/product-500x500.jpeg', 'Oriflame'),
(14, 'LipBalm_Oriflame', 'Lip balm dengan 3 pilihan aroma mango, coconut & melon ini siap melembabkan dan merawat bibir anda agar tidak kering, atau pecah pecah.', '21666', 'https://s2.bukalapak.com/img/7605349702/large/Oriflame_Love_Nature_Lip_Balm_Ori.jpg', 'Oriflame'),
(15, 'BBLipBalm_Oriflame', 'Beauty balm yang membantu membuat bibir tampak cerah, terasa sejuk dan menjaga kelembapannya. Hidrasi tahan lama hingga 24 jam.', '115000', 'https://ecs7.tokopedia.net/img/cache/700/product-1/2020/2/9/7753367/7753367_41c25399-7cff-4b34-8ac3-1de786685b03_1080_1080.jpg', 'Oriflame'),
(16, 'LipSpa_Oriflame', 'Seperti memanjakan bibir Anda di spa! Ultra-conditioning double core lip balm dengan SPF 8 dan sentuhan cantik warna lembut.', '99900', 'https://ecs7.tokopedia.net/img/cache/700/VqbcmM/2020/9/3/8995e43a-d3e0-4d88-93a8-46117803e188.jpg', 'Oriflame'),
(17, 'FacialTreatment_RK', 'Manfaat RK Treatment* 1.Wajah bersih dan lembab., Facial wajah memiliki fungsi untuk membuat kulit wajah lebih bersih dan lebih lembap.', '90000', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7fMp-aFA216Ka9l8HBDfCAeHSk3Q5Wdvv_w&usqp=CAU', 'RK'),
(18, 'AcneSeries_RK', 'RK GLOW Adalah perawatan wajah yang ampuh serta telah teruji Klinis & telah BPOM. RK GLOW cocok menemani perawatan Anda Masa Kini dari segala kalangan.', '210000', 'https://s4.bukalapak.com/img/4496814983/large/image.jpg', 'RK'),
(19, 'RedJelly_RK', 'RED Jelly PremiumKrim wajah berbentuk gelYang punya sejuta manfaat- Anti aging- mencerahkan kulit wajah- membuat wajah bercahaya- meremajakan kulit.', '80000', 'https://s3.bukalapak.com/img/8166362315/large/image.jpg', 'RK'),
(20, 'BeautyLotion_RK', 'Beauty Lotion produk kecantikan yang membuat kulit halus lembut dan wangi seketika tanpa ribet, dilengkapi formula whitening.', '120000', 'https://ecs7.tokopedia.net/img/cache/700/product-1/2018/12/2/183385/183385_03bb0cc3-b990-4e80-9daa-8bbf192f5815_700_700.jpg', 'RK'),
(21, 'LipTint_RK', 'RK Liptint by ANJ KOSMETIK Viral, Manfaat dari liptint RK, yaitu Liptint RK ini bisa bertahan 5-6 jam tanpa adanya efek bibir pecah2 dan lainnya. ', '55000', 'https://i.ytimg.com/vi/La1IdsYVJN8/hqdefault.jpg', 'RK'),
(22, 'VitCollagen_RK', 'RK VIT COLLAGEN rasa AVOCADO, Berikut Fungsi & Manfaatnya : Mencukupi kebutuhan serat Anda; Menjaga & Meningkatkan kesehatan jantung anda; Membersihkan lemak didalam darah maupun jaringan pembuluh darah. ', '250000', 'https://media.karousell.com/media/photos/products/2019/06/03/rk_vit_collagen_1559567516_5a7d6ed0_progressive.jpg', 'RK'),
(23, 'LipMatte_RK', 'RK lip Cream Matte tahan lama dan gak dempul dipake, tahan air, warnanya cantik-cantik dan soft banget, tersedia 5 varian Warna.', '65000', 'https://ecs7.tokopedia.net/img/cache/300/product-1/2020/7/11/8965389/8965389_2561f6f2-2a29-48f9-8eaa-18cee53b67b9_720_720.jpg', 'RK'),
(24, 'Cushion_RK', 'RK Cushion, memberikan efek lebih cerah, melindungi dari sinar UV dengan tekstur ringan dan daya tutup tinggi, menyamarkan noda di wajah.', '150000', 'https://miro.medium.com/max/1024/1*VOpH8xVLFJe2kVeGgYQCVw.jpeg', 'RK'),
(25, 'BeautyScrub_RK', 'BEAUTY SCRUB VIRAL BY RK COSMETICS, merupakan produk dari Kosmetics Viral PT ANJ kerabat dari RK Glow. Manfaat Beauty Scrub (Lulur) pada tubuh, Scrub dapat membantu mengangkat sel kulit mati sekaligus mematikan beragam debu dan kotoran lainnya.', '120000', 'https://s4.bukalapak.com/img/90757094532/s-330-330/data.jpeg.webp', 'RK'),
(28, 'Suplemen_MorningPower', 'Untuk nafsu makan', 'Rp94,900', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//80/MTA-3134132/fkc_fkc-morning-power---suplemen-nutrisi-100--alami_full03.jpg', 'Morning Power');

-- --------------------------------------------------------

--
-- Table structure for table `tb_profdok`
--

CREATE TABLE `tb_profdok` (
  `id_dok` int(11) NOT NULL,
  `nm_dok` varchar(100) NOT NULL,
  `spes_dok` varchar(100) NOT NULL,
  `klinik_dok` varchar(100) NOT NULL,
  `nope_dok` int(30) NOT NULL,
  `about_dok` text NOT NULL,
  `schedule_dok` datetime NOT NULL,
  `gb_dok` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_profdok`
--

INSERT INTO `tb_profdok` (`id_dok`, `nm_dok`, `spes_dok`, `klinik_dok`, `nope_dok`, `about_dok`, `schedule_dok`, `gb_dok`) VALUES
(1, 'dr. Diana Muchsin', 'Skin (Kulit)', 'Makassar', 0, 'dr. Diana adalah seorang dokter spesialis kulit sekaligus dosen pengajar di UIN Alauddin Makassar', '2021-01-12 07:39:56', 'https://www.honestdocs.id/system/blog_articles/main_hero_images/000/005/310/medium/iStock-913714110_%281%29.jpg'),
(2, 'dr. Fanny\r\n', 'Skin', 'Makassar', 0, 'dr. Fanny adalah seorang dokter spesialis kulit sekaligus dosen pengajar di UIN Alauddin Makassar', '2021-01-14 07:39:56', 'https://asset.kompas.com/crops/nO1skkIdLelqzqC3fEIOFQpxdUo=/338x0:1850x756/750x500/data/photo/2019/05/07/823404649.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kodepos` varchar(100) NOT NULL,
  `nope` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `fullname`, `email`, `password`, `alamat`, `kodepos`, `nope`) VALUES
(1, 'firda', 'firda123@gmail.com', '$2y$10$CaybYXrgn2plOaagNgexKOOmdFKYKMVtrAw5RnP8fKw4T49uCpkXS', '', '', 2147483647),
(2, 'admin1', 'admin1@gmail.com', '$2y$10$L6glAbD5AYTiWVM3frM26.cBIuL3IwwDWw11Jm8iRlno3LtNBIona', '', '', 123),
(3, 'rika', 'rikarahim@gmail.com', '$2y$10$4qEVyEzJd/em8pAONJdu.e/oQpn4e8dYVz.AIpM4rf4R1NcOfBrhe', '', '', 823456789),
(4, 'admin13', 'admin13@gmail.com', '$2y$10$96W2A5QpX3A.2XXQV1ZZaO80P3BIeX1qVpeb8YRPCRDLTP.zb2qvq', '', '', 123);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_cart`
--
ALTER TABLE `tb_cart`
  ADD PRIMARY KEY (`id_crprod`);

--
-- Indexes for table `tb_myorderpage`
--
ALTER TABLE `tb_myorderpage`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `tb_prod`
--
ALTER TABLE `tb_prod`
  ADD PRIMARY KEY (`id_prod`);

--
-- Indexes for table `tb_profdok`
--
ALTER TABLE `tb_profdok`
  ADD PRIMARY KEY (`id_dok`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_cart`
--
ALTER TABLE `tb_cart`
  MODIFY `id_crprod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_myorderpage`
--
ALTER TABLE `tb_myorderpage`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_prod`
--
ALTER TABLE `tb_prod`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tb_profdok`
--
ALTER TABLE `tb_profdok`
  MODIFY `id_dok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
