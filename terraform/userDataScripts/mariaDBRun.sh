#!/bin/bash
sudo apt-get update
sudo echo DATASOURCE_PASSWORD=eschoolPassword >> /etc/environment
sudo echo DATASOURCE_USERNAME=eschool >> /etc/environment 
source /etc/environment

sudo apt install -y mariadb-server-10.3 
echo 'Finnished reinstalling MariaDB Server 10.3'
sudo systemctl stop mariadb
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sudo systemctl start mariadb
# create database and user
sleep 0.5

sudo mysql -e "CREATE DATABASE eschool DEFAULT CHARSET utf8 COLLATE utf8_unicode_ci;"
sudo mysql -e "CREATE USER '$DATASOURCE_USERNAME'@'%' IDENTIFIED BY '$DATASOURCE_PASSWORD';"
sudo mysql -e "GRANT ALL ON eschool.* TO $DATASOURCE_USERNAME@'%';"

echo 'USER created'
