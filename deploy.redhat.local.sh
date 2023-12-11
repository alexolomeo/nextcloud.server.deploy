#!/bin/sh
  
echo "Init creating ssh key to verify conectivity...."

sudo dnf install -y ansible git

ssh-keygen -q -b 2048 -t rsa -N "" -C "creating SSH" -f KEY-UBUNTU

chmod 400 KEY-REDHAT

cat KEY-REDHAT.pub >> ~/.ssh/authorized_keys

git clone https://github.com/alexolomeo/nextcloud.server.git

ansible -i hosts -m ping all

ansible-playbook -i hosts deploy.yml -v

