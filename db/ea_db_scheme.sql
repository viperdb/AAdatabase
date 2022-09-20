CREATE DATABASE `epitope_analyzer` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `epitope_analyzer`;

CREATE TABLE `PDB_ATOM` (
  `atom_site_key` int NOT NULL,
  `entry_key` int NOT NULL DEFAULT '0',
  `pdb` varchar(255) DEFAULT NULL,
  `type_symbol_id` varchar(255) DEFAULT NULL,
  `label_atom_id` varchar(255) DEFAULT NULL,
  `label_seq_id` varchar(255) DEFAULT NULL,
  `label_comp_id` varchar(255) DEFAULT NULL,
  `label_asym_id` varchar(255) DEFAULT NULL,
  `cartn_x` double DEFAULT NULL,
  `cartn_y` double DEFAULT NULL,
  `cartn_z` double DEFAULT NULL,
  `occupancy` double DEFAULT NULL,
  `b_iso_or_equiv` double DEFAULT NULL,
  PRIMARY KEY (`atom_site_key`,`entry_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `PDB_BioMT` (
  `PDB` varchar(10) DEFAULT NULL,
  `Mid` int NOT NULL,
  `entry_key` int NOT NULL,
  `matrix_0_0` double DEFAULT NULL,
  `matrix_0_1` double DEFAULT NULL,
  `matrix_0_2` double DEFAULT NULL,
  `matrix_1_0` double DEFAULT NULL,
  `matrix_1_1` double DEFAULT NULL,
  `matrix_1_2` double DEFAULT NULL,
  `matrix_2_0` double DEFAULT NULL,
  `matrix_2_1` double DEFAULT NULL,
  `matrix_2_2` double DEFAULT NULL,
  `vector_0` double DEFAULT NULL,
  `vector_1` double DEFAULT NULL,
  `vector_2` double DEFAULT NULL,
  PRIMARY KEY (`Mid`,`entry_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `PDB_Headers` (
  `entry_key` int NOT NULL AUTO_INCREMENT,
  `Pdb` varchar(10) DEFAULT NULL,
  `Name` varchar(500) DEFAULT NULL,
  `Mol_Type` varchar(45) DEFAULT NULL,
  `Resolution` double DEFAULT NULL,
  `Symm_BIOMT` varchar(45) DEFAULT NULL,
  `Experiment` varchar(255) DEFAULT NULL,
  `User` int DEFAULT NULL,
  PRIMARY KEY (`entry_key`)
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=latin1;

CREATE TABLE `PDB_Interactions` (
  `PDB_1` varchar(45) NOT NULL,
  `PDB_2` varchar(45) NOT NULL,
  `Chain_1` varchar(45) NOT NULL,
  `Chain_2` varchar(45) NOT NULL,
  `Atom_Name_1` varchar(45) NOT NULL,
  `Atom_Name_2` varchar(45) NOT NULL,
  `Amino_Name_1` varchar(45) DEFAULT NULL,
  `Amino_Name_2` varchar(45) DEFAULT NULL,
  `Amino_Num_1` int NOT NULL,
  `Amino_Num_2` int NOT NULL,
  `Distance` float DEFAULT NULL,
  `Type_of_Interaction` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PDB_1`,`PDB_2`,`Chain_1`,`Chain_2`,`Atom_Name_1`,`Atom_Name_2`,`Amino_Num_2`,`Amino_Num_1`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `PDB_Mol_Info` (
  `Pdb` varchar(10) DEFAULT NULL,
  `Mol_Id` int NOT NULL,
  `Chain` varchar(10) DEFAULT NULL,
  `Mol_Name` varchar(100) DEFAULT NULL,
  `Organism_Scientific` varchar(100) DEFAULT NULL,
  `Organism_TaxID` varchar(45) DEFAULT NULL,
  `Strain` varchar(100) DEFAULT NULL,
  `Organ` varchar(100) DEFAULT NULL,
  `Tissue` varchar(100) DEFAULT NULL,
  `entry_key` int NOT NULL,
  `Sequence` varchar(9000) DEFAULT NULL,
  PRIMARY KEY (`Mol_Id`,`entry_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `lab` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
