#!/bin/bash


sudo ssh -i ./FirstKeyPair.pem -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@18.189.184.188 'bash -s' < ./scriptci/update.sh

