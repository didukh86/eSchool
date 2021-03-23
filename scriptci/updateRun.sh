#!/bin/bash

if sudo ssh -i ./eschool-key.pem -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@18.192.93.201 'bash -s' < ./scriptci/update.sh
then
echo "succefully passed update 1"
 sudo ssh -i ./eschool-key.pem -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@3.66.34.86 'bash -s' < ./scriptci/update.sh
fi


