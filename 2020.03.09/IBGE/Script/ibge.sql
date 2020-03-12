-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.6.13 - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para ibge
CREATE DATABASE IF NOT EXISTS `ibge` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ibge`;

-- Copiando estrutura para tabela ibge.cidade
CREATE TABLE IF NOT EXISTS `cidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '0',
  `uf_id` int(11) DEFAULT NULL,
  `populacao` int(11) DEFAULT NULL,
  `data_fundacao` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_uf` (`uf_id`),
  CONSTRAINT `FK1_uf` FOREIGN KEY (`uf_id`) REFERENCES `uf` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela ibge.cidade: ~27 rows (aproximadamente)
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` (`id`, `nome`, `uf_id`, `populacao`, `data_fundacao`) VALUES
	(11, 'Bauru', 4, 50000, '1756-08-17'),
	(12, 'Uru', 4, 2000, '1777-11-22'),
	(13, 'Avaí', 4, 6000, '1899-12-05'),
	(14, 'Blumenal', 5, 1231212, '1845-09-25'),
	(15, 'Florianópolis', 5, 346, '1875-06-12'),
	(16, 'Chapecó', 5, 132123, '1742-04-05'),
	(17, 'Riode Janeiro', 6, 555566, '1745-09-30'),
	(18, 'Niteroí', 6, 56745734, '1987-06-25'),
	(19, 'Cabo Frio', 6, 821554, '1958-01-11'),
	(20, 'Dallas', 7, 23423478, '1923-03-05'),
	(21, 'Austin', 7, 2354235, '1854-03-25'),
	(22, 'El Paso', 7, 135412, '1974-03-22'),
	(23, 'San Diego', 8, 21342356, '1952-04-30'),
	(24, 'Los Angeles', 8, 23423523, '1723-07-10'),
	(25, 'San Francisco', 8, 474562346, '1911-06-22'),
	(26, 'Orlando', 9, 87654768, '1894-12-20'),
	(27, 'Miami', 9, 63852, '1874-06-23'),
	(28, 'Tampa', 9, 213413, '1987-01-05'),
	(29, 'Hongkou', 10, 235235, '1746-05-31'),
	(30, 'Jing´an', 10, 67867, '1864-05-22'),
	(31, 'Huangpu', 10, 6783333, '1896-07-08'),
	(32, 'Cantao', 11, 6456456, '1984-06-22'),
	(33, 'Shantou', 11, 6456456, '1874-06-12'),
	(34, 'Foshan', 11, 6456456, '1958-12-19'),
	(35, 'Suizhou', 12, 2147483647, '1756-08-16'),
	(36, 'Tianmen', 12, 2147483647, '1896-11-20'),
	(37, 'Xiantao', 12, 2147483647, '1756-04-15');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;

-- Copiando estrutura para tabela ibge.pais
CREATE TABLE IF NOT EXISTS `pais` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) DEFAULT NULL,
  `continente` varchar(80) DEFAULT NULL,
  `populacao` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela ibge.pais: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` (`idPais`, `nome`, `continente`, `populacao`) VALUES
	(1, 'Brasil', 'Américas', 212000000),
	(2, 'Estados Unidos', 'Américas', 989000000),
	(3, 'China', 'Ásia', 1300000000);
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;

-- Copiando estrutura para tabela ibge.uf
CREATE TABLE IF NOT EXISTS `uf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `sigla` varchar(50) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_pais` (`pais_id`),
  CONSTRAINT `FK1_pais` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela ibge.uf: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `uf` DISABLE KEYS */;
INSERT INTO `uf` (`id`, `nome`, `sigla`, `pais_id`) VALUES
	(4, 'São paulo', 'SP', 1),
	(5, 'Santa Catarina', 'SC\r\n', 1),
	(6, 'Rio de Janeiro', 'RJ', 1),
	(7, 'Texas', 'TX', 2),
	(8, 'Califórnia', 'CA', 2),
	(9, 'Flórida', 'FL', 2),
	(10, 'Xangai', 'XG', 3),
	(11, 'Cantão', 'CT', 3),
	(12, 'Hubei', 'CG', 3);
/*!40000 ALTER TABLE `uf` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
