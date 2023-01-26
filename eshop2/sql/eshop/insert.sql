-- Active: 1660827563038@@127.0.0.1@3306@eshop
use `eshop`;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET SQL_SAFE_UPDATES = 0;

--
-- Enable LOAD DATA LOCAL INFILE on the server.
--
DELETE FROM `eshop`.`misc`;
DELETE FROM `eshop`.`kaffe`;
DELETE FROM `eshop`.`kaffe_mugg`;
DELETE FROM `eshop`.`produktregister`;
DELETE FROM `eshop`.`lager`;
DELETE FROM `eshop`.`Kund_Register`;

SET GLOBAL local_infile = 1;

--
-- loade objekts from csv into lager
--
LOAD DATA INFILE 'C:/cygwin64/home/zacki/databas/me/kmom06/eshop2/sql/eshop/lager.csv'
INTO TABLE `eshop`.`lager`
CHARSET utf8
FIELDS
    TERMINATED BY ';'
    ENCLOSED BY '"'
LINES
    TERMINATED BY '.'
(`produktKod`, `namn`, `antal`, `lagerhylla`)
;

--
-- loade objekts from csv into Kund_Register
--
LOAD DATA INFILE 'C:/Users/zacki/OneDrive/Desktop/programering/datorteknik/kmom06/eshop2/sql/eshop/Kund_register.csv'
INTO TABLE `eshop`.`Kund_Register`
CHARSET utf8
FIELDS
    TERMINATED BY ';'
    ENCLOSED BY '"'
LINES
    TERMINATED BY '.'
(`Kund_id`, `namn`, `adres`, `tel`, `mail`)
;

--
-- loade objekts from csv into produktregister
--
LOAD DATA INFILE 'C:/Users/zacki/OneDrive/Desktop/programering/datorteknik/kmom06/eshop2/sql/eshop/produktregister.csv'
INTO TABLE `eshop`.`produktregister`
CHARSET utf8
FIELDS
    TERMINATED BY ';'
    ENCLOSED BY '"'
LINES
    TERMINATED BY '.'
(`produkt_kategori`, `produktKod`, `pris`)
;

--
-- loade objekts from csv into coffe
--
LOAD DATA INFILE 'C:/Users/zacki/OneDrive/Desktop/programering/datorteknik/kmom06/eshop2/sql/eshop/coffie.csv'
INTO TABLE `eshop`.`kaffe`
CHARSET utf8
FIELDS
    TERMINATED BY ';'
    ENCLOSED BY '"'
LINES
    TERMINATED BY '.'
(`produktKod`, `pris`, `namn`, `kort_beskrivning`, `antal`)
;
--
-- loade objekts from csv into misc
--
LOAD DATA INFILE 'C:/cygwin64/home/zacki/databas/me/kmom06/eshop2/sql/eshop/misc.csv'
INTO TABLE `eshop`.`misc`
CHARSET utf8
FIELDS
    TERMINATED BY ';'
    ENCLOSED BY '"'
LINES
    TERMINATED BY '.'
(`produktKod`, `pris`, `namn`, `kort_beskrivning`, `antal`)
;

--
-- loade objekts from csv into kaffe_mugg
--
LOAD DATA INFILE 'C:/cygwin64/home/zacki/databas/me/kmom06/eshop2/sql/eshop/coffie_mugg.csv'
INTO TABLE `eshop`.`kaffe_mugg`
CHARSET utf8
FIELDS
    TERMINATED BY ';'
    ENCLOSED BY '"'
LINES
    TERMINATED BY '.'
(`produktKod`, `pris`, `namn`, `kort_beskrivning`, `antal`)
;
select * from eshop.Order;
SET GLOBAL local_infile = 0;
