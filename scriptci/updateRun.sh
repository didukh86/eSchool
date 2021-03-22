#!/bin/bash

ssh -i FirstKeyPair.pem.enc ubuntu@18.189.184.188 'bash -s' < ./scriptci/script.sh

