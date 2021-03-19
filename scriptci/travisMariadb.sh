#!/bin/bash

debconf-set-selections <<< 'mariadb-server-10.3 mysql-server/root_password password root'
debconf-set-selections <<< 'mariadb-server-10.3 mysql-server/root_password_again password root'
apt install mariadb-server-10.3 -y
echo 'Finnished reinstalling MariaDB Server 10.3'


# create database and user
mysql -e "CREATE DATABASE eschool DEFAULT CHARSET utf8 COLLATE utf8_unicode_ci;"
mysql -e "CREATE USER '$DATASOURCE_USERNAME'@'%' IDENTIFIED BY '$DATASOURCE_PASSWORD';"
mysql -e "GRANT ALL ON eschool.* TO $DATASOURCE_USERNAME@'%';"

echo 'USER created'