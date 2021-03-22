#!/bin/bash


ssh -i ./FirstKeyPair.pem ubuntu@18.189.184.188 'bash -s' < ./scriptci/update.sh

