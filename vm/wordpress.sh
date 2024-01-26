#!/bin/bash
sudo apt_get update -y
sudo apt-get install apache2 -y
sudo apt-get install wordpress -y
sudo systemctl start apache2
sudo systemctl enable apache2

