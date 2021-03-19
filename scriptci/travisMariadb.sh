#!/bin/bash

# create database and user
sudo mysql -e "CREATE DATABASE eschool DEFAULT CHARSET utf8 COLLATE utf8_unicode_ci;"
sudo mysql -e "CREATE USER '$DATASOURCE_USERNAME'@'%' IDENTIFIED BY '$DATASOURCE_PASSWORD';"
sudo mysql -e "GRANT ALL ON eschool.* TO $DATASOURCE_USERNAME@'%';"

echo 'USER created'
