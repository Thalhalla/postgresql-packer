#!/bin/sh
# install python-pip, then ansible via pip
apt-get install -y python-pip python-dev
sleep 5
pip install ansible
