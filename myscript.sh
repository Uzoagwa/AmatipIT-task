#!/bin/bash
sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ubuntu
sudo docker pull nginx
sudo docker run -d --name nginx-container -p 80:80 nginx




