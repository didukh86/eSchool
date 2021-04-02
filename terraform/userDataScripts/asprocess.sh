#!/bin/bash

sleep 30
sudo echo DATASOURCE_URL="jdbc:mysql://10.0.2.100:3306/eschool?useUnicode=true&characterEncoding=utf8&createDatabaseIfNotExist=true&&autoReconnect=true&useSSL=false" >> /etc/environment
sudo echo DATASOURCE_PASSWORD=eschoolPassword >> /etc/environment
sudo echo DATASOURCE_USERNAME=eschool >> /etc/environment 

source /etc/environment
sudo apt-get update

sudo apt install -y mariadb-client-core-10.3

echo 'Finnished reinstalling MariaDB Server 10.3'

sudo apt-get install -y openjdk-8-jdk
cd /home/ubuntu
wget -O eschool.jar https://eschoolbucket.s3.us-east-2.amazonaws.com/eschool.jar
sudo chmod +x eschool.jar

sudo echo "[Service]
ExecStart=/home/ubuntu/eschoolstart.sh
Restart=always
WorkingDirectory=/home/ubuntu
User=root
Restart=on-failure
RestartSec=30

SuccessExitStatus=143
TimeoutStopSec=10
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/eschool.service

sudo echo "#!/bin/bash

sudo java -jar /home/ubuntu/eschool.jar" > /home/ubuntu/eschoolstart.sh

sudo chmod +x /home/ubuntu/eschoolstart.sh

sudo systemctl daemon-reload
sudo systemctl enable eschool
sudo systemctl start eschool
