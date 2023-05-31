CREATE DATABASE  IF NOT EXISTS `dbuniversidade` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbuniversidade`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: dbuniversidade
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `idAluno` int NOT NULL,
  `Pessoa_idPessoa` int NOT NULL,
  `matricula` varchar(45) NOT NULL,
  PRIMARY KEY (`idAluno`),
  KEY `fk_Aluno_Pessoa1_idx` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Aluno_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_matriculado_curso`
--

DROP TABLE IF EXISTS `aluno_matriculado_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_matriculado_curso` (
  `Aluno_idAluno` int NOT NULL,
  `Curso_idCurso` int NOT NULL,
  PRIMARY KEY (`Aluno_idAluno`,`Curso_idCurso`),
  KEY `fk_Aluno_has_Curso_Curso1_idx` (`Curso_idCurso`),
  KEY `fk_Aluno_has_Curso_Aluno1_idx` (`Aluno_idAluno`),
  CONSTRAINT `fk_Aluno_has_Curso_Aluno1` FOREIGN KEY (`Aluno_idAluno`) REFERENCES `aluno` (`idAluno`),
  CONSTRAINT `fk_Aluno_has_Curso_Curso1` FOREIGN KEY (`Curso_idCurso`) REFERENCES `curso` (`idCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_matriculado_curso`
--

LOCK TABLES `aluno_matriculado_curso` WRITE;
/*!40000 ALTER TABLE `aluno_matriculado_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno_matriculado_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `idCurso` int NOT NULL,
  `Departamento_idDepartamento` int NOT NULL,
  PRIMARY KEY (`idCurso`,`Departamento_idDepartamento`),
  KEY `fk_Curso_Departamento1_idx` (`Departamento_idDepartamento`),
  CONSTRAINT `fk_Curso_Departamento1` FOREIGN KEY (`Departamento_idDepartamento`) REFERENCES `departamento` (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `idDepartamento` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Campus` varchar(45) NOT NULL,
  `idProfessor_coordenador` int NOT NULL,
  PRIMARY KEY (`idDepartamento`,`idProfessor_coordenador`),
  KEY `fk_Departamento_Professor1_idx` (`idProfessor_coordenador`),
  CONSTRAINT `fk_Departamento_Professor1` FOREIGN KEY (`idProfessor_coordenador`) REFERENCES `professor` (`idProfessor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `idDisciplina` int NOT NULL,
  `Professor_idProfessor` int NOT NULL,
  PRIMARY KEY (`idDisciplina`,`Professor_idProfessor`),
  KEY `fk_Disciplina_Professor1_idx` (`Professor_idProfessor`),
  CONSTRAINT `fk_Disciplina_Professor1` FOREIGN KEY (`Professor_idProfessor`) REFERENCES `professor` (`idProfessor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina & curso`
--

DROP TABLE IF EXISTS `disciplina & curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina & curso` (
  `Disciplina_idDisciplina` int NOT NULL,
  `Curso_idCurso` int NOT NULL,
  PRIMARY KEY (`Disciplina_idDisciplina`,`Curso_idCurso`),
  KEY `fk_Disciplina_has_Curso_Curso1_idx` (`Curso_idCurso`),
  KEY `fk_Disciplina_has_Curso_Disciplina1_idx` (`Disciplina_idDisciplina`),
  CONSTRAINT `fk_Disciplina_has_Curso_Curso1` FOREIGN KEY (`Curso_idCurso`) REFERENCES `curso` (`idCurso`),
  CONSTRAINT `fk_Disciplina_has_Curso_Disciplina1` FOREIGN KEY (`Disciplina_idDisciplina`) REFERENCES `disciplina` (`idDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina & curso`
--

LOCK TABLES `disciplina & curso` WRITE;
/*!40000 ALTER TABLE `disciplina & curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `disciplina & curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extensão`
--

DROP TABLE IF EXISTS `extensão`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extensão` (
  `idExtensão` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Área` varchar(45) NOT NULL,
  `Instituição` varchar(45) NOT NULL,
  PRIMARY KEY (`idExtensão`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extensão`
--

LOCK TABLES `extensão` WRITE;
/*!40000 ALTER TABLE `extensão` DISABLE KEYS */;
/*!40000 ALTER TABLE `extensão` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extensão_has_aluno`
--

DROP TABLE IF EXISTS `extensão_has_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extensão_has_aluno` (
  `Extensão_idExtensão` int NOT NULL,
  `Aluno_idAluno` int NOT NULL,
  PRIMARY KEY (`Extensão_idExtensão`,`Aluno_idAluno`),
  KEY `fk_Extensão_has_Aluno_Aluno1_idx` (`Aluno_idAluno`),
  KEY `fk_Extensão_has_Aluno_Extensão1_idx` (`Extensão_idExtensão`),
  CONSTRAINT `fk_Extensão_has_Aluno_Aluno1` FOREIGN KEY (`Aluno_idAluno`) REFERENCES `aluno` (`idAluno`),
  CONSTRAINT `fk_Extensão_has_Aluno_Extensão1` FOREIGN KEY (`Extensão_idExtensão`) REFERENCES `extensão` (`idExtensão`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extensão_has_aluno`
--

LOCK TABLES `extensão_has_aluno` WRITE;
/*!40000 ALTER TABLE `extensão_has_aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `extensão_has_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matriculado`
--

DROP TABLE IF EXISTS `matriculado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matriculado` (
  `Aluno_idAluno` int NOT NULL,
  `Disciplina_idDisciplina` int NOT NULL,
  PRIMARY KEY (`Aluno_idAluno`,`Disciplina_idDisciplina`),
  KEY `fk_Aluno_has_Disciplina_Disciplina1_idx` (`Disciplina_idDisciplina`),
  KEY `fk_Aluno_has_Disciplina_Aluno_idx` (`Aluno_idAluno`),
  CONSTRAINT `fk_Aluno_has_Disciplina_Aluno` FOREIGN KEY (`Aluno_idAluno`) REFERENCES `aluno` (`idAluno`),
  CONSTRAINT `fk_Aluno_has_Disciplina_Disciplina1` FOREIGN KEY (`Disciplina_idDisciplina`) REFERENCES `disciplina` (`idDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matriculado`
--

LOCK TABLES `matriculado` WRITE;
/*!40000 ALTER TABLE `matriculado` DISABLE KEYS */;
/*!40000 ALTER TABLE `matriculado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oferta de disciplina`
--

DROP TABLE IF EXISTS `oferta de disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oferta de disciplina` (
  `Disciplina_idDisciplina` int NOT NULL,
  `Disciplina_Professor_idProfessor` int NOT NULL,
  `Período_idPeríodo` int NOT NULL,
  PRIMARY KEY (`Disciplina_idDisciplina`,`Disciplina_Professor_idProfessor`,`Período_idPeríodo`),
  KEY `fk_Disciplina_has_Período_Período1_idx` (`Período_idPeríodo`),
  KEY `fk_Disciplina_has_Período_Disciplina1_idx` (`Disciplina_idDisciplina`,`Disciplina_Professor_idProfessor`),
  CONSTRAINT `fk_Disciplina_has_Período_Disciplina1` FOREIGN KEY (`Disciplina_idDisciplina`, `Disciplina_Professor_idProfessor`) REFERENCES `disciplina` (`idDisciplina`, `Professor_idProfessor`),
  CONSTRAINT `fk_Disciplina_has_Período_Período1` FOREIGN KEY (`Período_idPeríodo`) REFERENCES `período` (`idPeríodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta de disciplina`
--

LOCK TABLES `oferta de disciplina` WRITE;
/*!40000 ALTER TABLE `oferta de disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `oferta de disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `período`
--

DROP TABLE IF EXISTS `período`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `período` (
  `idPeríodo` int NOT NULL,
  `Ano` varchar(45) DEFAULT NULL,
  `Semestre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPeríodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `período`
--

LOCK TABLES `período` WRITE;
/*!40000 ALTER TABLE `período` DISABLE KEYS */;
/*!40000 ALTER TABLE `período` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `idPessoa` int NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) NOT NULL,
  `endereço` varchar(45) NOT NULL,
  PRIMARY KEY (`idPessoa`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'Pessoa 01','000.000.000-00','Endereço 01 01');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `idProfessor` int NOT NULL,
  `Departamento_idDepartamento` int NOT NULL,
  `Pessoa_idPessoa` int NOT NULL,
  `Registro` varchar(45) NOT NULL,
  PRIMARY KEY (`idProfessor`,`Departamento_idDepartamento`),
  KEY `fk_Professor_Departamento1_idx` (`Departamento_idDepartamento`),
  KEY `fk_Professor_Pessoa1_idx` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Professor_Departamento1` FOREIGN KEY (`Departamento_idDepartamento`) REFERENCES `departamento` (`idDepartamento`),
  CONSTRAINT `fk_Professor_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pré-requisitos`
--

DROP TABLE IF EXISTS `pré-requisitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pré-requisitos` (
  `idPré-requisitos` int NOT NULL,
  PRIMARY KEY (`idPré-requisitos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pré-requisitos`
--

LOCK TABLES `pré-requisitos` WRITE;
/*!40000 ALTER TABLE `pré-requisitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pré-requisitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pré-requisitos das disciplinas`
--

DROP TABLE IF EXISTS `pré-requisitos das disciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pré-requisitos das disciplinas` (
  `Disciplina_idDisciplina` int NOT NULL,
  `Pré-requisitos_idPré-requisitos` int NOT NULL,
  PRIMARY KEY (`Disciplina_idDisciplina`,`Pré-requisitos_idPré-requisitos`),
  KEY `fk_Disciplina_has_Pré-requisitos_Pré-requisitos1_idx` (`Pré-requisitos_idPré-requisitos`),
  KEY `fk_Disciplina_has_Pré-requisitos_Disciplina1_idx` (`Disciplina_idDisciplina`),
  CONSTRAINT `fk_Disciplina_has_Pré-requisitos_Disciplina1` FOREIGN KEY (`Disciplina_idDisciplina`) REFERENCES `disciplina` (`idDisciplina`),
  CONSTRAINT `fk_Disciplina_has_Pré-requisitos_Pré-requisitos1` FOREIGN KEY (`Pré-requisitos_idPré-requisitos`) REFERENCES `pré-requisitos` (`idPré-requisitos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pré-requisitos das disciplinas`
--

LOCK TABLES `pré-requisitos das disciplinas` WRITE;
/*!40000 ALTER TABLE `pré-requisitos das disciplinas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pré-requisitos das disciplinas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-31 17:29:55
