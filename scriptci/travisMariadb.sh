#!/bin/bash

# create database and user
mysql -e "CREATE DATABASE eschool DEFAULT CHARSET utf8 COLLATE utf8_unicode_ci;"
mysql -e "CREATE USER '$DATASOURCE_USERNAME'@'%' IDENTIFIED BY '$DATASOURCE_PASSWORD';"
mysql -e "GRANT ALL ON eschool.* TO $DATASOURCE_USERNAME@'%';"

echo 'USER created'
