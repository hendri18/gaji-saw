-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 07, 2024 at 03:49 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gaji_saw`
--

-- --------------------------------------------------------

--
-- Table structure for table `crips`
--

CREATE TABLE `crips` (
  `id` bigint UNSIGNED NOT NULL,
  `kriteria_id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nilai` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crips`
--

INSERT INTO `crips` (`id`, `kriteria_id`, `nama`, `nilai`) VALUES
(1, 1, 'Kurang dari 10', 1),
(2, 1, 'Lebih dari 10', 2),
(3, 2, '20%', 1),
(4, 2, '40%', 2),
(5, 2, '60%', 3),
(6, 2, '80%', 4),
(7, 2, '90% >', 5),
(8, 3, 'SMA/SMK', 1),
(9, 3, 'S1', 2),
(10, 3, 'S2', 3),
(11, 4, '0 - 1 Tahun', 1),
(12, 4, '1 - 2 Tahun', 2),
(13, 4, '2 - 4 Tahun', 3),
(14, 4, '4 Tahun lebih', 4),
(15, 5, 'Tidak Ada', 1),
(16, 5, '1', 2),
(17, 5, '2', 3),
(18, 5, '3', 4),
(19, 5, 'lebih dari 3', 5);

-- --------------------------------------------------------

--
-- Table structure for table `histori`
--

CREATE TABLE `histori` (
  `id` bigint UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `columns` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `karyawan_kriteria` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalization` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rankings` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `histori`
--

INSERT INTO `histori` (`id`, `tanggal`, `columns`, `karyawan_kriteria`, `normalization`, `rankings`) VALUES
(1, '2024-02-21', '[{\"title\":\"Nama\"},{\"title\":\"Absensi\",\"kriteria_id\":1,\"bobot\":10,\"type\":\"cost\"},{\"title\":\"Kinerja\",\"kriteria_id\":2,\"bobot\":30,\"type\":\"benefit\"},{\"title\":\"Pendidikan\",\"kriteria_id\":3,\"bobot\":10,\"type\":\"benefit\"},{\"title\":\"Masa Kerja\",\"kriteria_id\":4,\"bobot\":30,\"type\":\"benefit\"},{\"title\":\"Jumlah Tanggungan\",\"kriteria_id\":5,\"bobot\":20,\"type\":\"benefit\"}]', '{\"1\":[{\"key\":\"Agus\",\"value\":\"Agus\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":4,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"2\":[{\"key\":\"Doni\",\"value\":\"Doni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":4,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"3\":[{\"key\":\"Prama\",\"value\":\"Prama\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"4\":[{\"key\":\"Clifford\",\"value\":\"Clifford\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"5\":[{\"key\":\"Ahlam\",\"value\":\"Ahlam\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"60%\",\"value\":3,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"6\":[{\"key\":\"Asep Angga\",\"value\":\"Asep Angga\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"7\":[{\"key\":\"Daniel\",\"value\":\"Daniel\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"8\":[{\"key\":\"Fahmi Shiddiq\",\"value\":\"Fahmi Shiddiq\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"9\":[{\"key\":\"Feri\",\"value\":\"Feri\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"10\":[{\"key\":\"Henry\",\"value\":\"Henry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"11\":[{\"key\":\"Irhas\",\"value\":\"Irhas\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"12\":[{\"key\":\"Julius\",\"value\":\"Julius\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"13\":[{\"key\":\"Leni\",\"value\":\"Leni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"14\":[{\"key\":\"Rakha\",\"value\":\"Rakha\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"15\":[{\"key\":\"Tetty\",\"value\":\"Tetty\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"16\":[{\"key\":\"Anthonius\",\"value\":\"Anthonius\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"17\":[{\"key\":\"Derry\",\"value\":\"Derry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"18\":[{\"key\":\"Fabian\",\"value\":\"Fabian\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"3\",\"value\":4,\"kriteria_id\":5}],\"19\":[{\"key\":\"Fandi\",\"value\":\"Fandi\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"20\":[{\"key\":\"Nicholas\",\"value\":\"Nicholas\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}]}', '{\"1\":[{\"key\":\"Agus\",\"value\":\"Agus\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":1,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"2\":[{\"key\":\"Doni\",\"value\":\"Doni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":1,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"3\":[{\"key\":\"Prama\",\"value\":\"Prama\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"4\":[{\"key\":\"Clifford\",\"value\":\"Clifford\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"5\":[{\"key\":\"Ahlam\",\"value\":\"Ahlam\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"60%\",\"value\":0.6,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"6\":[{\"key\":\"Asep Angga\",\"value\":\"Asep Angga\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"7\":[{\"key\":\"Daniel\",\"value\":\"Daniel\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"8\":[{\"key\":\"Fahmi Shiddiq\",\"value\":\"Fahmi Shiddiq\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"9\":[{\"key\":\"Feri\",\"value\":\"Feri\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"10\":[{\"key\":\"Henry\",\"value\":\"Henry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"11\":[{\"key\":\"Irhas\",\"value\":\"Irhas\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"12\":[{\"key\":\"Julius\",\"value\":\"Julius\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"13\":[{\"key\":\"Leni\",\"value\":\"Leni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"14\":[{\"key\":\"Rakha\",\"value\":\"Rakha\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"15\":[{\"key\":\"Tetty\",\"value\":\"Tetty\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"16\":[{\"key\":\"Anthonius\",\"value\":\"Anthonius\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"17\":[{\"key\":\"Derry\",\"value\":\"Derry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"18\":[{\"key\":\"Fabian\",\"value\":\"Fabian\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"3\",\"value\":1,\"kriteria_id\":5}],\"19\":[{\"key\":\"Fandi\",\"value\":\"Fandi\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"20\":[{\"key\":\"Nicholas\",\"value\":\"Nicholas\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}]}', '[{\"nama\":\"Agus\",\"total\":0.95,\"rank\":1,\"percentage\":95,\"salary_increase\":\"Rp. 400.000,00\"},{\"nama\":\"Doni\",\"total\":0.9,\"rank\":2,\"percentage\":90,\"salary_increase\":\"Rp. 400.000,00\"},{\"nama\":\"Fabian\",\"total\":0.87,\"rank\":3,\"percentage\":87,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Tetty\",\"total\":0.77,\"rank\":4,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Prama\",\"total\":0.77,\"rank\":5,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Leni\",\"total\":0.77,\"rank\":6,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Anthonius\",\"total\":0.77,\"rank\":7,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Daniel\",\"total\":0.72,\"rank\":8,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Fahmi Shiddiq\",\"total\":0.72,\"rank\":9,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Julius\",\"total\":0.72,\"rank\":10,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Derry\",\"total\":0.72,\"rank\":11,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Fandi\",\"total\":0.72,\"rank\":12,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Henry\",\"total\":0.7,\"rank\":13,\"percentage\":70,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Nicholas\",\"total\":0.7,\"rank\":14,\"percentage\":70,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Clifford\",\"total\":0.67,\"rank\":15,\"percentage\":67,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Asep Angga\",\"total\":0.64,\"rank\":16,\"percentage\":64,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Irhas\",\"total\":0.59,\"rank\":17,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Feri\",\"total\":0.59,\"rank\":18,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Rakha\",\"total\":0.59,\"rank\":19,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Ahlam\",\"total\":0.53,\"rank\":20,\"percentage\":53,\"salary_increase\":\"Rp. 210.000,00\"}]'),
(2, '2024-02-23', '[{\"title\":\"Nama\"},{\"title\":\"Absensi\",\"kriteria_id\":1,\"bobot\":10,\"type\":\"cost\"},{\"title\":\"Kinerja\",\"kriteria_id\":2,\"bobot\":30,\"type\":\"benefit\"},{\"title\":\"Pendidikan\",\"kriteria_id\":3,\"bobot\":10,\"type\":\"benefit\"},{\"title\":\"Masa Kerja\",\"kriteria_id\":4,\"bobot\":30,\"type\":\"benefit\"},{\"title\":\"Jumlah Tanggungan\",\"kriteria_id\":5,\"bobot\":20,\"type\":\"benefit\"}]', '{\"1\":[{\"key\":\"Agus\",\"value\":\"Agus\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":4,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"2\":[{\"key\":\"Doni\",\"value\":\"Doni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":4,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"3\":[{\"key\":\"Prama\",\"value\":\"Prama\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"4\":[{\"key\":\"Clifford\",\"value\":\"Clifford\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"5\":[{\"key\":\"Ahlam\",\"value\":\"Ahlam\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"60%\",\"value\":3,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"6\":[{\"key\":\"Asep Angga\",\"value\":\"Asep Angga\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"7\":[{\"key\":\"Daniel\",\"value\":\"Daniel\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"8\":[{\"key\":\"Fahmi Shiddiq\",\"value\":\"Fahmi Shiddiq\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"9\":[{\"key\":\"Feri\",\"value\":\"Feri\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"10\":[{\"key\":\"Henry\",\"value\":\"Henry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"11\":[{\"key\":\"Irhas\",\"value\":\"Irhas\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"12\":[{\"key\":\"Julius\",\"value\":\"Julius\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"13\":[{\"key\":\"Leni\",\"value\":\"Leni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"14\":[{\"key\":\"Rakha\",\"value\":\"Rakha\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"15\":[{\"key\":\"Tetty\",\"value\":\"Tetty\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"16\":[{\"key\":\"Anthonius\",\"value\":\"Anthonius\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"17\":[{\"key\":\"Derry\",\"value\":\"Derry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"18\":[{\"key\":\"Fabian\",\"value\":\"Fabian\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"3\",\"value\":4,\"kriteria_id\":5}],\"19\":[{\"key\":\"Fandi\",\"value\":\"Fandi\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"20\":[{\"key\":\"Nicholas\",\"value\":\"Nicholas\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}]}', '{\"1\":[{\"key\":\"Agus\",\"value\":\"Agus\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":1,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"2\":[{\"key\":\"Doni\",\"value\":\"Doni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":1,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"3\":[{\"key\":\"Prama\",\"value\":\"Prama\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"4\":[{\"key\":\"Clifford\",\"value\":\"Clifford\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"5\":[{\"key\":\"Ahlam\",\"value\":\"Ahlam\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"60%\",\"value\":0.6,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"6\":[{\"key\":\"Asep Angga\",\"value\":\"Asep Angga\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"7\":[{\"key\":\"Daniel\",\"value\":\"Daniel\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"8\":[{\"key\":\"Fahmi Shiddiq\",\"value\":\"Fahmi Shiddiq\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"9\":[{\"key\":\"Feri\",\"value\":\"Feri\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"10\":[{\"key\":\"Henry\",\"value\":\"Henry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"11\":[{\"key\":\"Irhas\",\"value\":\"Irhas\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"12\":[{\"key\":\"Julius\",\"value\":\"Julius\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"13\":[{\"key\":\"Leni\",\"value\":\"Leni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"14\":[{\"key\":\"Rakha\",\"value\":\"Rakha\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"15\":[{\"key\":\"Tetty\",\"value\":\"Tetty\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"16\":[{\"key\":\"Anthonius\",\"value\":\"Anthonius\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"17\":[{\"key\":\"Derry\",\"value\":\"Derry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"18\":[{\"key\":\"Fabian\",\"value\":\"Fabian\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"3\",\"value\":1,\"kriteria_id\":5}],\"19\":[{\"key\":\"Fandi\",\"value\":\"Fandi\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"20\":[{\"key\":\"Nicholas\",\"value\":\"Nicholas\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}]}', '[{\"nama\":\"Agus\",\"total\":0.95,\"rank\":1,\"percentage\":95,\"salary_increase\":\"Rp. 400.000,00\"},{\"nama\":\"Doni\",\"total\":0.9,\"rank\":2,\"percentage\":90,\"salary_increase\":\"Rp. 400.000,00\"},{\"nama\":\"Fabian\",\"total\":0.87,\"rank\":3,\"percentage\":87,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Tetty\",\"total\":0.77,\"rank\":4,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Prama\",\"total\":0.77,\"rank\":5,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Leni\",\"total\":0.77,\"rank\":6,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Anthonius\",\"total\":0.77,\"rank\":7,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Daniel\",\"total\":0.72,\"rank\":8,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Fahmi Shiddiq\",\"total\":0.72,\"rank\":9,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Julius\",\"total\":0.72,\"rank\":10,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Derry\",\"total\":0.72,\"rank\":11,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Fandi\",\"total\":0.72,\"rank\":12,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Henry\",\"total\":0.7,\"rank\":13,\"percentage\":70,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Nicholas\",\"total\":0.7,\"rank\":14,\"percentage\":70,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Clifford\",\"total\":0.67,\"rank\":15,\"percentage\":67,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Asep Angga\",\"total\":0.64,\"rank\":16,\"percentage\":64,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Irhas\",\"total\":0.59,\"rank\":17,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Feri\",\"total\":0.59,\"rank\":18,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Rakha\",\"total\":0.59,\"rank\":19,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Ahlam\",\"total\":0.53,\"rank\":20,\"percentage\":53,\"salary_increase\":\"Rp. 210.000,00\"}]'),
(3, '2024-02-24', '[{\"title\":\"Nama\"},{\"title\":\"Absensi\",\"kriteria_id\":1,\"bobot\":10,\"type\":\"cost\"},{\"title\":\"Kinerja\",\"kriteria_id\":2,\"bobot\":30,\"type\":\"benefit\"},{\"title\":\"Pendidikan\",\"kriteria_id\":3,\"bobot\":10,\"type\":\"benefit\"},{\"title\":\"Masa Kerja\",\"kriteria_id\":4,\"bobot\":30,\"type\":\"benefit\"},{\"title\":\"Jumlah Tanggungan\",\"kriteria_id\":5,\"bobot\":20,\"type\":\"benefit\"}]', '{\"1\":[{\"key\":\"Agus\",\"value\":\"Agus\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":4,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"2\":[{\"key\":\"Doni\",\"value\":\"Doni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":4,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"3\":[{\"key\":\"Prama\",\"value\":\"Prama\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"4\":[{\"key\":\"Clifford\",\"value\":\"Clifford\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"5\":[{\"key\":\"Ahlam\",\"value\":\"Ahlam\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"60%\",\"value\":3,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"6\":[{\"key\":\"Asep Angga\",\"value\":\"Asep Angga\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"7\":[{\"key\":\"Daniel\",\"value\":\"Daniel\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"8\":[{\"key\":\"Fahmi Shiddiq\",\"value\":\"Fahmi Shiddiq\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"9\":[{\"key\":\"Feri\",\"value\":\"Feri\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"10\":[{\"key\":\"Henry\",\"value\":\"Henry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"11\":[{\"key\":\"Irhas\",\"value\":\"Irhas\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"12\":[{\"key\":\"Julius\",\"value\":\"Julius\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"13\":[{\"key\":\"Leni\",\"value\":\"Leni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"14\":[{\"key\":\"Rakha\",\"value\":\"Rakha\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"15\":[{\"key\":\"Tetty\",\"value\":\"Tetty\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"16\":[{\"key\":\"Anthonius\",\"value\":\"Anthonius\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"17\":[{\"key\":\"Derry\",\"value\":\"Derry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"18\":[{\"key\":\"Fabian\",\"value\":\"Fabian\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"3\",\"value\":4,\"kriteria_id\":5}],\"19\":[{\"key\":\"Fandi\",\"value\":\"Fandi\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"20\":[{\"key\":\"Nicholas\",\"value\":\"Nicholas\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}]}', '{\"1\":[{\"key\":\"Agus\",\"value\":\"Agus\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":1,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"2\":[{\"key\":\"Doni\",\"value\":\"Doni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":1,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"3\":[{\"key\":\"Prama\",\"value\":\"Prama\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"4\":[{\"key\":\"Clifford\",\"value\":\"Clifford\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"5\":[{\"key\":\"Ahlam\",\"value\":\"Ahlam\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"60%\",\"value\":0.6,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"6\":[{\"key\":\"Asep Angga\",\"value\":\"Asep Angga\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"7\":[{\"key\":\"Daniel\",\"value\":\"Daniel\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"8\":[{\"key\":\"Fahmi Shiddiq\",\"value\":\"Fahmi Shiddiq\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"9\":[{\"key\":\"Feri\",\"value\":\"Feri\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"10\":[{\"key\":\"Henry\",\"value\":\"Henry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"11\":[{\"key\":\"Irhas\",\"value\":\"Irhas\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"12\":[{\"key\":\"Julius\",\"value\":\"Julius\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"13\":[{\"key\":\"Leni\",\"value\":\"Leni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"14\":[{\"key\":\"Rakha\",\"value\":\"Rakha\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"15\":[{\"key\":\"Tetty\",\"value\":\"Tetty\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"16\":[{\"key\":\"Anthonius\",\"value\":\"Anthonius\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"17\":[{\"key\":\"Derry\",\"value\":\"Derry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"18\":[{\"key\":\"Fabian\",\"value\":\"Fabian\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"3\",\"value\":1,\"kriteria_id\":5}],\"19\":[{\"key\":\"Fandi\",\"value\":\"Fandi\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"20\":[{\"key\":\"Nicholas\",\"value\":\"Nicholas\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}]}', '[{\"nama\":\"Agus\",\"total\":0.95,\"rank\":1,\"percentage\":95,\"salary_increase\":\"Rp. 400.000,00\"},{\"nama\":\"Doni\",\"total\":0.9,\"rank\":2,\"percentage\":90,\"salary_increase\":\"Rp. 400.000,00\"},{\"nama\":\"Fabian\",\"total\":0.87,\"rank\":3,\"percentage\":87,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Tetty\",\"total\":0.77,\"rank\":4,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Prama\",\"total\":0.77,\"rank\":5,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Leni\",\"total\":0.77,\"rank\":6,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Anthonius\",\"total\":0.77,\"rank\":7,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Daniel\",\"total\":0.72,\"rank\":8,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Fahmi Shiddiq\",\"total\":0.72,\"rank\":9,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Julius\",\"total\":0.72,\"rank\":10,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Derry\",\"total\":0.72,\"rank\":11,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Fandi\",\"total\":0.72,\"rank\":12,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Henry\",\"total\":0.7,\"rank\":13,\"percentage\":70,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Nicholas\",\"total\":0.7,\"rank\":14,\"percentage\":70,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Clifford\",\"total\":0.67,\"rank\":15,\"percentage\":67,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Asep Angga\",\"total\":0.64,\"rank\":16,\"percentage\":64,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Irhas\",\"total\":0.59,\"rank\":17,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Feri\",\"total\":0.59,\"rank\":18,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Rakha\",\"total\":0.59,\"rank\":19,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Ahlam\",\"total\":0.53,\"rank\":20,\"percentage\":53,\"salary_increase\":\"Rp. 210.000,00\"}]');
INSERT INTO `histori` (`id`, `tanggal`, `columns`, `karyawan_kriteria`, `normalization`, `rankings`) VALUES
(4, '2024-02-25', '[{\"title\":\"Nama\"},{\"title\":\"Absensi\",\"kriteria_id\":1,\"bobot\":10,\"type\":\"cost\"},{\"title\":\"Kinerja\",\"kriteria_id\":2,\"bobot\":30,\"type\":\"benefit\"},{\"title\":\"Pendidikan\",\"kriteria_id\":3,\"bobot\":10,\"type\":\"benefit\"},{\"title\":\"Masa Kerja\",\"kriteria_id\":4,\"bobot\":30,\"type\":\"benefit\"},{\"title\":\"Jumlah Tanggungan\",\"kriteria_id\":5,\"bobot\":20,\"type\":\"benefit\"}]', '{\"1\":[{\"key\":\"Agus\",\"value\":\"Agus\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":4,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"2\":[{\"key\":\"Doni\",\"value\":\"Doni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":4,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"3\":[{\"key\":\"Prama\",\"value\":\"Prama\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"4\":[{\"key\":\"Clifford\",\"value\":\"Clifford\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"5\":[{\"key\":\"Ahlam\",\"value\":\"Ahlam\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"60%\",\"value\":3,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"6\":[{\"key\":\"Asep Angga\",\"value\":\"Asep Angga\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"7\":[{\"key\":\"Daniel\",\"value\":\"Daniel\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"8\":[{\"key\":\"Fahmi Shiddiq\",\"value\":\"Fahmi Shiddiq\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"9\":[{\"key\":\"Feri\",\"value\":\"Feri\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"10\":[{\"key\":\"Henry\",\"value\":\"Henry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"11\":[{\"key\":\"Irhas\",\"value\":\"Irhas\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"12\":[{\"key\":\"Julius\",\"value\":\"Julius\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"13\":[{\"key\":\"Leni\",\"value\":\"Leni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"14\":[{\"key\":\"Rakha\",\"value\":\"Rakha\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"15\":[{\"key\":\"Tetty\",\"value\":\"Tetty\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"16\":[{\"key\":\"Anthonius\",\"value\":\"Anthonius\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"17\":[{\"key\":\"Derry\",\"value\":\"Derry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"18\":[{\"key\":\"Fabian\",\"value\":\"Fabian\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"3\",\"value\":4,\"kriteria_id\":5}],\"19\":[{\"key\":\"Fandi\",\"value\":\"Fandi\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"20\":[{\"key\":\"Nicholas\",\"value\":\"Nicholas\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}]}', '{\"1\":[{\"key\":\"Agus\",\"value\":\"Agus\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":1,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"2\":[{\"key\":\"Doni\",\"value\":\"Doni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":1,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"3\":[{\"key\":\"Prama\",\"value\":\"Prama\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"4\":[{\"key\":\"Clifford\",\"value\":\"Clifford\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"5\":[{\"key\":\"Ahlam\",\"value\":\"Ahlam\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"60%\",\"value\":0.6,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"6\":[{\"key\":\"Asep Angga\",\"value\":\"Asep Angga\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"7\":[{\"key\":\"Daniel\",\"value\":\"Daniel\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"8\":[{\"key\":\"Fahmi Shiddiq\",\"value\":\"Fahmi Shiddiq\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"9\":[{\"key\":\"Feri\",\"value\":\"Feri\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"10\":[{\"key\":\"Henry\",\"value\":\"Henry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"11\":[{\"key\":\"Irhas\",\"value\":\"Irhas\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"12\":[{\"key\":\"Julius\",\"value\":\"Julius\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"13\":[{\"key\":\"Leni\",\"value\":\"Leni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"14\":[{\"key\":\"Rakha\",\"value\":\"Rakha\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"15\":[{\"key\":\"Tetty\",\"value\":\"Tetty\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"16\":[{\"key\":\"Anthonius\",\"value\":\"Anthonius\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"17\":[{\"key\":\"Derry\",\"value\":\"Derry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"18\":[{\"key\":\"Fabian\",\"value\":\"Fabian\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"3\",\"value\":1,\"kriteria_id\":5}],\"19\":[{\"key\":\"Fandi\",\"value\":\"Fandi\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"20\":[{\"key\":\"Nicholas\",\"value\":\"Nicholas\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}]}', '[{\"nama\":\"Agus\",\"total\":0.95,\"rank\":1,\"percentage\":95,\"salary_increase\":\"Rp. 400.000,00\"},{\"nama\":\"Doni\",\"total\":0.9,\"rank\":2,\"percentage\":90,\"salary_increase\":\"Rp. 400.000,00\"},{\"nama\":\"Fabian\",\"total\":0.87,\"rank\":3,\"percentage\":87,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Tetty\",\"total\":0.77,\"rank\":4,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Prama\",\"total\":0.77,\"rank\":5,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Leni\",\"total\":0.77,\"rank\":6,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Anthonius\",\"total\":0.77,\"rank\":7,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Daniel\",\"total\":0.72,\"rank\":8,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Fahmi Shiddiq\",\"total\":0.72,\"rank\":9,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Julius\",\"total\":0.72,\"rank\":10,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Derry\",\"total\":0.72,\"rank\":11,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Fandi\",\"total\":0.72,\"rank\":12,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Henry\",\"total\":0.7,\"rank\":13,\"percentage\":70,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Nicholas\",\"total\":0.7,\"rank\":14,\"percentage\":70,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Clifford\",\"total\":0.67,\"rank\":15,\"percentage\":67,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Asep Angga\",\"total\":0.64,\"rank\":16,\"percentage\":64,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Irhas\",\"total\":0.59,\"rank\":17,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Feri\",\"total\":0.59,\"rank\":18,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Rakha\",\"total\":0.59,\"rank\":19,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Ahlam\",\"total\":0.53,\"rank\":20,\"percentage\":53,\"salary_increase\":\"Rp. 210.000,00\"}]'),
(5, '2024-02-26', '[{\"title\":\"Nama\"},{\"title\":\"Absensi\",\"kriteria_id\":1,\"bobot\":10,\"type\":\"cost\"},{\"title\":\"Kinerja\",\"kriteria_id\":2,\"bobot\":30,\"type\":\"benefit\"},{\"title\":\"Pendidikan\",\"kriteria_id\":3,\"bobot\":10,\"type\":\"benefit\"},{\"title\":\"Masa Kerja\",\"kriteria_id\":4,\"bobot\":30,\"type\":\"benefit\"},{\"title\":\"Jumlah Tanggungan\",\"kriteria_id\":5,\"bobot\":20,\"type\":\"benefit\"}]', '{\"1\":[{\"key\":\"Agus\",\"value\":\"Agus\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":4,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"2\":[{\"key\":\"Doni\",\"value\":\"Doni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":4,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"3\":[{\"key\":\"Prama\",\"value\":\"Prama\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"4\":[{\"key\":\"Clifford\",\"value\":\"Clifford\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"5\":[{\"key\":\"Ahlam\",\"value\":\"Ahlam\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"60%\",\"value\":3,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"6\":[{\"key\":\"Asep Angga\",\"value\":\"Asep Angga\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"7\":[{\"key\":\"Daniel\",\"value\":\"Daniel\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"8\":[{\"key\":\"Fahmi Shiddiq\",\"value\":\"Fahmi Shiddiq\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"9\":[{\"key\":\"Feri\",\"value\":\"Feri\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"10\":[{\"key\":\"Henry\",\"value\":\"Henry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"11\":[{\"key\":\"Irhas\",\"value\":\"Irhas\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"12\":[{\"key\":\"Julius\",\"value\":\"Julius\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"13\":[{\"key\":\"Leni\",\"value\":\"Leni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"14\":[{\"key\":\"Rakha\",\"value\":\"Rakha\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"15\":[{\"key\":\"Tetty\",\"value\":\"Tetty\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"16\":[{\"key\":\"Anthonius\",\"value\":\"Anthonius\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"17\":[{\"key\":\"Derry\",\"value\":\"Derry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"18\":[{\"key\":\"Fabian\",\"value\":\"Fabian\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"3\",\"value\":4,\"kriteria_id\":5}],\"19\":[{\"key\":\"Fandi\",\"value\":\"Fandi\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"20\":[{\"key\":\"Nicholas\",\"value\":\"Nicholas\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}]}', '{\"1\":[{\"key\":\"Agus\",\"value\":\"Agus\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":1,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"2\":[{\"key\":\"Doni\",\"value\":\"Doni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":1,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"3\":[{\"key\":\"Prama\",\"value\":\"Prama\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"4\":[{\"key\":\"Clifford\",\"value\":\"Clifford\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"5\":[{\"key\":\"Ahlam\",\"value\":\"Ahlam\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"60%\",\"value\":0.6,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"6\":[{\"key\":\"Asep Angga\",\"value\":\"Asep Angga\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"7\":[{\"key\":\"Daniel\",\"value\":\"Daniel\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"8\":[{\"key\":\"Fahmi Shiddiq\",\"value\":\"Fahmi Shiddiq\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"9\":[{\"key\":\"Feri\",\"value\":\"Feri\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"10\":[{\"key\":\"Henry\",\"value\":\"Henry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"11\":[{\"key\":\"Irhas\",\"value\":\"Irhas\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"12\":[{\"key\":\"Julius\",\"value\":\"Julius\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"13\":[{\"key\":\"Leni\",\"value\":\"Leni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"14\":[{\"key\":\"Rakha\",\"value\":\"Rakha\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"15\":[{\"key\":\"Tetty\",\"value\":\"Tetty\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"16\":[{\"key\":\"Anthonius\",\"value\":\"Anthonius\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"17\":[{\"key\":\"Derry\",\"value\":\"Derry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"18\":[{\"key\":\"Fabian\",\"value\":\"Fabian\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"3\",\"value\":1,\"kriteria_id\":5}],\"19\":[{\"key\":\"Fandi\",\"value\":\"Fandi\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"20\":[{\"key\":\"Nicholas\",\"value\":\"Nicholas\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}]}', '[{\"nama\":\"Agus\",\"total\":0.95,\"rank\":1,\"percentage\":95,\"salary_increase\":\"Rp. 400.000,00\"},{\"nama\":\"Doni\",\"total\":0.9,\"rank\":2,\"percentage\":90,\"salary_increase\":\"Rp. 400.000,00\"},{\"nama\":\"Fabian\",\"total\":0.87,\"rank\":3,\"percentage\":87,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Tetty\",\"total\":0.77,\"rank\":4,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Prama\",\"total\":0.77,\"rank\":5,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Leni\",\"total\":0.77,\"rank\":6,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Anthonius\",\"total\":0.77,\"rank\":7,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Daniel\",\"total\":0.72,\"rank\":8,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Fahmi Shiddiq\",\"total\":0.72,\"rank\":9,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Julius\",\"total\":0.72,\"rank\":10,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Derry\",\"total\":0.72,\"rank\":11,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Fandi\",\"total\":0.72,\"rank\":12,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Henry\",\"total\":0.7,\"rank\":13,\"percentage\":70,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Nicholas\",\"total\":0.7,\"rank\":14,\"percentage\":70,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Clifford\",\"total\":0.67,\"rank\":15,\"percentage\":67,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Asep Angga\",\"total\":0.64,\"rank\":16,\"percentage\":64,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Irhas\",\"total\":0.59,\"rank\":17,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Feri\",\"total\":0.59,\"rank\":18,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Rakha\",\"total\":0.59,\"rank\":19,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Ahlam\",\"total\":0.53,\"rank\":20,\"percentage\":53,\"salary_increase\":\"Rp. 210.000,00\"}]'),
(6, '2024-02-28', '[{\"title\":\"Nama\"},{\"title\":\"Absensi\",\"kriteria_id\":1,\"bobot\":10,\"type\":\"cost\"},{\"title\":\"Kinerja\",\"kriteria_id\":2,\"bobot\":30,\"type\":\"benefit\"},{\"title\":\"Pendidikan\",\"kriteria_id\":3,\"bobot\":10,\"type\":\"benefit\"},{\"title\":\"Masa Kerja\",\"kriteria_id\":4,\"bobot\":30,\"type\":\"benefit\"},{\"title\":\"Jumlah Tanggungan\",\"kriteria_id\":5,\"bobot\":20,\"type\":\"benefit\"}]', '{\"1\":[{\"key\":\"Agus\",\"value\":\"Agus\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":4,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"2\":[{\"key\":\"Doni\",\"value\":\"Doni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":4,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"3\":[{\"key\":\"Prama\",\"value\":\"Prama\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"4\":[{\"key\":\"Clifford\",\"value\":\"Clifford\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"5\":[{\"key\":\"Ahlam\",\"value\":\"Ahlam\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"60%\",\"value\":3,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"6\":[{\"key\":\"Asep Angga\",\"value\":\"Asep Angga\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"7\":[{\"key\":\"Daniel\",\"value\":\"Daniel\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"8\":[{\"key\":\"Fahmi Shiddiq\",\"value\":\"Fahmi Shiddiq\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"9\":[{\"key\":\"Feri\",\"value\":\"Feri\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"10\":[{\"key\":\"Henry\",\"value\":\"Henry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"11\":[{\"key\":\"Irhas\",\"value\":\"Irhas\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"12\":[{\"key\":\"Julius\",\"value\":\"Julius\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"13\":[{\"key\":\"Leni\",\"value\":\"Leni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"14\":[{\"key\":\"Rakha\",\"value\":\"Rakha\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"15\":[{\"key\":\"Tetty\",\"value\":\"Tetty\"},{\"key\":\"Lebih dari 10\",\"value\":2,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"2\",\"value\":3,\"kriteria_id\":5}],\"16\":[{\"key\":\"Anthonius\",\"value\":\"Anthonius\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}],\"17\":[{\"key\":\"Derry\",\"value\":\"Derry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"18\":[{\"key\":\"Fabian\",\"value\":\"Fabian\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"3\",\"value\":4,\"kriteria_id\":5}],\"19\":[{\"key\":\"Fandi\",\"value\":\"Fandi\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":4,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":2,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":3,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":1,\"kriteria_id\":5}],\"20\":[{\"key\":\"Nicholas\",\"value\":\"Nicholas\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":5,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":2,\"kriteria_id\":4},{\"key\":\"1\",\"value\":2,\"kriteria_id\":5}]}', '{\"1\":[{\"key\":\"Agus\",\"value\":\"Agus\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":1,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"2\":[{\"key\":\"Doni\",\"value\":\"Doni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"4 Tahun lebih\",\"value\":1,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"3\":[{\"key\":\"Prama\",\"value\":\"Prama\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"4\":[{\"key\":\"Clifford\",\"value\":\"Clifford\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"5\":[{\"key\":\"Ahlam\",\"value\":\"Ahlam\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"60%\",\"value\":0.6,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"6\":[{\"key\":\"Asep Angga\",\"value\":\"Asep Angga\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"7\":[{\"key\":\"Daniel\",\"value\":\"Daniel\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"8\":[{\"key\":\"Fahmi Shiddiq\",\"value\":\"Fahmi Shiddiq\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"9\":[{\"key\":\"Feri\",\"value\":\"Feri\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"10\":[{\"key\":\"Henry\",\"value\":\"Henry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"11\":[{\"key\":\"Irhas\",\"value\":\"Irhas\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"12\":[{\"key\":\"Julius\",\"value\":\"Julius\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"13\":[{\"key\":\"Leni\",\"value\":\"Leni\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"14\":[{\"key\":\"Rakha\",\"value\":\"Rakha\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"15\":[{\"key\":\"Tetty\",\"value\":\"Tetty\"},{\"key\":\"Lebih dari 10\",\"value\":0.5,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"2\",\"value\":0.75,\"kriteria_id\":5}],\"16\":[{\"key\":\"Anthonius\",\"value\":\"Anthonius\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}],\"17\":[{\"key\":\"Derry\",\"value\":\"Derry\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"18\":[{\"key\":\"Fabian\",\"value\":\"Fabian\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"3\",\"value\":1,\"kriteria_id\":5}],\"19\":[{\"key\":\"Fandi\",\"value\":\"Fandi\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"80%\",\"value\":0.8,\"kriteria_id\":2},{\"key\":\"S1\",\"value\":1,\"kriteria_id\":3},{\"key\":\"2 - 4 Tahun\",\"value\":0.75,\"kriteria_id\":4},{\"key\":\"Tidak Ada\",\"value\":0.25,\"kriteria_id\":5}],\"20\":[{\"key\":\"Nicholas\",\"value\":\"Nicholas\"},{\"key\":\"Kurang dari 10\",\"value\":1,\"kriteria_id\":1},{\"key\":\"90% >\",\"value\":1,\"kriteria_id\":2},{\"key\":\"SMA\\/SMK\",\"value\":0.5,\"kriteria_id\":3},{\"key\":\"1 - 2 Tahun\",\"value\":0.5,\"kriteria_id\":4},{\"key\":\"1\",\"value\":0.5,\"kriteria_id\":5}]}', '[{\"nama\":\"Agus\",\"total\":0.95,\"rank\":1,\"percentage\":95,\"salary_increase\":\"Rp. 510.000,00\"},{\"nama\":\"Doni\",\"total\":0.9,\"rank\":2,\"percentage\":90,\"salary_increase\":\"Rp. 510.000,00\"},{\"nama\":\"Fabian\",\"total\":0.87,\"rank\":3,\"percentage\":87,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Tetty\",\"total\":0.77,\"rank\":4,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Prama\",\"total\":0.77,\"rank\":5,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Leni\",\"total\":0.77,\"rank\":6,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Anthonius\",\"total\":0.77,\"rank\":7,\"percentage\":77,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Daniel\",\"total\":0.72,\"rank\":8,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Fahmi Shiddiq\",\"total\":0.72,\"rank\":9,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Julius\",\"total\":0.72,\"rank\":10,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Derry\",\"total\":0.72,\"rank\":11,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Fandi\",\"total\":0.72,\"rank\":12,\"percentage\":72,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Henry\",\"total\":0.7,\"rank\":13,\"percentage\":70,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Nicholas\",\"total\":0.7,\"rank\":14,\"percentage\":70,\"salary_increase\":\"Rp. 300.000,00\"},{\"nama\":\"Clifford\",\"total\":0.67,\"rank\":15,\"percentage\":67,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Asep Angga\",\"total\":0.64,\"rank\":16,\"percentage\":64,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Irhas\",\"total\":0.59,\"rank\":17,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Feri\",\"total\":0.59,\"rank\":18,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Rakha\",\"total\":0.59,\"rank\":19,\"percentage\":59,\"salary_increase\":\"Rp. 210.000,00\"},{\"nama\":\"Ahlam\",\"total\":0.53,\"rank\":20,\"percentage\":53,\"salary_increase\":\"Rp. 210.000,00\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama`) VALUES
(1, 'Agus'),
(2, 'Doni'),
(3, 'Prama'),
(4, 'Clifford'),
(5, 'Ahlam'),
(6, 'Asep Angga'),
(7, 'Daniel'),
(8, 'Fahmi Shiddiq'),
(9, 'Feri'),
(10, 'Henry'),
(11, 'Irhas'),
(12, 'Julius'),
(13, 'Leni'),
(14, 'Rakha'),
(15, 'Tetty'),
(16, 'Anthonius'),
(17, 'Derry'),
(18, 'Fabian'),
(19, 'Fandi'),
(20, 'Nicholas');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan_kriteria`
--

CREATE TABLE `karyawan_kriteria` (
  `id` bigint UNSIGNED NOT NULL,
  `karyawan_id` bigint UNSIGNED NOT NULL,
  `crip_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `karyawan_kriteria`
--

INSERT INTO `karyawan_kriteria` (`id`, `karyawan_id`, `crip_id`) VALUES
(1, 1, 1),
(2, 1, 7),
(3, 1, 9),
(4, 1, 14),
(5, 1, 17),
(6, 2, 1),
(7, 2, 7),
(8, 2, 8),
(9, 2, 14),
(10, 2, 17),
(11, 3, 1),
(12, 3, 6),
(13, 3, 9),
(14, 3, 13),
(15, 3, 16),
(16, 4, 2),
(17, 4, 6),
(18, 4, 9),
(19, 4, 13),
(20, 4, 15),
(21, 5, 1),
(22, 5, 5),
(23, 5, 8),
(24, 5, 12),
(25, 5, 15),
(26, 6, 1),
(27, 6, 6),
(28, 6, 9),
(29, 6, 12),
(30, 6, 15),
(31, 7, 1),
(32, 7, 6),
(33, 7, 9),
(34, 7, 13),
(35, 7, 15),
(36, 8, 1),
(37, 8, 6),
(38, 8, 9),
(39, 8, 13),
(40, 8, 15),
(41, 9, 1),
(42, 9, 6),
(43, 9, 8),
(44, 9, 12),
(45, 9, 15),
(46, 10, 1),
(47, 10, 7),
(48, 10, 9),
(49, 10, 12),
(50, 10, 15),
(51, 11, 2),
(52, 11, 6),
(53, 11, 9),
(54, 11, 12),
(55, 11, 15),
(56, 12, 2),
(57, 12, 6),
(58, 12, 9),
(59, 12, 13),
(60, 12, 16),
(61, 13, 1),
(62, 13, 6),
(63, 13, 9),
(64, 13, 13),
(65, 13, 16),
(66, 14, 1),
(67, 14, 6),
(68, 14, 8),
(69, 14, 12),
(70, 14, 15),
(71, 15, 2),
(72, 15, 6),
(73, 15, 9),
(74, 15, 13),
(75, 15, 17),
(76, 16, 1),
(77, 16, 6),
(78, 16, 9),
(79, 16, 13),
(80, 16, 16),
(81, 17, 1),
(82, 17, 6),
(83, 17, 9),
(84, 17, 13),
(85, 17, 15),
(86, 18, 1),
(87, 18, 6),
(88, 18, 9),
(89, 18, 13),
(90, 18, 18),
(91, 19, 1),
(92, 19, 6),
(93, 19, 9),
(94, 19, 13),
(95, 19, 15),
(96, 20, 1),
(97, 20, 7),
(98, 20, 8),
(99, 20, 12),
(100, 20, 16);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bobot` int NOT NULL,
  `type` enum('benefit','cost') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id`, `nama`, `bobot`, `type`) VALUES
(1, 'Absensi', 10, 'cost'),
(2, 'Kinerja', 30, 'benefit'),
(3, 'Pendidikan', 10, 'benefit'),
(4, 'Masa Kerja', 30, 'benefit'),
(5, 'Jumlah Tanggungan', 20, 'benefit');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(179, '2014_10_12_000000_create_users_table', 1),
(180, '2014_10_12_100000_create_password_resets_table', 1),
(181, '2019_08_19_000000_create_failed_jobs_table', 1),
(182, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(183, '2023_11_23_045424_create_karyawan_table', 1),
(184, '2023_11_25_172745_create_kriteria_table', 1),
(185, '2023_11_27_064723_create_crips_table', 1),
(186, '2024_01_10_023329_create_karyawan_kriteria_table', 1),
(187, '2024_02_17_125132_create_permission_tables', 1),
(188, '2024_02_19_044355_create_persentase_kenaikan_table', 1),
(189, '2024_02_19_044435_create_histori_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(1, 'App\\Models\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `persentase_kenaikan`
--

CREATE TABLE `persentase_kenaikan` (
  `id` bigint UNSIGNED NOT NULL,
  `dari` int NOT NULL,
  `sampai` int NOT NULL,
  `nilai` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `persentase_kenaikan`
--

INSERT INTO `persentase_kenaikan` (`id`, `dari`, `sampai`, `nilai`) VALUES
(1, 0, 40, 0),
(2, 40, 50, 150000),
(3, 50, 70, 200000),
(4, 70, 90, 300000),
(5, 90, 100, 400000);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'atasan', 'web', '2024-02-23 09:00:23', '2024-02-23 09:00:23'),
(2, 'staff', 'web', '2024-02-23 09:00:23', '2024-02-23 09:00:23'),
(3, 'administrator', 'web', '2024-03-04 06:52:00', '2024-03-04 06:52:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Atasan Hendri', 'atasan@senja.com', '$2y$10$PfOmJfwrFnsrKyX5YW/HaO2D4CKYSjC89ekCWOwEEYjV8VuDADtB6', '2024-02-23 09:00:23', '2024-02-23 09:00:23'),
(2, 'Staff Hendri', 'staff@senja.com', '$2y$10$REKRCyZmsmBUlQ5LRu6asOC6UQD1M/RAeYk.5i3PnCvbaD4KP7NjC', '2024-02-23 09:00:23', '2024-02-23 09:00:23'),
(3, 'admin Hendri', 'admin@senja.com', '$2y$10$WLDDFzKm/CICkN.8Uw5QQORNdrqJ3f40JC.Os4D5CGrnRK5iZiyqi', '2024-03-04 06:52:00', '2024-03-04 06:52:00'),
(4, 'Hendri 2', 'hendri@senja.com', '$2y$10$lsSp4iGL13lwAswKWnTjeumjmCzfUTK8le5dweH7YCdhaYkqgDdyq', '2024-03-04 18:46:48', '2024-03-04 18:46:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `crips`
--
ALTER TABLE `crips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crips_kriteria_id_foreign` (`kriteria_id`);

--
-- Indexes for table `histori`
--
ALTER TABLE `histori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `karyawan_kriteria`
--
ALTER TABLE `karyawan_kriteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `karyawan_kriteria_karyawan_id_foreign` (`karyawan_id`),
  ADD KEY `karyawan_kriteria_crip_id_foreign` (`crip_id`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `persentase_kenaikan`
--
ALTER TABLE `persentase_kenaikan`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `crips`
--
ALTER TABLE `crips`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `histori`
--
ALTER TABLE `histori`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `karyawan_kriteria`
--
ALTER TABLE `karyawan_kriteria`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `persentase_kenaikan`
--
ALTER TABLE `persentase_kenaikan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `crips`
--
ALTER TABLE `crips`
  ADD CONSTRAINT `crips_kriteria_id_foreign` FOREIGN KEY (`kriteria_id`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `karyawan_kriteria`
--
ALTER TABLE `karyawan_kriteria`
  ADD CONSTRAINT `karyawan_kriteria_crip_id_foreign` FOREIGN KEY (`crip_id`) REFERENCES `crips` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `karyawan_kriteria_karyawan_id_foreign` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan` (`id`) ON DELETE CASCADE;

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
