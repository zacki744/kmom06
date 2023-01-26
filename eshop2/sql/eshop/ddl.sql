-- Active: 1660827563038@@127.0.0.1@3306@eshop
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema eshop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema eshop
-- -----------------------------------------------------
drop schema if EXISTS `eshop`;
CREATE SCHEMA IF NOT EXISTS `eshop` DEFAULT CHARACTER SET utf8mb3 ;
USE `eshop` ;

-- -----------------------------------------------------
-- Table `eshop`.`produktregister`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`produktregister` ;

CREATE TABLE IF NOT EXISTS `eshop`.`produktregister` (
  `id` INT NOT NULL auto_increment,
  `produkt_kategori` VARCHAR(45) NOT NULL,
  `produktKod` BIGINT NOT NULL,
  `pris` BIGINT NOT NULL,
  PRIMARY KEY (`id`, `produkt_kategori`, `produktKod`, `pris`)
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `eshop`.`kaffe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`kaffe` ;

CREATE TABLE IF NOT EXISTS `eshop`.`kaffe` (
  `idkaffe` INT auto_increment,
  `produktKod` BIGINT NOT NULL,
  `pris` BIGINT NOT NULL,
  `namn` VARCHAR(45) NULL,
  `kort_beskrivning` VARCHAR(500) NULL,
  `antal` BIGINT NULL,
  PRIMARY KEY (`idkaffe`),
    FOREIGN KEY (`idkaffe`)
    REFERENCES `eshop`.`produktregister` (`id`)
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eshop`.`misc`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`misc` ;

CREATE TABLE IF NOT EXISTS `eshop`.`misc` (
  `idmisc` INT auto_increment,
  `produktKod` BIGINT NOT NULL,
  `pris` BIGINT NOT NULL,
  `namn` VARCHAR(45) NULL,
  `kort_beskrivning` VARCHAR(500) NULL,
  `antal` BIGINT NULL,
  PRIMARY KEY (`idmisc`),
  UNIQUE INDEX `produktKod_UNIQUE` (`produktKod` ASC) VISIBLE,
  INDEX `idmisc_idx` (`idmisc` ASC, `produktKod` ASC, `pris` ASC) VISIBLE,
  CONSTRAINT `idmisc`
    FOREIGN KEY (`idmisc`)
    REFERENCES `eshop`.`produktregister` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eshop`.`kaffe_mugg`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`kaffe_mugg` ;

CREATE TABLE IF NOT EXISTS `eshop`.`kaffe_mugg` (
  `idMugg` INT auto_increment,
  `produktKod` BIGINT NOT NULL,
  `pris` BIGINT NOT NULL,
  `namn` VARCHAR(45) NULL,
  `kort_beskrivning` VARCHAR(500) NULL,
  `antal` BIGINT NULL,
  PRIMARY KEY (`idMugg`),
  UNIQUE INDEX `produktKod_UNIQUE` (`produktKod` ASC) VISIBLE,
  INDEX `idMugg_idx` (`idMugg` ASC, `produktKod` ASC, `pris` ASC) VISIBLE,
  CONSTRAINT `idMugg`
    FOREIGN KEY (`idMugg`)
    REFERENCES `eshop`.`produktregister` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eshop`.`Order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`Order` ;

CREATE TABLE IF NOT EXISTS `eshop`.`Order` (
  `id_kund` INT NOT NULL,
  `Namn` VARCHAR(45) NULL,
  `produktkod` BIGINT NOT NULL,
  `antal` BIGINT NULL
   )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eshop`.`lager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`lager` ;

CREATE TABLE IF NOT EXISTS `eshop`.`lager` (
  `produktkod` INT NOT NULL AUTO_INCREMENT,
  `namn` VARCHAR(45) NULL,
  `antal` BIGINT NULL,
  `lagerhylla` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`lagerhylla`),
  UNIQUE INDEX `produktkod_UNIQUE` (`produktkod` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eshop`.`plocklista`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`plocklista` ;

CREATE TABLE IF NOT EXISTS `eshop`.`plocklista` (
  `id_kund` INT NOT NULL,
  `Namn` VARCHAR(45) NOT NULL,
  `produktkod` BIGINT NOT NULL,
  `antal` BIGINT NOT NULL,
  `lagerhylla` VARCHAR(45) NULL
   )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eshop`.`Kund_Register`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`Kund_Register` ;

CREATE TABLE IF NOT EXISTS `eshop`.`Kund_Register` (
  `Kund_id` INT NOT NULL,
  `namn` VARCHAR(45) NOT NULL,
  `adres` VARCHAR(45) NOT NULL,
  `tel` INT NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Kund_id`),
  UNIQUE INDEX `Kund_id_UNIQUE` (`Kund_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eshop`.`faktura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`faktura` ;

CREATE TABLE IF NOT EXISTS `eshop`.`faktura` (
  `kundnamn` VARCHAR(45) NOT NULL,
  `produkt_id` INT NOT NULL,
  `pris` INT NOT NULL,
  `produkt_namn` VARCHAR(45) NULL,
  `antal` BIGINT NULL,
  `tel` INT NULL,
  `mail` VARCHAR(45) NULL,
  `kund_id` INT NOT NULL
   )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eshop`.`Register`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`Register` ;

CREATE TABLE IF NOT EXISTS `eshop`.`Register` (
  `köp_id` INT NOT NULL AUTO_INCREMENT,
  `kundnamn` VARCHAR(45) NOT NULL,
  `pris` BIGINT NULL,
  `produkt_namn` VARCHAR(45) NULL,
  `antal` BIGINT NULL,
  `tel` INT NULL,
  `mail` VARCHAR(45) NULL,
  `kund_id` INT NOT NULL,
  PRIMARY KEY (`köp_id`),
  UNIQUE INDEX `köp_id_UNIQUE` (`köp_id` ASC) VISIBLE
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eshop`.`logg`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`logg` ;

CREATE TABLE IF NOT EXISTS `eshop`.`logg` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tid` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `handelse` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


DROP PROCEDURE IF EXISTS `eshop`.`insertInto`;

DELIMITER ;;
CREATE PROCEDURE `eshop`.`insertInto`
(
	`f_produkt_kategori`  VARCHAR(45),
	`f_produktKod` BIGINT,
    `f_pris` BIGINT,
    `f_namn` VARCHAR(45),
    `f_kort_beskrivning` VARCHAR(500) ,
    `f_antal` BIGINT
)
BEGIN
	IF `f_produkt_kategori` = 'misc' THEN
		INSERT INTO `eshop`.`misc` (`produktKod`, `pris`, `namn`, `kort_beskrivning`, `antal`)
		values(`f_produktKod`, `f_pris`, `f_namn`, `f_kort_beskrivning`, `f_antal`);
        
    ELSEIF `f_produkt_kategori` = 'kaffe' THEN
		INSERT INTO `eshop`.`kaffe` (`produktKod`, `pris`, `namn`, `kort_beskrivning`, `antal`)
		values(`f_produktKod`, `f_pris`, `f_namn`, `f_kort_beskrivning`, `f_antal`);   
        
    ELSEIF `f_produkt_kategori` = 'kaffe_mugg' THEN
		INSERT INTO `eshop`.`kaffe_mugg` (`produktKod`, `pris`, `namn`, `kort_beskrivning`, `antal`)
		values(`f_produktKod`, `f_pris`, `f_namn`, `f_kort_beskrivning`, `f_antal`);
	END IF;
END
;;
DELIMITER ;

--
-- show log with limit
--
DROP PROCEDURE IF EXISTS show_log;
DELIMITER ;;
CREATE PROCEDURE show_log(_num INT)
BEGIN
    SELECT id, DATE_FORMAT(tid, '%Y-%m-%d %H:%i:%s') AS 'Time', handelse FROM logg
    ORDER BY id DESC
    LIMIT _num;
END
;;
DELIMITER ;

--
-- show all rows in storage 
--
DROP PROCEDURE IF EXISTS show_storage;
DELIMITER ;;
CREATE PROCEDURE show_storage_1()
BEGIN
    SELECT * FROM `eshop`.`lager`
    ORDER BY `lagerhylla` DESC
    ;
END
;;
DELIMITER ;
--
-- show lagerhylla rows in storage 
--
DROP PROCEDURE IF EXISTS show_storage;
DELIMITER ;;
CREATE PROCEDURE show_storage_2()
BEGIN
    SELECT `lagerhylla` FROM `eshop`.`lager`
    ORDER BY `lagerhylla` DESC
    ;
END
;;
DELIMITER ;
--
-- show product inventory
--
DROP PROCEDURE IF EXISTS serch_sorage;
DELIMITER ;;
CREATE PROCEDURE serch_sorage(_fltr VARCHAR(45))
BEGIN
    SELECT *
    FROM `eshop`.`lager`
    WHERE `produktkod` = _fltr OR `namn` LIKE CONCAT('%',_fltr,'%')  OR `lagerhylla` = _fltr;
END
;;
DELIMITER ;

--
-- add inventory
--
DROP PROCEDURE IF EXISTS addInv;
DELIMITER ;;
CREATE PROCEDURE addInv(
    _id INT,
    _hylla VARCHAR(45),
    _antal BIGINT)
BEGIN
    IF (
        SELECT `antal`
        FROM `eshop`.`lager`
        WHERE `produktkod` = _id AND `lagerhylla` = _hylla)

        THEN
        UPDATE `eshop`.`lager`
        SET `antal` = `antal` + _antal
        WHERE `produktkod` = _id AND `lagerhylla` = _hylla;

        ELSE
        INSERT INTO `eshop`.`lager`(`produktkod`, `antal`, `lagerhylla`)
        VALUES(_id, _antal, _hylla);
	END IF;
END
;;
DELIMITER ;

--
-- del inventory
--
DROP PROCEDURE IF EXISTS delInv;
DELIMITER ;;
CREATE PROCEDURE delInv(
    _id INT,
    _hylla VARCHAR(45),
    _antal BIGINT)
BEGIN
    IF (
        (SELECT `antal` 
        FROM `eshop`.`lager`
        WHERE `produktkod` = _id AND `lagerhylla` = _hylla) - _antal <= 0)

        THEN
        DELETE FROM `eshop`.`lager`
        WHERE `produktkod` = _id AND `lagerhylla` = _hylla;

        ELSE
        UPDATE `eshop`.`lager`
        SET `antal`  = `antal` - _antal
        WHERE `produktkod` = _id AND `lagerhylla` = _hylla;
    END IF;
END
;;
DELIMITER ;

DROP PROCEDURE IF EXISTS SELECT_ALL;
DELIMITER ;;

CREATE PROCEDURE SELECT_ALL
(
  _the_name varchar(45)
)
BEGIN
	IF _the_name = 'eshop.kaffe' THEN 
		SELECT `namn`, `kort_beskrivning`, `antal`, `pris`, `produktKod` FROM `eshop`.`kaffe`;
	ELSEIF _the_name = 'eshop.kaffe_mugg' THEN
		SELECT `namn`, `kort_beskrivning`, `antal`, `pris`, `produktKod` FROM `eshop`.`kaffe_mugg`;
	ELSE
		SELECT `namn`, `kort_beskrivning`, `antal`, `pris`, `produktKod` FROM `eshop`.`misc`;
	END IF;
END
;;
DELIMITER ;

DROP PROCEDURE IF EXISTS SELECT_ALL_where;
DELIMITER ;;

CREATE PROCEDURE SELECT_ALL_where
(
_the_name VARCHAR(45),
_id INT
)
BEGIN
	IF _the_name = 'kaffe' THEN 
		SELECT `namn`, `kort_beskrivning`, `antal`, `pris`, `produktKod` FROM  `eshop`.`kaffe` WHERE `produktkod` = _id;
	ELSEIF _the_name = 'kaffe_mugg' THEN
		SELECT `namn`, `kort_beskrivning`, `antal`, `pris`, `produktKod` FROM  `eshop`.`kaffe_mugg` WHERE `produktkod` = _id;
	ELSE
		SELECT `namn`, `kort_beskrivning`, `antal`, `pris`, `produktKod` FROM  `eshop`.`misc` WHERE `produktkod` = _id;
	END IF;
END
;;
DELIMITER ;

DROP PROCEDURE IF EXISTS uppdate_objekt;
DELIMITER ;;

CREATE PROCEDURE uppdate_objekt
(
_the_name VARCHAR(45),
_pris INT,
_namn VARCHAR(45),
_kort_beskrivning VARCHAR(500),
_antal INT,
_id INT
)
BEGIN
	IF _the_name = 'kaffe' THEN 
		UPDATE `eshop`.`kaffe` SET `pris` = _pris, `namn` = _namn, `kort_beskrivning` = _kort_beskrivning, `antal` = _antal WHERE `produktKod` = _id;
	ELSEIF _the_name = 'kaffe_mugg' THEN
		UPDATE `eshop`.`kaffe_mugg` SET `pris` = _pris, `namn` = _namn, `kort_beskrivning` = _kort_beskrivning, `antal` = _antal WHERE `produktKod` = _id;
	ELSE
		UPDATE `eshop`.`misc` SET `pris` = _pris, `namn` = _namn, `kort_beskrivning` = _kort_beskrivning, `antal` = _antal WHERE `produktKod` = _id;
	END IF;
END
;;
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_object;
DELIMITER ;;

CREATE PROCEDURE delete_object
(
_the_name VARCHAR(45),
_id INT
)
BEGIN
	IF _the_name = 'kaffe' THEN 
		DELETE FROM  `eshop`.`kaffe` WHERE `produktkod` = _id;
	ELSEIF _the_name = 'kaffe_mugg' THEN
		DELETE FROM  `eshop`.`kaffe_mugg` WHERE `produktkod` = _id;
	ELSE
		DELETE FROM  `eshop`.`misc` WHERE `produktkod` = _id;
	END IF;
END
;;
DELIMITER ;

--
-- costumer_list
--
DROP procedure if exists costumer_list
delimiter ;;

create procedure costumer_list ()
begin
	select * from `eshop`.`Kund_Register`;
end
;;
delimiter ;

--
-- insert into order
--
DROP PROCEDURE IF EXISTS insert_order;
DELIMITER //
CREATE PROCEDURE insert_order (
	  IN f_id_kund INT,
      IN f_produktkod BIGINT,
	  IN f_Namn VARCHAR(45),
	  IN f_antal BIGINT
      )
      BEGIN
		INSERT INTO `eshop`.`Order`(`id_kund`, `Namn`, `produktkod`, `antal`)
		values(f_id_kund, f_Namn, f_produktkod, f_antal);
      END //
DELIMITER ;

--
-- insert_order procedure
--

drop procedure if exists update_table_amount
delimiter //

create procedure update_table_amount (
	produktKod int,
    f_antal int
    )
    BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE current_table VARCHAR(45);
    DECLARE table_cursor CURSOR FOR SELECT table_name FROM information_schema.tables WHERE table_schema = 'eshop' AND table_name IN ('kaffe', 'misc', 'kaffe_mugg');
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN table_cursor;
    read_loop: LOOP
        FETCH table_cursor INTO current_table;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SET @update_query = CONCAT('UPDATE ', current_table, ' SET antal = ', f_antal, ' WHERE produktKod = ', produktKod);
        PREPARE stmt FROM @update_query;
        EXECUTE stmt;
    END LOOP;
    CLOSE table_cursor;
END//
DELIMITER ;

--
-- SHOW ORDER LIST
--
DROP PROCEDURE IF EXISTS order_history
DELIMITER //

CREATE PROCEDURE order_history ()
BEGIN
	SELECT * FROM `eshop`.`Order`;
END //
DELIMITER ;
  
--
-- Triggers
--
DROP TRIGGER IF EXISTS log_kaffe_insert;
DROP TRIGGER IF EXISTS log_misc_insert;
DROP TRIGGER IF EXISTS log_kaffe_mugg_insert;
DROP TRIGGER IF EXISTS log_lager_insert;

DROP TRIGGER IF EXISTS log_lager_update;
DROP TRIGGER IF EXISTS log_kaffe_update;
DROP TRIGGER IF EXISTS log_misc_update;
DROP TRIGGER IF EXISTS log_kaffe_mugg_update;

DROP TRIGGER IF EXISTS log_kaffe_delete;
DROP TRIGGER IF EXISTS log_misc_delete;
DROP TRIGGER IF EXISTS log_kaffe_mugg_delete;
DROP TRIGGER IF EXISTS log_lager_delete;

CREATE TRIGGER log_kaffe_insert
AFTER INSERT
ON `eshop`.`kaffe` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product inserted: ', NEW.namn, ', pris: ', NEW.pris));


CREATE TRIGGER log_misc_insert
AFTER INSERT
ON `eshop`.`kaffe_mugg` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product inserted: ', NEW.namn, ', pris: ', NEW.pris));
        
CREATE TRIGGER log_kaffe_mugg_insert
AFTER INSERT
ON `eshop`.`misc` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product inserted: ', NEW.namn, ', pris: ', NEW.pris));

CREATE TRIGGER log_lager_insert
AFTER INSERT
ON `eshop`.`lager` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product inserted: ', NEW.`produktkod`, ', amount: ', NEW.antal));

--
-- delete
--
CREATE TRIGGER log_kaffe_delete
AFTER DELETE
ON `eshop`.`kaffe` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product deleted: ', OLD.namn));


CREATE TRIGGER log_misc_delete
AFTER DELETE
ON `eshop`.`kaffe_mugg` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product deleted: ', OLD.namn));
        
CREATE TRIGGER log_kaffe_mugg_delete
AFTER DELETE
ON `eshop`.`misc` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product deleted: ', OLD.namn));

CREATE TRIGGER log_lager_delete
AFTER DELETE
ON `eshop`.`lager` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product deleted: ', OLD.`produktkod`));

--
-- uppdate
--
CREATE TRIGGER log_kaffe_update
AFTER UPDATE
ON `eshop`.`kaffe` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT(
            'Product updated, on the id: ',
            OLD.produktKod,
            ', ',
            OLD.namn,
            ', ',
            OLD.pris,
            ', ',
            OLD.antal,
            ', ',
            ' After: ',
            ', ',
            NEW.namn,
            ', ',
            NEW.pris,
             ', ',
            NEW.antal
            
));

CREATE TRIGGER log_misc_update
AFTER UPDATE
ON `eshop`.`kaffe_mugg` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT(
            'Product updated, on the id: ',
            OLD.produktKod,
            ', ',
            OLD.namn,
            ', ',
            OLD.pris,
            ', ',
            OLD.antal,
            ', ',
            ' After: ',
            ', ',
            NEW.namn,
            ', ',
            NEW.pris,
             ', ',
            NEW.antal
            
));        
CREATE TRIGGER log_kaffe_mugg_update
AFTER UPDATE
ON `eshop`.`misc` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT(
            'Product updated, on the id: ',
            OLD.produktKod,
            ', ',
            OLD.namn,
            ', ',
            OLD.pris,
            ', ',
            OLD.antal,
            ', ',
            ' After: ',
            ', ',
            NEW.namn,
            ', ',
            NEW.pris,
             ', ',
            NEW.antal
            
));

CREATE TRIGGER log_lager_update
AFTER UPDATE
ON `eshop`.`lager` FOR EACH ROW
    INSERT INTO logg(`handelse`)
        VALUES (CONCAT(
            'Product updated, on the id: ',
            OLD.produktKod,
            ', ',
            OLD.`lagerhylla`,
            ', ',
            OLD.antal,
            ', ',
            ' After: ',
            NEW.`lagerhylla`,
             ', ',
            NEW.antal
));
