#!/bin/bash

sudo ssh -i ./eschool-key.pem -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@3.65.148.111 'bash -s' < ./scriptci/update.sh
sleep 30
sudo ssh -i ./eschool-key.pem -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@3.65.252.232 'bash -s' < ./scriptci/update.sh



