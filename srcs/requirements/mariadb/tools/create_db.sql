USE mysql;
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS CH_NAME;
CREATE USER IF NOT EXISTS 'CH_USER'@'localhost' IDENTIFIED BY 'CH_PASS';
GRANT ALL PRIVILEGES ON CH_NAME.* TO 'CH_USER'@'%' IDENTIFIED BY 'CH_PASS';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'CH_ROOT_PASS';
FLUSH PRIVILEGES;