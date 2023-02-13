
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
