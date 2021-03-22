#!/bin/bash
sudo apt update
sudo apt install openssh-server
echo "SSH server installed"

ssh -i FirstKeyPair.pem.enc ubuntu@18.189.184.188 'bash -s' < ./scriptci/update.sh

