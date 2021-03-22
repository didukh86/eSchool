#!/bin/bash
date
sudo apt install net-tools
cd /home/ubuntu

sudo killall -9 java
wget https://eschoolbucket.s3.us-east-2.amazonaws.com/eschool.jar
sudo java -jar -eschool.jar
exit

