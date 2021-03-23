#!/bin/bash

sudo ufw allow ssh
sudo ufw allow 8080
sudo ufw allow 3306
yes | sudo ufw enable

sudo ufw deny 8080
cd /home/ubuntu/
sudo pkill -9 java
sudo ufw allow 8080


wget -O eschool.jar https://eschoolbucket.s3.us-east-2.amazonaws.com/eschool.jar
sudo nohup java -jar eschool.jar &
exit



