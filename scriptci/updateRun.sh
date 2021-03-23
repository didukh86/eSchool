#!/bin/bash

if sudo ssh -i ./eschool-key.pem -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@18.195.224.128 'bash -s' < ./scriptci/update.sh
then
echo "succefully passed update 1"
 sudo ssh -i ./eschool-key.pem -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@18.192.233.36 'bash -s' < ./scriptci/update.sh
fi


