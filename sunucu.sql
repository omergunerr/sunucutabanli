-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 01 Haz 2019, 15:07:33
-- Sunucu sürümü: 5.7.19
-- PHP Sürümü: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `sunucu`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bolgeler`
--

DROP TABLE IF EXISTS `bolgeler`;
CREATE TABLE IF NOT EXISTS `bolgeler` (
  `bolge_kodu` int(11) NOT NULL,
  `bolge_adi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `satis_sayisi` int(11) NOT NULL,
  `ortalama_fiyat` int(11) NOT NULL,
  PRIMARY KEY (`bolge_kodu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `bolgeler`
--

INSERT INTO `bolgeler` (`bolge_kodu`, `bolge_adi`, `satis_sayisi`, `ortalama_fiyat`) VALUES
(1, 'Buca', 25000, 210000),
(2, 'Bornova', 30000, 280000),
(3, 'Karşıyaka', 50000, 350000);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bolge_proje`
--

DROP TABLE IF EXISTS `bolge_proje`;
CREATE TABLE IF NOT EXISTS `bolge_proje` (
  `bolge_kodu` int(11) NOT NULL,
  `proje_kodu` int(11) NOT NULL,
  KEY `bolge_kodu` (`bolge_kodu`),
  KEY `proje_kodu` (`proje_kodu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `bolge_proje`
--

INSERT INTO `bolge_proje` (`bolge_kodu`, `proje_kodu`) VALUES
(3, 2),
(1, 1),
(2, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kar`
--

DROP TABLE IF EXISTS `kar`;
CREATE TABLE IF NOT EXISTS `kar` (
  `proje_adi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kar` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kar`
--

INSERT INTO `kar` (`proje_adi`, `kar`) VALUES
('Yapıkent Projesi', 10000000),
('Blue House Projesi', 11000000),
('Sky House Projesi', 16500000),
('Center Projesi', 2000000);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `projeler`
--

DROP TABLE IF EXISTS `projeler`;
CREATE TABLE IF NOT EXISTS `projeler` (
  `proje_kodu` int(11) NOT NULL,
  `proje_adi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `daire_sayisi` int(11) NOT NULL,
  `daire_tur` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `proje_maliyeti` int(11) NOT NULL,
  `kisa_not` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`proje_kodu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `projeler`
--

INSERT INTO `projeler` (`proje_kodu`, `proje_adi`, `daire_sayisi`, `daire_tur`, `proje_maliyeti`, `kisa_not`) VALUES
(1, 'Yapıkent Projesi', 45, '2+1', 3500000, 'Kısa vadeli plan.'),
(2, 'Blue House Projesi', 120, '3+1', 25000000, 'Lüks proje.'),
(3, 'Sky House Projesi', 75, '2+1 ve 3+1', 6000000, 'Opsiyonlu.'),
(4, 'Center Projesi', 40, '2+1', 10000000, 'Lüks ve geniş alanlı');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yonetici`
--

DROP TABLE IF EXISTS `yonetici`;
CREATE TABLE IF NOT EXISTS `yonetici` (
  `yonetici_no` int(11) NOT NULL,
  `kullanici_adi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sifre` int(11) NOT NULL,
  `ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `soyad` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yonetici`
--

INSERT INTO `yonetici` (`yonetici_no`, `kullanici_adi`, `sifre`, `ad`, `soyad`) VALUES
(1, 'omer', 123, 'Ömer', 'Güner');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `bolge_proje`
--
ALTER TABLE `bolge_proje`
  ADD CONSTRAINT `bolge` FOREIGN KEY (`bolge_kodu`) REFERENCES `bolgeler` (`bolge_kodu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proje` FOREIGN KEY (`proje_kodu`) REFERENCES `projeler` (`proje_kodu`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
