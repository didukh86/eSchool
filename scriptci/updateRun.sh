#!/bin/bash

if sudo ssh -i ./FirstKeyPair.pem -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@18.189.184.188 'bash -s' < ./scriptci/update.sh
then
echo "succefully passed update 1"
 sudo ssh -i ./FirstKeyPair.pem -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@3.142.198.62 'bash -s' < ./scriptci/update.sh
echo "succefully passed update 1"
fi
