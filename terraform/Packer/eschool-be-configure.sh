sleep 30
sudo echo DATASOURCE_URL="jdbc:mysql://10.0.2.100:3306/eschool?useUnicode=true&characterEncoding=utf8&createDatabaseIfNotExist=true&&autoReconnect=true&useSSL=false" >> /etc/environment
sudo echo DATASOURCE_PASSWORD=eschoolPassword >> /etc/environment
sudo echo DATASOURCE_USERNAME=eschool >> /etc/environment 
source /etc/environment
sudo apt-get update
sudo apt install -y mariadb-client-core-10.3
sudo apt-get install -y openjdk-8-jdk
cd /home/ubuntu
wget -O /home/ubuntu/eschool.jar https://eschoolbucket.s3.us-east-2.amazonaws.com/eschool.jar
sudo chmod +x /home/ubuntu/eschool.jar
sudo chmod +x /home/ubuntu/eschoolstart.sh
sudo mv /home/ubuntu/eschool.service /etc/systemd/system/
sudo chmod +x /etc/systemd/system/eschool.service
sudo systemctl daemon-reload
sudo systemctl enable eschool
sudo systemctl start eschool

