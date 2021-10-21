#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

#Bug en grub
echo "set grub-pc/install_devices /dev/sda" | debconf-communicate

# Configuramos repos de Huayra
echo "" > /etc/apt/sources.list.d/huayra.list
tee <<EOF /etc/apt/sources.list.d/huayra.list >/dev/null
deb [arch=i386,amd64] https://repo.huayra.educar.gob.ar/huayra austral main contrib non-free
deb-src https://repo.huayra.educar.gob.ar/huayra austral main contrib non-free
deb [arch=i386,amd64] https://repo.huayra.educar.gob.ar/huayra austral-updates main contrib non-free
deb-src https://repo.huayra.educar.gob.ar/huayra austral-updates main contrib non-free
EOF

# Agregamos llave publica de Huayra
wget -qO- https://repo.huayra.educar.gob.ar/huayra/huayra.gpg.asc | sudo apt-key add -

# update / upgrade
apt-get -y -qq update
apt-get -y -qq upgrade

# instalar herramientas
apt-get -y install htop iotop live-build apt-cacher sudo git parted

# Agregamos disco de construcción de iso
parted /dev/sdb mklabel msdos
parted /dev/sdb mkpart primary 512 100%
mkfs.ext4 /dev/sdb1
mkdir -p /opt/huayrari/
echo `blkid /dev/sdb1 | awk '{print$2}' | sed -e 's/"//g'` /opt/huayrari/   ext4  noatime,nobarrier   0   0 >> /etc/fstab
mount /opt/huayrari
chown vagrant:vagrant -R /opt/huayrari
