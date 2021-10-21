#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

echo "set grub-pc/install_devices /dev/sda" | debconf-communicate

# Configuramos repos de Huayra
rm /etc/apt/sources.list.d/huayra.list
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
apt-get -y install htop iotop live-build apt-cacher sudo git



