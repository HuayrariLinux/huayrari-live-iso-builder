# -*- mode: ruby -*-
# vi: set ft=ruby :


# Install vagrant-disksize to allow resizing the vagrant box disk.
unless Vagrant.has_plugin?("vagrant-disksize")
    raise  Vagrant::Errors::VagrantError.new, "vagrant-disksize plugin is missing. Please install it using 'vagrant plugin install vagrant-disksize' and rerun 'vagrant up'"
end

Vagrant.configure("2") do |config|

  # Debian GNU/Linux 10
  config.vm.box = "debian/contrib-buster64"

  # Network
  config.vm.network "private_network", ip: "172.16.100.100"

  # VM resources
  config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.memory = "4096"
  end
  config.disksize.size = '30GB'
  config.vm.synced_folder ".", "/vagrant", disabled: "true"

  # Provision
  config.vm.provision "shell", name: "base", path: "provision/base.sh", privileged: true

  # Sólo habilitar luego de aprovisionar la máquina - puede dar errores al inicio.
  #config.vm.synced_folder "src/web", "/var/www/html/itop", type: "rsync", owner: "vagrant", group: "apache"


end
