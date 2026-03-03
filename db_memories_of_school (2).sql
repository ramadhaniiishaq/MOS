-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 03 Mar 2026 pada 16.03
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Basis data: `db_memories_of_school`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `folder`
--

CREATE TABLE `folder` (
  `id_folder` int NOT NULL,
  `nama_folder` varchar(150) NOT NULL,
  `deskripsi` text,
  `dibuat_pada` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `media`
--

CREATE TABLE `media` (
  `id_media` int NOT NULL,
  `id_folder` int DEFAULT NULL,
  `diunggah_oleh` int DEFAULT NULL,
  `foto` varchar(255) NOT NULL,
  `keterangan` text,
  `tanggal_diambil` date DEFAULT NULL,
  `dibuat_pada` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `posisi_x` int DEFAULT NULL,
  `posisi_y` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `media`
--

INSERT INTO `media` (`id_media`, `id_folder`, `diunggah_oleh`, `foto`, `keterangan`, `tanggal_diambil`, `dibuat_pada`, `posisi_x`, `posisi_y`) VALUES
(1, NULL, NULL, '261fd76d8a634778a1407de1dd76c7fc_2.jpg', 'adalah', '2026-03-12', '2026-03-03 12:20:06', NULL, NULL),
(2, NULL, NULL, '88f8991d644342c18e1c9582a5cccb48_2c71f7fc1a57010f17beb9d1841060e1.jpg', 'adalah', '2026-03-03', '2026-03-03 12:20:06', NULL, NULL),
(3, NULL, NULL, '8816ab77bea541fcad8b1ea7e50dc06b_8efe141b80166feebe6cdd5e050bc808.jpg', 'adalah', '2025-02-13', '2026-03-03 12:20:06', NULL, NULL),
(4, NULL, NULL, 'f2bd10d19dab447ab58aad2974dec902_3.jpg', 'adalah', '2026-03-03', '2026-03-03 12:20:06', NULL, NULL),
(5, NULL, NULL, '6bd1a6f4164f48f9ac026bcfee23cc91_1.jpg', '', '2026-03-03', '2026-03-03 12:20:06', NULL, NULL),
(6, NULL, NULL, 'e764d163eb1a45f496fb2c0b013835be_3.jpg', '', '2025-02-07', '2026-03-03 13:21:11', NULL, NULL),
(7, NULL, NULL, '93f5b77eed834865976ef1d02b6c4038_13414519583c03a8576b45d6171c11c9.jpg', 'adalah', '2024-06-14', '2026-03-03 14:00:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(120) NOT NULL,
  `kata_sandi` varchar(255) NOT NULL,
  `peran` enum('admin','user') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nama`, `email`, `kata_sandi`, `peran`) VALUES
(1, 'nopal', 'nopal@.com', '$2b$12$SIAF5CivnKQskWPLVy8hkuLqlr03fwahPVyVnFLZmnXWfNmHCpc2C', 'admin'),
(2, 'nopal', 'nopal@gmail.com', '$2b$12$v23pTVvYcsXkQfP8/d6XQeUbAvKzoMHgemBTUxtUhGuBkZtm7R0ai', 'admin');

--
-- Indeks untuk tabel yang dibuang
--

--
-- Indeks untuk tabel `folder`
--
ALTER TABLE `folder`
  ADD PRIMARY KEY (`id_folder`);

--
-- Indeks untuk tabel `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id_media`),
  ADD KEY `fk_media_folder` (`id_folder`),
  ADD KEY `fk_media_pengguna` (`diunggah_oleh`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `folder`
--
ALTER TABLE `folder`
  MODIFY `id_folder` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `media`
--
ALTER TABLE `media`
  MODIFY `id_media` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `fk_media_folder` FOREIGN KEY (`id_folder`) REFERENCES `folder` (`id_folder`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_media_pengguna` FOREIGN KEY (`diunggah_oleh`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
