-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2023 at 07:11 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbhospitals`
--

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `gender` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `jenis_identitas` enum('KTP','SIM','Paspor') DEFAULT NULL,
  `nomor_identitas` varchar(30) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `petugas_medis`
--

CREATE TABLE `petugas_medis` (
  `id_petugas_medis` int(11) NOT NULL,
  `id_jadwalpraktik` varchar(5) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `spesialisasi` varchar(50) DEFAULT NULL,
  `telepon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `poliklinik`
--

CREATE TABLE `poliklinik` (
  `id_poliklinik` int(11) NOT NULL,
  `nama_poliklinik` varchar(50) DEFAULT NULL,
  `id_dokter` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rawatjalan`
--

CREATE TABLE `rawatjalan` (
  `id_rawat_jalan` int(11) NOT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `id_dokter` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `diagnosa` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ruanganrawatinap`
--

CREATE TABLE `ruanganrawatinap` (
  `id_ruangan` int(11) NOT NULL,
  `kelas_ruangan` enum('Kelas 1','Kelas 2','Kelas 3','Kelas Deluxe') DEFAULT NULL,
  `nama_ruangan` varchar(50) DEFAULT NULL,
  `nomor_kamar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jadwalpraktik`
--

CREATE TABLE `tb_jadwalpraktik` (
  `id_jadwal_praktek` int(11) NOT NULL,
  `hari` varchar(20) DEFAULT NULL,
  `jam` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kamar`
--

CREATE TABLE `tb_kamar` (
  `id_kamar` int(11) NOT NULL,
  `tipe_kamar` varchar(50) DEFAULT NULL,
  `tarif_kamar` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_obat`
--

CREATE TABLE `tb_obat` (
  `id_obat` int(11) NOT NULL,
  `nm_obat` varchar(100) DEFAULT NULL,
  `jenis_obat` varchar(50) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_obatkeluar`
--

CREATE TABLE `tb_obatkeluar` (
  `id_obat_keluar` int(11) NOT NULL,
  `id_obat` int(11) DEFAULT NULL,
  `jml_obat` int(11) DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `riwayat_pendidikan` varchar(200) DEFAULT NULL,
  `jurusan` varchar(50) DEFAULT NULL,
  `thn_lulus` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_resep` int(11) DEFAULT NULL,
  `tgl_bayar` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rawatinap`
--

CREATE TABLE `tb_rawatinap` (
  `id_rawatinap` int(5) NOT NULL,
  `id_rm` int(5) NOT NULL,
  `id_kamar` int(5) NOT NULL,
  `id_petugas_medis` int(5) NOT NULL,
  `tgl` int(5) NOT NULL,
  `status` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_resep`
--

CREATE TABLE `tb_resep` (
  `id_resep` int(11) NOT NULL,
  `id_rm` int(11) DEFAULT NULL,
  `id_obat` int(11) DEFAULT NULL,
  `tgl_resep` date DEFAULT NULL,
  `isi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rm`
--

CREATE TABLE `tb_rm` (
  `id_rm` int(11) NOT NULL,
  `id_petugas_medis` int(11) DEFAULT NULL,
  `id_tindakan` int(11) DEFAULT NULL,
  `id_obat` int(11) DEFAULT NULL,
  `id_pasien` varchar(10) DEFAULT NULL,
  `tinggi_badan` decimal(5,2) DEFAULT NULL,
  `berat_badan` decimal(5,2) DEFAULT NULL,
  `tekanan_darah` varchar(10) DEFAULT NULL,
  `nadi` int(11) DEFAULT NULL,
  `tgl_pemeriksaan` date DEFAULT NULL,
  `diagnosa` varchar(100) DEFAULT NULL,
  `status_asal` varchar(20) DEFAULT NULL,
  `status_keluar` varchar(20) DEFAULT NULL,
  `ket` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `petugas_medis`
--
ALTER TABLE `petugas_medis`
  ADD PRIMARY KEY (`id_petugas_medis`);

--
-- Indexes for table `poliklinik`
--
ALTER TABLE `poliklinik`
  ADD PRIMARY KEY (`id_poliklinik`);

--
-- Indexes for table `rawatjalan`
--
ALTER TABLE `rawatjalan`
  ADD PRIMARY KEY (`id_rawat_jalan`);

--
-- Indexes for table `ruanganrawatinap`
--
ALTER TABLE `ruanganrawatinap`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- Indexes for table `tb_jadwalpraktik`
--
ALTER TABLE `tb_jadwalpraktik`
  ADD PRIMARY KEY (`id_jadwal_praktek`);

--
-- Indexes for table `tb_kamar`
--
ALTER TABLE `tb_kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `tb_obat`
--
ALTER TABLE `tb_obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `tb_obatkeluar`
--
ALTER TABLE `tb_obatkeluar`
  ADD PRIMARY KEY (`id_obat_keluar`);

--
-- Indexes for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `tb_rawatinap`
--
ALTER TABLE `tb_rawatinap`
  ADD PRIMARY KEY (`id_rawatinap`);

--
-- Indexes for table `tb_resep`
--
ALTER TABLE `tb_resep`
  ADD PRIMARY KEY (`id_resep`);

--
-- Indexes for table `tb_rm`
--
ALTER TABLE `tb_rm`
  ADD PRIMARY KEY (`id_rm`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_rawatinap`
--
ALTER TABLE `tb_rawatinap`
  MODIFY `id_rawatinap` int(5) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
