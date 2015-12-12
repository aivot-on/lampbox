# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = false
  
  config.vm.network "forwarded_port", guest: 22, host: 6840
  config.vm.network "private_network", ip: "10.200.42.30"
  
  config.vm.synced_folder "../data", "/vagrant_default"
  
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
  SHELL
end
