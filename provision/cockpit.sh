#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Instalamos cockpit
apt-get -y install cockpit python3 rsync zip

# Instalamos cockpit navigator
cd /tmp/
git clone https://github.com/45Drives/cockpit-navigator.git
cd cockpit-navigator
git checkout v0.5.5
make install
systemctl restart cockpit
echo -e "root\nroot" | sudo passwd
