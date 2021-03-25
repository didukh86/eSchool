#!/bin/bash

sudo ssh -i ./eschool-key.pem -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@3.65.225.43 'bash -s' < ./scriptci/update.sh
sleep 30
sudo ssh -i ./eschool-key.pem -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@18.184.250.127 'bash -s' < ./scriptci/update.sh



