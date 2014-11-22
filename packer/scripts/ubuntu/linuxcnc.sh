#!/bin/bash -eux

cd /tmp
wget http://www.linuxcnc.org/install-scripts/lucid/linuxcnc-install.sh
chmod +x /tmp/linuxcnc-install.sh
sed -i 's/apt-get/apt-get\ -y/' linuxcnc-install.sh
bash /tmp/linuxcnc-install.sh
