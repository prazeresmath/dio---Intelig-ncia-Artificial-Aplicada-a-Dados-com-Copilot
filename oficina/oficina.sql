CREATE DATABASE  IF NOT EXISTS `oficina` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `oficina`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: oficina
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf_cnpj` varchar(20) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cpf_cnpj` (`cpf_cnpj`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Carlos Silva','123.456.789-00','11999999999','carlos@email.com','Rua A, 123'),(2,'Auto Peças XYZ','12.345.678/0001-99','1133334444','contato@xyz.com','Avenida B, 456');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itensordemservico`
--

DROP TABLE IF EXISTS `itensordemservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itensordemservico` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `id_ordem` int NOT NULL,
  `id_servico` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `id_ordem` (`id_ordem`),
  KEY `id_servico` (`id_servico`),
  CONSTRAINT `itensordemservico_ibfk_1` FOREIGN KEY (`id_ordem`) REFERENCES `ordemservico` (`id_ordem`),
  CONSTRAINT `itensordemservico_ibfk_2` FOREIGN KEY (`id_servico`) REFERENCES `servico` (`id_servico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itensordemservico`
--

LOCK TABLES `itensordemservico` WRITE;
/*!40000 ALTER TABLE `itensordemservico` DISABLE KEYS */;
INSERT INTO `itensordemservico` VALUES (1,1,1,1,150.00),(2,1,2,1,200.00);
/*!40000 ALTER TABLE `itensordemservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico`
--

DROP TABLE IF EXISTS `mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanico` (
  `id_mecanico` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_mecanico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico`
--

LOCK TABLES `mecanico` WRITE;
/*!40000 ALTER TABLE `mecanico` DISABLE KEYS */;
INSERT INTO `mecanico` VALUES (1,'José Ferreira','Suspensão e Freios'),(2,'Ana Souza','Troca de óleo e revisão');
/*!40000 ALTER TABLE `mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordemservico`
--

DROP TABLE IF EXISTS `ordemservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordemservico` (
  `id_ordem` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_veiculo` int NOT NULL,
  `data_abertura` datetime DEFAULT CURRENT_TIMESTAMP,
  `data_conclusao` datetime DEFAULT NULL,
  `status` enum('Aberta','Em andamento','Concluída','Cancelada') NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_ordem`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_veiculo` (`id_veiculo`),
  CONSTRAINT `ordemservico_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `ordemservico_ibfk_2` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordemservico`
--

LOCK TABLES `ordemservico` WRITE;
/*!40000 ALTER TABLE `ordemservico` DISABLE KEYS */;
INSERT INTO `ordemservico` VALUES (1,1,1,'2024-03-11 10:00:00',NULL,'Aberta',350.00);
/*!40000 ALTER TABLE `ordemservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordemservicomecanico`
--

DROP TABLE IF EXISTS `ordemservicomecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordemservicomecanico` (
  `id_ordem` int NOT NULL,
  `id_mecanico` int NOT NULL,
  PRIMARY KEY (`id_ordem`,`id_mecanico`),
  KEY `id_mecanico` (`id_mecanico`),
  CONSTRAINT `ordemservicomecanico_ibfk_1` FOREIGN KEY (`id_ordem`) REFERENCES `ordemservico` (`id_ordem`),
  CONSTRAINT `ordemservicomecanico_ibfk_2` FOREIGN KEY (`id_mecanico`) REFERENCES `mecanico` (`id_mecanico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordemservicomecanico`
--

LOCK TABLES `ordemservicomecanico` WRITE;
/*!40000 ALTER TABLE `ordemservicomecanico` DISABLE KEYS */;
INSERT INTO `ordemservicomecanico` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `ordemservicomecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `id_servico` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_servico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (1,'Troca de óleo',150.00),(2,'Alinhamento e balanceamento',200.00);
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `id_veiculo` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `ano` int NOT NULL,
  `placa` varchar(10) NOT NULL,
  PRIMARY KEY (`id_veiculo`),
  UNIQUE KEY `placa` (`placa`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,1,'Toyota','Corolla',2020,'ABC1D23'),(2,2,'Honda','Civic',2019,'XYZ4E56');
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-11 17:30:44
