#!/bin/bash

apt install openssh-server
echo "SSH server installed"

chmod 600 ./FirstKeyPair.pem
ssh -i ./FirstKeyPair.pem ubuntu@18.189.184.188 'bash -s' < ./scriptci/update.sh

