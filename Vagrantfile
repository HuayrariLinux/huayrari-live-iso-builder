# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Debian GNU/Linux 10
  config.vm.box = "debian/contrib-buster64"

  # Network
  config.vm.network "private_network", ip: "172.16.100.100"

  # VM resources
  config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.memory = "2048"
     vb.name = "huayrari-build"
  end
  config.vm.synced_folder ".", "/vagrant", disabled: "true"

  # Provision
  config.vm.provision "shell", name: "base", path: "provision/base.sh", privileged: true
  config.vm.provision "shell", name: "cockpit", path: "provision/cockpit.sh", privileged: true
  config.vm.provision "shell", name: "cockpit", path: "provision/live-build.sh", privileged: true
end
