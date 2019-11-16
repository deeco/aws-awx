#! /bin/bash
# set hostname
sudo hostnamectl set-hostname awx

# update
sudo apt-get update
sudo apt-get install apt-transport-https wget gnupg python3 python3-pip python-dev tree libpq-dev -y

## Anisble Python
sudo apt-get install python -y
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1

## Anisble Install
sudo pip3 install ansible

## install Docker
sudo apt-get install docker.io -y

## install NPM
sudo apt-get install npm -y
sudo npm install npm --global -y

## install Docker Compose
sudo pip3 install docker-compose

## Install git
sudo apt-get install git -y

# clone repository
git clone https://github.com/ansible/awx.git /tmp/awx

#switch user
sudo su

# add to inventory
sudo echo "[local]" >> /tmp/aws-awx/installer/inventory
sudo echo "127.0.0.1 ansible_connection=local" >> /tmp/awx/installer/inventory

# run playbook to install docker
cd /tmp/awx/
ansible-playbook -i inventory /tmp/awx/installer/install.yml
