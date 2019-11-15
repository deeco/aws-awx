#! /bin/bash
sudo apt-get update
sudo apt-get install apt-transport-https wget gnupg python3 python3-pip python-dev tree libpq-dev -y

## Anisble Python
sudo apt-get install python -y
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1

## Anisble Install
sudo pip3 install ansible -y

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
git clone https://github.com/ansible/awx.git /tmp/aws-awx

#switch user
sudo su

# run playbook to install docker
ansible-playbook -i inventory /tmp/aws-awx/installer/install.yml
