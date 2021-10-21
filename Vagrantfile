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
     vb.memory = "4096"
     vb.name = "huayrari-iso"

     unless File.exist?("huayrari-iso-disk.vdi")
        vb.customize ['createhd',
                           '--filename', "huayrari-iso-disk",
                           '--size', "10240"]
        vb.customize ['storageattach', :id,
                           '--storagectl', 'SATA Controller',
                           '--port', 1,
                           '--device', 0,
                           '--type', 'hdd',
                           '--medium', "huayrari-iso-disk.vdi"]
      end
 
  end
  config.vm.synced_folder ".", "/vagrant", disabled: "true"

  # Provision
  config.vm.provision "shell", name: "base", path: "provision/base.sh", privileged: true

  # Sólo habilitar luego de aprovisionar la máquina - puede dar errores al inicio.
  config.vm.synced_folder "./", "/opt/huayrari", type: "rsync", owner: "vagrant", group: "vagrant"

end
