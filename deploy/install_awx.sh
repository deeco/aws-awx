#! /bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install python -y
## Anisble Install
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible -y

# install git
sudo apt-get install git -y

# clone repository
git clone https://github.com/deeco/aws-awx /tmp/aws-awx

# install role pre-req
sudo ansible-galaxy install geerlingguy.docker

# run playbook to install docker
ansible-playbook --connection=local 127.0.0.1 /tmp/aws-awx/deploy/docker.yml

# run docker compose to install awx
sudo docker-compose -f /tmp/aws-awx/deploy/awx/docker-compose.yml up -d 
