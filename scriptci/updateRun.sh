#!/bin/bash

sudo ssh -i ./eschool-key.pem -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@3.66.3.207 'bash -s' < ./scriptci/update.sh
sleep 30
sudo ssh -i ./eschool-key.pem -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@18.196.123.113 'bash -s' < ./scriptci/update.sh



