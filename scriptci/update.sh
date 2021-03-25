#!/bin/bash


cd /home/ubuntu
sudo systemctl stop eschool
sudo wget -O eschool.jar https://eschoolbucket.s3.us-east-2.amazonaws.com/eschool.jar
sudo systemctl start eschool




