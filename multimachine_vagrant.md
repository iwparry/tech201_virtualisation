# Multimachine Vagrant
## Setting up two Virtual Machines, app and database, and connecting them

We start by modifying our existing `Vagrantfile`:
```Ruby
Vagrant.configure("2") do |config|
  # Configuration script for app
  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/bionic64"
    app.vm.network "private_network", ip: "192.168.10.100"
    # Sync the app folder
    app.vm.synced_folder "app", "/home/vagrant/app"
    # Provisioning
    app.vm.provision "shell", path: "provision.sh", privileged: false
  end
  # Configuration script for database
  config.vm.define "database" do |database|
    database.vm.box = "ubuntu/bionic64"
    database.vm.network "private_network", ip: "192.168.10.150"
    # Sync the environment folder
    database.vm.synced_folder "environment", "/home/vagrant/environment"
  end
end
```
What we are doing here is we are adding another configuration script for our second VM `database`, the setup of which is similar to our `app` VM. Note that the code should be indented as above.

What we should do next is fire up both VMs by running `vagrant up` in our terminal (in VS Code or directly in Git Bash). We should be able to have both start running with a single command, however if this doesn't happen it is possible to start the VMs by adding the name of the specific VM you want to start to the command.

![](multimachine_vagrant.png)

If any issues arise be sure to check the code in the `Vagrantfile` used to set up these machines and also check the `provision.sh` file used to provision the `app` VM. 
(I had to comment out the lines that started the app and change the version of Node from 6 to 12 to get this working as needed). The shell file should look like this.
```sh
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
```
Also any previous VM that was running should have been destroyed prior to begining this process.

### Setting up on our database VM
Note that we will require two terminals throughout this process, one where we logged into `app` and the other we use to log into `database`. In one of our terminals we log into `database`:
```command line
vagrant ssh database
```
This particular VM should only have the environment folder. Once we are logged in, we install the database that we want to use. First of all we require a key, we can add this as below:
```command line
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
```
We can verify that this command has worked for us with the following input:
```
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
```
This should return the output:
```
deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse
```
Assuming that everything has gone as above we upgrade and install the system we will use, and we will do so as we did with Nginx
```
sudo apt-get update -y
```
and
```
sudo apt-get upgrade -y
```
Following which we install the actual database, and we do so via the following command:
```
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20
```
After installing the database we need to use the following commands to activate the database:
```
sudo systemctl start mongod
```
and
```
sudo systemctl enable mongod
```
Note its good practice to check everything is alright whilst doing this with the command:
```
sudo systemctl status mongod
```
If everything is ok we should receive the following output after we `enable` our `mongod` database:
```
Created symlink /etc/systemd/system/multi-user.target.wants/mongod.service -> /lib/systemd/system/mongod.service.
```
