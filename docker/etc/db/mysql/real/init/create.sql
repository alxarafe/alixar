-- Normal database
ALTER
USER 'root'@'localhost' IDENTIFIED BY 'root';
CREATE
DATABASE IF NOT EXISTS `alixar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE
USER IF NOT EXISTS `dbuser`@`%` IDENTIFIED BY 'dbuser';
GRANT ALL PRIVILEGES ON alixar.* TO `dbuser`@`%`;
FLUSH
PRIVILEGES;