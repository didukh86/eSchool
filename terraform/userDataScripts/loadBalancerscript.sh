#!/bin/bash
sudo apt-get update
sudo ufw allow ssh
sudo ufw allow 8080

sudo apt -y install nginx

sudo echo "upstream servers {
        server 10.0.1.10:8080;
        server 10.0.1.20:8080;

}
server {
        listen 8080;
        server_name example.atlantic.net;
        location / {
          proxy_pass http://servers;
        }
}" > /etc/nginx/sites-available/default
sudo systemctl restart nginx

