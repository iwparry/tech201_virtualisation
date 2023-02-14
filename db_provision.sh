#!/bin/bash

# Getting the key for the database we want to use
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Update and Install
sudo apt-get update -y
sudo apt-get upgrade -y

# Installing Mongodb
sudo apt-get install mongodb-org=3.2.20 -y
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

# Activating Mongodb
sudo systemctl start mongod
sudo systemctl enable mongod

# Editing the Mongodb configuration file
sudo rm /etc/mongod.conf
sudo cp environment/spec-tests/replace_ip /etc/mongod.conf

# Restarting Mongodb and enabling it again
sudo systemctl restart mongod
sudo systemctl enable mongod