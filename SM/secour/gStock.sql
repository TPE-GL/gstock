-- MySQL Script generated by MySQL Workbench
-- Mon Aug 24 12:47:28 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Table  `Produit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  `Produit` (
  `qualite` VARCHAR(255) NOT NULL,
  `model` VARCHAR(255) NOT NULL,
  `marque` VARCHAR(255) NOT NULL,
  `type` VARCHAR(255) NOT NULL,
  `prix_d_achat` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`qualite`, `model`))
 ;


-- -----------------------------------------------------
-- Table  `facture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  `facture` (
  `numero` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`numero`))
 ;


-- -----------------------------------------------------
-- Table  `achat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  `achat` (
  `id` INT NOT NULL ,
  `nombreModel` INT NOT NULL,
  `remise` INT NOT NULL,
  `date` DATE NOT NULL,
  `qualiteProduit` VARCHAR(255) NOT NULL,
  `modelProduit` VARCHAR(255) NOT NULL,
  `numeroFacture` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`qualiteProduit` , `modelProduit`)
    REFERENCES  `Produit` (`qualite` , `model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`numeroFacture`)
    REFERENCES  `facture` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
 ;


-- -----------------------------------------------------
-- Table  `magasin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  `magasin` (
  `qualiteProduit` VARCHAR(255) NOT NULL,
  `modelProduit` VARCHAR(255) NOT NULL,
  `quantite` INT NOT NULL,
  `min` INT NOT NULL DEFAULT 50,
  PRIMARY KEY (`qualiteProduit`, `modelProduit`),
    FOREIGN KEY (`qualiteProduit` , `modelProduit`)
    REFERENCES  `Produit` (`qualite` , `model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
 ;


-- -----------------------------------------------------
-- Table  `boutique`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  `boutique` (
  `qualiteProduit` VARCHAR(255) NOT NULL,
  `modelProduit` VARCHAR(255) NOT NULL,
  `quantite` INT NOT NULL,
  `min` INT NOT NULL DEFAULT 10,
  PRIMARY KEY (`qualiteProduit`, `modelProduit`),
    FOREIGN KEY (`qualiteProduit` , `modelProduit`)
    REFERENCES  `Produit` (`qualite` , `model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
 ;


-- -----------------------------------------------------
-- Table  `user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  `user` (
	`id`  INTEGER NOT NULL,
  `login` VARCHAR(255) NOT NULL UNIQUE,
  `passWord` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
 ;