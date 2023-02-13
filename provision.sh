#!/bin/bash

# Update and upgrade
sudo apt-get update -y
sudo apt-get upgrade -y

# Install nginx
sudo apt-get install nginx -y

# Enable or start Nginx
sudo systemctl enable nginx -y

# Install Node.js dependencies
sudo apt-get install python-software-properties -y

# Specifying and Installing the desired version of Node-js (6.x)
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash
sudo apt-get install nodejs -y

# Installing pm2 package
sudo npm install pm2 -g

# # Navigate into our app folder and install our app
# cd app
# npm install

# # Start app
# node app.js
