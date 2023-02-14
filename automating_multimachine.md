# Automating Multimachine Vagrant

This markdown illustrates how we are able to simultaneously provision two Virtual Machines.

## Provisioning the Database VM in our Vagrantfile so that Database has Mongodb

We start off by creating a shell file to provision our database VM, lets name it `db_provision.sh` and add the following commands:
```sh
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
```
When we `ssh` into out database VM we should have `mongod`.

We should also ensure that we have added our provisioning line to our database configuration in `Vagrantfile`.
```Ruby
database.vm.provision "shell", path: "db_provision.sh"
```
This works since we have created the file within the same folder as our `Vagrantfile`.

Now we have provisioned our database VM in such a way that we have MongoDB installed after `vagrant up`.

## Activating MongoDB and get /posts working on our IP address

To provision the activation of MongoDB in our `database` VM we add these lines to `db_provision`:
```sh
# Activating Mongodb
sudo systemctl start mongod
sudo systemctl enable mongod
```
At this point we should be able to access the configuration file `/etc/mongod.conf`, we need to edit this in such a way that our app can access it (changing bindIp from `127.0.0.1` to `0.0.0.0`) to do this we need to create another file that contains the exact contents of the configuration file, but of course with our desired change. To do this we add the following to our provision file:
```sh
# Editing the Mongodb configuration file
sudo rm /etc/mongod.conf
sudo cp environment/spec-tests/replace_ip /etc/mongod.conf
```
Where `replace_ip` is our edited configuration file and we replace the original file with our edited file.

Note we will need restart MongoDB and enable it again. So we also add:
```sh
# Restarting Mongodb and enabling it again
sudo systemctl restart mongod
sudo systemctl enable mongod
```
We should now be in a place where after `vagrant up` we only need to log into our `app` VM to set the environment variable `DB_HOST=mongodb://192.168.10.150:27017/posts`, and then navigate to the app directory, install the app, seed the folder and start Node.js. After this posts should be working.