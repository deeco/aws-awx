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
git clone https://github.com/deeco/aws-awx

# run playbook
ansible-playbook --connection=local 127.0.0.1 aws-awx/deploy/docker.yml
