-- Active: 1660827563038@@127.0.0.1@3306@eshop
drop user if exists 'maria'@'%';
CREATE USER 'maria'@'%' IDENTIFIED BY  '123';
GRANT ALL PRIVILEGES ON *.* to 'maria'@'%';
GRANT PROCESS ON *.* TO 'maria'@'%';
DROP DATABASE IF EXISTS `eshop`;
CREATE DATABASE IF NOT EXISTS `eshop`;