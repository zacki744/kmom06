-- Active: 1660827563038@@127.0.0.1@3306@eshop
drop user if exists 'maria'@'%';
CREATE USER 'maria'@'%' IDENTIFIED BY  '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257';
GRANT ALL PRIVILEGES ON *.* to 'maria'@'%';
GRANT PROCESS ON *.* TO 'maria'@'%';
DROP DATABASE IF EXISTS `eshop`;
CREATE DATABASE IF NOT EXISTS `eshop`;