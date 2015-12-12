# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = false
  
  config.vm.network "forwarded_port", guest: 22, host: 6840
  config.vm.network "private_network", ip: "10.200.42.30"
  
  config.vm.synced_folder "./data", "/data"
  # config.vm.synced_folder "./data", "/data", type: "nfs"
  
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.memory = 2048
  end
  
  config.vm.provision "file", source: "provision/php7-fpm.conf", destination: "provision/php7-fpm.conf"
  config.vm.provision :shell, path: "bootstrap.sh"
end
