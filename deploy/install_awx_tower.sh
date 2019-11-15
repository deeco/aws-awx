#! /bin/bash
sudo apt-get update
sudo apt-get update apt-get install apt-transport-https wget gnupg python3 python3-pip python-dev tree libpq-dev

## Anisble Python
sudo apt-get install python -y
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1

## Anisble Install
sudo pip3 install ansible

## install Docker
sudo apt-get install docker.io

## install NPM
sudo apt-get install npm
sudo npm install npm --global

## install Docker Compose
sudo pip3 install docker-compose

## Install git
sudo apt-get install git -y

git clone https://github.com/deeco/aws-awx /tmp/aws-awx

# clone repository
git clone https://github.com/deeco/aws-awx /tmp/aws-awx

# install role pre-req
sudo ansible-galaxy install geerlingguy.docker

# run playbook to install docker
ansible-playbook -i inventory install.yml
